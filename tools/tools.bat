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

if not exist tools mkdir tools
cd tools

if not exist gcit mkdir gcit
cd gcit
%UNZIP% gcit_Win32_Build7.zip > nul
cd ..

if not exist paktool mkdir paktool
cd paktool
%UNZIP% paktool.zip > nul
cd ..

if not exist audacity mkdir audacity
cd audacity
%SCRIPT_DIR%\tools\7zip\7za.exe -bb0 -bd -y e audacity-gcdspadpcm-2.3.0-win.zip > nul
cd ..

if not exist urde mkdir urde
cd urde
%UNZIP% urde-50-win32-x86_64.zip > nul
cd ..

cd ..
