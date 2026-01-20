# LibriX 보안 카테고리 문서

LibriX 제품의 보안 관련 기능에 대한 완전한 문서화입니다.

## 📚 문서 목록

### 1. 사용자 관리 (user-management.md)
- LibriX 관리콘솔 사용자 계정 관리
- Basic User Registry 기반 인증
- 사용자 생성, 편집, 삭제
- 역할 관리 (administrator / reader)
- **이미지: 6개**

### 2. J2C 인증 데이터 (j2c-authentication-data.md)
- Java 2 Connector 인증 정보 관리
- 데이터소스, JMS 연결을 위한 인증 정보
- 인증 데이터 생성, 편집, 삭제
- authentication.json 구성
- **이미지: 6개**

### 3. SSL 구성 (ssl-configuration.md)
- SSL/TLS 프로토콜 설정
- 암호화 스위트 선택 (37개)
- 클라이언트 인증 구성
- 사용자 정의 특성
- **이미지: 4개**

### 4. 인증서 관리 (certificate-management.md)
- 키 저장소 관리 (PKCS12)
- 개인 인증서 관리 (서버 인증서 + 개인키)
- 서명자 인증서 관리 (CA 인증서)
- 인증서 가져오기/내보내기/교체/갱신/폐기
- **이미지: 15개**

## 📂 폴더 구조

```
security/
├── README.md                           # 이 파일
├── user-management.md                  # 사용자 관리 문서
├── j2c-authentication-data.md          # J2C 인증 데이터 문서
├── ssl-configuration.md                # SSL 구성 문서
├── certificate-management.md           # 인증서 관리 문서
└── images/                             # 이미지 폴더
    ├── user_management/                # 사용자 관리 이미지 (6개)
    │   ├── user_list.png
    │   ├── user_create.png
    │   ├── save_message.png
    │   ├── review_changes.png
    │   ├── user_detail.png
    │   └── user_delete_confirm.png
    ├── j2c_auth/                       # J2C 인증 데이터 이미지 (6개)
    │   ├── j2c_list.png
    │   ├── j2c_create.png
    │   ├── save_message.png
    │   ├── review_changes.png
    │   ├── j2c_detail.png
    │   └── delete_confirm.png
    ├── ssl_configuration/              # SSL 구성 이미지 (4개)
    │   ├── ssl_list.png
    │   ├── ssl_detail.png
    │   ├── custom_properties_list.png
    │   └── custom_property_create.png
    └── certificate_management/         # 인증서 관리 이미지 (15개)
        ├── cert_list.png
        ├── keystore_detail.png
        ├── personal_cert_list.png
        ├── personal_cert_tabs.png
        ├── cert_detail.png
        ├── cert_import.png
        ├── cert_export.png
        ├── cert_replace.png
        ├── cert_renew.png
        ├── cert_revoke.png
        ├── signer_cert_list.png
        ├── signer_cert_import.png
        ├── signer_cert_export.png
        ├── signer_cert_replace.png
        └── signer_cert_revoke.png
```

## 📊 통계

- **총 문서 수**: 4개
- **총 이미지 수**: 31개
- **총 파일 크기**: 약 250KB (문서) + 이미지

## 🎯 문서 특징

### 공통 특징
- WebSphere Application Server와의 비교
- Liberty 구현 상세 설명
- 실전 사용 시나리오
- 보안 모범 사례
- 문제 해결 가이드
- 한국어 마크다운 형식

### 기술 스택
- Open Liberty 기반
- IBM WebSphere ISC 스타일 UI
- GitHub 마크다운 호환

## 📖 사용 방법

1. **GitHub에 업로드하는 경우:**
   ```bash
   # security 폴더를 GitHub 저장소에 추가
   git add security/
   git commit -m "Add LibriX security documentation"
   git push
   ```

2. **로컬에서 보는 경우:**
   - Markdown 뷰어로 .md 파일 열기
   - VSCode, Typora, MacDown 등 사용

3. **웹에서 호스팅하는 경우:**
   - GitHub Pages
   - GitBook
   - MkDocs

## 🔗 관련 문서

다른 카테고리 문서:
- 서버 관리
- 애플리케이션 관리
- 리소스 관리
- 환경 관리
- 시스템 관리

## 📝 작성 정보

- **작성일**: 2024-01-20
- **작성자**: Claude (Anthropic)
- **버전**: 1.0
- **라이선스**: 프로젝트 라이선스 준수

## ✨ 업데이트 이력

- 2024-01-20: 초기 작성 완료
  - 사용자 관리 문서
  - J2C 인증 데이터 문서
  - SSL 구성 문서
  - 인증서 관리 문서
