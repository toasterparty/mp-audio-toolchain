@echo off
if exist %SCRIPT_DIR%\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp rmdir %SCRIPT_DIR%\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp /s /q
xcopy %SCRIPT_DIR%\prime\AudioGrp-clean\ %SCRIPT_DIR%\prime\MP1\AudioGrp\ /u /s /y
xcopy %SCRIPT_DIR%\mods\AudioGrp %SCRIPT_DIR%\prime\MP1\AudioGrp\ /u /s /y
