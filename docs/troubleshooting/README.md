# LibriX 문제 분석 문서

LibriX 관리콘솔의 문제 분석 기능에 대한 문서입니다.

## 문서 구성

### 주요 문서
- **dump-generation.md**: 덤프생성 문서 (1360줄)

### 이미지 파일 (7개)
- 덤프생성 메인 화면
- 오류 메시지 (서버 미선택)
- 스레드 덤프 생성 중/완료
- 스레드 덤프 파일
- 힙 덤프 파일
- 시스템 덤프 파일

## 주요 내용

### 덤프생성
- **덤프 유형**
  - 스레드 덤프 (Thread Dump)
  - 힙 덤프 (Heap Dump)
  - 시스템 덤프 (System Dump)

- **사용 시나리오**
  - 응답 없음 (Hang) - 스레드 덤프
  - 높은 CPU - 스레드 덤프
  - 메모리 누수 - 힙 덤프
  - OutOfMemoryError - 힙 덤프
  - JVM 크래시 - 시스템 덤프
  - 네이티브 메모리 누수 - 시스템 덤프

- **분석 도구**
  - Eclipse MAT (힙 덤프)
  - FastThread (스레드 덤프)
  - IBM TMDA (스레드 덤프)
  - gdb, jdmpview (시스템 덤프)

- **실전 문제 해결**
  - 애플리케이션 응답 느림
  - OutOfMemoryError 발생
  - 데드락 탐지
  - 메모리 누수 분석

## 파일 구조

```
docs/troubleshooting/
├── README.md                      # 이 파일
├── dump-generation.md             # 덤프생성 문서 (1360줄)
└── images/
    └── dump_generation/           # 덤프생성 이미지 (7개)
```

## 작성 일자

- 2026-01-27

## 다음 작업

- 서비스 지원확인 (Log Analyzer 연동 후 문서화)
