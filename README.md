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
├── application/                    # 애플리케이션 관리 문서 ⭐ 신규
│   ├── application-install.md      # 애플리케이션 설치
│   ├── enterprise-application.md   # 엔터프라이즈 애플리케이션 관리
│   └── images/
│       ├── app_install/            # 애플리케이션 설치 이미지 (5개)
│       └── enterprise_app/         # 엔터프라이즈 애플리케이션 이미지 (6개)
└── environment/                    # 환경 관리 문서
    ├── session-domain.md           # 세션 도메인 관리
    └── images/
        └── session_domain/         # 세션 도메인 이미지 (3개)
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

- **데이터소스 관리**: 데이터베이스 연결 풀 구성
- **보안 관리**: 보안 도메인, 인증, 권한 부여
- **모니터링**: 성능 모니터링 및 통계
- **로그 관리**: 통합 로그 수집 및 분석

## 최근 업데이트

### 2026-01-09
- ✅ **애플리케이션 설치** 문서 추가 (5단계 설치 마법사)
- ✅ **엔터프라이즈 애플리케이션 관리** 문서 추가 (시작, 중지, 업데이트, 설치제거, 내보내기)

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
