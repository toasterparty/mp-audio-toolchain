@echo off
set SCRIPT_DIR=%cd%

call %SCRIPT_DIR%\tools\tools.bat
call %SCRIPT_DIR%\tools\mod-hecl.bat

if exist %SCRIPT_DIR%\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp rmdir %SCRIPT_DIR%\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp /s /q
xcopy %SCRIPT_DIR%\prime\AudioGrp-clean\ %SCRIPT_DIR%\prime\MP1\AudioGrp\ /u /s /y
xcopy %SCRIPT_DIR%\mods\AudioGrp %SCRIPT_DIR%\prime\MP1\AudioGrp\ /u /s /y

cd %SCRIPT_DIR%\prime
%SCRIPT_DIR%\tools\metaforce\hecl.exe cook
%SCRIPT_DIR%\tools\metaforce\hecl.exe package -y
cd %SCRIPT_DIR%

call %SCRIPT_DIR%\tools\mod-pak.bat

%SCRIPT_DIR%\tools\gcit\gcit.exe %SCRIPT_DIR%\prime\pakdump\dump -q -d %SCRIPT_DIR%\prime_audio_mod.iso
