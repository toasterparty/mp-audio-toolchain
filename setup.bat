@echo off
set SCRIPT_DIR=%cd%

set WGET=%SCRIPT_DIR%\tools\wget.exe -nc
set UNZIP=%SCRIPT_DIR%\tools\7zip\7za.exe -bb0 -y x

if not exist tools mkdir tools
cd tools

if not exist urde mkdir urde
cd urde
%WGET% https://releases.axiodl.com/dev/win32/hecl-gui-win32.zip
%UNZIP% hecl-gui-win32.zip
cd ..

if not exist gcit mkdir gcit
cd gcit
%UNZIP% gcit_Win32_Build7.zip
cd ..

if not exist paktool mkdir paktool
cd paktool
%UNZIP% paktool.zip
cd ..

pause