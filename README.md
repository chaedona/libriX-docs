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
[서버 관리, 애플리케이션 관리, 리소스 관리, 환경 관리, 시스템 관리 섹션은 기존과 동일하므로 생략]

### 보안 관리

#### [사용자 관리](security/user-management.md) ⭐

LibriX 관리콘솔의 사용자 계정을 생성하고 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- 사용자 관리 개요 (Basic User Registry, 역할 관리)
- 사용자 생성 (아이디, 패스워드, 권한)
- 역할 비교 (administrator / reader)
- 변경사항 저장 프로세스
- 사용자 편집 및 삭제
- Liberty 구성 (userRegistry.xml, XOR 인코딩)
- WebSphere ND와의 비교
- 보안 모범 사례
- 문제 해결

**스크린샷:** 6개

</details>

#### [J2C 인증 데이터](security/j2c-authentication-data.md) ⭐

Java 2 Connector 인증 정보를 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- J2C 인증 데이터 개요
- 인증 데이터 생성 (별명, 사용자 ID, 비밀번호)
- 데이터소스/JMS에서 사용
- authentication.json 구성
- 사용 시나리오 (데이터소스, JMS, 비밀번호 로테이션)
- WebSphere ND와의 비교
- 보안 모범 사례

**스크린샷:** 6개

</details>

#### [SSL 구성](security/ssl-configuration.md) ⭐

Liberty 서버의 SSL/TLS 통신을 설정하고 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- SSL 구성 개요
- 클라이언트 인증 (Mutual SSL)
- SSL 프로토콜 (7개)
- 암호화 알고리즘 (37개 스위트)
- 사용자 정의 특성
- 사용 시나리오 (HTTPS, Mutual SSL, 레거시 지원)
- 보안 모범 사례 (TLS 1.2+, 암호화 선택)

**스크린샷:** 4개

</details>

#### [인증서 관리](security/certificate-management.md) ⭐

Liberty 서버의 SSL/TLS 인증서와 키 저장소를 관리하는 방법을 설명합니다.

<details>
<summary><strong>📋 주요 내용 보기</strong></summary>

- 인증서 관리 개요 (PKCS12)
- 키 저장소 상세 설정 (경로, 비밀번호, 실시간 반영)
- 개인 인증서 관리 (5개 탭)
- 서명자 인증서 관리 (4개 탭)
- 인증서 작업 (가져오기, 내보내기, 교체, 갱신, 폐기)
- Liberty 인증서 구성 (keytool)
- 사용 시나리오 (공인 CA, Let's Encrypt, Mutual SSL, 갱신)
- 보안 모범 사례 (개인키 보호, 수명 주기 관리)

**스크린샷:** 15개

</details>

## LibriX의 가치 제안
[기존 내용과 동일]

### 지원 기능

**보안 관리**
- 사용자 계정 관리 (Basic User Registry)
- J2C 인증 데이터 관리
- SSL/TLS 구성 (프로토콜, 암호화 스위트)
- 인증서 관리 (키 저장소, 개인/서명자 인증서)

[나머지 기능들은 기존과 동일]

## 지원 데이터베이스
[기존과 동일]

## 향후 추가 예정 문서
[기존과 동일]

## 최근 업데이트

### 2026-01-20
- ✅ **사용자 관리** 문서 추가 (Basic User Registry, 역할 관리, 사용자 생명주기)
- ✅ **J2C 인증 데이터** 문서 추가 (데이터소스/JMS 인증, authentication.json 구성)
- ✅ **SSL 구성** 문서 추가 (7개 프로토콜, 37개 암호화 스위트, Mutual SSL)
- ✅ **인증서 관리** 문서 추가 (키 저장소, 개인/서명자 인증서, PKCS12)
- ✅ 31개 스크린샷 추가 (사용자 관리 6개, J2C 인증 6개, SSL 구성 4개, 인증서 관리 15개)

[이전 업데이트 내역은 기존과 동일]

## GitHub 업로드 방법

```bash
# 1. 압축 해제
unzip librix-security-docs.zip

# 2. GitHub 저장소로 이동
cd your-github-repo

# 3. 파일 복사
cp -r docs/security/* docs/security/

# 4. Git에 추가 및 커밋
git add README.md docs/security/
git commit -m "Add Security Management documentation"
git push
```

## 기여

문서 개선 제안이나 오류 발견 시 이슈를 등록해 주세요.

## 라이선스

이 문서는 LibriX 프로젝트의 일부입니다.
