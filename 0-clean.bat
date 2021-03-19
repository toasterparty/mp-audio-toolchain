@echo off
set SCRIPT_DIR=%cd%\..

cd %SCRIPT_DIR%
del *.tmp

if exist %SCRIPT_DIR%\prime rmdir %SCRIPT_DIR%\prime /s /q

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

cd %SCRIPT_DIR%\tools\urde
del *.dll
del *.exe
del *.ini
del *.txt
del *.pdb

cd %SCRIPT_DIR%\tools
del .wget-hsts
