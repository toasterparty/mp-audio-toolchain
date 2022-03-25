@echo off

set /p MOD_NAME="Enter a name for the mod (no spaces):"

set SCRIPT_DIR="%~dp0"
call .\tools\tools.bat
call .\tools\mod-hecl.bat

if exist .\mods\%MOD_NAME%\ rmdir .\mods\%MOD_NAME%\ /s /q
if exist .\mods\%MOD_NAME%.zip del .\mods\%MOD_NAME%.zip

cd .\mods
mkdir %MOD_NAME%
mkdir %MOD_NAME%\tools
mkdir %MOD_NAME%\Audio
mkdir %MOD_NAME%\AudioGrp

xcopy Audio %MOD_NAME%\Audio /s /y
xcopy AudioGrp %MOD_NAME%\AudioGrp /s /y
xcopy ..\tools\ %MOD_NAME%\tools /s /y
move %MOD_NAME%\tools\patch.bat %MOD_NAME%
move %MOD_NAME%\tools\readme.txt %MOD_NAME%

rmdir %MOD_NAME%\tools\7zip /s /q
rmdir %MOD_NAME%\tools\audacity /s /q
rmdir %MOD_NAME%\tools\dsp-header-copy /s /q
del %MOD_NAME%\tools\wget.exe
del %MOD_NAME%\tools\mod-hecl.bat
del %MOD_NAME%\tools\tools.bat
del %MOD_NAME%\tools\.gitignore
del %MOD_NAME%\tools\metaforce\*.zip
del %MOD_NAME%\tools\metaforce\.gitignore
del %MOD_NAME%\tools\paktool\*.zip
del %MOD_NAME%\tools\paktool\.gitignore
del %MOD_NAME%\tools\gcit\*.zip
del %MOD_NAME%\tools\gcit\.gitignore

%ZIP% %MOD_NAME%.zip %MOD_NAME%

rmdir %MOD_NAME% /s /q
echo .
echo .
echo .
echo "Created standalone package 'mods\%MOD_NAME%.zip'"
pause
