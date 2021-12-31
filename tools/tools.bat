@echo off
set WGET=%SCRIPT_DIR%\tools\wget.exe -nc
set UNZIP=%SCRIPT_DIR%\tools\7zip\7za.exe -bb0 -bd -y x
set ZIP=%SCRIPT_DIR%\tools\7zip\7za.exe a -tzip

cd %SCRIPT_DIR%
if not exist mods mkdir mods
cd mods
if not exist Audio mkdir Audio
if not exist AudioGrp mkdir AudioGrp
cd ..

cd tools

cd gcit
%UNZIP% gcit_Win32_Build7.7z > nul
cd ..

cd paktool
%UNZIP% paktool.7z > nul
cd ..

cd audacity
%SCRIPT_DIR%\tools\7zip\7za.exe -bb0 -bd -y e audacity-gcdspadpcm-2.3.0-win.7z > nul
cd ..

cd metaforce
%UNZIP% metaforce-v0.1.3-155-win32-x86_64.7z > nul
cd ..

cd dsp-header-copy
%UNZIP% dsp-header-copy.7z > nul
cd ..

cd ..
