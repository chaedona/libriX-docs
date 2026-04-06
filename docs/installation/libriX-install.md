# LibriX 설치 가이드

> **제품:** LibriX V2.0
> **최종 수정:** 2026-04-06

---

## 목차

1. [제품 설치 미디어 정보](#1-제품-설치-미디어-정보)
2. [제품 설치 방법](#2-제품-설치-방법)
3. [제품 운영 방법](#3-제품-운영-방법)

---

## 1. 제품 설치 미디어 정보

LibriX V2.0 설치 미디어는 사용하는 Liberty 종류에 따라 구성이 다릅니다.

### 가) Open Liberty 및 LibriX

| 파일명 | 설명 |
|---|---|
| `01.script.zip` | 설치 시 필요한 스크립트 모음 |
| `02.templates.zip` | LibriX 환경을 위한 서버 템플릿 |
| `features.txt` | Open Liberty에 포함된 서버 기능 목록 |
| `features_jdbc.txt` | Open Liberty에 포함된 JDBC 기능 목록 |
| `init.bat` | (Windows) 초기 설치 및 초기 환경 구성 스크립트 |
| `init.sh` | (UNIX/Linux) 초기 설치 및 초기 환경 구성 스크립트 |
| `liberty-collective-client-jakarta-v1.war` | Jakarta EE를 사용하는 서버의 상태 체크 모듈 |
| `liberty-collective-client-javaee-v1.war` | Java EE를 사용하는 서버의 상태 체크 모듈 |
| `liberty-dmgr-v1.war` | 통합 관리를 위한 Deployment Manager 모듈 |
| `liberty-external-utils.jar` | LibriX 구성 및 운영에 필요한 모듈 |
| `liberty-nodeagent-v1.war` | 각 노드를 관리하는 Node Agent 모듈 |
| `openliberty-[VERSION].zip` | Open Liberty 미디어 파일 |
| `userRegistry.xml` | LibriX 초기 구성에 필요한 사용자 계정 정보 |

### 나) WebSphere Liberty 및 LibriX

| 파일명 | 설명 |
|---|---|
| `01.script.zip` | 설치 시 필요한 스크립트 모음 |
| `02.templates.zip` | LibriX 환경을 위한 서버 템플릿 |
| `init.bat` | (Windows) 초기 설치 및 초기 환경 구성 스크립트 |
| `init.sh` | (UNIX/Linux) 초기 설치 및 초기 환경 구성 스크립트 |
| `liberty-collective-client-jakarta-v1.war` | Jakarta EE를 사용하는 서버의 상태 체크 모듈 |
| `liberty-collective-client-javaee-v1.war` | Java EE를 사용하는 서버의 상태 체크 모듈 |
| `liberty-dmgr-v1.war` | 통합 관리를 위한 Deployment Manager 모듈 |
| `liberty-external-utils.jar` | LibriX 구성 및 운영에 필요한 모듈 |
| `liberty-nodeagent-v1.war` | 각 노드를 관리하는 Node Agent 모듈 |
| `wlp-[JAVA_SPEC]-[VERSION].zip` | WebSphere Liberty 미디어 파일 |
| `wlp-featureRepo-[VERSION].zip` | WebSphere Liberty Feature 저장소 |
| `userRegistry.xml` | LibriX 초기 구성에 필요한 사용자 계정 정보 |

---

## 2. 제품 설치 방법

### 가) 사전 정의 내용

설치 전 WAS 계정의 환경 변수 파일(예: `~/.bash_profile` 또는 `~/.bashrc`)에 아래 내용을 추가합니다.

> ⚠️ **주의** 아래 경로는 실제 설치 환경에 맞게 수정하십시오.
> `WLP_HOME`과 `JAVA_HOME`은 반드시 올바른 경로로 지정해야 합니다.

```bash
WLP_HOME=/was/wlp
JAVA_HOME=/was/java/jdk21
PATH=$JAVA_HOME/bin:$PATH:$HOME/.local/bin:$HOME/bin/:$WLP_HOME/bin
export PATH

# 로그 확인 별칭
alias dmlog="tail -f $WLP_HOME/usr/servers/dmgr/logs/messages.log"
alias nodelog="tail -f $WLP_HOME/usr/servers/nodeagent/logs/messages.log"

# 디렉토리 이동 별칭
alias cfg="cd $WLP_HOME/usr/servers"
alias tmp="cd $WLP_HOME/usr/servers/dmgr/tmp/"
alias rs="cd $WLP_HOME/usr/shared/resources/"
alias home="cd $WLP_HOME"
alias logs="cd $WLP_HOME/usr/logs"
alias bin="cd $WLP_HOME/bin"

# 서버 기동/중지 별칭
alias sysout="tail -f messages.log"
alias dmstart="server start dmgr;dmlog"
alias dmstop="server stop dmgr"
alias dmrestart="server stop dmgr;server start dmgr;dmlog"
alias nodestart="server start nodeagent;nodelog"
alias nodestop="server stop nodeagent"
alias noderestart="server stop nodeagent;server start nodeagent;nodelog"
```

### 나) 설치

#### ■ 초기 설치 (공통)

**1.** `media.zip` 파일을 압축 해제합니다.

```bash
unzip media.zip
# 또는:
jar -xvf media.zip
```

**2.** `init.sh` 파일을 실행합니다.

```bash
./init.sh <WLP_HOME> <JAVA_HOME> <WLP_MEDIA_FILE_NAME> <WLP_REPOSITORY>
```

| 파라미터 | 설명 |
|---|---|
| `<WLP_HOME>` | LibriX를 설치할 디렉토리 경로 |
| `<JAVA_HOME>` | WAS 계정에 설정된 JAVA_HOME 경로 |
| `<WLP_MEDIA_FILE_NAME>` | Open Liberty 또는 WebSphere Liberty 미디어 파일 경로 |
| `<WLP_REPOSITORY>` | Open Liberty: 마침표(`.`) 입력 / WebSphere Liberty: `wlp-featureRepo-[버전].zip` 파일 경로 (디렉토리명 포함) |

---

#### ■ Open Liberty 및 LibriX 설치

실행 예시:

```bash
./init.sh /was/wlp /etc/alternatives/jre_17/ ./openliberty-25.0.0.11.zip .
```

---

#### ■ WebSphere Liberty 및 LibriX 설치

실행 예시:

```bash
./init.sh /was/wlp25 /etc/alternatives/jre_17/ ./wlp-jakartaee10-25.0.0.11.zip /was/media/wlp-featureRepo-25.0.0.11.zip
```

---

### 다) Deployment Manager 및 Node 생성

> 📋 **참고** 아래 모든 스크립트는 LibriX가 설치된 홈 디렉토리의 `[LibriX_HOME]/bin` 에서 실행해야 합니다.

#### ■ Deployment Manager 생성

**1.** `createDmgr.sh`를 실행합니다.

```bash
./createDmgr.sh
```

#### ■ Node Agent 생성

**1.** `createNodeAgent.sh`를 실행합니다.

```bash
./createNodeAgent.sh
```

#### ■ Deployment Manager 기동

**1.** Deployment Manager를 기동합니다.

```bash
[LibriX_HOME]/bin/server start dmgr
```

#### ■ 노드 연합 (Deployment Manager 기동 이후 실행)

**Open Liberty 및 LibriX 환경:**

**1.** 실행 형식:

```bash
./addNode.sh [NODEAGENT_HOME] [DM_HOST] [DM_PORT]
```

| 파라미터 | 설명 |
|---|---|
| `<NODEAGENT_HOME>` | Node Agent가 구성된 홈 디렉토리. `createNodeAgent.sh` 실행 시 출력되는 경로를 입력합니다. 예) `/was/wlp/usr/servers/nodeagent` |
| `<DM_HOST>` | Deployment Manager가 설치된 hostname |
| `<DM_PORT>` | Deployment Manager의 HTTP 포트. 기본값 `29060` |

> 📋 **참고** DM_PORT 확인 방법: `[LibriX_HOME]/usr/servers/dmgr/server.xml` 파일에서 `webContainerEndpoint`의 `httpPort` 값을 확인합니다.
> ```xml
> <httpEndpoint id="webContainerEndpoint" host="*" httpPort="29060" httpsPort="29043" />
> ```

**2.** 실행 예시 (Open Liberty):

```bash
./addNode.sh /was/wlp/usr/servers/nodeagent shpark-pc.vm2 29060
```

---

**WebSphere Liberty 및 LibriX 환경:**

**1.** 실행 형식:

```bash
./addNode.sh [NODEAGENT_HOME] [DM_HOST] [DM_PORT] [WLP_REPOSITORY]
```

| 파라미터 | 설명 |
|---|---|
| `<NODEAGENT_HOME>` | Node Agent가 구성된 홈 디렉토리 |
| `<DM_HOST>` | Deployment Manager가 설치된 hostname |
| `<DM_PORT>` | Deployment Manager의 HTTP 포트. 기본값 `29060` |
| `<WLP_REPOSITORY>` | `wlp-featureRepo-[버전].zip` 파일 경로 (디렉토리명 포함) |

**2.** 실행 예시 (WebSphere Liberty):

```bash
./addNode.sh /was/wlp25/usr/servers/nodeagent shpark-pc.vm2 29060 /was/media/wlp-featureRepo-25.0.0.11.zip
```

---

## 3. 제품 운영 방법

### 가) Deployment Manager 기동 및 중지

| 작업 | 명령어 |
|---|---|
| 기동 | `[LibriX_HOME]/bin/server start dmgr` |
| 중지 | `[LibriX_HOME]/bin/server stop dmgr` |

### 나) Node Agent 기동 및 중지

| 작업 | 명령어 |
|---|---|
| 기동 | `[LibriX_HOME]/bin/server start nodeagent` |
| 중지 | `[LibriX_HOME]/bin/server stop nodeagent` |

### 다) LibriX Admin UI 접속

| 항목 | 내용 |
|---|---|
| 접속 URL | `https://[IP]:[PORT]` |
| PORT | Deployment Manager의 HTTPS 포트. 기본값 `29043` |
| 초기 ID / 비밀번호 | `admin` / `admin` |

> 📋 **참고** 접속 PORT 확인 방법: `[LibriX_HOME]/usr/servers/dmgr/server.xml` 파일에서 `webContainerEndpoint`의 `httpsPort` 값을 확인합니다.
> ```xml
> <httpEndpoint id="webContainerEndpoint" host="*" httpPort="29060" httpsPort="29043" />
> ```

> ⚠️ **주의** 초기 접속 비밀번호(`admin/admin`)는 설치 후 즉시 변경하십시오.
> 비밀번호 변경은 LibriX 관리콘솔의 **[보안] > [사용자 관리]** 메뉴에서 수행합니다.

---

## 관련 문서

- [Open Liberty 설치 가이드](./open-liberty-install.md)
- [애플리케이션 서버 관리](../server/application-server.md)
- [배치 관리자 관리](../system-management/deployment-manager.md)
- [노드 관리](../system-management/node-management.md)
- [사용자 관리](../security/user-management.md)
