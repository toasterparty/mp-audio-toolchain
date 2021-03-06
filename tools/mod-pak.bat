@echo off

xcopy %SCRIPT_DIR%\prime\Audio-clean\ %SCRIPT_DIR%\prime\pakdump\dump\root\Audio\ /u /s /y
xcopy %SCRIPT_DIR%\mods\Audio\ %SCRIPT_DIR%\prime\pakdump\dump\root\Audio\ /u /s /y

if exist %SCRIPT_DIR%\prime\pakdump\AudioGrpNew\ rmdir %SCRIPT_DIR%\prime\pakdump\AudioGrpNew\ /s /q
xcopy %SCRIPT_DIR%\prime\.hecl\cooked\MP1.spec\MP1\AudioGrp\ %SCRIPT_DIR%\prime\pakdump\AudioGrpNew\ /s /y
cd %SCRIPT_DIR%\prime\pakdump\AudioGrpNew\

ren Atomic_AE0230B6 AE0230B6.AGSC
ren BetaBeetle_8CCDD026 8CCDD026.AGSC
ren Bird_33358ABA 33358ABA.AGSC
ren BloodFlower_F3C33C5E F3C33C5E.AGSC
ren Burrower_3118E452 3118E452.AGSC
ren ChozoGhost_EA6B4117 EA6B4117.AGSC
ren ChubbWeed_B2C49B0B B2C49B0B.AGSC
ren CineBoots_62414707 62414707.AGSC
ren CineGeneral_33A833DA 33A833DA.AGSC
ren CineGun_9BADC20D 9BADC20D.AGSC
ren CineMorphball_7F8153FE 7F8153FE.AGSC
ren CineSuit_9D2A6E46 9D2A6E46.AGSC
ren CineVisor_BA8F20EA BA8F20EA.AGSC
ren Crater_5F6CB3E8 5F6CB3E8.AGSC
ren Crystallite_EE9200F4 EE9200F4.AGSC
ren Drones_98B283BF 98B283BF.AGSC
ren EliteSpacePirate_170F408C 170F408C.AGSC
ren FireFlea_35F15F3B 35F15F3B.AGSC
ren Flaaghra_A2E59262 A2E59262.AGSC
ren FlickerBat_17928B51 17928B51.AGSC
ren FlyingPirate_DB76A972 DB76A972.AGSC
ren FrontEnd_1A4AD067 1A4AD067.AGSC
ren GagantuanBeatle_8389DBEC 8389DBEC.AGSC
ren Gnats_F6ABC1E1 F6ABC1E1.AGSC
ren Gryzbee_E68ECFA5 E68ECFA5.AGSC
ren IceCrack_DA07D390 DA07D390.AGSC
ren IceWorld_5CE7A3D0 5CE7A3D0.AGSC
ren InjuredPirates_93393A50 93393A50.AGSC
ren IntroBoss_6DF11D78 6DF11D78.AGSC
ren IntroWorld_16553E57 16553E57.AGSC
ren JellyZap_5FBC2F67 5FBC2F67.AGSC
ren LavaWorld_B8C046C0 B8C046C0.AGSC
ren Magdolite_706D7BCF 706D7BCF.AGSC
ren Metaree_2CA490BB 2CA490BB.AGSC
ren MetroidPrime_B6931363 B6931363.AGSC
ren Metroid_52AB7324 52AB7324.AGSC
ren MinesWorld_ABD06377 ABD06377.AGSC
ren MiscSamus_3724095B 3724095B.AGSC
ren Misc_57FE7E67 57FE7E67.AGSC
ren OmegaPirate_CBAE2616 CBAE2616.AGSC
ren OverWorld_41475E5F 41475E5F.AGSC
ren Parasite_DA7B2C8E DA7B2C8E.AGSC
ren PhazonGun_C2C1B6FE C2C1B6FE.AGSC
ren Phazon_9D1A8F9F 9D1A8F9F.AGSC
ren PuddleSpore_2163D60A 2163D60A.AGSC
ren PuddleToad_48A8F172 48A8F172.AGSC
ren Puffer_D05B51C4 D05B51C4.AGSC
ren ReactorDoor_F5FE70FB F5FE70FB.AGSC
ren Ridley_60544DEE 60544DEE.AGSC
ren Ripper_D0AB8A34 D0AB8A34.AGSC
ren RuinsWorld_FB9C30B2 FB9C30B2.AGSC
ren SamusShip_8F586337 8F586337.AGSC
ren Scarab_0800B2FA 0800B2FA.AGSC
ren Seedling_F84C8E18 F84C8E18.AGSC
ren SheeGoth_FFE302C7 FFE302C7.AGSC
ren SnakeWeed_E21C8BC5 E21C8BC5.AGSC
ren Sova_EA6360AF EA6360AF.AGSC
ren SpacePirate_E8D4F8F1 E8D4F8F1.AGSC
ren SpankWeed_C363BD5E C363BD5E.AGSC
ren Thardus_2ACE7B2D 2ACE7B2D.AGSC
ren TheEnd_D258A644 D258A644.AGSC
ren Torobyte_2A3AC2AC 2A3AC2AC.AGSC
ren Triclops_7CB0AB14 7CB0AB14.AGSC
ren Turret_BF06EDF7 BF06EDF7.AGSC
ren UI_FC838AE4 FC838AE4.AGSC
ren WarWasp_0DB7A10C 0DB7A10C.AGSC
ren Weapons_8081183E 8081183E.AGSC
ren ZZZ_C50CC2AE C50CC2AE.AGSC
ren Zoomer_F3B1B26C F3B1B26C.AGSC
ren lumigek_77C54E1A 77C54E1A.AGSC
ren sound_lookup_B7C1B3A7 B7C1B3A7.ATBL
ren test_1EE1AD21 1EE1AD21.AGSC

cd %SCRIPT_DIR%

xcopy %SCRIPT_DIR%\prime\pakdump\AudioGrpNew\ %SCRIPT_DIR%\prime\pakdump\AudioGrp\ /u /s /y

%SCRIPT_DIR%\tools\paktool\PakTool.exe -r MP1 %SCRIPT_DIR%\prime\pakdump\AudioGrp\ %SCRIPT_DIR%\prime\pakdump\AudioGrp.pak %SCRIPT_DIR%\tools\paktool\AudioGrp-pak.txt

xcopy %SCRIPT_DIR%\prime\pakdump\AudioGrp.pak %SCRIPT_DIR%\prime\pakdump\dump\root\ /u /y
