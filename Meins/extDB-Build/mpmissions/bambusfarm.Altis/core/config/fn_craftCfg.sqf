#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_skill"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.
_skill = life_SkillBauen;


switch(_craft) do
{
	case "weapon":
	{
		switch(_skill) do
		{
			case (2000):
			{
				["Weapons",
					[
						["srifle_DMR_02_sniper_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",3,"life_inv_carbonfaser",4,"life_inv_titaneisen",2,"life_inv_edelholz",2,"life_inv_bp_mar10",1]],	//MAR-10 .338
						["srifle_DMR_03_tan_F", ["life_inv_craftingtool_01",1,"life_inv_titaneisen",1,"life_inv_carbonfaser",3,"life_inv_alup",3,"life_inv_edelholz",2,"life_inv_bp_mk1",1]],     	//Mk-I
						["srifle_DMR_06_camo_F", ["life_inv_craftingtool_01",1,"life_inv_titaneisen",1,"life_inv_carbonfaser",3,"life_inv_alup",3,"life_inv_edelholz",2,"life_inv_bp_mk14",1]],       //Mk14
						
						["srifle_DMR_01_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",3,"life_inv_carbonfaser",3,"life_inv_alup",2,"life_inv_bp_rahim",1]],		  			  				   	  //RAHIM
						["arifle_MXM_Black_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",2,"life_inv_carbonfaser",4,"life_inv_alup",2,"life_inv_bp_mxm",1]],											//MXM
						["arifle_MXM_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",2,"life_inv_carbonfaser",4,"life_inv_alup",2,"life_inv_bp_mxm_lz",1]],											//MXM LZ
						["LMG_Mk200_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",2,"life_inv_carbonfaser",4,"life_inv_alup",2,"life_inv_bp_mk200mg",1]],											//MK200 MG
						["arifle_Katiba_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",2,"life_inv_carbonfaser",1,"life_inv_alup",2,"life_inv_bp_katiba",1]],										//Katiba
						["arifle_Katiba_GL_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",2,"life_inv_carbonfaser",1,"life_inv_alup",3,"life_inv_bp_katiba",1]],									//Katiba GL
						
						["arifle_MX_Black_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",2,"life_inv_carbonfaser",1,"life_inv_alup",2,"life_inv_bp_mx",1]],											//MX
						["arifle_MX_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",2,"life_inv_carbonfaser",1,"life_inv_alup",2,"life_inv_bp_mx_ps",1]],            				               //MX
						["arifle_MX_GL_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",2,"life_inv_carbonfaser",2,"life_inv_alup",2,"life_inv_bp_mx_gl_sog",1]],										//MX
						["arifle_Mk20_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",2,"life_inv_carbonfaser",1,"life_inv_alup",1,"life_inv_bp_mk20",1]],										//MK20
						["arifle_TRG21_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",2,"life_inv_carbonfaser",1,"life_inv_bp_trg_21",1]],        			     										//TRG 21
						["SMG_01_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",5,"life_inv_plastik",2,"life_inv_bp_vermin",1]],																	//VERMIN
						["SMG_02_F", ["life_inv_craftingtool_01",1,"life_inv_ironr",5,"life_inv_plastik",2,"life_inv_bp_sting",1]]        			     												//STING
					]
				];
			};
		};
	};
	
	case "magazine":
	{
		switch(_skill) do
		{
			case (2000):
			{
				["Magazine",
					[
						["10Rnd_338_Mag", ["life_inv_craftingtool_01",1,"life_inv_ironr",5]],																				//MAS-10 MAG
						["20Rnd_762x51_Mag", ["life_inv_craftingtool_01",1,"life_inv_ironr",4]],																			//MK MAG
						["10Rnd_762x54_Mag", ["life_inv_craftingtool_01",1,"life_inv_ironr",4]],																			//RAHIM MAG
						["200Rnd_65x39_cased_Box", ["life_inv_craftingtool_01",1,"life_inv_ironr",10]],																		//MK200 MG Mag
						["30Rnd_65x39_caseless_mag", ["life_inv_craftingtool_01",1,"life_inv_ironr",2]],																	//MX Mag
						["30Rnd_65x39_caseless_green", ["life_inv_craftingtool_01",1,"life_inv_ironr",2]],																	//Katiba Mag
						["30Rnd_556x45_Stanag", ["life_inv_craftingtool_01",1,"life_inv_ironr",2]],																			//MK20 Mag
						["30Rnd_9x21_Mag", ["life_inv_craftingtool_01",1,"life_inv_ironr",2]],																			    //9mm 30rnd
						["30Rnd_45ACP_Mag_SMG_01", ["life_inv_craftingtool_01",1,"life_inv_ironr",2]]																	//ACP 30rnd
					]
				];
			};
		};
	};
	
	case "attachments":
	{
		switch(_skill) do
		{
			case (2000):
			{
				["Attachments",
					[
						["muzzle_snds_338_sand", ["life_inv_craftingtool_01",1,"life_inv_carbonfaser",2,"life_inv_edelmetall",4,"life_inv_bp_sln338",1]],					//SCHALLI .338
						["muzzle_snds_B", ["life_inv_craftingtool_01",1,"life_inv_carbonfaser",1,"life_inv_edelmetall",4,"life_inv_bp_sln762",1]],							//SCHALLI 7,62mm
						["muzzle_snds_H", ["life_inv_craftingtool_01",1,"life_inv_carbonfaser",1,"life_inv_edelmetall",3,"life_inv_bp_sln65",1]],							//SCHALLI 6,5mm
						["muzzle_snds_M", ["life_inv_craftingtool_01",1,"life_inv_carbonfaser",1,"life_inv_edelmetall",2,"life_inv_bp_sln556",1]],							//SCHALLI 5,56mm
						["muzzle_snds_L", ["life_inv_craftingtool_01",1,"life_inv_carbonfaser",1,"life_inv_bp_sln9mm",1]],													//SCHALLI 9mm
						["muzzle_snds_acp", ["life_inv_craftingtool_01",1,"life_inv_carbonfaser",1,"life_inv_bp_slnacp",1]],													//SCHALLI ACP
						
						["optic_DMS", ["life_inv_craftingtool_01",1,"life_inv_titaneisen",1,"life_inv_glass",4,"life_inv_bp_sniperoptic",1]],								//DMS Visier
						["optic_LRPS", ["life_inv_craftingtool_01",1,"life_inv_titaneisen",1,"life_inv_glass",4,"life_inv_bp_sniperoptic",1]],								//LRPS Visier
						["optic_SOS", ["life_inv_craftingtool_01",1,"life_inv_titaneisen",1,"life_inv_glass",4,"life_inv_bp_sniperoptic",1]],								//SOS Visier
						["optic_AMS_snd", ["life_inv_craftingtool_01",1,"life_inv_titaneisen",1,"life_inv_glass",4,"life_inv_bp_sniperoptic",1]],							//AMS Visier
						["optic_KHS_tan", ["life_inv_craftingtool_01",1,"life_inv_titaneisen",1,"life_inv_glass",4,"life_inv_bp_sniperoptic",1]],							//Khalia Visier
						
						["bipod_01_F_blk", ["life_inv_craftingtool_01",1,"life_inv_titaneisen",1,"life_inv_ironr",5,"life_inv_bp_bipod",1]],								//BIPOD
						["acc_pointer_IR", ["life_inv_craftingtool_01",1,"life_inv_titaneisen",1,"life_inv_ironr",2]]												//LASER
					]
				];
			};
		};
	};
	
	case "zubehoer":
	{
		switch(_skill) do
		{
			case (2000):
			{
				["Zubehoer",
					[			
						["SmokeShellRed", ["life_inv_craftingtool_01",1,"life_inv_ironr",1,"life_inv_phosphor",1]],													// smokegrenade
						["SmokeShellPurple", ["life_inv_craftingtool_01",1,"life_inv_ironr",1,"life_inv_phosphor",1]],													// smokegrenade
						["SmokeShell", ["life_inv_craftingtool_01",1,"life_inv_ironr",1,"life_inv_phosphor",1]],													// smokegrenade
						["SmokeShellBlue", ["life_inv_craftingtool_01",1,"life_inv_ironr",1,"life_inv_phosphor",1]],													// smokegrenade
						["SmokeShellGreen", ["life_inv_craftingtool_01",1,"life_inv_ironr",1,"life_inv_phosphor",1]],													// smokegrenade
						["1Rnd_SmokeRed_Grenade_shell", ["life_inv_craftingtool_01",1,"life_inv_ironr",1,"life_inv_phosphor",1]],										// smokegrenade
						["1Rnd_SmokePurple_Grenade_shell", ["life_inv_craftingtool_01",1,"life_inv_ironr",1,"life_inv_phosphor",1]],										// smokegrenade
						["1Rnd_SmokeBlue_Grenade_shell", ["life_inv_craftingtool_01",1,"life_inv_ironr",1,"life_inv_phosphor",1]],										// smokegrenade
						["1Rnd_SmokeGreen_Grenade_shell", ["life_inv_craftingtool_01",1,"life_inv_ironr",1,"life_inv_phosphor",1]],										// smokegrenade
						["1Rnd_Smoke_Grenade_shell", ["life_inv_craftingtool_01",1,"life_inv_ironr",1,"life_inv_phosphor",1]],										// smokegrenade
						
						["ToolKit", ["life_inv_craftingtool_01",1,"life_inv_ironr",2]],																						//TOOLKIT
						["Medikit", ["life_inv_craftingtool_01",1,"life_inv_stoff",2,"life_inv_redgull",1]],																//MEDIKIT
						["NVGoggles", ["life_inv_craftingtool_01",1,"life_inv_glass",2]],																					//nvg
						["ItemGPS", ["life_inv_craftingtool_01",1,"life_inv_glass",2]]																						//GPS
					]
				];
			};
		};
	};
	
	case "uniform":
	{
		switch(_skill) do
		{
			case (2000):
			{
				["Kleidung",
					[
						["U_B_FullGhillie_lsh", ["life_inv_craftingtool_01",1,"life_inv_stoff",2,"life_inv_leder",2,"life_inv_bp_ghillie",1]],							//GHILLIE NEU 1
						["U_B_FullGhillie_sard", ["life_inv_craftingtool_01",1,"life_inv_stoff",2,"life_inv_leder",2,"life_inv_bp_ghillie",1]],							//GHILLIE NEU 2
						["U_B_FullGhillie_ard", ["life_inv_craftingtool_01",1,"life_inv_stoff",2,"life_inv_leder",2,"life_inv_bp_ghillie",1]],							//GHILLIE NEU 3

						["U_I_GhillieSuit", ["life_inv_craftingtool_01",1,"life_inv_stoff",2,"life_inv_leder",2]],														//GHILLIE ALT 1
						["U_O_GhillieSuit", ["life_inv_craftingtool_01",1,"life_inv_stoff",2,"life_inv_leder",2]],														//GHILLIE ALT 2
						["U_B_GhillieSuit", ["life_inv_craftingtool_01",1,"life_inv_stoff",2,"life_inv_leder",2]],														//GHILLIE ALT 2
						
						["U_C_Poloshirt_burgundy", ["life_inv_craftingtool_01",1,"life_inv_stoff",2,"life_inv_leder",1]],												//DFB
						["U_C_Poloshirt_redwhite", ["life_inv_craftingtool_01",1,"life_inv_stoff",2,"life_inv_leder",1]]												//RAINBOW
						
					]
				];
			};
		};
	};
	
	case "veste":
	{
		switch(_skill) do
		{
			case (2000):
			{
				["Veste",
					[

						["V_TacVest_khk", ["life_inv_craftingtool_01",1,"life_inv_stoff",1,"life_inv_leder",1]],														//DON-VEST 1
						["V_BandollierB_cbr", ["life_inv_craftingtool_01",1,"life_inv_stoff",1,"life_inv_leder",1]],													//DON-VEST 2
						["V_HarnessO_brn", ["life_inv_craftingtool_01",1,"life_inv_stoff",1,"life_inv_leder",1]],														//DON-VEST 3
						["V_PlateCarrierSpec_mtp", ["life_inv_craftingtool_01",1,"life_inv_stoff",3,"life_inv_leder",10,"life_inv_titaneisen",1,"life_inv_bp_fatvest",1]],	 //DON-VEST 4
						["V_PlateCarrierIAGL_dgtl", ["life_inv_craftingtool_01",1,"life_inv_stoff",2,"life_inv_leder",2,"life_inv_bp_lz_vest",1]]							//LZ-VEST 3
					]
				];
			};
		};
	};

	case "backpack":
	{
		switch(_skill) do
		{
			case (2000):
			{
				["Backpacks",
					[
						["B_Carryall_oli", ["life_inv_craftingtool_01",1,"life_inv_leder",3]],														//CARRYALL BP OLIV
						["B_Carryall_khk", ["life_inv_craftingtool_01",1,"life_inv_leder",3]]														//CARRYALL CP KHAKI
					]
				];
			};
		};
	};
	
	case "item":
	{
		switch(_skill) do
		{
			case (2000):
			{
				["items",
					[
						["life_inv_bs_humm_civ", ["life_inv_craftingtool_01",1,"life_inv_edelmetall",2,"life_inv_ironr",10,"life_inv_bp_humm_civ",1]],					// BAUSÄTZE FAHRZEUGE - HUMMINGBIRD CIV
						["life_inv_bs_offroad", ["life_inv_fahrzeugteile",20]],																									// BAUSÄTZE FAHRZEUGE - OFFROAD
						["life_inv_bs_suv", ["life_inv_fahrzeugteile",25]],																										// BAUSÄTZE FAHRZEUGE - SUV
					
						["life_inv_flush", ["life_inv_craftingtool_01",1,"life_inv_heroinu",3,"life_inv_cannabis",3,"life_inv_coke",3,"life_inv_bottles",1]],
						["life_inv_titanmantel", ["life_inv_craftingtool_01",1,"life_inv_titaneisen",10]],
						["life_inv_edelholz", ["life_inv_craftingtool_01",1,"life_inv_bretter",4]],
						["life_inv_stoff", ["life_inv_craftingtool_01",1,"life_inv_faser",4]],
						["life_inv_leder", ["life_inv_craftingtool_01",1,"life_inv_unv_leder",3]],
						
						["life_inv_edelmetall", ["life_inv_craftingtool_01",1,"life_inv_silverr",20]],
						["life_inv_alup", ["life_inv_elektroschrott",40]],
						["life_inv_plastik", ["life_inv_oilp",3]],
						["life_inv_carbonfaser", ["life_inv_kohlenstoff",4]],
						["life_inv_kohlenstoff", ["life_inv_diamondr",5]],
						["life_inv_phosphor", ["life_inv_rock",10]],
						
						["life_inv_lockpick", ["life_inv_craftingtool_01",1,"life_inv_ironr",1]],
						["life_inv_redgull", ["life_inv_banana",2]],
						["life_inv_obstsalat", ["life_inv_apple",2,"life_inv_pear",3,"life_inv_peach",2,"life_inv_cherry",1,"life_inv_lemon",1]],

						["life_inv_handcuffs", ["life_inv_plastik",1]],
						["life_inv_battery", ["life_inv_redgull",1]],
						["life_inv_gpstracker", ["life_inv_ironr",1,"life_inv_battery",1]],
						
						["life_inv_rolex", ["life_inv_craftingtool_01",1,"life_inv_goldbar",4,"life_inv_battery",1,"life_inv_alup",2,"life_inv_carbonfaser",8,"life_inv_bp_rolex",1]],
						["life_inv_almanach", ["life_inv_craftingtool_01",1,"life_inv_bp_sln9mm",1,"life_inv_bp_sln556",1,"life_inv_bp_sln65",1,"life_inv_bp_sniperoptic",1,"life_inv_bp_mk20",1,"life_inv_bp_mx",1,"life_inv_bp_katiba",1,"life_inv_bp_sting",1,"life_inv_bp_vermin",1,"life_inv_bp_almanach",1]],
						["life_inv_aktex", ["life_inv_craftingtool_01",1,"life_inv_bp_aktex",1,"life_inv_aktex1",1,"life_inv_aktex2",1,"life_inv_aktex3",1,"life_inv_aktex4",1,"life_inv_aktex5",1,"life_inv_aktex6",1,"life_inv_aktex7",1,"life_inv_aktex8",1,"life_inv_aktex9",1]],
						
						["life_inv_furniture_05", ["life_inv_craftingtool_01",1,"life_inv_edelmetall",2,"life_inv_alup",2,"life_inv_bp_furniture_05",1]],

						["life_inv_schutthaufen", ["life_inv_craftingtool_01",1,"life_inv_schutt",10]],
						["life_inv_dreckhaufen", ["life_inv_craftingtool_01",1,"life_inv_dreck",10]]
																	
					]
				];
			};
		};
	};
	
	case "vehicle":
	{
		switch(_skill) do
		{
			case (2000):
			{
				["Fahrzeuge",
					[
						["I_Truck_02_covered_F", ["life_inv_bs_zamak_i",1,"life_inv_bs_zamak_ii",1]],
						["I_Truck_02_fuel_F", ["life_inv_bs_zamak_i",1,"life_inv_bs_zamak_ii",1]],
						["C_Heli_Light_01_civil_F", ["life_inv_bs_humm_civ",1]],
						["C_Offroad_01_F", ["life_inv_apple",1]],
						["C_SUV_01_F", ["life_inv_bs_suv",1]]
					]
				];
			};
		};
	};
};