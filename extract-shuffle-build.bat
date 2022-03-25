@echo off

set /p seed="Input a seed # (same seed = same sounds): "
echo %seed%|findstr /r /c:"^[0-9][0-9]*$" >nul
if errorlevel 1 (echo Invalid seed number) else (echo .)

set /p randomlevel="On a scale of 1 to 10, how random?: "

set SCRIPT_DIR=%~dp0
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

if exist .\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp rmdir .\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp /s /q
if exist .\prime\MP1\AudioGrp\ rmdir .\prime\MP1\AudioGrp\ /s /q
xcopy .\prime\AudioGrp-clean\ .\prime\MP1\AudioGrp\ /s /y
if exist .\prime\pakdump\dump\root\Audio\ rmdir .\prime\pakdump\dump\root\Audio\ /s /q
xcopy .\prime\Audio-clean\ .\prime\pakdump\dump\root\Audio\ /s /y

py .\tools\shuffle.py .\prime\MP1\AudioGrp\ %seed% %randomlevel%
py .\tools\shuffle.py .\prime\pakdump\dump\root\Audio\ %seed% %randomlevel%

cd prime
..\tools\metaforce\hecl.exe cook
..\tools\metaforce\hecl.exe package -y

cd %SCRIPT_DIR%
call .\tools\mod-pak.bat
.\tools\gcit\gcit.exe .\prime\pakdump\dump -q -d .\prime_audio_mod.iso

pause
