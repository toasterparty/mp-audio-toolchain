@echo off

xcopy %SCRIPT_DIR%\prime\MP1\AudioGrp-clean\ %SCRIPT_DIR%\prime\MP1\AudioGrp\ /u /s /y
xcopy %SCRIPT_DIR%\mods\AudioGrp %SCRIPT_DIR%\prime\MP1\AudioGrp\ /u /s /y
