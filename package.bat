@echo off
set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

cd prime

%SCRIPT_DIR%\tools\urde\hecl.exe cook
%SCRIPT_DIR%\tools\urde\hecl.exe package -y

pause
