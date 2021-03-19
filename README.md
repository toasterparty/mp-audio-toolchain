# Metroid Prime Audio Toolchain
This repository is a streamlined toolchain for modifying music and sound effects in Metroid Prime, and packaging them for distribution. This is for Windows only (tested on Windows 10). 

It is illegal to share the any of the original game's data, so *only* custom audio can be distributed when sharing custom audio mods. This used to be tricky because sound effects in this game are packaged tightly around similar audio files. This tools helps by providing a way to isolate just the custom audio files from the rest of the game and a means of packaging them so that a user has everything they need to apply it stored in a single .zip file.

Please note that I am only the author of the batch scripts. Please see each included tool's license and/or homepage for more information.

# Usage
*Note: These tools can sometimes be falsely flagged as viruses by aftermarket antivirus programs. Disable your antivirus before using this toolchain.*

YouTube Guide: TBD

There are 5 `.bat` files which streamline the modding process. To use them, simply double click and wait for them to complete. They are numbered roughly in the order they are needed.

## 0 - Clean
Clears all of the cached data. You should only need to use this if you having problems.

## 1 - Extract
Extracts all of the audio files from the game so that they can be viewed and replaced. First, copy your legally obtained copy of Metroid Prime 1 for the Nintendo Gamecube in the base folder and name it `prime.iso`. Then run `1-extract.bat`.

The original music audio will be extracted to `prime/AudioGrp-clean/` and the sound effects to `prime/AudioGrp-clean/`.

## 2 - Edit
Run `2-edit.bat` to launch a special version of Audacity that can handle.

This version of Audacity is prone to crashes, so I recommend doing all audio work outside of this Audacity version beforehand.

# Credits

DSPADPCM Audacity Fork - https://github.com/jackoalan/audacity

URDE - https://github.com/AxioDL/urde

PakTool - https://github.com/arukibree/PakTool

Gamecube ISO Tool - http://www.wiibackupmanager.co.uk/gcit.html
