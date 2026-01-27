# LibriX 관리 문서

LibriX 관리콘솔의 전체 기능에 대한 상세 문서입니다.

## 문서 구조

<details>
<summary><strong>📂 전체 파일 구조 보기</strong></summary>

```
docs/
├── server/                         # 서버 관리 문서
│   ├── application-server.md       # 애플리케이션 서버 관리
│   ├── web-server.md               # 웹서버 관리
│   ├── session-server.md           # 세션 서버 관리
│   ├── cluster.md                  # 클러스터 관리
│   └── images/
│       ├── app_server/             # 애플리케이션 서버 이미지 (12개)
│       ├── web_server/             # 웹서버 이미지 (8개)
│       ├── session_server/         # 세션 서버 이미지 (3개)
│       └── cluster/                # 클러스터 이미지 (5개)
├── application/                    # 애플리케이션 관리 문서
│   ├── application-install.md      # 애플리케이션 설치
│   ├── enterprise-application.md   # 엔터프라이즈 애플리케이션 관리
│   └── images/
│       ├── app_install/            # 애플리케이션 설치 이미지 (5개)
│       └── enterprise_app/         # 엔터프라이즈 애플리케이션 이미지 (6개)
├── resource/                       # 리소스 관리 문서
│   ├── jdbc-provider.md            # JDBC 제공자 관리
│   ├── datasource.md               # 데이터소스 관리
│   └── images/
│       ├── jdbc_provider/          # JDBC 제공자 이미지 (14개)
│       └── datasource/             # 데이터소스 이미지 (6개)
├── environment/                    # 환경 관리 문서
│   ├── session-domain.md           # 세션 도메인 관리
│   ├── liberty-variables.md        # Liberty 변수 관리
│   ├── virtual-host.md             # 가상호스트 관리
│   ├── shared-library.md           # 공유 라이브러리 관리
│   └── images/
│       ├── session_domain/         # 세션 도메인 이미지 (3개)
│       ├── liberty_variables/      # Liberty 변수 이미지 (4개)
│       ├── virtual_host/           # 가상호스트 이미지 (5개)
│       └── shared_library/         # 공유 라이브러리 이미지 (2개)
├── system-management/              # 시스템 관리 문서
│   ├── deployment-manager.md       # 배치 관리자 관리
│   ├── node-management.md          # 노드 관리
│   ├── node-agent.md               # 노드 에이전트 관리
│   └── images/
│       ├── deployment_manager/     # 배치 관리자 이미지 (4개)
│       ├── node_management/        # 노드 관리 이미지 (2개)
│       └── node_agent/             # 노드 에이전트 이미지 (1개)
├── security/                       # 보안 관리 문서
│   ├── user-management.md          # 사용자 관리
│   ├── j2c-authentication-data.md  # J2C 인증 데이터
│   ├── ssl-configuration.md        # SSL 구성
│   ├── certificate-management.md   # 인증서 관리
│   └── images/
│       ├── user_management/        # 사용자 관리 이미지 (6개)
│       ├── j2c_auth/               # J2C 인증 데이터 이미지 (6개)
│       ├── ssl_configuration/      # SSL 구성 이미지 (4개)
│       └── certificate_management/ # 인증서 관리 이미지 (15개)
├── monitoring/                     # 모니터링 문서
│   ├── monitoring.md               # 모니터링 통합 문서
│   └── images/
│       ├── server_monitoring/      # 서버 모니터링 이미지 (2개)
│       ├── connection_pool/        # 연결 풀 모니터링 이미지 (1개)
│       ├── namespace/              # 네임스페이스 현황 이미지 (2개)
│       ├── dashboard/              # 모니터링 대시보드 이미지 (1개)
│       └── dashboard_graphic/      # 그래픽 대시보드 이미지 (5개)
└── troubleshooting/                # 문제 분석 문서
    ├── dump-generation.md          # 덤프생성 문서
    └── images/
        └── dump_generation/        # 덤프생성 이미지 (7개)
```

</details>

## 문서 목록

### 1. 서버 관리

<details>
<summary><strong>📋 서버 관리 문서 보기</strong></summary>

#### 1.1 [애플리케이션 서버 관리](docs/server/application-server.md)
  Open Liberty 애플리케이션 서버를 LibriX에서 관리하는 방법을 설명합니다.
  - 서버 생성 및 구성, 생명주기 관리
  - 웹/EJB 컨테이너, 세션 관리, 트랜잭션 서비스
  - JVM 설정, 포트 관리, 로그 분석
  - **스크린샷:** 12개

#### 1.2 [웹서버 관리](docs/server/web-server.md)
  IBM HTTP Server 또는 Apache HTTP Server를 LibriX에서 관리하는 방법을 설명합니다.
  - 웹서버 생성 및 구성 (3단계)
  - 플러그인 생성 및 전파
  - 로드 밸런싱 및 세션 어피니티
  - **스크린샷:** 8개

#### 1.3 [세션 서버 관리](docs/server/session-server.md)
  JCache 기반 세션 서버를 LibriX에서 관리하는 방법을 설명합니다.
  - JCache 구현 (Hazelcast, Redis)
  - Client-Server 모드 세션 복제
  - 고가용성 구성
  - **스크린샷:** 3개

#### 1.4 [클러스터 관리](docs/server/cluster.md)
  여러 애플리케이션 서버를 하나의 논리적 그룹으로 관리하는 클러스터 기능을 설명합니다.
  - 클러스터 생성 (3단계)
  - 클러스터 생명주기 관리
  - 고가용성 및 로드 밸런싱
  - **스크린샷:** 5개

</details>

### 2. 애플리케이션 관리

<details>
<summary><strong>📋 애플리케이션 관리 문서 보기</strong></summary>

#### 2.1 [애플리케이션 설치](docs/application/application-install.md)
  WAR/EAR 애플리케이션을 Liberty 서버에 배포하는 방법을 설명합니다.
  - 5단계 설치 마법사
  - 가상호스트 및 컨텍스트 루트 설정
  - 배포 전략 (Blue-Green, Canary)
  - **스크린샷:** 5개

#### 2.2 [엔터프라이즈 애플리케이션 관리](docs/application/enterprise-application.md)
  배포된 애플리케이션의 전체 생명주기를 관리하는 방법을 설명합니다.
  - 시작/중지/재시작
  - 업데이트 및 롤백
  - 내보내기 (Export)
  - **스크린샷:** 6개

</details>

### 3. 리소스 관리

<details>
<summary><strong>📋 리소스 관리 문서 보기</strong></summary>

#### 3.1 [JDBC 제공자 관리](docs/resource/jdbc-provider.md)
  JDBC 드라이버를 관리하는 JDBC 제공자의 생성, 수정, 삭제 방법을 설명합니다.
  - 3단계 생성 마법사
  - 8개 데이터베이스 지원
  - 데이터베이스별 설정 가이드
  - **스크린샷:** 14개

#### 3.2 [데이터소스 관리](docs/resource/datasource.md)
  애플리케이션이 데이터베이스에 연결하기 위한 데이터소스의 생성 및 관리 방법을 설명합니다.
  - 5단계 생성 마법사
  - 연결 풀 구성
  - J2C 인증 설정
  - **스크린샷:** 6개

</details>

### 4. 환경 관리

<details>
<summary><strong>📋 환경 관리 문서 보기</strong></summary>

#### 4.1 [세션 도메인 관리](docs/environment/session-domain.md)
  세션 데이터를 공유하는 서버 그룹(세션 도메인)을 LibriX에서 관리하는 방법을 설명합니다.
  - JCache 클러스터 구성 (Hazelcast, Redis)
  - 세션 복제 아키텍처
  - **스크린샷:** 3개

#### 4.2 [Liberty 변수 관리](docs/environment/liberty-variables.md)
  Liberty 서버 구성에서 재사용 가능한 값을 정의하고 관리하는 방법을 설명합니다.
  - 범위별 변수 관리 (서버/호스트/클러스터)
  - 환경별 설정 분리
  - **스크린샷:** 4개

#### 4.3 [가상호스트 관리](docs/environment/virtual-host.md)
  하나의 Liberty 서버에서 여러 도메인과 애플리케이션을 분리하여 제공하는 방법을 설명합니다.
  - 다중 도메인 호스팅
  - 호스트 별명 관리 (와일드카드)
  - **스크린샷:** 5개

#### 4.4 [공유 라이브러리 관리](docs/environment/shared-library.md)
  여러 애플리케이션이 공통으로 사용하는 JAR 파일을 중앙에서 관리하는 방법을 설명합니다.
  - JAR 파일 중앙 관리
  - 클래스로더 설정
  - **스크린샷:** 2개

</details>

### 5. 시스템 관리

<details>
<summary><strong>📋 시스템 관리 문서 보기</strong></summary>

#### 5.1 [배치 관리자 관리](docs/system-management/deployment-manager.md)
  LibriX의 중앙 관리 서버인 배치 관리자(Deployment Manager)의 구성 및 관리 방법을 설명합니다.
  - 중앙 관리 서버 역할
  - 프로세스 정의 (JVM 설정)
  - 포트 설정 (8개 포트)
  - **스크린샷:** 4개

#### 5.2 [노드 관리](docs/system-management/node-management.md)
  Liberty 서버들의 논리적 그룹인 노드를 배치 관리자에서 관리하는 방법을 설명합니다.
  - 비관리 노드 추가
  - 구성 동기화
  - **스크린샷:** 2개

#### 5.3 [노드 에이전트 관리](docs/system-management/node-agent.md)
  각 노드에서 실행되는 관리 에이전트인 Node Agent의 구성 및 관리 방법을 설명합니다.
  - 통신 중계자 역할
  - 서버 생명주기 관리
  - **스크린샷:** 1개

</details>

### 6. 보안 관리

<details>
<summary><strong>📋 보안 관리 문서 보기</strong></summary>

#### 6.1 [사용자 관리](docs/security/user-management.md)
  LibriX 관리콘솔의 사용자 계정을 생성하고 관리하는 방법을 설명합니다.
  - Basic User Registry 기반 인증
  - 역할 기반 접근 제어 (administrator/reader)
  - **스크린샷:** 6개

#### 6.2 [J2C 인증 데이터](docs/security/j2c-authentication-data.md)
  Java 2 Connector 인증 정보를 관리하는 방법을 설명합니다.
  - 데이터소스/JMS 인증 정보 관리
  - 비밀번호 로테이션
  - **스크린샷:** 6개

#### 6.3 [SSL 구성](docs/security/ssl-configuration.md)
  Liberty 서버의 SSL/TLS 통신을 설정하고 관리하는 방법을 설명합니다.
  - 7개 SSL/TLS 프로토콜
  - 37개 암호화 스위트
  - Mutual SSL (양방향 인증)
  - **스크린샷:** 4개

#### 6.4 [인증서 관리](docs/security/certificate-management.md)
  Liberty 서버의 SSL/TLS 인증서와 키 저장소를 관리하는 방법을 설명합니다.
  - 키 저장소 관리 (PKCS12)
  - 개인/서명자 인증서 관리
  - **스크린샷:** 15개

</details>

### 7. 모니터링

<details>
<summary><strong>📋 모니터링 문서 보기</strong></summary>

#### 7.1 [모니터링](docs/monitoring/monitoring.md)
  Liberty 서버와 리소스의 실시간 성능을 모니터링하는 방법을 설명합니다.
  - **서버 모니터링**: 모니터링 시작/중지, 상태 관리
  - **연결 풀 모니터링**: 데이터소스 연결 풀 추적
  - **네임스페이스 현황**: JNDI 구조 확인
  - **모니터링 대시보드**: Instance/DB 성능 테이블
  - **모니터링 대시보드 (그래픽)**: 4개 시계열 그래프
  - **스크린샷:** 11개

</details>

### 8. 문제 분석

<details>
<summary><strong>📋 문제 분석 문서 보기</strong></summary>

#### 8.1 [덤프생성](docs/troubleshooting/dump-generation.md)
  Liberty 서버의 문제를 진단하기 위해 덤프를 생성하는 방법을 설명합니다.
  - **스레드 덤프**: 응답 없음, 높은 CPU, 스레드 풀 고갈
  - **힙 덤프**: 메모리 누수, OutOfMemoryError, GC 튜닝
  - **시스템 덤프**: JVM 크래시, 네이티브 메모리 누수
  - **분석 도구**: Eclipse MAT, FastThread, IBM TMDA
  - **실전 문제 해결**: 2개 시나리오
  - **스크린샷:** 7개

</details>

---

## LibriX의 가치 제안

### Open Liberty/WebSphere Liberty와의 관계

LibriX는 Open Liberty 및 WebSphere Liberty를 기반으로 하며, Liberty의 강력한 기능을 웹 UI로 제공합니다.

**Liberty의 전통적인 방식:**
- `server.xml` 파일을 수동으로 편집
- 복잡한 XML 구조와 구문 이해 필요
- JCache 구현체 구성 파일 별도 작성
- 각 서버마다 개별적으로 설정 파일 관리
- 설정 오류 발견이 어렵고 디버깅 시간 소요

**LibriX의 접근 방식:**
- **GUI 기반 구성**: 복잡한 XML 편집 불필요
- **자동 구성 생성**: server.xml 및 관련 설정 파일 자동 생성
- **중앙 관리**: 여러 서버의 설정을 한 곳에서 관리
- **시각적 모니터링**: 서버 상태를 실시간으로 확인
- **검증 기능**: 설정 오류 사전 방지
- **일관성 보장**: 동일한 구성을 여러 서버에 일관되게 적용

### 지원 기능

**서버 관리**
- Open Liberty 애플리케이션 서버 관리
- IBM HTTP Server / Apache HTTP Server 관리
- JCache 기반 세션 서버 관리
- 클러스터링 및 고가용성

**애플리케이션 관리**
- WAR/EAR 애플리케이션 배포
- 생명주기 관리 (시작, 중지, 업데이트)
- 무중단 배포 전략
- 가상호스트 및 컨텍스트 루트 구성

**리소스 관리**
- JDBC 제공자 관리 (8개 주요 DB 지원)
- 데이터소스 관리 (연결 풀 구성)
- J2C 인증 별칭 관리

**보안 관리**
- 사용자 계정 관리
- J2C 인증 데이터
- SSL/TLS 구성
- 인증서 관리

**모니터링**
- 서버 모니터링 (CPU, 메모리, 스레드)
- 연결 풀 모니터링
- JNDI 네임스페이스 현황
- 실시간 대시보드 (텍스트/그래픽)
- 성능 추세 분석

**문제 분석**
- 덤프 생성 (스레드/힙/시스템)
- 실시간 문제 진단
- 메모리 누수 탐지
- 성능 병목 분석

---

## 지원 데이터베이스

LibriX는 다음 데이터베이스를 공식 지원합니다:

- **Apache Derby** - Embedded 및 Network 모드
- **IBM DB2** - LUW, z/OS, i (JCC 및 CLI 드라이버)
- **Oracle Database** - 11g ~ 21c (Thin 및 OCI 드라이버)
- **MySQL / MariaDB** - MySQL 5.7, 8.0 및 MariaDB
- **PostgreSQL** - PostgreSQL 9.x ~ 15.x
- **Microsoft SQL Server** - SQL Server 2012 이상
- **IBM Informix** - Informix 11.x, 12.x, 14.x
- **SAP Sybase** - Sybase ASE

---

## 최근 업데이트

### 2026-01-27 ⭐ 신규
- ✅ **덤프생성** 문서 추가 (1360줄)
- ✅ 3가지 덤프 유형 상세 설명 (스레드/힙/시스템)
- ✅ 실전 문제 해결 시나리오 2개
- ✅ 분석 도구 가이드 (Eclipse MAT, FastThread, IBM TMDA)
- ✅ 7개 스크린샷 추가

### 2026-01-27
- ✅ **모니터링** 문서 추가 (624줄)
- ✅ 5개 모니터링 기능 문서화
- ✅ 11개 스크린샷 추가

### 2026-01-20
- ✅ **보안 관리** 문서 4개 추가
- ✅ 31개 스크린샷 추가

### 2026-01-19
- ✅ **시스템 관리** 문서 3개 추가
- ✅ 7개 스크린샷 추가

### 2026-01-15
- ✅ **환경 관리** 문서 3개 추가
- ✅ 11개 스크린샷 추가

### 2026-01-13
- ✅ **리소스 관리** 문서 2개 추가
- ✅ 20개 스크린샷 추가

### 2026-01-09
- ✅ **애플리케이션 관리** 문서 2개 추가

---

## GitHub 업로드 방법

```bash
# 1. 압축 해제
unzip librix-troubleshooting-docs.zip

# 2. GitHub 저장소로 이동
cd your-github-repo

# 3. 파일 복사
cp -r troubleshooting/* docs/

# 4. README.md 업데이트
cp README.md .

# 5. Git에 추가 및 커밋
git add README.md docs/troubleshooting/
git commit -m "Add Troubleshooting documentation (Dump Generation)"
git push
```

---

## 기여

문서 개선 제안이나 오류 발견 시 이슈를 등록해 주세요.

## 라이선스

이 문서는 LibriX 프로젝트의 일부입니다.
