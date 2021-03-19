@echo off
set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

if exist %SCRIPT_DIR%\mods\my-audio-mod\ rmdir %SCRIPT_DIR%\mods\my-audio-mod\ /s /q

cd %SCRIPT_DIR%\mods
mkdir my-audio-mod

%ZIP% my-audio-mod.zip my-audio-mod
pause
