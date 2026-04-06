# Open Liberty 설치 가이드

> **환경:** Rocky Linux 9.4 / VMware
> **버전:** Open Liberty 26.0.0.2 (GA)
> **최종 수정:** 2026-04-06

---

## 목차

1. [시스템 업데이트 및 사전 패키지 설치](#1-시스템-업데이트-및-사전-패키지-설치)
2. [Java 설치](#2-java-설치)
3. [Open Liberty 다운로드 및 설치](#3-open-liberty-다운로드-및-설치)
4. [환경변수 설정](#4-환경변수-설정)
5. [Liberty 서버 생성 및 기동](#5-liberty-서버-생성-및-기동)
6. [방화벽 포트 오픈](#6-방화벽-포트-오픈)
7. [systemd 서비스 등록](#7-systemd-서비스-등록-자동-시작)
8. [주요 경로 요약](#주요-경로-요약)

---

## 1. 시스템 업데이트 및 사전 패키지 설치

Rocky Linux 9.4 패키지를 최신 상태로 업데이트하고 설치에 필요한 기본 도구를 설치합니다.

```bash
sudo dnf update -y
sudo dnf install -y wget unzip curl
```

---

## 2. Java 설치

Open Liberty는 Java 11, 17, 21을 지원합니다. **Java 21 (LTS)** 사용을 권장합니다.

```bash
# Eclipse Temurin 21 설치
sudo dnf install -y java-21-openjdk java-21-openjdk-devel

# 설치 확인
java -version
```

> **참고:** IBM Semeru JDK를 선호하는 경우 [IBM Semeru 공식 사이트](https://developer.ibm.com/languages/java/semeru-runtimes/downloads/)에서 별도 다운로드하여 설치하세요.

`JAVA_HOME` 환경변수를 설정합니다.

```bash
echo 'export JAVA_HOME=/usr/lib/jvm/java-21-openjdk' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

---

## 3. Open Liberty 다운로드 및 설치

IBM 공식 배포 서버에서 Open Liberty 26.0.0.2를 다운로드하고 설치 디렉토리에 압축을 해제합니다.

```bash
# 설치 디렉토리 생성
sudo mkdir -p /opt/openliberty
cd /tmp

# Open Liberty 26.0.0.2 다운로드
wget https://public.dhe.ibm.com/ibmdl/export/pub/software/openliberty/runtime/release/26.0.0.2/openliberty-26.0.0.2.zip

# 압축 해제
sudo unzip openliberty-26.0.0.2.zip -d /opt/openliberty

# 설치 경로 확인
ls /opt/openliberty/
```

### ⚠️ 소유권 변경 필수

`sudo unzip` 으로 압축을 해제하면 모든 파일의 소유권이 `root`로 설정됩니다.
현재 사용자로 소유권을 변경하지 않으면 이후 `server` 명령 실행 시 아래와 같은 오류가 발생합니다.

```
Error: Unable to access jarfile /opt/openliberty/wlp/bin/tools/ws-server.jar
```

소유권을 현재 사용자로 변경합니다.

```bash
# 현재 사용자명으로 변경 (예: rockylinux)
sudo chown -R rockylinux:rockylinux /opt/openliberty
```

---

## 4. 환경변수 설정

`WLP_HOME` 환경변수를 설정하여 Liberty 명령어를 어디서든 실행할 수 있도록 합니다.

```bash
echo 'export WLP_HOME=/opt/openliberty/wlp' >> ~/.bashrc
echo 'export PATH=$WLP_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

환경변수가 정상적으로 반영되었는지 **새 터미널**을 열어 확인합니다.

```bash
echo $WLP_HOME
# 출력: /opt/openliberty/wlp

echo $JAVA_HOME
# 출력: /usr/lib/jvm/java-21-openjdk

echo $PATH | grep -o 'wlp[^:]*'
# 출력: wlp/bin
```

---

## 5. Liberty 서버 생성 및 기동

서버 인스턴스를 생성하고 기동합니다.

```bash
# 서버 인스턴스 생성
server create myServer

# 서버 기동
server start myServer

# 서버 상태 확인
server status myServer

# 실시간 로그 확인
tail -f $WLP_HOME/usr/servers/myServer/logs/messages.log
```

기동 성공 시 로그에서 아래 메시지를 확인합니다.

```
[AUDIT   ] CWWKF0011I: The myServer server is ready to run a smarter planet.
```

---

## 6. 방화벽 포트 오픈

VMware 환경에서 외부 접속을 위해 Liberty 기본 포트를 방화벽에서 허용합니다.

```bash
# HTTP 포트 오픈
sudo firewall-cmd --permanent --add-port=9080/tcp

# HTTPS 포트 오픈
sudo firewall-cmd --permanent --add-port=9443/tcp

# 방화벽 규칙 적용
sudo firewall-cmd --reload
```

브라우저에서 `http://<VM_IP>:9080` 접속하여 Liberty 기본 페이지를 확인합니다.

---

## 7. systemd 서비스 등록 (자동 시작)

서버 재부팅 시 Open Liberty가 자동으로 시작되도록 systemd 서비스로 등록합니다.

### 7.1 전용 계정 생성

```bash
sudo useradd -r -s /sbin/nologin liberty
sudo chown -R liberty:liberty /opt/openliberty
```

### 7.2 systemd 서비스 파일 생성

```bash
sudo tee /etc/systemd/system/openliberty.service > /dev/null <<EOF
[Unit]
Description=Open Liberty Application Server
After=network.target

[Service]
Type=forking
User=liberty
ExecStart=/opt/openliberty/wlp/bin/server start myServer
ExecStop=/opt/openliberty/wlp/bin/server stop myServer
PIDFile=/opt/openliberty/wlp/usr/servers/myServer/workarea/.pid

[Install]
WantedBy=multi-user.target
EOF
```

### 7.3 서비스 활성화 및 시작

```bash
sudo systemctl daemon-reload
sudo systemctl enable openliberty
sudo systemctl start openliberty
```

---

## 주요 경로 요약

| 항목 | 경로 |
|---|---|
| WLP 홈 | `/opt/openliberty/wlp` |
| 서버 설정 파일 | `/opt/openliberty/wlp/usr/servers/myServer/server.xml` |
| 로그 디렉토리 | `/opt/openliberty/wlp/usr/servers/myServer/logs/` |
| 앱 배포 디렉토리 | `/opt/openliberty/wlp/usr/servers/myServer/apps/` |
| Liberty 실행 파일 | `/opt/openliberty/wlp/bin/server` |

---

## 관련 문서

- [애플리케이션 서버 관리](../server/application-server.md)
- [애플리케이션 설치](../application/application-install.md)
- [Liberty 변수 관리](../environment/liberty-variables.md)
