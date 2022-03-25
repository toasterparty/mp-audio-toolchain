@echo off
set SCRIPT_DIR="%~dp0"

if exist .\prime\pakdump\ rmdir .\prime\pakdump\ /s /q

.\tools\gcit\gcit.exe .\prime.iso -f GCReEx -q -d .\prime\pakdump\

for /d %%i in (.\prime\pakdump\*) do (
ren "%%i" dump
)

if exist .\prime\Audio-clean\ rmdir .\prime\Audio-clean\ /s /q
xcopy .\prime\pakdump\dump\root\Audio\ .\prime\Audio-clean\ /s /y

.\tools\paktool\PakTool.exe -x .\prime\pakdump\dump\root\AudioGrp.pak -o .\prime\pakdump\AudioGrp\

.\tools\metaforce\hecl.exe extract -y prime.iso AudioGrp.pak

if exist .\prime\AudioGrp-clean\ rmdir .\prime\AudioGrp-clean\ /s /q
xcopy .\prime\MP1\AudioGrp\ .\prime\AudioGrp-clean\ /s /y

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
