@echo off
set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

%SCRIPT_DIR%\tools\urde\hecl.exe extract -y prime.iso AudioGrp.pak

pause
