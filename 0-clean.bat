@echo off
set SCRIPT_DIR="%~dp0"

cd %SCRIPT_DIR%
del *.tmp

if exist .\prime rmdir .\prime /s /q

cd %SCRIPT_DIR%\tools\audacity
del *.dll
del *.exe

cd %SCRIPT_DIR%\tools\gcit
del *.dll
del *.exe
del *.ini
del *.txt

cd %SCRIPT_DIR%\tools\paktool
del *.dll
del *.exe
del *.ini
del *.txt

cd %SCRIPT_DIR%\tools\metaforce
del *.dll
del *.exe
del *.ini
del *.txt
del *.pdb

cd %SCRIPT_DIR%\tools
del .wget-hsts

cd %SCRIPT_DIR%

pause
