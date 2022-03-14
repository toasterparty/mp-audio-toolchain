@echo off

set /p seed="Input a seed # (same seed = same sounds): "
echo %seed%|findstr /r /c:"^[0-9][0-9]*$" >nul
if errorlevel 1 (echo Invalid seed number) else (echo .)

set /p randomlevel="On a scale of 1 to 10, how random?: "

set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

if exist %SCRIPT_DIR%\prime\pakdump\ rmdir %SCRIPT_DIR%\prime\pakdump\ /s /q

%SCRIPT_DIR%\tools\gcit\gcit.exe %SCRIPT_DIR%\prime.iso -f GCReEx -q -d %SCRIPT_DIR%\prime\pakdump\

for /d %%i in (%SCRIPT_DIR%\prime\pakdump\*) do (
ren "%%i" dump
)

if exist %SCRIPT_DIR%\prime\Audio-clean\ rmdir %SCRIPT_DIR%\prime\Audio-clean\ /s /q
xcopy %SCRIPT_DIR%\prime\pakdump\dump\root\Audio\ %SCRIPT_DIR%\prime\Audio-clean\ /s /y

%SCRIPT_DIR%\tools\paktool\PakTool.exe -x %SCRIPT_DIR%\prime\pakdump\dump\root\AudioGrp.pak -o %SCRIPT_DIR%\prime\pakdump\AudioGrp\

%SCRIPT_DIR%\tools\metaforce\hecl.exe extract -y prime.iso AudioGrp.pak

if exist %SCRIPT_DIR%\prime\AudioGrp-clean\ rmdir %SCRIPT_DIR%\prime\AudioGrp-clean\ /s /q
xcopy %SCRIPT_DIR%\prime\MP1\AudioGrp\ %SCRIPT_DIR%\prime\AudioGrp-clean\ /s /y

if exist %SCRIPT_DIR%\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp rmdir %SCRIPT_DIR%\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp /s /q
if exist %SCRIPT_DIR%\prime\MP1\AudioGrp\ rmdir %SCRIPT_DIR%\prime\MP1\AudioGrp\ /s /q
xcopy %SCRIPT_DIR%\prime\AudioGrp-clean\ %SCRIPT_DIR%\prime\MP1\AudioGrp\ /s /y
if exist %SCRIPT_DIR%\prime\pakdump\dump\root\Audio\ rmdir %SCRIPT_DIR%\prime\pakdump\dump\root\Audio\ /s /q
xcopy %SCRIPT_DIR%\prime\Audio-clean\ %SCRIPT_DIR%\prime\pakdump\dump\root\Audio\ /s /y

py %SCRIPT_DIR%\tools\shuffle.py %SCRIPT_DIR%\prime\MP1\AudioGrp\ %seed% %randomlevel%
py %SCRIPT_DIR%\tools\shuffle.py %SCRIPT_DIR%\prime\pakdump\dump\root\Audio\ %seed% %randomlevel%

cd %SCRIPT_DIR%\prime
%SCRIPT_DIR%\tools\metaforce\hecl.exe cook
%SCRIPT_DIR%\tools\metaforce\hecl.exe package -y
cd %SCRIPT_DIR%

call %SCRIPT_DIR%\tools\mod-pak.bat

%SCRIPT_DIR%\tools\gcit\gcit.exe %SCRIPT_DIR%\prime\pakdump\dump -q -d %SCRIPT_DIR%\prime_audio_mod.iso

pause
