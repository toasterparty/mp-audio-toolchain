@echo off
set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

if not exist gcit mkdir gcit
cd gcit
%UNZIP% gcit_Win32_Build7.zip
cd ..

if not exist paktool mkdir paktool
cd paktool
%UNZIP% paktool.zip
cd ..

pause
