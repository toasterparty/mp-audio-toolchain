@echo off

echo "launching dsp audacity..."

set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

start "" %SCRIPT_DIR%\tools\audacity\audacity.exe
