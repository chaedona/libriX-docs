# LibriX 사용자 가이드

LibriX (Open Liberty 기반 관리 콘솔) 사용자 가이드 문서입니다.

## 📚 문서 구조

```
librix-docs/
├── README.md                              # 이 파일
└── docs/
    ├── server/                            # 서버 관리 문서
    │   ├── application-server.md          # 애플리케이션 서버 관리
    │   ├── web-server.md                  # 웹 서버 관리
    │   ├── session-server.md              # 세션 서버 관리
    │   ├── domain-server.md               # 도메인 서버 관리
    │   ├── cluster.md                     # 클러스터 관리
    │   └── images/                        # 서버 관련 이미지
    ├── application/                       # 애플리케이션 관리 문서
    │   ├── app-install.md                 # 애플리케이션 설치
    │   ├── enterprise-app.md              # 엔터프라이즈 애플리케이션 관리
    │   └── images/                        # 애플리케이션 관련 이미지
    └── resource/                          # 리소스 관리 문서
        ├── jdbc-provider.md               # JDBC 제공자 관리
        ├── datasource.md                  # 데이터소스 관리
        └── images/                        # 리소스 관련 이미지
            ├── jdbc_provider/             # JDBC 제공자 이미지 (14개)
            └── datasource/                # 데이터소스 이미지 (6개)
```

## 📖 문서 목록

### 서버 관리 (docs/server/)

#### 1. 애플리케이션 서버 관리
**파일:** `docs/server/application-server.md`

Liberty 기반 애플리케이션 서버의 생성, 시작, 중지, 구성 관리를 설명합니다.

**주요 내용:**
- 서버 개요
- 서버 생성 및 구성
- 서버 시작/중지
- 서버 모니터링

#### 2. 웹 서버 관리
**파일:** `docs/server/web-server.md`

IHS (IBM HTTP Server) 웹 서버 관리를 설명합니다.

**주요 내용:**
- 웹 서버 개요
- 웹 서버 생성
- 가상 호스트 설정
- 플러그인 구성

#### 3. 세션 서버 관리
**파일:** `docs/server/session-server.md`

세션 복제를 위한 세션 서버 관리를 설명합니다.

**주요 내용:**
- 세션 서버 개요
- 세션 서버 생성
- 세션 복제 구성
- 세션 모니터링

#### 4. 도메인 서버 관리
**파일:** `docs/server/domain-server.md`

중앙 집중식 관리를 위한 도메인 서버를 설명합니다.

**주요 내용:**
- 도메인 서버 개요
- 도메인 서버 구성
- 서버 관리
- 구성 동기화

#### 5. 클러스터 관리
**파일:** `docs/server/cluster.md`

고가용성을 위한 클러스터 구성 및 관리를 설명합니다.

**주요 내용:**
- 클러스터 개요
- 클러스터 생성
- 멤버 관리
- 로드 밸런싱

### 애플리케이션 관리 (docs/application/)

#### 6. 애플리케이션 설치
**파일:** `docs/application/app-install.md`

WAR/EAR 애플리케이션의 설치 방법을 설명합니다.

**주요 내용:**
- 애플리케이션 개요
- 설치 마법사 (6단계)
- 배포 옵션
- 애플리케이션 관리

#### 7. 엔터프라이즈 애플리케이션 관리
**파일:** `docs/application/enterprise-app.md`

설치된 엔터프라이즈 애플리케이션의 상세 관리를 설명합니다.

**주요 내용:**
- 애플리케이션 상세 화면
- 모듈 매핑
- 컨텍스트 루트 설정
- 시작/중지/업데이트/삭제

### 리소스 관리 (docs/resource/)

#### 8. JDBC 제공자 관리 ⭐
**파일:** `docs/resource/jdbc-provider.md` **(NEW)**

JDBC 드라이버를 관리하는 JDBC 제공자의 생성, 수정, 삭제 방법을 설명합니다.

**주요 내용:**
- JDBC 제공자 개요 및 역할
- JDBC 제공자 목록 및 범위 선택
- JDBC 제공자 생성 마법사 (3단계)
  - 1단계: 기본 정보 입력 (DB 유형, 제공자 유형, 구현 유형)
  - 2단계: 클래스 경로 설정
  - 3단계: 확인
- 데이터베이스별 설정 가이드
  - Derby, DB2, Oracle, MySQL, PostgreSQL, SQL Server, Informix, Sybase
- Liberty server.xml 구성 예시
- 문제 해결 가이드
- 모범 사례

**이미지:** 14개

#### 9. 데이터소스 관리 ⭐
**파일:** `docs/resource/datasource.md` **(NEW)**

애플리케이션이 데이터베이스에 연결하기 위한 데이터소스의 생성 및 관리 방법을 설명합니다.

**주요 내용:**
- 데이터소스 개요 및 역할
- 데이터소스 목록 및 범위 선택
- 데이터소스 생성 마법사 (5단계)
  - 1단계: 기본 정보 입력 (이름, JNDI, JDBC 버전)
  - 2단계: JDBC 제공자 선택
  - 3단계: 데이터베이스 연결 정보
  - 4단계: J2C 인증 별칭 설정
  - 5단계: 확인
- 데이터베이스별 속성 설정
- Liberty server.xml 구성 예시
- 생성 후 확인 및 테스트
- 문제 해결 가이드

**이미지:** 6개

## 🚀 시작하기

### 권장 읽기 순서

**초보자:**
1. 애플리케이션 서버 관리 → 서버 개념 이해
2. 애플리케이션 설치 → 애플리케이션 배포
3. JDBC 제공자 관리 → 데이터베이스 드라이버 설정
4. 데이터소스 관리 → 데이터베이스 연결

**고급 사용자:**
1. 클러스터 관리 → 고가용성 구성
2. 도메인 서버 관리 → 중앙 집중식 관리
3. 세션 서버 관리 → 세션 복제
4. 웹 서버 관리 → 웹 계층 구성

### 빠른 시작: 데이터베이스 연결 설정

**1단계: JDBC 제공자 생성**
```
자원 > JDBC 제공자 > 생성
→ 데이터베이스 유형 선택 (예: MySQL)
→ 드라이버 클래스 경로 입력
→ 완료
```

**2단계: 데이터소스 생성**
```
자원 > 데이터 소스 > 생성
→ 이름 및 JNDI 이름 입력
→ JDBC 제공자 선택
→ 데이터베이스 연결 정보 입력
→ 인증 정보 설정
→ 완료
```

**3단계: 연결 테스트**
```
데이터 소스 목록 > 데이터소스 선택 > 연결테스트
```

**4단계: 애플리케이션에서 사용**
```java
@Resource(name = "jdbc/myapp")
private DataSource dataSource;
```

## 🔧 지원 환경

### Liberty 버전
- Open Liberty 23.0.0.3 이상
- WebSphere Liberty 23.0.0.3 이상

### 지원 데이터베이스
- **Derby** - Apache Derby (Embedded/Network)
- **DB2** - IBM DB2 for LUW, z/OS, i
- **Oracle** - Oracle Database 11g, 12c, 18c, 19c, 21c
- **MySQL** - MySQL 5.7, 8.0, MariaDB
- **PostgreSQL** - PostgreSQL 9.x ~ 15.x
- **SQL Server** - Microsoft SQL Server 2012 이상
- **Informix** - IBM Informix 11.x, 12.x, 14.x
- **Sybase** - SAP Sybase ASE

### 지원 Java 버전
- Java 8 (JDBC 4.2)
- Java 11 (JDBC 4.2, 4.3)
- Java 17 (JDBC 4.3)

## 📖 주요 개념

### 서버 유형
- **애플리케이션 서버**: 비즈니스 로직 실행
- **웹 서버**: HTTP 요청 처리 및 정적 컨텐츠 서빙
- **세션 서버**: 세션 데이터 복제 및 관리
- **도메인 서버**: 중앙 집중식 관리

### 리소스 관리
- **JDBC 제공자**: JDBC 드라이버 정의 및 관리
- **데이터소스**: 데이터베이스 연결 풀 제공
- **J2C 인증 별칭**: 데이터베이스 인증 정보 관리

### 범위 (Scope)
리소스가 사용 가능한 범위를 정의합니다.
- **클러스터 범위**: 클러스터의 모든 멤버 서버
- **호스트 범위**: 호스트의 모든 서버
- **서버 범위**: 특정 서버만

## 🔗 관련 링크

### Liberty 공식 문서
- [Open Liberty Documentation](https://openliberty.io/docs/)
- [Liberty Configuration](https://openliberty.io/docs/latest/reference/config/)
- [Relational Database Connections](https://openliberty.io/docs/latest/relational-database-connections.html)

### JDBC 드라이버 다운로드
- [Apache Derby](https://db.apache.org/derby/)
- [IBM DB2 JDBC Drivers](https://www.ibm.com/support/pages/db2-jdbc-driver-versions-and-downloads)
- [Oracle JDBC Drivers](https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html)
- [MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/)
- [PostgreSQL JDBC Driver](https://jdbc.postgresql.org/)
- [Microsoft SQL Server JDBC Driver](https://docs.microsoft.com/en-us/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server)

## 📝 버전 히스토리

### v1.1 (2026-01-13)
- ✨ **NEW**: JDBC 제공자 관리 문서 추가
- ✨ **NEW**: 데이터소스 관리 문서 추가
- 📸 20개 스크린샷 추가 (JDBC 제공자 14개, 데이터소스 6개)
- 📚 데이터베이스별 상세 가이드 추가 (8개 DB)

### v1.0 (2026-01-09)
- 📘 초기 문서 작성
- 서버 관리 문서 (5개)
- 애플리케이션 관리 문서 (2개)

## 🎯 문서 특징

- **단계별 가이드**: 각 단계마다 스크린샷과 함께 상세한 설명
- **실전 예시**: 실제 사용 시나리오와 구성 예시
- **데이터베이스별 가이드**: 주요 데이터베이스의 상세 설정 방법
- **문제 해결**: 일반적인 오류와 해결 방법
- **모범 사례**: 프로덕션 환경을 위한 권장 사항
- **Liberty 구성**: server.xml 구성 예시
- **한글 문서**: 모든 문서가 한글로 작성됨

## 💡 활용 팁

### 개발 환경 설정
1. Derby Embedded를 사용한 빠른 시작
2. 개발용 데이터소스 구성
3. 애플리케이션 빠른 배포

### 프로덕션 환경 설정
1. 클러스터 구성으로 고가용성 확보
2. 세션 복제로 무중단 서비스
3. 웹 서버 연동으로 성능 최적화
4. 연결 풀 튜닝으로 데이터베이스 성능 향상

### 문제 해결
각 문서의 "문제 해결" 섹션 참조:
- JDBC 드라이버 로드 오류
- 데이터베이스 연결 실패
- 애플리케이션 배포 오류
- 클러스터 통신 문제

## 📧 기여 및 문의

문서 개선 제안이나 오류 발견 시 이슈를 등록해주세요.

---

**LibriX로 효율적인 Liberty 관리를! 🚀**
