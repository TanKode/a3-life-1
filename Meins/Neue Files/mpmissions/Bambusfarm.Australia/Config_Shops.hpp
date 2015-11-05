class WeaponShops {
    //Armory Shops
    class gun {
        name = "Billy Joe's Feurwaffen";
        side = "civ";
        license = "gun";
        level = 3;
        msg = "Sie haben noch nicht Skilllevel 3 erreicht!";
        items[] = {
           { "hgun_Rook40_F", "", 6500, {"life_level", 3 } },
		   { "hgun_Pistol_heavy_02_Yorris_F", "", 20000, { "life_level", 6 } },
		   { "hgun_ACPC2_F", "", 15000, {"life_level", 3 } },
		   { "hgun_Pistol_heavy_01_MRD_F", "", 18000, {"life_level", 3 } },
		   { "hgun_PDW2000_F", "", 22000, {"life_level", 3 } },
		   { "11Rnd_45ACP_Mag", "", 100, {"life_level", 3 } },
		   { "16Rnd_9x21_Mag", "", 25, {"life_level", 3 } },
		   { "9Rnd_45ACP_Mag", "", 45,{"life_level", 3 } },
		   { "6Rnd_45ACP_Cylinder", "", 150, { "life_level", 6 } },
		   { "30Rnd_9x21_Mag", "", 75, {"life_level", 3 } },
		   { "optic_ACO_grn_smg", "", 2500, {"life_level", 3 } },
		   { "V_Rangemaster_belt", "", 4900, ""}
        };
    };
	
    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        license = "rebel";
        level = 6;
        msg = "Sie haben noch nicht Skilllevel 6 erreicht!"; 
        items[] = {
            { "Rangefinder", "", 2000, "" },
			{ "arifle_TRG20_F", "", 200000, { "life_level", 6 } },
			{ "arifle_Katiba_C_F", "", 200000, {"life_level", 7 } },
			{ "arifle_SDAR_F", "", 20000, { "life_level", 6 } },
			{ "arifle_MX_SW_F", "", 400000, {"life_level", 7 } },
			{ "srifle_EBR_F", "",800000, {"life_level", 8 } },
			{ "srifle_DMR_06_olive_F", "",800000, {"life_level", 8 } },
			{ "srifle_DMR_03_multicam_F", "",800000, {"life_level", 8 } },
			{ "SMG_01_F", "", 200000, { "life_level", 6 } },
			{""},
			{ "hgun_Rook40_F", "", 6500, {"life_level", 3 } },
			{ "hgun_Pistol_heavy_02_Yorris_F", "", 20000, { "life_level", 6 } },
			{ "hgun_ACPC2_F", "", 15000, {"life_level", 3 } },
			{ "hgun_Pistol_heavy_01_MRD_F", "", 18000, {"life_level", 3 } },
			{ "hgun_PDW2000_F", "", 22000, {"life_level", 3 } },
			{""},
			{ "bipod_03_F_oli", "", 40000, "" },
			{ "bipod_03_F_blk", "", 40000, "" },
			{ "bipod_01_F_snd", "", 40000, "" },
			{""},
			{ "7Rnd_408_Mag", "", 80000, "" },
			{ "30Rnd_45ACP_Mag_SMG_01_tracer_green", "", 250, { "life_level", 6 } },
			{ "100Rnd_65x39_caseless_mag", "", 65000, { "life_level", 7 } },
			{ "20Rnd_556x45_UW_mag", "", 125, { "life_level", 6 } },
			{ "30Rnd_556x45_Stanag", "", 300, { "life_level", 6 } },
			{ "10Rnd_762x51_Mag", "",500, { "life_level", 8 } },
			{ "20Rnd_762x51_Mag", "", 500, { "life_level", 8 } },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 250, { "life_level", 6 } },
			{ "30Rnd_65x39_caseless_green", "", 275, { "life_level", 7 } },
			{ "11Rnd_45ACP_Mag", "", 100, {"life_level", 3 } },
		    { "16Rnd_9x21_Mag", "", 25, {"life_level", 3 } },
		    { "9Rnd_45ACP_Mag", "", 45,{"life_level", 3 } },
		    { "6Rnd_45ACP_Cylinder", "", 150, { "life_level", 6 } },
		    { "30Rnd_9x21_Mag", "", 75, {"life_level", 3 } },
			{""},
			{ "optic_ACO_grn", "", 3500, "" },
			{ "optic_Holosight", "", 3600, "" },
			{ "acc_flashlight", "", 1500, "" },
			{ "acc_pointer_IR", "", 1500, "" },
			{ "optic_Hamr", "", 7500, "" },
			{ "optic_MRCO", "", 5500, "" },
			{ "optic_SOS", "", 8500, "" },
			{ "optic_DMS", "", 8500, "" },
			{ "optic_NVS", "", 10000, "" },
			{ "optic_ACO_grn_smg", "", 2500, "" }		
        };
    };
	
    class gang {
        name = "Waffenbox";
        side = "civ";
        license = "";
        level = -1;
        msg = "";
        items[] = {
			{ "Rangefinder", "", 1000, "" },
			{ "arifle_TRG20_F", "", 150000, { "life_level", 6 } },
			{ "arifle_Katiba_C_F", "", 150000, {"life_level", 7 } },
			{ "arifle_SDAR_F", "", 10000, { "life_level", 6 } },
			{ "arifle_MX_SW_F", "", 200000, {"life_level", 7 } },
			{ "srifle_EBR_F", "",500000, {"life_level", 8 } },
			{ "srifle_DMR_06_olive_F", "",500000, {"life_level", 8 } },
			{ "srifle_DMR_03_multicam_F", "",500000, {"life_level", 8 } },
			{ "SMG_01_F", "", 150000, { "life_level", 6 } },
			{ "launch_RPG32_F", "", 900000, {"life_level", 8 } },	
			{""},
			{ "hgun_Rook40_F", "", 5500, {"life_level", 3 } },
			{ "hgun_Pistol_heavy_02_Yorris_F", "", 10000, { "life_level", 6 } },
			{ "hgun_ACPC2_F", "", 10000, {"life_level", 3 } },
			{ "hgun_Pistol_heavy_01_MRD_F", "", 10000, {"life_level", 3 } },
			{ "hgun_PDW2000_F", "", 12000, {"life_level", 3 } },
			{""},
			{ "bipod_03_F_oli", "", 30000, "" },
			{ "bipod_03_F_blk", "", 30000, "" },
			{ "bipod_01_F_snd", "", 30000, "" },
			{""},
			{ "7Rnd_408_Mag", "", 40000, "" },
			{ "30Rnd_45ACP_Mag_SMG_01_tracer_green", "", 250, { "life_level", 6 } },
			{ "100Rnd_65x39_caseless_mag", "", 34000, { "life_level", 7 } },
			{ "20Rnd_556x45_UW_mag", "", 125, { "life_level", 6 } },
			{ "30Rnd_556x45_Stanag", "", 300, { "life_level", 6 } },
			{ "10Rnd_762x51_Mag", "",500, { "life_level", 8 } },
			{ "20Rnd_762x51_Mag", "", 500, { "life_level", 8 } },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 250, { "life_level", 6 } },
			{ "30Rnd_65x39_caseless_green", "", 275, { "life_level", 7 } },
			{ "11Rnd_45ACP_Mag", "", 100, {"life_level", 3 } },
		    { "16Rnd_9x21_Mag", "", 25, {"life_level", 3 } },
		    { "9Rnd_45ACP_Mag", "", 45,{"life_level", 3 } },
		    { "6Rnd_45ACP_Cylinder", "", 150, { "life_level", 6 } },
		    { "30Rnd_9x21_Mag", "", 75, {"life_level", 3 } },
			{ "RPG32_F", "", 90000, {"life_level", 8 } },
			{""},
			{ "optic_ACO_grn", "", 2500, "" },
			{ "optic_Holosight", "", 2600, "" },
			{ "acc_flashlight", "", 1500, "" },
			{ "acc_pointer_IR", "", 1500, "" },
			{ "optic_Hamr", "", 5500, "" },
			{ "optic_MRCO", "", 3500, "" },
			{ "optic_SOS", "", 4500, "" },
			{ "optic_DMS", "", 4500, "" },
			{ "optic_NVS", "", 6000, "" },
			{ "optic_ACO_grn_smg", "", 1500, "" },
			{ "DemoCharge_Remote_Mag", "", 500000, {"life_level", 7 } }
        };
    };
	
	class medical_cop {
		name = "Medizinische Ausruestung";
		side = "cop";
		license = "";
		level = -1;
		msg = "";
		items[] = {
			{ "FirstAidKit", "", 150, "" },
			{ "Medikit", "", 2000, "" }
		};
	};
	
    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        license = "";
        level = -1;
        msg = "";
        items[] = {
			{ "Binocular", "", 150, "" },
			{ "ItemGPS", "", 100, "" },
			{ "ToolKit", "", 10000, "" },
			{ "FirstAidKit", "", 150, "" },
			{ "ItemCompass", "", 50, "" },
			{ "ItemMap", "", 50, "" },
			{ "NVGoggles_OPFOR", "", 2000, "" },
			{ "Chemlight_red", "", 300, "" },
			{ "Chemlight_yellow", "", 300, "" },
			{ "Chemlight_green", "", 300, "" },
			{ "Chemlight_blue", "", 300, "" },
			{ "A3_GPNVG18_F", "", 555, "" },
			{ "A3_GPNVG18_BLK_F", "", 555, "" },
			{ "A3_GPNVG18b_F", "", 555, "" },
			{ "A3_GPNVG18b_BLK_F", "", 555, "" },
			{ "A3_GPNVG18_REC_F", "", 555, "" },
			{ "A3_GPNVG18_REC_BLK_F", "", 555, "" },
			{ "A3_GPNVG18b_REC_F", "", 555, "" },
			{ "A3_GPNVG18b_REC_BLK_F", "", 555, "" }
        };
    };
	
    //Cop Shops
    class cop_basic {
        name = "Altis Polizeihaendler";
        side = "cop";
        license = "";
        level = -1;
        msg = "";
        items[] = {
        	{ "SMG_01_ACO_F", "Taser Rifle", 20000, "" },
			{ "hgun_P07_snds_F", "Taser/Radar Pistole", 2000, "" },
			{""},	
			{ "16Rnd_9x21_Mag", "", 50, "" },
			{ "30Rnd_45ACP_Mag_SMG_01", "Taser Rifle Magazine", 125, "" },
			{""},
			{ "acc_flashlight", "", 1000, "" },
			{ "acc_pointer_IR", "", 1500, "" },
			{ "optic_Holosight", "", 2500, "" },
			{ "optic_Arco", "", 2500, "" },
			{ "optic_MRCO", "", 2500, "" },
			{ "optic_Hamr", "", 2500, "" },
			{""},
			{ "Binocular", "", 150, "" },
			{ "ItemGPS", "",100, "" },
			{ "ToolKit", "", 250, "" },
			{ "Rangefinder", "", 500, "" },
			{ "NVGoggles_OPFOR", , 2000, "" },
			{""},
			{ "Chemlight_red", "", 300, "" },
			{ "Chemlight_yellow", "", 300, "" },
			{ "Chemlight_green", "", 300, "" },
			{ "Chemlight_blue", "", 300, "" }
        };
    };
	
    class cop_patrol {
        name = "Altis Offizierhaendler";
        side = "cop";
        license = "";
        level = 2;
        msg = "Sie haben nicht den benötigten Rang!";
        items[] = {
			{ "SMG_02_F", "", 15000, "" },
        	{ "arifle_MXC_Black_F", "", 30000, "" },
			{ "arifle_MXM_Black_F", "", 50000, "" },
			{""},	
			{ "bipod_01_F_blk", "", 6000, "" },
			{ "bipod_01_F_snd", "", 6000, "" },
			{ "bipod_01_F_mtp", "", 6000, "" },
			{""},
			{ "30Rnd_65x39_caseless_mag", "", 200, "" },
			{ "30Rnd_9x21_Mag", "", 100, "" },
			{""},	
			{ "optic_SOS", "", 3000, "" },
			{ "acc_flashlight", "", 1000, "" },
			{ "acc_pointer_IR", "", 1500, "" },
			{ "optic_Holosight", "", 2500, "" },
			{ "optic_Arco", "", 2500, "" },
			{ "optic_MRCO", "", 2500, "" },
			{ "optic_Hamr", "", 2500, "" },
			{ "optic_NVS", "",5000, "" },
			{ "B_UavTerminal", "",5000, "" }
		};
    };
	
	class cop_SEK {
		name = "Altis SEK-Haendler";
		side = "cop";
		license = "";
		level = 5;
		msg = "Sie haben nicht den benötigten Rang!";
		items[] = {	
			{ "SMG_02_F", "", 15000, "" },
			{ "arifle_MXC_Black_F", "", 30000, "" },
			{ "arifle_MXM_Black_F", "", 50000, "" },
			{ "srifle_EBR_SOS_F", "", 50000, "" },
			{ "srifle_DMR_06_olive_F", "",500000, "" },
			{ "srifle_DMR_03_F", "",500000, "" },
			{""},
			{ "bipod_01_F_blk", "", 6000, "" },
			{ "bipod_01_F_snd", "", 6000, "" },
			{ "bipod_01_F_mtp", "", 6000, "" },
			{""},
			{ "muzzle_snds_H", "", 1000, "" },
			{ "muzzle_snds_L", "", 1000, "" },
			{ "muzzle_snds_M", "", 1000, "" },
			{""},
			{ "20Rnd_762x51_Mag", "", 300, "" },
			{ "30Rnd_65x39_caseless_mag", "", 200, "" },
			{ "30Rnd_9x21_Mag", "", 100, "" },
			{""},	
			{ "optic_SOS", "", 3000, "" },
			{ "acc_flashlight", "", 1000, "" },
			{ "acc_pointer_IR", "", 1500, "" },
			{ "optic_Holosight", "",2500, "" },
			{ "optic_Arco", "", 2500, "" },
			{ "optic_MRCO", "", 2500, "" },
			{ "optic_Hamr", "", 2500, "" },
			{ "optic_DMS", "", 3000, "" },
			{ "optic_NVS", "", 5000, "" },
			{ "HandGrenade_Stone", "Flashbang", 500, "" }
		};
	};
	
    class cop_sergeant {
        name = "Altis Militaerhaendler";
        side = "cop";
        license = "";
        level = 7;
        msg = "Sie haben nicht den benötigten Rang!";
        items[] = {
			{ "arifle_Mk20C_plain_F", "", 30000, "" },
			{ "arifle_Mk20_GL_plain_F", "", 30000, "" },
			{ "arifle_MX_F", "", 30000, "" },
			{ "arifle_MX_GL_F", "", 30000, "" },
			{ "arifle_MXM_F", "", 30000, "" },
			{ "arifle_MX_SW_F", "", 40000, "" },
			{ "srifle_EBR_SOS_F", "", 50000, "" },
			{ "LMG_Mk200_F", "", 75000, "" },
			{ "launch_NLAW_F", "", 50000, "" },
			{""},	
			{ "bipod_01_F_blk", "", 6000, "" },
			{ "bipod_01_F_snd", "", 6000, "" },
			{ "bipod_01_F_mtp", "", 6000, "" },
			{""},	
			{ "muzzle_snds_H", "", 1000, "" },
			{ "muzzle_snds_L", "", 1000, "" },
			{ "muzzle_snds_M", "", 1000, "" },
			{ "muzzle_snds_H_MG", "", 1000, "" },
			{""},
			{ "20Rnd_762x51_Mag", "", 300, "" },
			{ "30Rnd_65x39_caseless_mag", "", 200, "" },
			{ "30Rnd_556x45_Stanag", "", 100, "" },
			{ "100Rnd_65x39_caseless_mag", "", 500, "" },
			{ "200Rnd_65x39_cased_Box_Tracer", "", 1000, "" },
			{ "NLAW_F", "", 15000, "" },
			{""},
			{ "optic_Arco", "", 2500, "" },
			{ "optic_MRCO", "", 2500, "" },
			{ "acc_flashlight", "", 1000, "" },
			{ "acc_pointer_IR", "", 1500, "" },
			{ "optic_Holosight", "", 2500, "" },
			{ "optic_SOS", "", 3000, "" },
			{ "optic_DMS", "", 3000, "" },
			{ "optic_NVS", "", 5000, "" },
			{ "optic_Hamr", "", 2500, "" },
			{""},
			{ "MineDetector", "", 1000, "" },
			{ "DemoCharge_Remote_Mag", "", 10000, "" },
			//{ "SmokeShellYellow", "Traenengasgranate", 500, " },
			//{ "1Rnd_SmokeYellow_Grenade_shell", "Traenengas GL", 500, " },
			{ "HandGrenade_Stone", "Flashbang", 500, "" },
			{ "UGL_FlareWhite_F", "Vorfeldbeleuchtung", 100, "" }
        };
    };
		
	class cop_general {
        name = "Altis Generalshop";
        side = "cop";
        license = "";
        level = 9;
        msg = "Sie haben nicht den benötigten Rang!";
        items[] = {
			{ "arifle_Mk20C_plain_F", "", 30000, "" },
			{ "arifle_Mk20_GL_plain_F", "", 30000, "" },
			{ "arifle_MX_F", "", 30000, "" },
			{ "arifle_MX_GL_F", "", 30000, "" },
			{ "arifle_MXM_F", "", 30000, "" },
			{ "arifle_MX_SW_F", "", 40000, "" },
			{ "srifle_EBR_SOS_F", "", 50000, "" },
			{ "LMG_Mk200_F", "", 75000, "" },
			{ "srifle_LRR_camo_F", "", 50000, "" },
			{ "launch_NLAW_F", "", 50000, "" },
			{""},	
			{ "bipod_01_F_blk", "", 6000, "" },
			{ "bipod_01_F_snd", "", 6000, "" },
			{ "bipod_01_F_mtp", "", 6000, "" },
			{""},
			{ "muzzle_snds_H", "", 1000, "" },
			{ "muzzle_snds_L", "", 1000, "" },
			{ "muzzle_snds_M", "", 1000, "" },
			{ "muzzle_snds_H_MG", "", 1000, "" },
			{""},
			{ "20Rnd_762x51_Mag", "", 300, "" },
			{ "30Rnd_65x39_caseless_mag", "", 200, "" },
			{ "30Rnd_556x45_Stanag", "", 100, "" },
			{ "100Rnd_65x39_caseless_mag", "", 500, "" },
			{ "200Rnd_65x39_cased_Box_Tracer", "", 1000, "" },
			{ "7Rnd_408_Mag", "", 1000, "" },
			{ "NLAW_F", "", 15000, "" },
			{""},
			{ "optic_Arco", "", 2500, "" },
			{ "optic_MRCO", "", 2500, "" },
			{ "acc_flashlight", "", 1000, "" },
			{ "acc_pointer_IR", "", 1500, "" },
			{ "optic_Holosight", "", 2500, "" },
			{ "optic_SOS", "", 3000, "" },
			{ "optic_DMS", "", 3000, "" },
			{ "optic_NVS", "", 5000, "" },
			{ "optic_Hamr", "", 2500, "" },
			{""},
			{ "MineDetector", "", 1000, "" },
			{ "DemoCharge_Remote_Mag", "", 10000, "" },
			//{ "SmokeShellYellow", "Traenengasgranate", 500, " },
			//{ "1Rnd_SmokeYellow_Grenade_shell", "Traenengas GL", 500, " },
			{ "HandGrenade_Stone", "Flashbang", 500, "" },
			{ "UGL_FlareWhite_F", "Vorfeldbeleuchtung", 100, "" }
        };
    };
	
	class medical {
		name = "Medizinische Ausruestung";
		side = "";
		license = "";
		level = -1;
		items[] = {
			{ "FirstAidKit", "", 150, "" }
		};
	};	
		
    //Medic Shops
    class med_basic {
        name = "Sanitäter Shop";
        side = "med";
        license = "";
        level = -1;
        items[] = {
            { "ItemGPS", "", 100, "" },
			{ "Binocular", "", 150, "" },
			{ "ToolKit", "", 250, "" },
			{ "FirstAidKit", "", 150, "" },
			{ "Medikit", "", 500, "" },
			{ "NVGoggles_OPFOR", "", 2000, "" },
			{ "Chemlight_red", "", 300, "" },
			{ "Chemlight_yellow", "", 300, "" },
			{ "Chemlight_green", "", 300, "" },
			{ "Chemlight_blue", "", 300, "" }
        };
    };
		
	class adac_basic {
		name = "ADAC Shop";
		side = "adac";
		license = "";
		level = -1;
		items[] = {
			{ "ItemGPS", "", 100, "" },
			{ "Binocular", "", 150, "" },
			{ "ToolKit", "", 250, "" },
			{ "FirstAidKit", "", 150, "" },
			{ "NVGoggles_OPFOR", "", 2000, "" },
			{ "Chemlight_red", "", 300, "" },
			{ "Chemlight_yellow", "", 300, "" },
			{ "Chemlight_green", "", 300, "" },
			{ "Chemlight_blue", "", 300, "" }
		};
	};
		
	class gas {
		name = "Tankstelle";
		side = "civ";
		license = "";
		level = -1;
		items[] = {
			{ "ItemGPS", "", 100, "" },
			{ "Binocular", "", 150, "" },
			{ "ToolKit", "", 10000, "" },
			{ "FirstAidKit", "", 150, "" },
			{ "Itemwatch", "", 100, "" },
			{ "ItemCompass", "", 50, "" },
			{ "ItemMap", "", 50, "" },
			{ "NVGoggles_OPFOR", "", 2000, "" },
			{ "Chemlight_red", "", 300, "" },
			{ "Chemlight_yellow", "", 300, "" },
			{ "Chemlight_green", "", 300, "" },
			{ "Chemlight_blue", "", 300, "" }
		};
	};
		
	class kart {
		name = "Waffenladen an der Kartstrecke";
		side = "civ";
		license = "";
		level = -1;
		items[] = {
			{ "hgun_Pistol_Signal_F", "", 1400, "" },
			{ "6Rnd_RedSignal_F", "", 300, "" }
		};
	};
		
	class airSoft {
		name = "AirSoft-Laden";
		side = "civ";
		license = "";
		level = -1;
		items[] = {
			{ "arifle_TRG20_ACO_Flash_F", "AirSoft-Waffe-Taschenlampe", 0, "" },
			{ "arifle_TRG20_ACO_pointer_F", "AirSoft-Waffe-Laserpointer", 0, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Red", "AirSoft-Magazin", 0, "" },
			{ "NVGoggles_OPFOR", "",2000, "" },
			{ "Binocular", "", 150, "" },
			{ "Chemlight_red", "", 300, "" },
			{ "Chemlight_yellow", "", 300, "" },
			{ "Chemlight_green", "", 300, "" },
			{ "Chemlight_blue", "", 300, "" },
			{ "Weapon_angel_F", "", 555, "" },
			{ "Weapon_egosl_F", "", 555, "" },
			{ "Weapon_angel_kitty_F", "", 555, "" },
			{ "Weapon_angel_rasta_F", "", 555, "" },
			{ "Weapon_tippmann_x7_F", "", 555, "" },
			{ "Weapon_tippmann_x7_UMP_F", "", 555, "" },
			{ "Weapon_invert_mini_dye_F", "", 555, "" },
			{ "140Rnd_PaintBall_blau", "AirSoft-Magazin", 0, "" },
			{ "140Rnd_PaintBall_fire", "AirSoft-Magazin", 0, "" },
			{ "140Rnd_PaintBall_glow", "AirSoft-Magazin", 0, "" },
			{ "140Rnd_PaintBall_gold", "AirSoft-Magazin", 0, "" },
			{ "140Rnd_PaintBall_grun", "AirSoft-Magazin", 0, "" },
			{ "140Rnd_PaintBall_grungelb", "AirSoft-Magazin", 0, "" },
			{ "140Rnd_PaintBall_rotgelb", "AirSoft-Magazin", 0, "" },
			{ "Weapon_brass_n_F", "", 555, "" },
			{ "15Rnd_PaintBall_blau", "AirSoft-Magazin", 0, "" },
			{ "15Rnd_PaintBall_gold", "AirSoft-Magazin", 0, "" }
		};
	};
};
