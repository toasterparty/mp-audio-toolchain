@echo off
set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

cd prime

%SCRIPT_DIR%\tools\urde\hecl.exe cook

sleep 3

%SCRIPT_DIR%\tools\urde\hecl.exe package -y

echo take from prime\.hecl\cooked\MP1.spec\MP1\AudioGrp

echo move/overwrite in prime\pakdump

%SCRIPT_DIR%\tools\paktool\PakTool.exe -r MP1 %SCRIPT_DIR%\prime\pakdump\AudioGrp %SCRIPT_DIR%\prime\pakdump\AudioGrp.pak %SCRIPT_DIR%\tools\paktool\AudioGrp-pak.txt

%SCRIPT_DIR%\tools\gcit\gcit.exe %SCRIPT_DIR%\prime\pakdump\dump -q -d %SCRIPT_DIR%\prime_audio_mod.iso
