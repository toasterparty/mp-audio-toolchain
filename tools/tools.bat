@echo off
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
%UNZIP% audacity-gcdspadpcm-2.3.0-win.7z > nul
cd ..

if not exist metaforce mkdir metaforce
cd metaforce
%UNZIP% metaforce-v0.1.3-173.7z > nul
cd ..

cd ..
