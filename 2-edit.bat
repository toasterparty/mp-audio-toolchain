@echo off
set SCRIPT_DIR="%~dp0"
call .\tools\tools.bat

start "" .\tools\audacity\audacity.exe
