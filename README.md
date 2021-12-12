# Metroid Prime Audio Toolchain
This repository is a streamlined toolchain for modifying music and sound effects in Metroid Prime, and packaging them for distribution. This is for Windows only (tested on Windows 10).

It is illegal to share the any of the original game's data, so *only* custom audio can be distributed when sharing custom audio mods. This used to be tricky because sound effects in this game are packaged tightly amonst other game data. This tools helps by providing a way to isolate just the custom audio files from the rest of the game and a means of packaging them so that a user has everything they need to apply it stored in a single .zip file.

Please note that I am the only author of the batch scripts and `dsp-header-copy`. Please see each included tool's license and/or homepage for more information.

# Usage
*Note: These tools can sometimes be falsely flagged as viruses by 3rd party antivirus programs. Disable your antivirus before using this toolchain.*

YouTube Guide: TBD

Everything you need can be downloaded using the green "Code" button and selecting "Download ZIP".

There are 5 `.bat` files which streamline the modding process. To use them, simply double click and wait for them to complete. They are numbered roughly in the order they are needed.

## 0 - Clean
Clears all of the cached data. You should only need to use this if you having problems.

## 1 - Extract
Extracts all of the audio files from the game so that they can be viewed and replaced. First, copy your legally obtained copy of Metroid Prime 1 for the Nintendo Gamecube in the base folder and name it `prime.iso`. Then run `1-extract.bat`.

The original music audio will be extracted to `prime/Audio-clean/` and the sound effects to `prime/AudioGrp-clean/`.

## 2 - Edit
Run `2-edit.bat` to launch a special version of Audacity that can handle the `.dsp` audio format used by Prime. You can make things easier by telling Windows to associate the `.dsp` file extension with the `/tools/audacity/Audacity.exe` executable.

*NOTE: This version of Audacity is prone to crashes, so I recommend doing any complicated audio work outside of this Audacity version beforehand.*

### 2.1 Browsing Files
Use Audacity to open any `.dsp` file you want to modify from the extracted files.

When viewing in Audacity, note the looping points. You cannot change these, so make sure you are okay with your custom audio looping at these points in the sample.

Note the sample rate - Some files may use a sample rate far lower than you are used to.

Note the length of the sample - The new file should be the same length, if the replacement is too shot or too long, there may be glitches.

If it is an AudioGrp file, note the name of the subfolder which contains the audio sample (e.g. `ChozoGhost_EA6B4117`). This will be important later.

Finally, note whether the file is mono or stereo. Your custom audio will have to match. To mix a stereo track down to mono, use `Tracks > Mix > Mix Stereo Down to Mono`.

### 2.2 Exporting
Once you have finished modifying existing in Audacity, you need to export it to the `mods` folder.

To do this, click `File > Export > Export Audio...`.

"Save as type:" should be "DSPADPCM (.dsp)".

For both mono and stereo samples use `Layout: Standard Mono`. The stereo option is for Metroid Prime 2 *only*.

The output filename should be identical as the file you intend to replace. Note that if you're outputting a stereo project, it will save 2 files, each with and L and R appended.

Then click Save.

When you are all done, your mods folder should mirror a subset of the vanilla file structure. Here's an example:
```
/mods/Audio/int_introcinemaL.dsp
/mods/Audio/int_introcinemaR.dsp
/mods/Audio/gen_ShortBattleL.dsp
/mods/Audio/gen_ShortBattleR.dsp
/mods/AudioGrp/Weapons_8081183E/sample00D1.dsp
/mods/AudioGrp/Weapons_8081183E/sample02DE.dsp
/mods/AudioGrp/Ridley_60544DEE/sample02C9.dsp
```

In the next step, these files will be merged with the game's files and packaged into an ISO.

## 3 - Test
Simply click `3-test.bat` and wait for it to complete. It will eventually output an ISO file into the base directory with the name of the game on it. Play this iso to test your changes, but do not share it online (that's illegal silly).

The first time you run this command, it may take 10-20 minutes. After this first execution, it will be significantly faster.

## 4 - Distribute
Click `4-distribute.bat` and enter in the name of the mod (do not use spaces). Once packaging is complete, a zip file will be created in the `mods` folder. As long as there is no copyrighted content in your `mods/Audio` and `mods/AudioGrp` folders, the output zip file can be legally distributed and used to install your mod.

# Credits

DSPADPCM Audacity Fork - https://github.com/jackoalan/audacity

HECL - https://axiodl.com/

PakTool - https://github.com/arukibree/PakTool

Gamecube ISO Tool - http://www.wiibackupmanager.co.uk/gcit.html
