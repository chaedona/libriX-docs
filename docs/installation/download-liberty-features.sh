#!/bin/bash
# ============================================================
# Open Liberty Feature 전체 미러링 스크립트
# 사용법: ./download-liberty-features.sh {버전}
# 예시:   ./download-liberty-features.sh 26.0.0.2
# ============================================================

set -e

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()    { echo -e "${BLUE}[INFO]${NC}  $1"; }
success() { echo -e "${GREEN}[OK]${NC}    $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC}  $1"; }
error()   { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

if [ -z "$1" ]; then
  echo ""; echo "사용법: $0 {Liberty 버전}"; echo "예시:   $0 26.0.0.2"; echo ""; exit 1
fi

VERSION=$1
TEMP_DIR="/tmp/liberty-feature-download-$$"
ALL_FEATURES_FILE="$TEMP_DIR/all-features.txt"
CACHED_FEATURES_FILE="$TEMP_DIR/cached-features.txt"
MISSING_FEATURES_FILE="$TEMP_DIR/missing-features.txt"
M2_REPO="$HOME/.m2/repository"
FEATURE_REPO="$M2_REPO/io/openliberty/features"

echo ""
echo "============================================================"
echo "  Open Liberty Feature 전체 미러링"
echo "  버전: $VERSION"
echo "============================================================"
echo ""

# ── Maven 확인 ─────────────────────────────────────────────
info "Maven 설치 확인 중..."
if ! command -v mvn &> /dev/null; then
  error "Maven이 설치되어 있지 않습니다. 'sudo dnf install maven -y' 로 설치하세요."
fi
success "Maven 확인 완료: $(mvn -version 2>&1 | head -1)"

# ── 임시 디렉토리 생성 (pom.xml 없는 공간에서 mvn 실행) ───
mkdir -p "$TEMP_DIR"
trap "rm -rf $TEMP_DIR" EXIT
cd "$TEMP_DIR"

# ── STEP 1: BOM 및 features JSON 다운로드 ─────────────────
echo ""
info "STEP 1/5: BOM 및 features JSON 다운로드 중... (버전: $VERSION)"

mvn dependency:get \
  -Dartifact=io.openliberty.features:features-bom:${VERSION}:pom \
  -q 2>/dev/null || error "BOM 다운로드 실패. 버전($VERSION)을 확인하세요."

# features JSON 다운로드 (featureUtility가 필수로 요구)
mvn dependency:get \
  -Dartifact=io.openliberty.features:features:${VERSION}:json \
  -q 2>/dev/null || warn "features JSON 다운로드 실패 (계속 진행)"

BOM_POM="$FEATURE_REPO/features-bom/${VERSION}/features-bom-${VERSION}.pom"
JSON_FILE="$FEATURE_REPO/features/${VERSION}/features-${VERSION}.json"

if [ ! -f "$BOM_POM" ]; then
  error "BOM 파일을 찾을 수 없습니다: $BOM_POM"
fi

if [ ! -f "$JSON_FILE" ]; then
  warn "features JSON 파일이 없습니다. HTTP 서버를 통해 다운로드됩니다."
else
  success "BOM 및 features JSON 다운로드 완료"
fi

# ── STEP 2: 전체 Feature 목록 추출 ────────────────────────
echo ""
info "STEP 2/5: 전체 Feature 목록 추출 중..."

grep -oP '(?<=<artifactId>)[^<]+(?=</artifactId>)' "$BOM_POM" \
  | grep -v "features-bom" \
  | sort -u > "$ALL_FEATURES_FILE"

TOTAL_COUNT=$(wc -l < "$ALL_FEATURES_FILE")
success "전체 Feature 수: ${TOTAL_COUNT}개"

# ── STEP 3: Umbrella Feature 다운로드 ─────────────────────
echo ""
info "STEP 3/5: 주요 Umbrella Feature 다운로드 중..."
info "  (jakartaee, javaee, microProfile)"

UMBRELLA_FEATURES=(
  "jakartaee-10.0" "jakartaee-9.1"
  "javaee-8.0" "javaee-7.0"
  "microProfile-7.0" "microProfile-6.1" "microProfile-5.0"
)

for feature in "${UMBRELLA_FEATURES[@]}"; do
  printf "  Downloading umbrella: %-40s" "$feature"
  if mvn dependency:get \
    -Dartifact=io.openliberty.features:${feature}:${VERSION}:esa \
    -q 2>/dev/null; then echo "✓"
  else echo "(skip)"; fi
done

success "Umbrella Feature 다운로드 완료"

# ── STEP 4: 누락 Feature 확인 및 처리 ────────────────────
echo ""
info "STEP 4/5: 누락 Feature 확인 및 전체 처리 중..."
info "  (버전 ${VERSION} ESA 파일 존재 여부 체크)"

find "$FEATURE_REPO" -name "*-${VERSION}.esa" 2>/dev/null \
  | xargs -I{} basename {} \
  | sed "s/-${VERSION}\.esa//" \
  | sort -u > "$CACHED_FEATURES_FILE"

CACHED_COUNT=$(wc -l < "$CACHED_FEATURES_FILE")
info "  버전 ${VERSION} ESA 보유 수: ${CACHED_COUNT}개"

diff "$ALL_FEATURES_FILE" "$CACHED_FEATURES_FILE" \
  | grep "^<" | sed 's/^< //' > "$MISSING_FEATURES_FILE" || true

MISSING_COUNT=$(wc -l < "$MISSING_FEATURES_FILE")

if [ "$MISSING_COUNT" -eq 0 ]; then
  success "누락 Feature 없음 - 전체 처리 완료"
else
  info "누락 Feature: ${MISSING_COUNT}개 처리 시작..."
  info "  (이전 버전 ESA 복사 우선 → 없으면 Maven Central 다운로드)"
  echo ""

  CURRENT=0; COPIED=0; DOWNLOADED=0; SKIPPED=0

  while IFS= read -r feature; do
    CURRENT=$((CURRENT + 1))
    PERCENT=$((CURRENT * 100 / MISSING_COUNT))

    TARGET_DIR="$FEATURE_REPO/${feature}/${VERSION}"
    TARGET_ESA="$TARGET_DIR/${feature}-${VERSION}.esa"
    TARGET_POM="$TARGET_DIR/${feature}-${VERSION}.pom"

    if [ -f "$TARGET_ESA" ]; then
      SKIPPED=$((SKIPPED + 1)); continue
    fi

    printf "\r  [%3d%%] (%d/%d) %-55s" "$PERCENT" "$CURRENT" "$MISSING_COUNT" "$feature"

    # 이전 버전 ESA 검색
    PREV_ESA=$(find "$FEATURE_REPO/${feature}" -name "*.esa" \
      ! -name "*${VERSION}*" 2>/dev/null | sort -V | tail -1)
    PREV_POM=$(find "$FEATURE_REPO/${feature}" -name "*.pom" \
      ! -name "*${VERSION}*" 2>/dev/null | sort -V | tail -1)

    if [ -n "$PREV_ESA" ]; then
      mkdir -p "$TARGET_DIR"
      cp "$PREV_ESA" "$TARGET_ESA"
      [ -n "$PREV_POM" ] && cp "$PREV_POM" "$TARGET_POM"
      printf " [복사]\n"
      COPIED=$((COPIED + 1))
    else
      if mvn dependency:get \
        -Dartifact=io.openliberty.features:${feature}:${VERSION}:esa \
        -q 2>/dev/null; then
        printf " [다운로드]\n"
        DOWNLOADED=$((DOWNLOADED + 1))
      else
        printf " [skip]\n"
        SKIPPED=$((SKIPPED + 1))
      fi
    fi
  done < "$MISSING_FEATURES_FILE"

  echo ""
  echo ""
  success "처리 완료: 복사 ${COPIED}개 / 다운로드 ${DOWNLOADED}개 / 스킵 ${SKIPPED}개"
fi

# ── STEP 5: 최종 검증 ──────────────────────────────────────
echo ""
info "STEP 5/5: 최종 검증 중..."

find "$FEATURE_REPO" -name "*-${VERSION}.esa" 2>/dev/null \
  | xargs -I{} basename {} \
  | sed "s/-${VERSION}\.esa//" \
  | sort -u > "$CACHED_FEATURES_FILE"

FINAL_CACHED=$(wc -l < "$CACHED_FEATURES_FILE")
FINAL_MISSING=$(diff "$ALL_FEATURES_FILE" "$CACHED_FEATURES_FILE" \
  | grep "^<" | wc -l || true)

echo ""
echo "============================================================"
echo "  다운로드 결과 요약"
echo "============================================================"
echo "  Liberty 버전       : $VERSION"
echo "  전체 Feature 수    : ${TOTAL_COUNT}개"
echo "  버전 ESA 보유 수   : ${FINAL_CACHED}개"
echo "  누락 Feature 수    : ${FINAL_MISSING}개"
echo "  저장 위치          : $M2_REPO"
echo "============================================================"
echo ""

if [ "$FINAL_MISSING" -eq 0 ]; then
  success "전체 Feature 미러링 완료!"
  echo ""
  echo "  다음 단계:"
  echo "  1. liberty-mirror 폴더 구성"
  echo "     mkdir -p ~/liberty-mirror"
  echo "     cp -r ~/.m2/repository/io ~/liberty-mirror/"
  echo "  2. liberty-mirror 폴더를 폐쇄망 서버로 전송"
  echo "  3. 폐쇄망 서버에서 HTTP 서버 실행 (liberty-mirror 에서):"
  echo "     cd ~/liberty-mirror && python3 -m http.server 8081"
  echo "  4. featureUtility.properties 설정:"
  echo "     featureLocalRepo=/home/{user}/liberty-mirror"
  echo "     mavenCentralMirror.url=http://localhost:8081/"
  echo ""
else
  warn "누락 Feature ${FINAL_MISSING}개가 있습니다."
  diff "$ALL_FEATURES_FILE" "$CACHED_FEATURES_FILE" \
    | grep "^<" | sed 's/^< //' | head -20
fi