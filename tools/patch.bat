@echo off
set SCRIPT_DIR=%cd%

if exist %SCRIPT_DIR%\prime\pakdump\ rmdir %SCRIPT_DIR%\prime\pakdump\ /s /q

%SCRIPT_DIR%\tools\gcit\gcit.exe %SCRIPT_DIR%\prime.iso -f GCReEx -q -d %SCRIPT_DIR%\prime\pakdump\

for /d %%i in (%SCRIPT_DIR%\prime\pakdump\*) do (
ren "%%i" dump
)

if exist %SCRIPT_DIR%\prime\Audio-clean\ rmdir %SCRIPT_DIR%\prime\Audio-clean\ /s /q
xcopy %SCRIPT_DIR%\prime\pakdump\dump\root\Audio\ %SCRIPT_DIR%\prime\Audio-clean\ /s /y

%SCRIPT_DIR%\tools\paktool\PakTool.exe -x %SCRIPT_DIR%\prime\pakdump\dump\root\AudioGrp.pak -o %SCRIPT_DIR%\prime\pakdump\AudioGrp\

%SCRIPT_DIR%\tools\urde\hecl.exe extract -y prime.iso AudioGrp.pak

if exist %SCRIPT_DIR%\prime\AudioGrp-clean\ rmdir %SCRIPT_DIR%\prime\AudioGrp-clean\ /s /q
xcopy %SCRIPT_DIR%\prime\MP1\AudioGrp\ %SCRIPT_DIR%\prime\AudioGrp-clean\ /s /y

if exist %SCRIPT_DIR%\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp rmdir %SCRIPT_DIR%\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp /s /q
xcopy %SCRIPT_DIR%\prime\AudioGrp-clean\ %SCRIPT_DIR%\prime\MP1\AudioGrp\ /u /s /y
xcopy %SCRIPT_DIR%\mods\AudioGrp %SCRIPT_DIR%\prime\MP1\AudioGrp\ /u /s /y

cd %SCRIPT_DIR%\prime
%SCRIPT_DIR%\tools\urde\hecl.exe cook
%SCRIPT_DIR%\tools\urde\hecl.exe package -y
cd %SCRIPT_DIR%

call %SCRIPT_DIR%\tools\mod-pak.bat

%SCRIPT_DIR%\tools\gcit\gcit.exe %SCRIPT_DIR%\prime\pakdump\dump -q -d %SCRIPT_DIR%\prime_audio_mod.iso

pause
