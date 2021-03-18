@echo off
set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

cd prime

call %SCRIPT_DIR%\tools\mod-hecl.bat

%SCRIPT_DIR%\tools\urde\hecl.exe cook

%SCRIPT_DIR%\tools\urde\hecl.exe package -y

call %SCRIPT_DIR%\tools\mod-pak.bat

%SCRIPT_DIR%\tools\gcit\gcit.exe %SCRIPT_DIR%\prime\pakdump\dump -q -d %SCRIPT_DIR%\prime_audio_mod.iso
