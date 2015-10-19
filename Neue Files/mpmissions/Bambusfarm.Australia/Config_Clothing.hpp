/*
	ARRAY FORMAT:
		0: STRING (Classname)
		1: STRING (Display Name, leave as "" for default)
		2: SCALAR (Price)
		4: ARRAY (This is for limiting items to certain things)
			0: Variable to read from
			1: Variable Value Type
			2: What to compare to
*/
class Clothing {
	class bruce {
		title = "STR_Shops_C_Bruce";
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_C_Poloshirt_blue", "Poloshirt Blau", 250, { "life_level", "SCALAR", 1 } },
			{ "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 250, { "life_level", "SCALAR", 1 } },
			{ "U_C_Poloshirt_redwhite", "Poloshirt Rot/Weiss", 250, { "life_level", "SCALAR", 1 } },
			{ "U_C_Poloshirt_salmon", "Poloshirt Salmon", 250, { "life_level", "SCALAR", 1 } },
			{ "U_C_Poloshirt_stripped", "Poloshirt Gestreift", 250, { "life_level", "SCALAR", 1 } },
			{ "U_C_Poloshirt_tricolour", "Poloshirt Dreifarbig", 250, { "life_level", "SCALAR", 1 } },
			{ "U_C_Poor_2", "Rag tagged clothes", 250, { "life_level", "SCALAR", 2 } },
			{ "U_IG_Guerilla2_2", "Gruenes Hemd & weisse Hose", 650, { "life_level", "SCALAR", 2 } },
			{ "U_IG_Guerilla2_1", "Schwarzes Hemd & beche Hose", 750, { "life_level", "SCALAR", 2 } },
			{ "U_IG_Guerilla3_1", "Braune Jacke & Jeans", 735, { "life_level", "SCALAR", 2 } },
			{ "U_IG_Guerilla2_3", "Graues Hemd & gruene Hose", 1200, { "life_level", "SCALAR", 2 } },
			{ "U_C_HunterBody_grn", "Beche Jacke & Jeans", 1500, { "life_level", "SCALAR", 4 } },
			{ "U_C_WorkerCoveralls", "Mechaniker Outfit", 2500, { "life_level", "SCALAR", 4 } },
			{ "U_OrestesBody", "Surfer", 1100, { "life_level", "SCALAR", 4 } },
			{ "U_NikosAgedBody", "Casual Wears", 5000, { "life_level", "SCALAR", 4 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Bandanna_camo", "Camo Bandanna", 125, { "life_level", "SCALAR", 1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 150, { "life_level", "SCALAR", 1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 150, { "life_level", "SCALAR", 1 } },
			{ "H_Bandanna_cbr", "", 150, { "life_level", "SCALAR", 1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 150, { "life_level", "SCALAR", 1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 150, { "life_level", "SCALAR", 1 } },
			{ "H_StrawHat", "", 250, { "life_level", "SCALAR", 2 } },
			{ "H_BandMask_blk", "", 425, { "life_level", "SCALAR", 2 } },
			{ "H_Booniehat_tan", "", 425, { "life_level", "SCALAR", 2 } },
			{ "H_Hat_blue", "", 425, { "life_level", "SCALAR", 2 } },
			{ "H_Hat_brown", "", 425, { "life_level", "SCALAR", 2 } },
			{ "H_Hat_checker", "", 425, { "life_level", "SCALAR", 2 } },
			{ "H_Hat_grey", "", 425, { "life_level", "SCALAR", 2 } },
			{ "H_Hat_tan", "", 425, { "life_level", "SCALAR", 2 } },
			{ "H_Cap_blu", "", 525, { "life_level", "SCALAR", 4 } },
			{ "H_Cap_grn", "", 525, { "life_level", "SCALAR", 4 } },
			{ "H_Cap_grn_BI", "", 525, { "life_level", "SCALAR", 4 } },
			{ "H_Cap_oli", "", 525, { "life_level", "SCALAR", 4 } },
			{ "H_Cap_red", "", 525, { "life_level", "SCALAR", 4 } },
			{ "H_Cap_tan", "", 525, { "life_level", "SCALAR", 4 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "life_level", "SCALAR", 1 } },
			{ "G_Shades_Black", "", 25, { "life_level", "SCALAR", 1 } },
			{ "G_Shades_Blue", "", 25, { "life_level", "SCALAR", 1 } },
			{ "G_Sport_Blackred", "", 30, { "life_level", "SCALAR", 1 } },
			{ "G_Sport_Checkered", "", 30, { "life_level", "SCALAR", 1 } },
			{ "G_Sport_Blackyellow", "", 30, { "life_level", "SCALAR", 1 } },
			{ "G_Sport_BlackWhite", "", 30, { "life_level", "SCALAR", 1 } },
			{ "G_Squares", "", 40, { "life_level", "SCALAR", 2 } },
			{ "G_Aviator", "", 50, { "life_level", "SCALAR", 2 } },
			{ "G_Lady_Mirror", "", 100, { "life_level", "SCALAR", 2 } },
			{ "G_Lady_Dark", "", 100, { "life_level", "SCALAR", 2 } },
			{ "G_Lady_Blue", "", 100, { "life_level", "SCALAR", 2 } },
			{ "G_Lowprofile", "", 100, { "life_level", "SCALAR", 4 } },
			{ "G_Combat", "", 100, { "life_level", "SCALAR", 4 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{"V_Press_F","", 2000, { "life_level", "SCALAR", 4 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "life_level", "SCALAR", 1 } },
			{ "B_AssaultPack_cbr", "", 2500, { "life_level", "SCALAR", 1 } },
			{ "B_Kitbag_mcamo", "", 4500, { "life_level", "SCALAR", 1 } },
			{ "B_TacticalPack_oli", "", 3500, { "life_level", "SCALAR", 2 } },
			{ "B_FieldPack_ocamo", "", 3000, { "life_level", "SCALAR", 2 } },
			{ "B_Bergen_sgg", "", 4500, { "life_level", "SCALAR", 4 } },
			{ "B_Kitbag_cbr", "", 4500, { "life_level", "SCALAR", 4 } }
		};
	};

	class cop {
		title = "STR_Shops_C_Police";
		license = "";
		side = "cop";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_Rangemaster", "Polizeiuniform", 25, { "", "", -1 } },
			{ "U_O_Wetsuit", "", 2000, {"life_coplevel", "SCALAR", 1} },
			{ "U_B_SpecopsUniform_sgg", "SEK Uniform", 550, { "life_coplevel", "SCALAR", 4 } },
			{ "U_B_CombatUniform_mcam", "Kampfanzug (Tropen)", 1000, { "life_coplevel", "SCALAR", 6 } },
			{ "U_B_GhillieSuit", "Ghillie-Anzug (Tropen)", 1000, { "life_coplevel", "SCALAR", 6 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Beret_blk_POLICE", "", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Cap_police", "", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_Colonel", "", 100, { "life_coplevel", "SCALAR", 4 } },
			{ "H_Cap_brn_SPECOPS", "", 50, { "life_coplevel", "SCALAR", 6 } },
			{ "H_MilCap_mcamo", "", 300, { "life_coplevel", "SCALAR", 6 } },
			{ "H_Watchcap_blk", "", 300, { "life_coplevel", "SCALAR", 6 } },
			{ "H_HelmetB_light_grass", "", 300, { "life_coplevel", "SCALAR", 6 } },	
			{ "H_HelmetB_camo", "", 300, { "life_coplevel", "SCALAR", 6 } },
			{ "H_Booniehat_mcamo", "", 300, { "life_coplevel", "SCALAR", 6 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 80, { "", "", -1 } },
			{ "G_Shades_Blue", "", 80, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 80, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 80, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 80, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 80, { "", "", -1 } },
			{ "G_Squares", "", 80, { "", "", -1 } },
			{ "G_Aviator", "", 80, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 150, { "", "", -1 } },
			{ "G_Lady_Dark", "", 150, { "", "", -1 } },
			{ "G_Lady_Blue", "", 150, { "", "", -1 } },
			{ "G_Lowprofile", "", 150, { "", "", -1 } },
			{ "G_Combat", "", 150, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 150, { "life_coplevel", "SCALAR", 4 } },
			{ "G_Balaclava_lowprofile", "", 150, { "life_coplevel", "SCALAR", 4 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_TacVest_blk_POLICE", "", 1500, { "", "", -1 } },
			{ "V_RebreatherIR", "", 1500, { "", "", -1 } },
			{ "V_PlateCarrier1_blk", "Antigasweste", 2000, { "life_coplevel", "SCALAR", 4 } },
			{ "V_TacVest_oli", "", 1500, {"life_coplevel", "SCALAR", 6} }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Bergen_blk", "Polizeirucksack", 2500, { "", "", -1 } },
			{ "B_UAV_01_backpack_F", "", 20000, { "", "", -1 } },
			{ "B_Bergen_sgg", "SEK-Rucksack", 2500, { "life_coplevel", "SCALAR", 4} },
			{ "B_Kitbag_cbr", "", 4500, { "life_coplevel", "SCALAR", 6 } },
			{ "B_FieldPack_blk", "", 1500, { "life_coplevel", "SCALAR", 6 } }
		};
	};

	class dive {
		title = "STR_Shops_C_Diving";
		license = "dive";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_Wetsuit", "", 50000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Diving", "", 5000, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_RebreatherB", "", 50000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } }
		};
	};

	class reb {
		title = "STR_Shops_C_Rebel";
		license = "rebel";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_IG_Guerilla1_1", "", 5000, { "life_level", "SCALAR", 5 } },
			{ "U_I_G_resistanceLeader_F", "", 6000, { "life_level", "SCALAR", 5 } },
			{ "U_O_SpecopsUniform_ocamo", "", 10000, { "life_level", "SCALAR", 6 } },
			{ "U_O_CombatUniform_oucamo", "", 10000, { "life_level", "SCALAR", 6 } },
			{ "U_O_PilotCoveralls", "", 12000, { "life_level", "SCALAR", 7 } },
			{ "U_I_OfficerUniform", "", 18000, { "life_level", "SCALAR", 7 } },
			{ "U_O_OfficerUniform_ocamo", "", 18000, { "life_level", "SCALAR", 8 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Booniehat_dgtl", "", 2500, { "life_level", "SCALAR", 5 } },
			{ "H_MilCap_ocamo", "Rebellen-Mütze", 3000, { "life_level", "SCALAR", 5 } },
			{ "H_ShemagOpen_tan", "", 5000, { "life_level", "SCALAR", 6 } },
			{ "H_Shemag_tan", "", 5000, { "life_level", "SCALAR", 6 } },
			{ "H_Shemag_olive", "", 5000, { "life_level", "SCALAR", 6 } },
			{ "H_ShemagOpen_khk", "", 5000, { "life_level", "SCALAR", 6 } },
			{ "H_Shemag_olive_hs", "", 5200, { "life_level", "SCALAR", 6 } },
			{ "H_HelmetIA", "", 10000, { "life_level", "SCALAR", 7 } },
			{ "H_HelmetIA_net", "", 10000, { "life_level", "SCALAR", 7 } },
			{ "H_HelmetLeaderO_ocamo", "", 10000, { "life_level", "SCALAR", 7 } },
			{ "H_HelmetLeaderO_oucamo", "", 10000, { "life_level", "SCALAR", 7 } },
			{ "H_BandMask_khk", "", 10000, { "life_level", "SCALAR", 8 } },
			{ "H_Watchcap_blk", "", 150, { "life_level", "SCALAR", 8 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "life_level", "SCALAR", 1 } },
			{ "G_Shades_Blue", "", 25, { "life_level", "SCALAR", 1 } },
			{ "G_Sport_Blackred", "", 30, { "life_level", "SCALAR", 1 } },
			{ "G_Sport_Checkered", "", 30, { "life_level", "SCALAR", 1 } },
			{ "G_Sport_Blackyellow", "", 30, { "life_level", "SCALAR", 1 } },
			{ "G_Sport_BlackWhite", "", 30, { "life_level", "SCALAR", 1 } },
			{ "G_Squares", "", 40, { "life_level", "SCALAR", 2 } },
			{ "G_Aviator", "", 50, { "life_level", "SCALAR", 2 } },
			{ "G_Lady_Mirror", "", 100, { "life_level", "SCALAR", 2 } },
			{ "G_Lady_Dark", "", 100, { "life_level", "SCALAR", 2 } },
			{ "G_Lady_Blue", "", 100, { "life_level", "SCALAR", 2 } },
			{ "G_Lowprofile", "", 100, { "life_level", "SCALAR", 4 } },
			{ "G_Combat", "", 100, { "life_level", "SCALAR", 4 } },
			{ "G_Balaclava_oli", "", 1000, { "life_level", "SCALAR", 5 } }
			
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_BandollierB_khk", "", 2500, { "life_level", "SCALAR", 5 } },
			{ "V_BandollierB_cbr", "", 2500, { "life_level", "SCALAR", 5 } },
			{ "V_BandollierB_rgr", "", 2500, { "life_level", "SCALAR", 5 } },
			{ "V_BandollierB_blk", "", 2500, { "life_level", "SCALAR", 5 } },
			{ "V_Chestrig_khk", "", 5000, { "life_level", "SCALAR", 6 } },
			{ "V_Chestrig_rgr", "", 5000, { "life_level", "SCALAR", 6 } },
			{ "V_Chestrig_blk", "", 5000, { "life_level", "SCALAR", 6 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "life_level", "SCALAR", 1 } },
			{ "B_AssaultPack_cbr", "", 2500, { "life_level", "SCALAR", 1 } },
			{ "B_Kitbag_mcamo", "", 4500, { "life_level", "SCALAR", 1 } },
			{ "B_TacticalPack_oli", "", 3500, { "life_level", "SCALAR", 2 } },
			{ "B_FieldPack_ocamo", "", 3000, { "life_level", "SCALAR", 2 } },
			{ "B_Bergen_sgg", "", 4500, { "life_level", "SCALAR", 4 } },
			{ "B_Kitbag_cbr", "", 4500, { "life_level", "SCALAR", 4 } }
		};
	};

	class kart {
		title = "STR_Shops_C_Kart";
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_C_Driver_1_black", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_blue", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_red", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_orange", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_green", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_white", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_1_yellow", "", 1500, { "", "", -1 } },
			{ "U_C_Driver_2", "", 3500, { "", "", -1 } },
			{ "U_C_Driver_1", "", 3600, { "", "", -1 } },
			{ "U_C_Driver_3", "", 3700, { "", "", -1 } },
			{ "U_C_Driver_4", "", 3700, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_RacingHelmet_1_black_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_red_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_white_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_blue_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_yellow_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_green_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_F", "", 2500, { "", "", -1 } },
			{ "H_RacingHelmet_2_F", "", 2500, { "", "", -1 } },
			{ "H_RacingHelmet_3_F", "", 2500, { "", "", -1 } },
			{ "H_RacingHelmet_4_F", "", 2500, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } }
		};
	};
	
	class med {
		title = "STR_Shop_C_Med";
		license = "";
		side = "med";
		
		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_I_HeliPilotCoveralls", "Sanitäter Uniform", 850, { "", "", -1} },
			{ "U_Rangemaster", "Notarzt Uniform", 1000, { "life_mediclevel", "SCALAR", 1} }
		};
		
		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Cap_red", "Sanitäter-Cap (Rot)", 150, { "", "", -1} },
			{ "H_Cap_blk", "Sanitäter-Cap (Schwarz)", 150, { "", "" , -1} }
		};
		
		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 25, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 30, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 30, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 30, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 30, { "", "", -1 } },
			{ "G_Squares", "", 40, { "", "", -1 } },
			{ "G_Aviator", "", 50, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 100, { "", "", -1 } },
			{ "G_Lady_Dark", "", 100, { "", "", -1 } },
			{ "G_Lady_Blue", "", 100, { "", "", -1 } },
			{ "G_Lowprofile", "", 100, { "", "", -1 } },
			{ "G_Combat", "", 100, { "", "", -1 } }
		};
		
		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } }
		};
		
		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Bergen_blk", "Sanitäterrucksack", 2500, { "", "", -1} },
			{ "B_Bergen_sgg", "Notarztrucksack", 2500, { "life_mediclevel", "SCALAR", 1} }
		};
	};
	
	class adac {
		title = "STR_Shop_C_ADAC";
		license = "";
		side = "adac";
		
		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_OG_Guerilla2_3", "ADAC Uniform", 850, { "", "", -1} }
		};
		
		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Cap_blk", "ADAC-Cap (Schwarz)", 150, {"", "", -1} }
		};
		
		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 25, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 30, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 30, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 30, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 30, { "", "", -1 } },
			{ "G_Squares", "", 40, { "", "", -1 } },
			{ "G_Aviator", "", 50, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 100, { "", "", -1 } },
			{ "G_Lady_Dark", "", 100, { "", "", -1 } },
			{ "G_Lady_Blue", "", 100, { "", "", -1 } },
			{ "G_Lowprofile", "", 100, { "", "", -1 } },
			{ "G_Combat", "", 100, { "", "", -1 } }
		};
		
		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } }
		};
		
		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Bergen_blk", "ADAC-Rrucksack", 2500, { "", "", -1} }
		};
	};
	
	class airSoft {
		title = "STR_Shop_C_AirSoft";
		license = "";
		side = "civ";
			
		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_I_Protagonist_VR", "VR Independent", 0, { "", "", -1} },
			{ "U_O_Protagonist_VR", "VR Opfor", 0, { "", "", -1} },
			{ "U_B_Protagonist_VR", "VR Blufor", 0, {"", "", -1} },
			{ "Paintball_Uniform_desert_01_B", "VR Blufor", 0, {"", "", -1} },
			{ "Paintball_Uniform_desert_02_B", "VR Blufor", 0, {"", "", -1} },
			{ "Paintball_Uniform_Digital_Urban_01_B", "VR Blufor", 0, {"", "", -1} },
			{ "Paintball_Uniform_Fun_Camo_01_B", "VR Blufor", 0, {"", "", -1} },
			{ "Paintball_Uniform_Hex_Camo_01_B", "VR Blufor", 0, {"", "", -1} },
			{ "Paintball_Uniform_blue_01_B", "VR Blufor", 0, {"", "", -1} },
			{ "Paintball_Uniform_desert_01_O", "VR Opfor", 0, { "", "", -1} },
			{ "Paintball_Uniform_desert_02_O", "VR Opfor", 0, { "", "", -1} },
			{ "Paintball_Uniform_Digital_Urban_01_O", "VR Opfor", 0, { "", "", -1} },
			{ "Paintball_Uniform_Fun_Camo_01_O", "VR Opfor", 0, { "", "", -1} },
			{ "Paintball_Uniform_Hex_Camo_01_O", "VR Opfor", 0, { "", "", -1} },
			{ "Paintball_Uniform_blue_01_O", "VR Opfor", 0, { "", "", -1} },
			{ "Paintball_Uniform_desert_01_I", "VR Independent", 0, { "", "", -1} },
			{ "Paintball_Uniform_desert_02_I", "VR Independent", 0, { "", "", -1} },
			{ "Paintball_Uniform_Digital_Urban_01_I", "VR Independent", 0, { "", "", -1} },
			{ "Paintball_Uniform_Fun_Camo_01_I", "VR Independent", 0, { "", "", -1} },
			{ "Paintball_Uniform_Hex_Camo_01_I", "VR Independent", 0, { "", "", -1} },
			{ "Paintball_Uniform_blue_01_I", "VR Independent", 0, { "", "", -1} }
		};
			
		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Bandanna_camo", "Camo Bandanna", 125, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 150, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 150, { "", "", -1 } },
			{ "H_StrawHat", "", 250, { "", "", -1 } },
			{ "H_BandMask_blk", "", 425, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 425, { "", "", -1 } },
			{ "H_Hat_blue", "", 425, { "", "", -1 } },
			{ "H_Hat_brown", "", 425, { "", "", -1 } },
			{ "H_Hat_checker", "", 425, { "", "", -1 } },
			{ "H_Hat_grey", "", 425, { "", "", -1 } },
			{ "H_Hat_tan", "", 425, { "", "", -1 } },
			{ "H_Cap_blu", "", 525, { "", "", -1 } },
			{ "H_Cap_grn", "", 525, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 525, { "", "", -1 } },
			{ "H_Cap_oli", "", 525, { "", "", -1 } },
			{ "H_Cap_red", "", 525, { "", "", -1 } },
			{ "H_Cap_tan", "", 525, { "", "", -1 } },
			{ "Paintball_Mask_01", "", 555, { "", "", -1 } },
			{ "Paintball_Mask_02", "", 555, { "", "", -1 } },
			{ "Paintball_Mask_03", "", 555, { "", "", -1 } },
			{ "Paintball_Mask_04", "", 555, { "", "", -1 } },
			{ "Paintball_Mask_05", "", 555, { "", "", -1 } },
			{ "Paintball_Mask_06", "", 555, { "", "", -1 } }
			
		};
			
		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 25, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 30, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 30, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 30, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 30, { "", "", -1 } },
			{ "G_Squares", "", 40, { "", "", -1 } },
			{ "G_Aviator", "", 50, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 100, { "", "", -1 } },
			{ "G_Lady_Dark", "", 100, { "", "", -1 } },
			{ "G_Lady_Blue", "", 100, { "", "", -1 } },
			{ "G_Lowprofile", "", 100, { "", "", -1 } },
			{ "G_Combat", "", 100, { "", "", -1 } }
		};
			
		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } }
		};
		
		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } }
		};
	};
};