# LibriX 관리 문서

LibriX 관리콘솔의 전체 기능에 대한 상세 문서입니다.

## 문서 구조

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
└── security/                       # 보안 관리 문서 ⭐ 신규
    ├── user-management.md          # 사용자 관리
    ├── j2c-authentication-data.md  # J2C 인증 데이터
    ├── ssl-configuration.md        # SSL 구성
    ├── certificate-management.md   # 인증서 관리
    └── images/
        ├── user_management/        # 사용자 관리 이미지 (6개)
        ├── j2c_auth/               # J2C 인증 데이터 이미지 (6개)
        ├── ssl_configuration/      # SSL 구성 이미지 (4개)
        └── certificate_management/ # 인증서 관리 이미지 (15개)
```

## 문서 목록

### 서버 관리

#### [애플리케이션 서버 관리](docs/server/application-server.md)

Open Liberty 애플리케이션 서버를 LibriX에서 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

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

</details>

#### [웹서버 관리](docs/server/web-server.md)

IBM HTTP Server 또는 Apache HTTP Server를 LibriX에서 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

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

</details>

#### [세션 서버 관리](docs/server/session-server.md)

JCache 기반 세션 서버를 LibriX에서 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

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

</details>

#### [클러스터 관리](docs/server/cluster.md)

여러 애플리케이션 서버를 하나의 논리적 그룹으로 관리하는 클러스터 기능을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- LibriX와 WebSphere ND NodeAgent 아키텍처
- Liberty Collective vs NodeAgent 방식 비교
- 클러스터 목록 및 상태 모니터링
- 클러스터 관리 탭 (생성, 삭제, 시작, 중지, 즉시 중지)
- 클러스터 생성 (3단계 프로세스)
  - 1단계: 클러스터 정보 입력
  - 2단계: 클러스터 멤버 작성
  - 3단계: 새 클러스터 확인
- 클러스터와 애플리케이션 서버
- 클러스터 설계 고려사항
- 클러스터 모니터링
- 문제 해결
- 운영 모범 사례

**스크린샷:** 5개

</details>

### 애플리케이션 관리

#### [애플리케이션 설치](docs/application/application-install.md)

WAR/EAR 애플리케이션을 Liberty 서버에 배포하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **1단계: 애플리케이션 업로드**
  - EAR/WAR 파일 선택 및 업로드
  - 파일 형식 검증

- **2단계: 설치 옵션 선택**
  - JSP 사전 컴파일
  - 설치 디렉토리 지정
  - 관리노드에 의한 애플리케이션 분배 설정
  - 애플리케이션 이름 설정
  - 클래스 리로딩 활성화 및 간격
  - JSP 리로딩 활성화 및 간격
  - 클래스 로딩 순서 (parentFirst/parentLast)

- **3단계: 배포할 서버 선택**
  - 클러스터 선택
  - 개별 서버 선택
  - 웹서버 연동

- **4단계: 가상호스트 설정**
  - 가상 호스트 개념 및 구성
  - default_host 가상 호스트
  - 가상 호스트 매핑
  - 가상 호스트 별칭 (Host Alias)
  - 다중 애플리케이션 격리
  - 보안 강화 (관리 트래픽 분리)
  - 다중 도메인 지원

- **5단계: 컨텍스트 루트 설정**
  - 컨텍스트 루트 개념 및 역할
  - 컨텍스트 루트 결정 규칙 (우선순위)
  - 기본 컨텍스트 루트
  - 컨텍스트 루트 명명 규칙
  - 루트 컨텍스트 (/)
  - 컨텍스트 루트 충돌 해결

- **배포 프로세스**
  - 파일 전송 및 배포
  - server.xml 구성 업데이트
  - 애플리케이션 시작
  - 웹서버 플러그인 업데이트

- **배포 전략**
  - 단계적 배포 (Phased Rollout)
  - Blue-Green 배포
  - Canary 배포

- **변경사항 확인 및 저장**
  - 저장 옵션
  - 변경사항 검토
  - 롤백 옵션

- **WebSphere ND와의 비교**

**스크린샷:** 5개

</details>

#### [엔터프라이즈 애플리케이션 관리](docs/application/enterprise-application.md)

배포된 애플리케이션의 전체 생명주기를 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **애플리케이션 목록 및 상태 모니터링**
  - 애플리케이션 목록 조회
  - 상태 표시 (실행 중, 중지됨, 시작 중, 경고)
  - 선택 및 다중 선택

- **애플리케이션 상세 설정**
  - 일반 특성
    - 애플리케이션 디렉토리
    - 관리노드에 의한 애플리케이션 분배 설정
    - 애플리케이션 이름
    - 클래스 리로딩 (간격 설정)
    - JSP 리로딩 (간격 설정)
    - 클래스 로딩 순서 (parentFirst vs parentLast 상세 비교)
  - 추가 특성
    - 컨텍스트 루트 설정 (URL 경로 매핑)
    - 가상호스트 설정 (네트워크 격리 및 도메인 매핑)
    - 공유 라이브러리 설정 (공통/전용 라이브러리 관리)
    - 모듈 맵핑 설정 (배포 대상 관리)

- **시작 (Start)**
  - 중지된 애플리케이션 활성화
  - 7단계 시작 프로세스
  - Liberty 시작 단계 상세
  - 문제 해결 (메모리, 포트, 종속성, Liberty 기능)
  - 클러스터 환경에서의 시작
  - 시작 후 확인 사항

- **중지 (Stop)**
  - 실행 중인 애플리케이션 비활성화
  - Graceful Shutdown (우아한 종료)
  - 진행 중인 요청 완료 후 정지 (30초 타임아웃)
  - 리소스 정리 및 메모리 해제
  - 문제 해결 (타임아웃, 리소스 누수, 세션 손실)
  - 클러스터 환경 및 롤링 중지

- **설치 (Install)**
  - 새로운 애플리케이션 배포
  - 설치 마법사 7단계
  - 6단계 설치 프로세스
  - 웹서버 플러그인 자동 업데이트
  - 애플리케이션 설치 문서 참조

- **설치제거 (Uninstall)**
  - 애플리케이션 완전 제거
  - EAR/WAR 파일 및 메타데이터 삭제
  - 캐시 및 임시 파일 정리
  - 9단계 제거 프로세스
  - 설치제거 vs 중지 비교
  - 백업 및 롤백 불가 주의사항
  - 클러스터 환경에서의 설치제거

- **업데이트 (Update)**
  - 기존 애플리케이션을 새 버전으로 교체
  - 구성 설정 자동 유지
  - 자동 백업 생성 옵션
  - 9단계 업데이트 프로세스
  - 업데이트되는 항목 vs 유지되는 항목
  - **업데이트 전략**
    - 일반 업데이트 (단일 서버)
    - Blue-Green 배포 (무중단)
    - 롤링 업데이트 (무중단)
    - 핫픽스 배포 (긴급)
  - 롤백 방법 (자동/수동)
  - 호환성, 테스트, 백업, 모니터링

- **내보내기 (Export)**
  - 설치된 애플리케이션을 EAR 파일로 다운로드
  - 현재 상태 + 설정 정보 포함
  - 원본과 다른 구성 파일 추가 (ibm-application-bnd, ibm-web-bnd, ibm-web-ext)
  - **사용 시나리오**
    - 프로덕션 백업
    - 개발→테스트→프로덕션 이관
    - 재해 복구
    - 다중 환경 배포
    - 버전 관리
  - 내보낸 파일 사용 방법
  - 주의사항 (민감 정보, 환경별 차이, 버전 호환성)

- **WebSphere ND와의 비교**

**스크린샷:** 6개

</details>

### 리소스 관리

#### [JDBC 제공자 관리](docs/resource/jdbc-provider.md) ⭐

JDBC 드라이버를 관리하는 JDBC 제공자의 생성, 수정, 삭제 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **JDBC 제공자 개요**
  - JDBC 제공자의 역할
  - Liberty 구현 방식
  - JDBC 제공자와 데이터소스의 관계

- **JDBC 제공자 메인 화면**
  - 범위 선택 드롭다운 (클러스터/호스트/서버)
  - 관리 탭 (생성, 삭제)
  - 목록 테이블 및 필터링

- **JDBC 제공자 생성 (3단계 마법사)**
  - **1단계: 새 JDBC 제공자 작성**
    - 범위 설정
    - 데이터베이스 유형 선택 (8개 DB)
    - 제공자 유형 선택 (DB별 상세)
    - 구현 유형 선택 (연결 풀/XA/Simple)
    - 이름 및 설명
  - **2단계: 클래스 경로 정보 입력**
    - 클래스 경로 설정
    - Liberty 변수 사용
    - 네이티브 라이브러리 경로
  - **3단계: 확인**
    - 입력 정보 검토
    - 완료 및 저장

- **데이터베이스별 JDBC 드라이버 설정 가이드**
  - Derby (Embedded/Network)
  - DB2 (JCC/CLI)
  - Oracle (Thin/OCI)
  - MySQL/MariaDB
  - PostgreSQL
  - SQL Server (Microsoft/jTDS)
  - Informix
  - Sybase

- **JDBC 제공자 상세 화면**
  - 구성 탭
  - 연결 풀 탭
  - 사용자 정의 속성

- **Liberty server.xml 구성**
  - 데이터베이스별 구성 예시
  - 고급 설정

- **문제 해결**
  - ClassNotFoundException
  - 드라이버 버전 충돌
  - 네이티브 라이브러리 오류
  - 격리 수준 문제

- **모범 사례**
  - 드라이버 파일 관리
  - 명명 규칙
  - 범위 선택 전략
  - 버전 관리
  - 보안 및 성능

- **WebSphere ND와의 비교**

**스크린샷:** 14개

</details>

#### [데이터소스 관리](docs/resource/datasource.md) ⭐

애플리케이션이 데이터베이스에 연결하기 위한 데이터소스의 생성 및 관리 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **데이터소스 개요**
  - 데이터소스의 역할
  - JDBC 제공자와의 관계
  - 연결 풀링

- **데이터소스 메인 화면**
  - 범위 선택
  - 관리 탭 (생성, 삭제, 연결테스트)
  - 목록 테이블 (이름, JNDI, 범위, 제공자, 버전)

- **데이터소스 생성 (5단계 마법사)**
  - **1단계: 기본 데이터 소스 정보 입력**
    - 범위 설정
    - 데이터 소스 이름
    - JNDI 이름 (애플리케이션 조회용)
    - JDBC 버전 (jdbc-4.0/4.2/4.3)
    - 복제 대상 데이터 소스 (선택사항)
    - 설명
  - **2단계: JDBC 제공자 선택**
    - 기존 JDBC 제공자 선택
    - 새 JDBC 제공자 작성 (선택사항)
  - **3단계: 기본 속성 정의**
    - 데이터베이스별 연결 정보
    - Derby: 데이터베이스 경로, 자동 생성
    - MySQL: 서버, 포트, DB명, 문자 인코딩, SSL
    - Oracle: 서버, 포트, SID/Service Name
    - PostgreSQL: 서버, 포트, DB명, 스키마, SSL
    - SQL Server: 서버, 포트, DB명, 암호화
    - DB2: 서버, 포트, DB명, 드라이버 유형
  - **4단계: 보안 별칭 설정**
    - J2C 인증 별칭 선택
    - 새 J2C 인증 별칭 작성
    - 데이터베이스 사용자 권한
    - 보안 모범 사례
  - **5단계: 새 데이터 소스 확인**
    - 입력 정보 검토
    - 완료 및 저장

- **생성 후 프로세스**
  - 구성 검증
  - Liberty server.xml 업데이트
  - 서버 자동 갱신
  - 연결 풀 초기화

- **생성 후 확인 및 테스트**
  - 목록 확인
  - Liberty 로그 확인
  - 연결 테스트
  - 애플리케이션 사용

- **문제 해결**
  - 이름 중복
  - 연결 실패
  - 인증 오류
  - 네트워크 문제

**스크린샷:** 6개

</details>

### 환경 관리

#### [세션 도메인 관리](docs/environment/session-domain.md)

세션 데이터를 공유하는 서버 그룹(세션 도메인)을 LibriX에서 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

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

</details>

#### [Liberty 변수 관리](docs/environment/liberty-variables.md) ⭐

Liberty 서버 구성에서 재사용 가능한 값을 정의하고 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **Liberty 변수 개요**
  - 변수의 역할 및 필요성
  - 구성 파일 재사용성 및 이식성
  - 환경별 설정 관리

- **Liberty 변수 메인 화면**
  - 범위 선택 (클러스터/호스트/서버)
  - 변수 목록 및 필터링
  - 시스템 변수 vs 사용자 정의 변수

- **Liberty 변수 생성**
  - 변수 이름 및 명명 규칙
  - 변수 값 설정
  - 범위 선택 전략

- **변수 사용**
  - server.xml에서 변수 참조 (${변수명})
  - 다른 변수 참조 및 조합
  - 기본값 설정
  - Liberty 내장 변수 활용

- **변수 유형**
  - 시스템 변수 (LibriX 자동 생성)
  - 사용자 정의 변수
  - Liberty 내장 변수

- **변수 우선순위**
  - 서버 범위 > 호스트 범위 > 클러스터 범위
  - 시스템 속성, 환경 변수, bootstrap.properties

- **Liberty server.xml 구성**
  - 기본 구문 및 예시
  - 환경별 구성

- **문제 해결**
  - 변수 값 미적용
  - 변수 참조 순환
  - 특수문자 처리

- **모범 사례**
  - 명명 규칙 일관성
  - 범위 선택 전략
  - 변수 조합 활용
  - 민감한 정보 보호

- **WebSphere ND와의 비교**

**스크린샷:** 4개

</details>

#### [가상호스트 관리](docs/environment/virtual-host.md) ⭐

하나의 Liberty 서버에서 여러 도메인과 애플리케이션을 분리하여 제공하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **가상호스트 개요**
  - 가상호스트의 역할 및 필요성
  - default_host (기본 가상호스트)
  - 다중 도메인/포트 처리

- **가상호스트 메인 화면**
  - 목록 조회 및 관리
  - 생성/삭제 탭

- **가상호스트 생성**
  - 가상호스트 이름 설정
  - 명명 규칙 (도메인/용도/환경 기반)
  - 호스트 별명 추가 필수

- **호스트 별명 관리**
  - 호스트명:포트 형식
  - 와일드카드 사용 (*, *.company.com)
  - IP 주소 및 대역 지원
  - 우선순위 및 매칭 규칙

- **요청 라우팅**
  - Host 헤더 기반 매칭
  - 매칭 우선순위

- **MIME 유형 관리**
  - 파일 확장자와 MIME 타입 매핑
  - 사용자 정의 MIME 타입

- **가상호스트 사용 사례**
  - 다중 도메인 호스팅
  - 포트 기반 분리
  - 환경별 분리
  - 보안 분리
  - API 버전 분리

- **애플리케이션 매핑**
  - server.xml 구성
  - LibriX 관리 콘솔 설정

- **Liberty server.xml 구성**
  - 기본 구문
  - 다중 도메인 구성
  - 와일드카드 사용

- **문제 해결**
  - 404 Not Found
  - 가상호스트 충돌
  - DNS/hosts 파일 문제

- **모범 사례**
  - 명명 규칙
  - 최소 권한 원칙
  - HTTPS 우선
  - 환경별 분리

- **WebSphere ND와의 비교**

**스크린샷:** 5개

</details>

#### [공유 라이브러리 관리](docs/environment/shared-library.md) ⭐

여러 애플리케이션이 공통으로 사용하는 JAR 파일을 중앙에서 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **공유 라이브러리 개요**
  - 공유 라이브러리의 역할 및 필요성
  - 공유 라이브러리 vs 애플리케이션 내장
  - 클래스로더 계층

- **공유 라이브러리 메인 화면**
  - 목록 조회 및 관리
  - 생성/삭제 탭

- **공유 라이브러리 생성**
  - 라이브러리 이름 설정
  - 명명 규칙 (DB/프레임워크/용도 기반)
  - **디렉토리 경로 설정**
    - JAR 파일이 있는 디렉토리 지정
    - Liberty 변수 활용
    - 패턴 매칭 (includes/excludes)
  - **파일 경로 설정**
    - 특정 JAR 파일 직접 지정
    - 정확한 버전 제어
  - **바이너리 파일 경로 설정**
    - 네이티브 라이브러리 (.so, .dll, .dylib)
    - Oracle, DB2 등 네이티브 드라이버
  - **단일 클래스 로더 옵션**
    - 단일 vs 개별 클래스로더
    - 라이브러리 간 의존성 해결
    - 메모리 효율성

- **경로 설정 전략**
  - 디렉토리 기반 (권장)
  - 파일 기반
  - 혼합 방식

- **공유 라이브러리 사용 사례**
  - 데이터베이스 드라이버
  - Apache Commons 라이브러리
  - 사내 공통 모듈
  - 로깅 프레임워크
  - REST API 라이브러리

- **애플리케이션 매핑**
  - 개별 애플리케이션
  - 여러 라이브러리
  - 모든 애플리케이션
  - 클래스로더 위임 설정 (parentFirst/parentLast)

- **Liberty server.xml 구성**
  - 기본 구문 (library, fileset, file)
  - 여러 디렉토리 포함
  - 패턴 매칭
  - 네이티브 라이브러리 포함

- **문제 해결**
  - ClassNotFoundException
  - NoClassDefFoundError
  - 버전 충돌
  - 네이티브 라이브러리 로드 실패

- **모범 사례**
  - 디렉토리 구조 표준화
  - 명명 규칙 일관성
  - 버전 관리
  - 의존성 문서화
  - 단일 클래스로더 사용
  - Liberty 변수 활용

- **WebSphere ND와의 비교**

**스크린샷:** 2개

</details>

### 시스템 관리

#### [배치 관리자 관리](docs/system-management/deployment-manager.md) ⭐

LibriX의 중앙 관리 서버인 배치 관리자(Deployment Manager)의 구성 및 관리 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **배치 관리자 개요**
  - 중앙 관리 서버 역할
  - WebSphere ND Deployment Manager와의 관계
  - 노드 및 서버 구성 정보 저장
  - 클러스터 관리

- **배치 관리자 화면**
  - 구성 탭 (일반 특성, 서버 인프라)
  - 런타임 탭 (실행 상태, 리소스 정보)

- **구성 탭**
  - 이름 (dmgr)
  - 호스트 이름 (FQDN/IP)
  - 프로세스 정의
  - 포트 설정 (8개 포트)
  - 중지 버튼

- **런타임 탭**
  - 프로세스 ID
  - 호스트
  - 상태 (STARTED/STARTING/STOPPING/STOPPED)
  - 현재 힙 크기
  - 최대 힙 크기

- **프로세스 정의**
  - 클래스 경로
  - 부트클래스 경로
  - 상세한 클래스 로딩
  - 상세한 가비지 콜렉션
  - 상세한 JNI
  - 초기 힙 크기
  - 최대 힙 크기
  - 일반 JVM 인수
  - JIT 사용 안함
  - 운영 체제 이름

- **포트 설정**
  - JMX_ENDPOINT_ADDRESS (28010)
  - JMX_ENDPOINT_SECURE_ADDRESS (28011)
  - WC_DEFAULTHOST (29060)
  - WC_DEFAULTHOST_SECURE (29043) - 관리 콘솔
  - SIB_ENDPOINT_ADDRESS (27273)
  - SIB_ENDPOINT_SECURE_ADDRESS (27274)
  - ORB_LISTENER_ADDRESS (22808)
  - ORB_LISTENER_SECURE_ADDRESS (22809)

- **배치 관리자의 역할**
  - 중앙 구성 저장소
  - 구성 동기화
  - 클러스터 관리
  - 애플리케이션 배포 조율
  - 보안 및 인증

- **배치 관리자 시작 및 중지**
  - Liberty 명령어
  - systemd 서비스
  - 시작/중지 프로세스

- **아키텍처**
  - 시스템 구성도
  - 통신 흐름
  - WebSphere ND와의 비교

- **문제 해결**
  - 시작 실패
  - 노드 에이전트 연결 실패
  - 구성 동기화 실패

- **모범 사례**
  - 고가용성 구성
  - 백업 전략
  - 모니터링
  - 보안 강화

**스크린샷:** 4개

</details>

#### [노드 관리](docs/system-management/node-management.md) ⭐

Liberty 서버들의 논리적 그룹인 노드를 배치 관리자에서 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **노드 개요**
  - 노드의 개념 및 역할
  - WebSphere ND Node와의 관계
  - 노드 = 호스트 + Node Agent + 서버들

- **노드 관리 화면**
  - 비관리 노드 추가
  - 노드 삭제
  - 동기화 확인

- **노드 목록**
  - 선택
  - 호스트 이름
  - 버전
  - 동기화 상태 (SYNC/UNSYNC/Unknown)

- **노드의 개념**
  - 서버 그룹화
  - 관리 단위
  - 배포 대상
  - 장애 격리
  - 노드와 호스트 관계
  - 노드와 클러스터 관계

- **비관리 노드 추가**
  - 노드 등록 개요
  - 비관리 노드 추가 화면
  - 호스트명 입력 (필수)
  - 등록 전 준비사항
    - Liberty 설치
    - Node Agent 생성
    - Node Agent 구성
    - 네트워크 연결 확인
    - 방화벽 규칙
  - 등록 프로세스 (3단계)
  - 등록 후 확인
  - 등록 문제 해결

- **노드 삭제**
  - 삭제 프로세스
  - 삭제 후 상태
  - 영향 범위

- **구성 동기화**
  - 동기화 개념
  - 마스터 구성 vs 로컬 구성
  - 자동 동기화
  - 수동 동기화
  - 동기화 문제 해결

- **WebSphere ND와의 비교**
  - 아키텍처 비교
  - 기능 비교
  - 마이그레이션 가이드

- **모범 사례**
  - 노드 명명 규칙
  - 노드 구성 계획
  - 동기화 모니터링
  - 백업 전략

**스크린샷:** 2개

</details>

#### [노드 에이전트 관리](docs/system-management/node-agent.md) ⭐

각 노드에서 실행되는 관리 에이전트인 Node Agent의 구성 및 관리 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **Node Agent 개요**
  - Node Agent의 역할
  - WebSphere ND NodeAgent와의 관계
  - 통신 중계자 역할
  - 위치 및 아키텍처

- **Node Agent 화면**
  - 중지
  - 재시작
  - 목록 테이블

- **Node Agent 목록**
  - 선택
  - 이름 (nodeagent)
  - 호스트 이름
  - 버전
  - 상태 (STARTED/STOPPED/STARTING/UNKNOWN)

- **Node Agent의 역할**
  - 통신 중계자
    - REST/HTTPS 기반 통신
    - 구성 동기화
    - 상태 보고
    - 관리 명령 수신
  - 구성 동기화
    - 자동/수동 동기화
    - 동기화 프로세스
  - 서버 생명주기 관리
    - 서버 시작/중지/재시작
    - 서버 상태 확인
  - 상태 모니터링
    - Node Agent 자체
    - Liberty 서버
    - 시스템 리소스
  - 로그 수집

- **Node Agent 구성**
  - 설치 위치
  - server.xml 구성
  - bootstrap.properties
  - jvm.options

- **Node Agent 시작 및 중지**
  - Liberty 명령어
  - 시작 프로세스
  - 시작 확인
  - 자동 시작 설정 (systemd)
  - 중지 프로세스
  - 중지 시 영향
  - 재시작

- **Node Agent 문제 해결**
  - 시작 실패
  - dmgr 연결 실패
  - 동기화 실패
  - 메모리 부족

- **WebSphere ND와의 비교**
  - 아키텍처 비교
  - 기능 비교

- **모범 사례**
  - 자동 시작 설정
  - 모니터링
  - 로그 관리
  - 보안

**스크린샷:** 1개

</details>
### 보안 관리

#### [사용자 관리](security/user-management.md) ⭐

LibriX 관리콘솔의 사용자 계정을 생성하고 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **사용자 관리 개요**
  - Basic User Registry 기반 인증
  - 역할 기반 접근 제어 (administrator / reader)

- **사용자 메인 화면**
  - 사용자 목록 및 관리 탭

- **사용자 생성**
  - 사용자 아이디 (필수)
  - 패스워드 (필수)
  - 권한 선택 (administrator / reader)

- **역할 비교**
  - administrator: 전체 권한
  - reader: 읽기 전용

- **변경사항 저장 프로세스**
  - 적용 → 저장 메시지 → 검토 → 저장/버리기

- **사용자 상세 및 편집**
  - 패스워드 변경
  - 역할 변경

- **사용자 삭제**
  - 4단계 삭제 프로세스
  - 제한사항 (마지막 관리자, 현재 사용자)

- **Liberty 구성**
  - Basic User Registry 구성
  - userRegistry.xml 구조
  - XOR 비밀번호 인코딩

- **WebSphere ND와의 비교**
  - Federated Repository vs Basic User Registry

- **보안 모범 사례**
  - 비밀번호 정책
  - 최소 권한 원칙
  - 감사 로그

- **문제 해결**

**스크린샷:** 6개

</details>

#### [J2C 인증 데이터](security/j2c-authentication-data.md) ⭐

Java 2 Connector 인증 정보를 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **J2C 인증 데이터 개요**
  - Java 2 Connector 아키텍처
  - 데이터소스/JMS 인증 정보 관리

- **J2C 인증 데이터 메인 화면**
  - 목록 테이블 (별명, 사용자 ID, 설명)
  - 생성/삭제 탭

- **인증 데이터 생성**
  - 별명 (필수) - 명명 규칙
  - 사용자 ID (필수) - 데이터베이스별 예시
  - 비밀번호 (필수) - XOR 인코딩
  - 설명 (선택)

- **변경사항 저장 프로세스**
  - authentication.json 업데이트

- **인증 데이터 상세 및 편집**
  - 사용자 ID 변경
  - 비밀번호 변경 (정기 로테이션)

- **인증 데이터 삭제**
  - 참조 관계 확인 중요성

- **Liberty J2C 인증 데이터 구성**
  - AuthData 요소
  - 데이터소스/JMS에서 참조

- **WebSphere ND와의 비교**
  - J2C Authentication Alias

- **사용 시나리오**
  - 데이터소스 인증 구성
  - 다중 환경 관리
  - JMS 메시징 인증
  - 비밀번호 로테이션

- **보안 모범 사례**
  - 강력한 비밀번호
  - 최소 권한 원칙
  - 외부 비밀 관리 시스템

- **문제 해결**

**스크린샷:** 6개

</details>

#### [SSL 구성](security/ssl-configuration.md) ⭐

Liberty 서버의 SSL/TLS 통신을 설정하고 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **SSL 구성 개요**
  - SSL/TLS 프로토콜
  - Liberty 구현

- **SSL 구성 메인 화면**
  - NodeSSLSettings (자동 생성)

- **SSL 구성 상세 설정**
  - 클라이언트 인증 (없음 / 활성화)
  - 클라이언트 인증 지원 (없음 / 활성화)
  - Mutual SSL (양방향 인증)

- **SSL 프로토콜**
  - 7개 프로토콜 (SSL, TLSv1.3, TLSv1.2, TLSv1.1, TLSv1, SSLv3, SSLv2Hello)
  - 프로토콜별 보안 수준 및 권장사항

- **암호화 알고리즘 설정**
  - 37개 암호화 스위트
  - TLS 1.3 전용 (3개)
  - TLS 1.2 권장 스위트
  - 보안 등급 분류
  - 피해야 할 암호화

- **사용자 정의 특성**
  - SSL 세션 캐시
  - 타임아웃 설정

- **Liberty SSL 구성**
  - server.xml 구성
  - 암호화 스위트 제한

- **WebSphere ND와의 비교**

- **사용 시나리오**
  - HTTPS 활성화
  - 프로덕션 SSL 구성
  - Mutual SSL
  - 레거시 클라이언트 지원

- **보안 모범 사례**
  - 프로토콜 선택 (TLS 1.2+)
  - 암호화 스위트 선택
  - 인증서 관리
  - 프로덕션 환경 체크리스트

- **문제 해결**

**스크린샷:** 4개

</details>

#### [인증서 관리](security/certificate-management.md) ⭐

Liberty 서버의 SSL/TLS 인증서와 키 저장소를 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- **인증서 관리 개요**
  - 키 저장소와 인증서
  - PKCS12 형식

- **인증서 관리 메인 화면**
  - NodeDefaultKeyStore (자동 생성)

- **키 저장소 상세 설정**
  - 경로 (Liberty 변수)
  - 비밀번호
  - 읽기 전용
  - 인증서 실시간 반영
  - 리로딩 간격

- **개인 인증서 관리**
  - 서버 인증서 + 개인키
  - 5개 관리 탭 (가져오기, 내보내기, 교체, 갱신, 폐기)

- **인증서 상세 정보**
  - 11개 필드 (별명, 버전, 키 크기, 일련번호, 만기일 등)

- **인증서 작업**
  - 가져오기 (PKCS12)
  - 내보내기 (파일/노드)
  - 교체 (만료 예정)
  - 갱신 (자체 서명)
  - 폐기 (삭제)

- **서명자 인증서 관리**
  - CA 인증서
  - 4개 관리 탭
  - 파일/포트에서 가져오기

- **Liberty 인증서 구성**
  - server.xml 구성
  - keytool 명령어

- **WebSphere ND와의 비교**

- **사용 시나리오**
  - 공인 CA 인증서 설정
  - Let's Encrypt 무료 인증서
  - Mutual SSL
  - 인증서 갱신 (무중단)

- **보안 모범 사례**
  - 개인키 보호
  - 비밀번호 관리
  - 인증서 수명 주기 관리
  - 프로덕션 환경 체크리스트

- **문제 해결**

**스크린샷:** 15개

</details>
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

**애플리케이션 관리**
- WAR/EAR 애플리케이션 배포 (5단계 마법사)
- 애플리케이션 생명주기 관리 (시작, 중지, 업데이트, 설치제거)
- 가상호스트 및 컨텍스트 루트 구성
- 공유 라이브러리 관리
- 애플리케이션 백업 및 내보내기
- 무중단 배포 전략 (Blue-Green, 롤링 업데이트, Canary)

**리소스 관리**
- JDBC 제공자 관리 (8개 주요 데이터베이스 지원)
- 데이터소스 관리 (연결 풀 구성)
- J2C 인증 별칭 관리
- 데이터베이스 연결 테스트

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

**보안 관리**
- 사용자 계정 관리 (Basic User Registry)
- J2C 인증 데이터 관리
- SSL/TLS 구성 (프로토콜, 암호화 스위트)
- 인증서 관리 (키 저장소, 개인/서명자 인증서)
 
## 지원 데이터베이스

LibriX는 다음 데이터베이스를 공식 지원합니다:

- **Apache Derby** - Embedded 및 Network 모드
- **IBM DB2** - LUW, z/OS, i (JCC 및 CLI 드라이버)
- **Oracle Database** - 11g, 12c, 18c, 19c, 21c (Thin 및 OCI 드라이버)
- **MySQL** - MySQL 5.7, 8.0 및 MariaDB
- **PostgreSQL** - PostgreSQL 9.x ~ 15.x
- **Microsoft SQL Server** - SQL Server 2012 이상
- **IBM Informix** - Informix 11.x, 12.x, 14.x
- **SAP Sybase** - Sybase ASE

각 데이터베이스에 대한 상세한 설정 가이드가 문서에 포함되어 있습니다.

## 향후 추가 예정 문서

다음 문서들이 추가될 예정입니다:

- **연결 풀 최적화**: 성능 튜닝 가이드
- **보안 관리**: 보안 도메인, 인증, 권한 부여
- **모니터링**: 성능 모니터링 및 통계
- **로그 관리**: 통합 로그 수집 및 분석

## 최근 업데이트

### 2026-01-20
- ✅ **사용자 관리** 문서 추가 (Basic User Registry, 역할 관리, 사용자 생명주기)
- ✅ **J2C 인증 데이터** 문서 추가 (데이터소스/JMS 인증, authentication.json 구성)
- ✅ **SSL 구성** 문서 추가 (7개 프로토콜, 37개 암호화 스위트, Mutual SSL)
- ✅ **인증서 관리** 문서 추가 (키 저장소, 개인/서명자 인증서, PKCS12)
- ✅ 31개 스크린샷 추가 (사용자 관리 6개, J2C 인증 6개, SSL 구성 4개, 인증서 관리 15개)

### 2026-01-19
- ✅ **배치 관리자 관리** 문서 추가 (구성/런타임 탭, 프로세스 정의, 포트 설정)
- ✅ **노드 관리** 문서 추가 (비관리 노드 추가, 동기화 상태, 노드 개념)
- ✅ **노드 에이전트 관리** 문서 추가 (통신 중계, 구성 동기화, 생명주기 관리)
- ✅ 7개 스크린샷 추가 (배치 관리자 4개, 노드 관리 2개, 노드 에이전트 1개)

### 2026-01-15
- ✅ **Liberty 변수 관리** 문서 추가 (범위별 변수 관리, 환경별 설정)
- ✅ **가상호스트 관리** 문서 추가 (다중 도메인, 호스트 별명 구성)
- ✅ **공유 라이브러리 관리** 문서 추가 (JAR 파일 중앙 관리, 클래스로더 설정)
- ✅ 11개 스크린샷 추가 (Liberty 변수 4개, 가상호스트 5개, 공유 라이브러리 2개)

### 2026-01-13
- ✅ **JDBC 제공자 관리** 문서 추가 (3단계 생성 마법사, 8개 DB 지원)
- ✅ **데이터소스 관리** 문서 추가 (5단계 생성 마법사, 연결 풀 구성)
- ✅ 20개 스크린샷 추가 (JDBC 제공자 14개, 데이터소스 6개)

### 2026-01-09
- ✅ **애플리케이션 설치** 문서 추가 (5단계 설치 마법사)
- ✅ **엔터프라이즈 애플리케이션 관리** 문서 추가 (시작, 중지, 업데이트, 설치제거, 내보내기)

## GitHub 업로드 방법

```bash
# 1. 압축 해제
unzip librix-docs.zip
# 또는
tar -xzf librix-docs.tar.gz

# 2. GitHub 저장소로 이동
cd your-github-repo

# 3. 파일 복사
cp -r librix-docs/* .

# 4. Git에 추가 및 커밋
git add README.md docs/
git commit -m "Add System Management documentation (Deployment Manager, Node Management, Node Agent)"
git push
```

## 기여

문서 개선 제안이나 오류 발견 시 이슈를 등록해 주세요.

## 라이선스

이 문서는 LibriX 프로젝트의 일부입니다.
