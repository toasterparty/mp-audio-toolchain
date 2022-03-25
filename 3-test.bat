@echo off
set SCRIPT_DIR="%~dp0"

call .\tools\tools.bat
call .\tools\mod-hecl.bat

if exist .\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp rmdir .\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp /s /q
xcopy .\prime\AudioGrp-clean\ .\prime\MP1\AudioGrp\ /u /s /y
xcopy .\mods\AudioGrp .\prime\MP1\AudioGrp\ /u /s /y

cd .\prime
..\tools\metaforce\hecl.exe cook
..\tools\metaforce\hecl.exe package -y
cd %SCRIPT_DIR%

xcopy .\prime\Audio-clean\ .\prime\pakdump\dump\root\Audio\ /u /s /y
xcopy .\mods\Audio\ .\prime\pakdump\dump\root\Audio\ /u /s /y

call .\tools\mod-pak.bat

.\tools\gcit\gcit.exe .\prime\pakdump\dump -q -d .\prime_audio_mod.iso
