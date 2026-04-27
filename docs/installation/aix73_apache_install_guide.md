# AIX 7.3 — Apache HTTP Server 설치 가이드
## AIX Toolbox 오프라인(에어갭) 환경 기준

---

## 개요

본 문서는 인터넷 연결이 불가한 에어갭(Air-Gap) 환경의 AIX 7.3 서버에  
AIX Toolbox 미러링 패키지(tar.gz)를 이용하여 Apache HTTP Server를 설치하는 절차를 설명합니다.

| 항목 | 내용 |
|---|---|
| 대상 OS | IBM AIX 7.3 |
| 설치 패키지 | Apache HTTP Server (httpd) |
| 설치 방식 | 오프라인 로컬 DNF 리포지토리 |
| 사전 준비물 | `aixtoolbox_aix73.tar.gz` |

---

## 사전 준비물 확인

AIX 서버 작업 시작 전 아래 파일이 준비되어 있어야 합니다.

| 파일명 | 설명 |
|---|---|
| `aixtoolbox_aix73.tar.gz` | AIX Toolbox 미러링 패키지 (약 8GB) |

압축 파일 내부 구조:
```
aixtoolbox_mirror/
├── AIX_Toolbox/          ← AIX 공용 RPM 패키지
├── AIX_Toolbox_73/       ← AIX 7.3 전용 RPM 패키지
├── AIX_Toolbox_noarch/   ← 아키텍처 무관 RPM 패키지
└── ezinstall/            ← DNF 설치 번들 (dnf_bundle_aix_73.tar)
```

---

## STEP 1. 시스템 환경 확인

### 1-1. AIX 버전 확인

```bash
oslevel -s
```

정상 출력 예시:
```
7300-02-01-2320
```

### 1-2. 디스크 여유 공간 확인 (최소 20GB 필요)

```bash
df -g /opt /tmp /var
```

출력 예시:
```
Filesystem    GB blocks   Free  %Used  Iused  %Iused  Mounted on
/dev/hd4          10.00   8.50    15%    1234      5%  /
/dev/hd10opt      30.00  25.00    17%    2345      6%  /opt
```

> ⚠️ `/opt` 에 최소 15GB 이상 여유 공간이 필요합니다.

### 1-3. 현재 rpm.rte 버전 확인

```bash
lslpp -l rpm.rte
```

정상 출력 예시:
```
Fileset           Level         State  Description
rpm.rte           4.18.1.2003   COMMITTED  RPM Package Manager
```

> AIX 7.3 TL2 기준 권장 버전: **4.18.1.2003 이상**  
> 버전이 낮으면 STEP 3에서 업데이트합니다.

---

## STEP 2. 파일 전송 및 압축 해제

### 2-1. USB를 AIX 서버에 연결

```bash
# 디스크 장치 목록 확인
lsdev -Cc disk
```

출력 예시:
```
hdisk0  Available  SCSI Disk Drive
usbdisk0  Available  USB Disk Drive   ← USB 장치
```

### 2-2. USB 마운트

```bash
# 마운트 포인트 생성
mkdir -p /mnt/usb

# ext2 포맷 USB 마운트
mount -V ext2 /dev/usbdisk0 /mnt/usb

# 마운트 확인
df -g | grep usb
ls /mnt/usb
```

> ⚠️ USB 장치명이 `usbdisk0`이 아닐 수 있습니다.  
> `lsdev -Cc disk` 결과를 확인하여 정확한 장치명을 사용하세요.

### 2-3. tar.gz 파일을 로컬로 복사

```bash
# /opt 에 복사 (약 8GB, 시간 소요)
cp /mnt/usb/aixtoolbox_aix73.tar.gz /opt/

# 복사 완료 확인
ls -lh /opt/aixtoolbox_aix73.tar.gz
```

### 2-4. USB 언마운트

```bash
umount /mnt/usb
```

### 2-5. 압축 해제

```bash
cd /opt
tar -xzvf aixtoolbox_aix73.tar.gz

# 압축 해제 확인
ls /opt/aixtoolbox_mirror/
```

정상 출력:
```
AIX_Toolbox  AIX_Toolbox_73  AIX_Toolbox_noarch  ezinstall
```

---

## STEP 3. rpm.rte 업데이트 및 DB 등록

### 3-1. rpm.rte 업데이트 (버전이 낮은 경우)

```bash
# rpm.rte 파일 위치 확인
ls /opt/aixtoolbox_mirror/ezinstall/

# 업데이트 실행
installp -aXYd /opt/aixtoolbox_mirror/ezinstall/rpm.rte all

# 업데이트 확인
lslpp -l rpm.rte
```

### 3-2. AIX installp 라이브러리를 RPM DB에 등록 (필수)

```bash
/usr/sbin/updtvpkg
```

> ⚠️ 이 명령을 실행하지 않으면 RPM 패키지 설치 시  
> `libc.a(shr.o) is needed` 같은 의존성 오류가 발생합니다.

---

## STEP 4. DNF 설치

### 4-1. DNF 번들 압축 해제

```bash
cd /opt/aixtoolbox_mirror/ezinstall
tar -xvf dnf_bundle_aix_73.tar

# 파일 확인
ls -la
# install_dnf.sh 파일이 있어야 함
```

### 4-2. DNF 설치 스크립트 실행

```bash
chmod +x install_dnf.sh
./install_dnf.sh
```

### 4-3. DNF 설치 확인

```bash
dnf --version
```

정상 출력 예시:
```
4.x.x
```

---

## STEP 5. 로컬 DNF 리포지토리 등록

### 5-1. 기존 온라인 IBM 리포지토리 비활성화

```bash
# 에어갭 환경에서 온라인 repo를 활성화 상태로 두면
# dnf 실행 시 인터넷 연결을 시도하다 타임아웃 발생
sed -i 's/^enabled=1/enabled=0/' \
    /opt/freeware/etc/dnf/repos.d/*.repo 2>/dev/null

# 비활성화 확인
cat /opt/freeware/etc/dnf/repos.d/*.repo | grep enabled
# 모두 enabled=0 이어야 함
```

### 5-2. 로컬 리포지토리 등록

```bash
cat >> /opt/freeware/etc/dnf/dnf.conf << 'EOF'

[LOCAL_ppc]
name=Local AIX Toolbox generic
baseurl=file:///opt/aixtoolbox_mirror/AIX_Toolbox/
enabled=1
gpgcheck=0

[LOCAL_73]
name=Local AIX Toolbox 7.3
baseurl=file:///opt/aixtoolbox_mirror/AIX_Toolbox_73/
enabled=1
gpgcheck=0

[LOCAL_noarch]
name=Local AIX Toolbox noarch
baseurl=file:///opt/aixtoolbox_mirror/AIX_Toolbox_noarch/
enabled=1
gpgcheck=0
EOF
```

### 5-3. 리포지토리 확인

```bash
dnf repolist
```

정상 출력:
```
repo id         repo name
LOCAL_ppc       Local AIX Toolbox generic
LOCAL_73        Local AIX Toolbox 7.3
LOCAL_noarch    Local AIX Toolbox noarch
```

> ⚠️ 3개 repo가 모두 보여야 합니다.  
> 보이지 않으면 `dnf.conf` 경로와 `baseurl` 경로를 재확인하세요.

---

## STEP 6. Apache HTTP Server 설치

```bash
dnf install httpd
```

DNF가 로컬 리포지토리에서 의존성 패키지를 자동으로 찾아 설치합니다.

설치 진행 중 확인 메시지:
```
Is this ok [y/N]: y
```

### 설치 확인

```bash
rpm -qa | grep httpd
```

정상 출력 예시:
```
httpd-2.4.65-1.aix7.1.ppc
mod_ssl-2.4.65-1.aix7.1.ppc
```

```bash
/opt/freeware/sbin/httpd -v
```

정상 출력 예시:
```
Server version: Apache/2.4.65 (Unix)
```

---

## STEP 7. 설정 및 기동

### 7-1. 설정 파일 확인

```bash
# 설정 파일 위치
vi /opt/freeware/etc/httpd/conf/httpd.conf

# 주요 확인 항목
grep -E "^(ServerName|Listen|DocumentRoot)" \
    /opt/freeware/etc/httpd/conf/httpd.conf
```

기본 설정값:
```
Listen 80
ServerName localhost:80
DocumentRoot "/opt/freeware/htdocs"
```

### 7-2. 포트 사용 여부 확인

```bash
netstat -an | grep 80
```

80번 포트를 사용 중인 프로세스가 있으면 httpd.conf에서 포트 변경 필요합니다.

### 7-3. 기동

```bash
/opt/freeware/sbin/apachectl start
```

### 7-4. 기동 확인

```bash
# 프로세스 확인
ps -ef | grep httpd

# 포트 리스닝 확인
netstat -an | grep 80

# 동작 테스트
curl http://localhost
# 또는
wget -O - http://localhost
```

정상 응답 예시:
```html
<html><body><h1>It works!</h1></body></html>
```

### 7-5. 부팅 시 자동 시작 설정

```bash
echo "/opt/freeware/sbin/apachectl start" >> /etc/rc.local
```

---

## STEP 8. 중지 및 재시작

```bash
# 중지
/opt/freeware/sbin/apachectl stop

# 재시작
/opt/freeware/sbin/apachectl restart

# 설정 파일 문법 검사
/opt/freeware/sbin/apachectl configtest
```

---

## 트러블슈팅

### [오류 1] USB 마운트 실패

```
mount: /mnt/usb: special device /dev/usbdisk0 does not exist.
```

**해결:**
```bash
# 장치 목록 재확인
lsdev -Cc disk

# 정확한 장치명으로 재시도
mount -V ext2 /dev/usbdisk1 /mnt/usb
```

---

### [오류 2] libc.a 의존성 오류

```
libc.a(shr.o) is needed by <package>
```

**해결:**
```bash
/usr/sbin/updtvpkg
```

---

### [오류 3] dnf repolist 에 LOCAL repo가 안 보임

**해결:**
```bash
# dnf.conf 내용 확인
cat /opt/freeware/etc/dnf/dnf.conf

# baseurl 경로가 실제로 존재하는지 확인
ls /opt/aixtoolbox_mirror/AIX_Toolbox/
ls /opt/aixtoolbox_mirror/AIX_Toolbox_73/
ls /opt/aixtoolbox_mirror/AIX_Toolbox_noarch/

# repodata 디렉토리 존재 여부 확인
ls /opt/aixtoolbox_mirror/AIX_Toolbox/repodata/
```

---

### [오류 4] dnf install httpd 시 의존성 패키지 없음

```
No match for argument: httpd
Error: Unable to find a match
```

**해결:**
```bash
# repodata 캐시 초기화 후 재시도
dnf clean all
dnf repolist
dnf install httpd
```

---

### [오류 5] httpd 기동 실패 — 포트 80 충돌

```
(98)Address already in use: make_sock: could not bind to address 0.0.0.0:80
```

**해결:**
```bash
# 80 포트 사용 프로세스 확인
netstat -an | grep 80

# httpd.conf에서 포트 변경
vi /opt/freeware/etc/httpd/conf/httpd.conf
# Listen 80 → Listen 8080 으로 변경

# 재기동
/opt/freeware/sbin/apachectl start
```

---

### [오류 6] LIBPATH 오류로 httpd 실행 실패

```
httpd: symbol resolution failed
```

**해결:**
```bash
export LIBPATH=/opt/freeware/lib64:/opt/freeware/lib:$LIBPATH

# 영구 설정
echo "LIBPATH=/opt/freeware/lib64:/opt/freeware/lib" >> /etc/environment
```

---

## 주요 파일 경로 참고

| 항목 | 경로 |
|---|---|
| httpd 바이너리 | `/opt/freeware/sbin/httpd` |
| apachectl | `/opt/freeware/sbin/apachectl` |
| 설정 파일 | `/opt/freeware/etc/httpd/conf/httpd.conf` |
| DocumentRoot | `/opt/freeware/htdocs/` |
| 로그 디렉토리 | `/opt/freeware/var/log/httpd/` |
| Access 로그 | `/opt/freeware/var/log/httpd/access_log` |
| Error 로그 | `/opt/freeware/var/log/httpd/error_log` |
| DNF 설정 | `/opt/freeware/etc/dnf/dnf.conf` |
| DNF Repo 디렉토리 | `/opt/freeware/etc/dnf/repos.d/` |

---

## 참고 문서

| 문서 | URL |
|---|---|
| IBM AIX Toolbox 시작 가이드 | https://www.ibm.com/support/pages/aix-toolbox-open-source-software-get-started |
| AIX Toolbox 다운로드 | https://www.ibm.com/support/pages/aix-toolbox-open-source-software-downloads-alpha |
| IBM AIX Toolbox FTP | https://public.dhe.ibm.com/aix/freeSoftware/aixtoolbox/ |
| rpm.rte 업데이트 가이드 | https://www.ibm.com/support/pages/update-rpmrte-latest-version-resolve-rpm-errors-and-core-dumps |

---

*작성일: 2026년 4월*  
*대상: AIX 7.3 에어갭 환경*
