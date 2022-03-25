@echo off
set SCRIPT_DIR="%~dp0"

cd %SCRIPT_DIR%

call .\tools\tools.bat

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

pause
