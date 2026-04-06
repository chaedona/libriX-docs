# Open Liberty Airgap(폐쇄망) 환경 Feature 설치 가이드

> **환경:** Rocky Linux 9.4 / Open Liberty 26.0.0.2 ~ 26.0.0.3
> **최종 수정:** 2026-04-06

---

## 목차

1. [개요](#1-개요)
2. [Phase A — Feature 전체 미러링 (인터넷 연결 서버)](#2-phase-a--feature-전체-미러링-인터넷-연결-서버)
3. [Phase B — Kernel ZIP 다운로드 및 전송 (인터넷 연결 서버)](#3-phase-b--kernel-zip-다운로드-및-전송-인터넷-연결-서버)
4. [Phase C — 폐쇄망 서버 최초 구성 및 Feature 설치](#4-phase-c--폐쇄망-서버-최초-구성-및-feature-설치)
5. [Phase D — 버전 업그레이드 (폐쇄망 서버)](#5-phase-d--버전-업그레이드-폐쇄망-서버)
6. [문제 해결](#6-문제-해결)
7. [주의사항](#7-주의사항)

---

## 1. 개요

본 문서는 인터넷이 차단된 폐쇄망(Airgap) 환경에서 Open Liberty Feature를 설치하는 전체 시나리오를 설명합니다.

제공된 쉘 스크립트(`download-liberty-features.sh`) 하나만으로 전체 Feature를 자동 미러링하고, 폐쇄망에서 Python HTTP 서버를 통해 오프라인으로 Feature를 설치하는 전체 과정을 단계별로 안내합니다.

### 1.1 전체 시나리오 흐름

| Phase | 환경 | 작업 |
|---|---|---|
| **Phase A** | 인터넷 연결 서버 (필수) | `download-liberty-features.sh` 실행 → 전체 Feature ESA + JSON 자동 미러링 → `liberty-mirror/io` 폴더 구성 |
| **Phase B** | 인터넷 연결 서버 (필수) | Open Liberty Kernel ZIP 다운로드 → `liberty-mirror` 폴더에 보관 → 압축 전송 |
| **Phase C** | 폐쇄망 서버 | Kernel Liberty 설치 → Python HTTP 서버 실행 → featureUtility 설정 → Feature 설치 → 서버 운영 |
| **Phase D** | 폐쇄망 서버 (업그레이드) | 새 버전 Kernel 설치 → `featureUtility.properties` 재설정 → Feature 설치 |

### 1.2 liberty-mirror 폴더 최종 구조

폐쇄망으로 전송하는 패키지의 최종 구조입니다.

```
~/liberty-mirror/
├── io/                                         ← Maven 레이아웃 Feature 저장소
│   └── openliberty/
│       └── features/
│           ├── features/                       ← features JSON 파일 (필수!)
│           │   ├── 26.0.0.2/
│           │   │   └── features-26.0.0.2.json
│           │   └── 26.0.0.3/
│           │       └── features-26.0.0.3.json
│           ├── jsp-2.3/
│           │   ├── 26.0.0.2/
│           │   │   ├── jsp-2.3-26.0.0.2.esa
│           │   │   └── jsp-2.3-26.0.0.2.pom
│           │   └── 26.0.0.3/
│           │       ├── jsp-2.3-26.0.0.3.esa
│           │       └── jsp-2.3-26.0.0.3.pom
│           └── ... (전체 Feature)
├── openliberty-kernel-26.0.0.2.zip            ← Kernel 26.0.0.2
└── openliberty-kernel-26.0.0.3.zip            ← Kernel 26.0.0.3
```

> **※** `liberty-mirror/io` 폴더는 `~/.m2/repository/io`를 그대로 복사한 것입니다.
> Maven 레이아웃 구조를 반드시 유지해야 featureUtility가 정상 동작합니다.

### 1.3 핵심 설정

**featureUtility.properties:**

```properties
# 위치: /opt/openliberty-kernel/wlp/etc/featureUtility.properties
featureLocalRepo=/home/websphere/liberty-mirror
mavenCentralMirror.url=http://localhost:8081/
```

**~/.bashrc — 서명 검증 생략 설정:**

폐쇄망에서는 서명 키 서버에 접근할 수 없습니다. `featureUtility`가 ESA 파일을 설치할 때 기본적으로 `.asc` 서명 파일을 검증하는데, 이 검증 과정에서 외부 PGP 키 서버에 접근을 시도합니다. 폐쇄망에서는 이 키 서버에 접근이 불가능하므로 아래 옵션을 설정합니다.

```bash
export FEATURE_VERIFY=skip
```

**Python HTTP 서버 — 반드시 `~/liberty-mirror`에서 실행:**

```bash
cd ~/liberty-mirror && python3 -m http.server 8081
```

### 1.4 사전 준비

| 항목 | 요구 사항 | 비고 |
|---|---|---|
| OS | Rocky Linux 9.4 | 인터넷 서버 및 폐쇄망 서버 모두 |
| Java | OpenJDK 21 | 양쪽 서버 모두 필요 |
| Maven | 3.6.3 이상 | 인터넷 연결 서버에만 필요 |
| Python | 3.x | 폐쇄망 서버 HTTP 서버용 |
| 디스크 여유 공간 | 5GB 이상 | 버전당 Feature ESA 약 3~4GB |

Maven 설치:

```bash
sudo dnf install maven -y
```

---

## 2. Phase A — Feature 전체 미러링 (인터넷 연결 서버)

> ⚠️ **주의** 스크립트는 반드시 인터넷이 연결된 상태에서 실행해야 합니다.
> 인터넷 차단 상태에서 실행하면 BOM 및 JSON 다운로드가 실패합니다.

### 2.1 스크립트 배치

`download-liberty-features.sh` 파일 하나만 준비합니다. `pom.xml`은 불필요합니다.

```bash
mkdir ~/liberty-feature-downloader
cd ~/liberty-feature-downloader

# download-liberty-features.sh 복사
chmod +x download-liberty-features.sh
```

> ⚠️ **주의** 같은 디렉토리에 `pom.xml`이 있으면 Maven이 자동으로 읽어 `{{VERSION}}` 오류가 발생합니다.
> `pom.xml`은 반드시 삭제하십시오.

### 2.2 스크립트 실행

```bash
./download-liberty-features.sh 26.0.0.2
```

스크립트 내부 처리 단계:

| 단계 | 처리 내용 |
|---|---|
| 1/5 | Maven 설치 여부 확인 |
| 2/5 | BOM(`features-bom`) 및 features JSON 다운로드 — `pom.xml` 없는 임시 디렉토리에서 실행하여 충돌 방지 |
| 3/5 | BOM에서 전체 Feature 목록 추출 (약 1,200개 이상) |
| 4/5 | Umbrella Feature 다운로드 후 누락 Feature 처리 — 이전 버전 ESA 있으면 복사, 없으면 Maven Central 다운로드 |
| 5/5 | 해당 버전 ESA 파일 기준으로 최종 검증 및 결과 요약 출력 |

완료 시 출력 예시 (최초 실행):

```
Liberty 버전 : 26.0.0.2
전체 Feature 수 : 1239개
버전 ESA 보유 수 : 1239개
누락 Feature 수 : 0개
[OK] 전체 Feature 미러링 완료!
처리 완료: 복사 0개 / 다운로드 1239개 / 스킵 0개
```

새 버전 실행 시 출력 예시 (이전 버전 활용):

```
Liberty 버전 : 26.0.0.3
전체 Feature 수 : 1240개
버전 ESA 보유 수 : 1240개
누락 Feature 수 : 0개
[OK] 전체 Feature 미러링 완료!
처리 완료: 복사 840개 / 다운로드 400개 / 스킵 0개
```

> 💡 새 버전 실행 시 이전 버전과 동일한 ESA는 복사로 처리되어 다운로드 시간이 크게 단축됩니다.

### 2.3 liberty-mirror 폴더 구성

다운로드된 Feature를 `liberty-mirror` 폴더로 구성합니다. `io` 폴더 전체를 복사하면 Maven 레이아웃이 유지됩니다.

```bash
mkdir -p ~/liberty-mirror
cp -r ~/.m2/repository/io ~/liberty-mirror/
```

구성 확인 (JSON 파일 존재 여부):

```bash
find ~/liberty-mirror/io -name 'features-26.0.0.2.json'
```

정상 출력:

```
/home/websphere/liberty-mirror/io/openliberty/features/features/26.0.0.2/features-26.0.0.2.json
```

> **※** features JSON 파일이 없으면 featureUtility 실행 시 `CWWKF1409E` 오류가 발생합니다.
> `cp -r` 명령을 재실행하십시오.

### 2.4 새 버전 추가 시

새 버전이 출시되면 스크립트를 새 버전으로 재실행 후 `liberty-mirror`를 업데이트합니다.

```bash
# 인터넷 연결 상태에서 실행
./download-liberty-features.sh 26.0.0.3

# liberty-mirror 업데이트 (기존 파일 유지, 새 버전 추가)
cp -r ~/.m2/repository/io ~/liberty-mirror/
```

---

## 3. Phase B — Kernel ZIP 다운로드 및 전송 (인터넷 연결 서버)

### 3.1 Kernel ZIP 다운로드

Feature가 포함되지 않은 최소 설치본인 Kernel ZIP을 다운로드합니다.

> ⚠️ **주의** URL 경로의 버전과 파일명의 버전이 반드시 일치해야 합니다.
> 불일치 시 404 오류가 발생합니다.

```bash
cd ~/liberty-mirror

# 올바른 예시 — 경로 버전과 파일명 버전 일치
wget https://repo1.maven.org/maven2/io/openliberty/openliberty-kernel/26.0.0.2/openliberty-kernel-26.0.0.2.zip
wget https://repo1.maven.org/maven2/io/openliberty/openliberty-kernel/26.0.0.3/openliberty-kernel-26.0.0.3.zip
```

`liberty-mirror` 최종 구조 확인:

```bash
ls ~/liberty-mirror/
# io/  openliberty-kernel-26.0.0.2.zip  openliberty-kernel-26.0.0.3.zip
```

### 3.2 폐쇄망 서버로 전송

```bash
cd ~
tar -czvf liberty-mirror.tar.gz liberty-mirror/

# USB 또는 파일 전송 도구로 폐쇄망 서버에 복사
```

폐쇄망 서버에서 압축 해제:

```bash
tar -xzvf liberty-mirror.tar.gz -C ~/
```

---

## 4. Phase C — 폐쇄망 서버 최초 구성 및 Feature 설치

> ⚠️ **주의** 이 단계부터는 인터넷을 차단한 상태에서 진행합니다.

### 4.1 인터넷 차단

```bash
ip link show                    # 네트워크 인터페이스 확인
sudo ip link set ens160 down    # 인터넷 차단
ping -c 3 8.8.8.8              # 차단 확인 — timeout이 나오면 정상
sudo ip link set ens160 up      # 복구 시
```

### 4.2 FEATURE_VERIFY 환경 변수 설정

폐쇄망에서는 서명 키 서버에 접근할 수 없으므로 서명 검증을 생략합니다.
`~/.bashrc`에 추가하면 영구 적용됩니다.

```bash
echo 'export FEATURE_VERIFY=skip' >> ~/.bashrc
source ~/.bashrc
echo $FEATURE_VERIFY    # skip 출력 확인
```

### 4.3 Open Liberty Kernel 설치

```bash
sudo unzip ~/liberty-mirror/openliberty-kernel-26.0.0.2.zip -d /opt/openliberty-kernel
sudo chown -R $(whoami):$(whoami) /opt/openliberty-kernel

/opt/openliberty-kernel/wlp/bin/productInfo version        # 버전 확인
/opt/openliberty-kernel/wlp/bin/productInfo featureInfo    # Feature 미설치 확인 (출력 없음)
```

### 4.4 Python HTTP 서버 실행

> ⚠️ **주의** HTTP 서버는 반드시 `~/liberty-mirror` 디렉토리에서 실행해야 합니다.

```bash
# 별도 터미널에서 실행
cd ~/liberty-mirror
python3 -m http.server 8081
```

### 4.5 featureUtility.properties 설정

```bash
mkdir -p /opt/openliberty-kernel/wlp/etc

cat > /opt/openliberty-kernel/wlp/etc/featureUtility.properties << 'EOF'
featureLocalRepo=/home/websphere/liberty-mirror
mavenCentralMirror.url=http://localhost:8081/
EOF
```

설정 확인:

```bash
/opt/openliberty-kernel/wlp/bin/featureUtility viewSettings
```

| 확인 항목 | 정상 값 |
|---|---|
| Use Default Repository | False |
| Validation Results | The properties file successfully passed the validation. |
| Feature Verify | Skip |
| Maven Local Repository Location | `/home/websphere/liberty-mirror` |
| Configured Repository Location | `http://localhost:8081/` |

### 4.6 Feature 설치

#### 개별 Feature 설치

```bash
/opt/openliberty-kernel/wlp/bin/featureUtility installFeature jsp-2.3 --acceptLicense
```

정상 설치 출력:

```
Initializing ...
Resolving remote features. This process might take several minutes to complete.
Starting installation ...
Successfully installed feature servlet-3.1.
Successfully installed feature el-3.0.
Successfully installed feature jsp-2.3.
All features were successfully installed.
Product validation completed successfully.
```

#### server.xml 기반 Feature 일괄 설치

서버를 생성하고 `server.xml`에 필요한 Feature를 정의한 뒤 일괄 설치합니다.

```bash
/opt/openliberty-kernel/wlp/bin/server create myServer
```

`/opt/openliberty-kernel/wlp/usr/servers/myServer/server.xml` 편집:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<server description="myServer">
    <featureManager>
        <feature>mpHealth-4.0</feature>
        <feature>jdbc-4.2</feature>
        <feature>jsp-2.3</feature>
    </featureManager>

    <httpEndpoint id="defaultHttpEndpoint"
                  httpPort="9080"
                  httpsPort="9443" />

    <applicationManager autoExpand="true"/>
</server>
```

Feature 일괄 설치 및 서버 기동:

```bash
/opt/openliberty-kernel/wlp/bin/featureUtility installServerFeatures myServer --acceptLicense

/opt/openliberty-kernel/wlp/bin/server start myServer

tail -f /opt/openliberty-kernel/wlp/usr/servers/myServer/logs/messages.log
```

정상 시작 메시지:

```
CWWKF0012I: The server installed the following features: [jdbc-4.2, jsp-2.3, mpHealth-4.0, ...]
CWWKF0011I: The myServer server is ready to run a smarter planet.
```

---

## 5. Phase D — 버전 업그레이드 (폐쇄망 서버)

기존 설치 위치 그대로 새 버전으로 업그레이드하는 방법입니다.

### 5.1 업그레이드 절차

**① 서버 중지**

```bash
/opt/openliberty-kernel/wlp/bin/server stop myServer 2>/dev/null || true
```

**② 기존 설치 백업**

```bash
sudo mv /opt/openliberty-kernel /opt/openliberty-kernel-26.0.0.2-backup
```

**③ 새 버전 Kernel 설치**

```bash
sudo unzip ~/liberty-mirror/openliberty-kernel-26.0.0.3.zip -d /opt/openliberty-kernel
sudo chown -R $(whoami):$(whoami) /opt/openliberty-kernel

/opt/openliberty-kernel/wlp/bin/productInfo version    # 26.0.0.3 확인
```

**④ featureUtility.properties 재설정**

새 Kernel을 설치하면 `etc` 디렉토리가 없으므로 반드시 재설정해야 합니다.

```bash
mkdir -p /opt/openliberty-kernel/wlp/etc

cat > /opt/openliberty-kernel/wlp/etc/featureUtility.properties << 'EOF'
featureLocalRepo=/home/websphere/liberty-mirror
mavenCentralMirror.url=http://localhost:8081/
EOF
```

**⑤ Feature 설치**

```bash
/opt/openliberty-kernel/wlp/bin/featureUtility installFeature jsp-2.3 --acceptLicense
```

정상 설치 확인:

```bash
/opt/openliberty-kernel/wlp/bin/productInfo version
/opt/openliberty-kernel/wlp/bin/productInfo featureInfo
```

### 5.2 업그레이드 시 주의사항

| 항목 | 내용 |
|---|---|
| 백업 유지 | 이전 버전 디렉토리를 삭제하지 말고 백업으로 유지하여 롤백에 대비 |
| featureUtility.properties 재설정 필수 | 새 Kernel 설치 시 `etc` 디렉토리가 새로 생성되므로 properties 파일을 반드시 다시 작성 |
| 서버 설정 파일 마이그레이션 | 기존 서버의 `server.xml` 등 설정 파일을 새 설치 디렉토리로 복사 필요 |
| liberty-mirror에 새 버전 JSON 필수 | 새 버전의 `features-{버전}.json`이 `liberty-mirror`에 있어야 설치 가능 |

### 5.3 운영 중 Feature 추가

| 순서 | 작업 | 비고 |
|---|---|---|
| 1 | `server.xml`에 Feature 추가 | Liberty 자동 감지 — 미설치 Feature는 `CWWKF0001E` 에러 |
| 2 | `featureUtility installServerFeatures` 실행 | 로컬 HTTP 서버에서 Feature 설치 |
| 3 | 서버 재시작 | 설치된 Feature 로드 |
| 4 | `messages.log` 확인 | `CWWKF0012I` 메시지로 정상 확인 |

> **※** Liberty는 `server.xml` 변경을 자동 감지하지만 미설치 Feature의 자동 다운로드는 지원하지 않습니다.
> `featureUtility` 수동 실행 후 재시작이 필요합니다.

---

## 6. 문제 해결

| 오류 메시지 / 현상 | 원인 | 해결 방법 |
|---|---|---|
| 스크립트 실행 시 `{{VERSION}}` 오류 | 같은 디렉토리에 `pom.xml` 존재 | `pom.xml` 삭제 후 재실행 |
| 스크립트 실행 시 BOM 다운로드 실패 | 인터넷 차단 상태에서 스크립트 실행 | 인터넷 연결 후 재실행 |
| `CWWKF1409E`: Unable to find feature JSON files | `features-{버전}.json` 파일 누락 | 스크립트 재실행 후 `cp -r ~/.m2/repository/io ~/liberty-mirror/` 실행 |
| `CWWKF1390E`: Maven Repository cannot be reached | HTTP 서버 미실행 또는 URL 오류 | `~/liberty-mirror`에서 `python3 -m http.server 8081` 실행 확인 |
| `CWWKF1285E`: feature(s) cannot be downloaded | 해당 버전 ESA가 `liberty-mirror`에 없음 | 스크립트 재실행 후 `cp -r` 재실행 |
| 404 Not Found (Kernel ZIP wget) | URL 경로 버전과 파일명 버전 불일치 | 경로와 파일명의 버전을 동일하게 맞춰서 재실행 |
| `CWWKF0001E`: feature definition could not be found | `server.xml` Feature 미설치 | `featureUtility installServerFeatures` 실행 후 재시작 |
| `featureUtility.properties` 설정이 반영 안 됨 | 업그레이드 후 `etc` 디렉토리 재생성 안 함 | `mkdir -p .../etc` 후 properties 파일 재작성 |
| Feature Verify: Enforce (`viewSettings` 확인) | `FEATURE_VERIFY=skip` 미설정 | `~/.bashrc`에 추가 후 `source ~/.bashrc` |

---

## 7. 주의사항

- `download-liberty-features.sh` 스크립트는 반드시 인터넷이 연결된 상태에서 실행해야 합니다.
- 스크립트와 같은 디렉토리에 `pom.xml`이 있으면 `{{VERSION}}` 오류가 발생합니다. `pom.xml`은 반드시 삭제하십시오.
- HTTP 서버는 반드시 `~/liberty-mirror` 디렉토리에서 실행해야 합니다. 다른 디렉토리에서 실행하면 featureUtility가 파일을 찾지 못합니다.
- 새 Kernel 설치 후 `featureUtility.properties`를 반드시 재설정해야 합니다. 새 설치 시 `etc` 디렉토리가 존재하지 않습니다.
- `FEATURE_VERIFY=skip`은 서명 검증을 건너뜁니다. 신뢰할 수 있는 내부 저장소에서만 사용하십시오.
- `featureUtility`는 `file://` 프로토콜을 지원하지 않습니다. 반드시 `python3 -m http.server` 또는 Nginx로 HTTP 서비스를 구성하십시오.
- Python HTTP 서버는 프로세스 종료 시 중단됩니다. 운영 환경에서는 Nginx 또는 Nexus Repository 사용을 권장합니다.
- 새 버전 업그레이드 시 이전 버전 ESA를 복사 활용하므로 최초 실행보다 훨씬 빠릅니다. 기존 `liberty-mirror` 내용은 유지됩니다.

---

## 관련 문서

- [Open Liberty 설치 가이드](./open-liberty-install.md)
- [LibriX 설치 가이드](./libriX-install.md)
- [Liberty 변수 관리](../environment/liberty-variables.md)
- [애플리케이션 서버 관리](../server/application-server.md)
