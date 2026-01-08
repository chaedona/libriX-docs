# LibriX 관리 문서

LibriX 관리콘솔의 전체 기능에 대한 상세 문서입니다.

## 문서 구조

```
docs/
├── server/                         # 서버 관리 문서
│   ├── application-server.md       # 애플리케이션 서버 관리
│   ├── web-server.md               # 웹서버 관리
│   ├── session-server.md           # 세션 서버 관리
│   └── images/
│       ├── app_server/             # 애플리케이션 서버 이미지 (12개)
│       ├── web_server/             # 웹서버 이미지 (8개)
│       └── session_server/         # 세션 서버 이미지 (3개)
└── environment/                    # 환경 관리 문서
    ├── session-domain.md           # 세션 도메인 관리
    └── images/
        └── session_domain/         # 세션 도메인 이미지 (3개)
```

## 문서 목록

### 서버 관리

#### [애플리케이션 서버 관리](docs/server/application-server.md)

Open Liberty 애플리케이션 서버를 LibriX에서 관리하는 방법을 설명합니다.

**주요 내용:**
- 애플리케이션 서버 목록 및 상태 모니터링
- 서버 생성 및 구성 (2단계 프로세스)
- 서버 생명주기 관리 (시작, 중지, 재시작)
- 웹 컨테이너 및 HTTP 설정
- EJB 컨테이너 및 캐시 설정
- 세션 관리 구성
- 트랜잭션 서비스 설정
- ORB 서비스 구성
- 설치된 애플리케이션 관리
- 프로세스 정의 및 JVM 설정
- 포트 설정 관리
- 진단 추적 서비스
- 로그 확인 및 분석

**스크린샷:** 12개

#### [웹서버 관리](docs/server/web-server.md)

IBM HTTP Server 또는 Apache HTTP Server를 LibriX에서 관리하는 방법을 설명합니다.

**주요 내용:**
- 웹서버 목록 및 상태 모니터링
- 웹서버 생성 및 구성 (3단계 프로세스)
- 플러그인 생성 및 관리
- 플러그인 전파 (Propagation)
- 웹서버 상세 정보 및 구성
- 웹서버 구성 파일 관리 (httpd.conf)
- 로그 확인 (액세스, 오류, 플러그인 로그)
- 웹서버와 애플리케이션 서버 연동
- 로드 밸런싱 및 세션 어피니티

**스크린샷:** 8개

#### [세션 서버 관리](docs/server/session-server.md)

JCache 기반 세션 서버를 LibriX에서 관리하는 방법을 설명합니다.

**주요 내용:**
- LibriX와 Open Liberty/WebSphere Liberty의 관계
- Liberty XML 편집의 복잡성 vs LibriX UI 접근
- 세션 서버 목록 및 상태 모니터링
- 세션 서버 생성 및 구성 (2단계 프로세스)
- JCache 기반 구현 (Hazelcast, Redis)
- Client-Server 모드 세션 복제
- 세션 어피니티 메커니즘
- 세션 서버와 애플리케이션 서버 연동
- 세션 서버 모니터링
- 고가용성 구성
- 성능 최적화
- 문제 해결

**스크린샷:** 3개

### 환경 관리

#### [세션 도메인 관리](docs/environment/session-domain.md)

세션 데이터를 공유하는 서버 그룹(세션 도메인)을 LibriX에서 관리하는 방법을 설명합니다.

**주요 내용:**
- LibriX와 Open Liberty/WebSphere Liberty의 관계
- Liberty 구성 방식 vs LibriX 접근
- 세션 도메인 개요 및 역할
- 세션 도메인 목록 및 관리
- 세션 도메인 생성
- JCache 클러스터 구성
- Hazelcast 구성 상세
- Redis (Redisson) 구성 상세
- 세션 도메인 설계 고려사항
- 세션 도메인 명명 규칙
- 세션 도메인과 JCache 클러스터
- 모니터링 및 문제 해결
- 세션 도메인 마이그레이션
- 모범 사례

**스크린샷:** 3개

## LibriX의 가치 제안

### Open Liberty/WebSphere Liberty와의 관계

LibriX는 Open Liberty 및 WebSphere Liberty를 기반으로 하며, Liberty의 강력한 기능을 웹 UI로 제공합니다.

**Liberty의 전통적인 방식:**
- `server.xml` 파일을 수동으로 편집
- 복잡한 XML 구조와 구문 이해 필요
- JCache 구현체 구성 파일 별도 작성 (hazelcast.xml, redisson-config.yaml 등)
- 각 서버마다 개별적으로 설정 파일 관리
- 설정 오류 발견이 어렵고 디버깅 시간 소요

**LibriX의 접근 방식:**
- **GUI 기반 구성**: 복잡한 XML 편집 불필요
- **자동 구성 생성**: 입력된 정보를 바탕으로 자동으로 server.xml 및 관련 설정 파일 생성
- **중앙 관리**: 여러 서버의 설정을 한 곳에서 관리
- **시각적 모니터링**: 서버 상태를 실시간으로 확인
- **검증 기능**: 설정 오류를 사전에 방지하는 유효성 검사
- **일관성 보장**: 동일한 구성을 여러 서버에 일관되게 적용

### 지원 기능

**서버 관리**
- Open Liberty 애플리케이션 서버 관리
- IBM HTTP Server / Apache HTTP Server 관리
- JCache 기반 세션 서버 관리

**세션 관리**
- JCache 구현체: Hazelcast, Redis (Redisson)
- 클러스터 모드: Client-Server 모드
- 분산 세션 관리 및 복제
- 세션 어피니티

**고가용성**
- 서버 클러스터링
- 로드 밸런싱
- 장애 조치 (Failover)
- 세션 데이터 보존

## 향후 추가 예정 문서

다음 문서들이 추가될 예정입니다:

- **클러스터 관리**: 애플리케이션 서버 클러스터 구성 및 관리
- **데이터소스 관리**: 데이터베이스 연결 풀 구성
- **보안 관리**: 보안 도메인, 인증, 권한 부여
- **모니터링**: 성능 모니터링 및 통계
- **로그 관리**: 통합 로그 수집 및 분석

## GitHub 업로드 방법

```bash
# 1. 압축 해제
tar -xzf librix-docs-github.tar.gz

# 2. GitHub 저장소로 이동
cd your-github-repo

# 3. 파일 복사
cp -r github-upload/* .

# 4. Git에 추가 및 커밋
git add README.md docs/
git commit -m "Add/Update LibriX documentation"
git push
```

## 기여

문서 개선 제안이나 오류 발견 시 이슈를 등록해 주세요.

## 라이선스

이 문서는 LibriX 프로젝트의 일부입니다.
