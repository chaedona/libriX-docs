@echo OFF
REM libriX-docs 폴더에서 모든 md 파일을 같은 이름의 docx로 변환

PUSHD C:\Users\user\libriX-docs

FOR %%f IN (*.md) DO (
    ECHO 변환 중: %%f
    pandoc "%%f" -f gfm -t docx -o "%%~nf.docx"
)

POPD

ECHO.
ECHO 모든 .md 파일을 .docx로 변환했습니다.
PAUSE
