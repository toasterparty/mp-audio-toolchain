@echo off
set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

%SCRIPT_DIR%\tools\audacity\audacity.exe
