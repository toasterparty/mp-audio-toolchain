@echo off
set WGET=%SCRIPT_DIR%\tools\wget.exe -nc
set UNZIP=%SCRIPT_DIR%\tools\7zip\7za.exe -bb0 -y x

if not exist tools mkdir tools
cd tools

if not exist gcit mkdir gcit
cd gcit
%UNZIP% gcit_Win32_Build7.zip
cd ..

if not exist paktool mkdir paktool
cd paktool
%UNZIP% paktool.zip
cd ..

if not exist audacity mkdir audacity
cd audacity
%SCRIPT_DIR%\tools\7zip\7za.exe -bb0 -y e audacity-gcdspadpcm-2.3.0-win.zip
cd ..

if not exist urde mkdir urde
cd urde
%WGET% https://releases.axiodl.com/dev/win32/urde-31-win32-x86_64-sse41.zip
%UNZIP% urde-31-win32-x86_64-sse41.zip
cd ..

cd ..
