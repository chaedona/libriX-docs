@echo OFF
PUSHD C:\Users\user\libriX-docs

FOR /R . %%f IN (*.md) DO (
    PUSHD "%%~dpf"
    ECHO º¯È¯ Áß: %%f
    pandoc "%%~nxf" -f gfm -t docx -o "%%~nf.docx"
    POPD
)

POPD
