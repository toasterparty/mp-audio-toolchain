@echo off
set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

echo "launching dsp audacity..."
start "" %SCRIPT_DIR%\tools\audacity\audacity.exe
