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
_skill = bambusfarm_SkillBauen;


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
						["srifle_DMR_02_sniper_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",3,"bambusfarm_inv_carbonfaser",4,"bambusfarm_inv_titaneisen",2,"bambusfarm_inv_edelholz",2,"bambusfarm_inv_bp_mar10",1]],	//MAR-10 .338
						["srifle_DMR_03_tan_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_titaneisen",1,"bambusfarm_inv_carbonfaser",3,"bambusfarm_inv_alup",3,"bambusfarm_inv_edelholz",2,"bambusfarm_inv_bp_mk1",1]],     	//Mk-I
						["srifle_DMR_06_camo_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_titaneisen",1,"bambusfarm_inv_carbonfaser",3,"bambusfarm_inv_alup",3,"bambusfarm_inv_edelholz",2,"bambusfarm_inv_bp_mk14",1]],       //Mk14
						
						["srifle_DMR_01_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",3,"bambusfarm_inv_carbonfaser",3,"bambusfarm_inv_alup",2,"bambusfarm_inv_bp_rahim",1]],		  			  				   	  //RAHIM
						["arifle_MXM_Black_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2,"bambusfarm_inv_carbonfaser",4,"bambusfarm_inv_alup",2,"bambusfarm_inv_bp_mxm",1]],											//MXM
						["arifle_MXM_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2,"bambusfarm_inv_carbonfaser",4,"bambusfarm_inv_alup",2,"bambusfarm_inv_bp_mxm_lz",1]],											//MXM LZ
						["LMG_Mk200_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2,"bambusfarm_inv_carbonfaser",4,"bambusfarm_inv_alup",2,"bambusfarm_inv_bp_mk200mg",1]],											//MK200 MG
						["arifle_Katiba_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_alup",2,"bambusfarm_inv_bp_katiba",1]],										//Katiba
						["arifle_Katiba_GL_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_alup",3,"bambusfarm_inv_bp_katiba",1]],									//Katiba GL
						
						["arifle_MX_Black_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_alup",2,"bambusfarm_inv_bp_mx",1]],											//MX
						["arifle_MX_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_alup",2,"bambusfarm_inv_bp_mx_ps",1]],            				               //MX
						["arifle_MX_GL_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2,"bambusfarm_inv_carbonfaser",2,"bambusfarm_inv_alup",2,"bambusfarm_inv_bp_mx_gl_sog",1]],										//MX
						["arifle_Mk20_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_alup",1,"bambusfarm_inv_bp_mk20",1]],										//MK20
						["arifle_TRG21_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_bp_trg_21",1]],        			     										//TRG 21
						["SMG_01_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",5,"bambusfarm_inv_plastik",2,"bambusfarm_inv_bp_vermin",1]],																	//VERMIN
						["SMG_02_F", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",5,"bambusfarm_inv_plastik",2,"bambusfarm_inv_bp_sting",1]]        			     												//STING
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
						["10Rnd_338_Mag", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",5]],																				//MAS-10 MAG
						["20Rnd_762x51_Mag", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",4]],																			//MK MAG
						["10Rnd_762x54_Mag", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",4]],																			//RAHIM MAG
						["200Rnd_65x39_cased_Box", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",10]],																		//MK200 MG Mag
						["30Rnd_65x39_caseless_mag", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2]],																	//MX Mag
						["30Rnd_65x39_caseless_green", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2]],																	//Katiba Mag
						["30Rnd_556x45_Stanag", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2]],																			//MK20 Mag
						["30Rnd_9x21_Mag", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2]],																			    //9mm 30rnd
						["30Rnd_45ACP_Mag_SMG_01", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2]]																	//ACP 30rnd
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
						["muzzle_snds_338_sand", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_carbonfaser",2,"bambusfarm_inv_edelmetall",4,"bambusfarm_inv_bp_sln338",1]],					//SCHALLI .338
						["muzzle_snds_B", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_edelmetall",4,"bambusfarm_inv_bp_sln762",1]],							//SCHALLI 7,62mm
						["muzzle_snds_H", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_edelmetall",3,"bambusfarm_inv_bp_sln65",1]],							//SCHALLI 6,5mm
						["muzzle_snds_M", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_edelmetall",2,"bambusfarm_inv_bp_sln556",1]],							//SCHALLI 5,56mm
						["muzzle_snds_L", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_bp_sln9mm",1]],													//SCHALLI 9mm
						["muzzle_snds_acp", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_carbonfaser",1,"bambusfarm_inv_bp_slnacp",1]],													//SCHALLI ACP
						
						["optic_DMS", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_titaneisen",1,"bambusfarm_inv_glass",4,"bambusfarm_inv_bp_sniperoptic",1]],								//DMS Visier
						["optic_LRPS", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_titaneisen",1,"bambusfarm_inv_glass",4,"bambusfarm_inv_bp_sniperoptic",1]],								//LRPS Visier
						["optic_SOS", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_titaneisen",1,"bambusfarm_inv_glass",4,"bambusfarm_inv_bp_sniperoptic",1]],								//SOS Visier
						["optic_AMS_snd", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_titaneisen",1,"bambusfarm_inv_glass",4,"bambusfarm_inv_bp_sniperoptic",1]],							//AMS Visier
						["optic_KHS_tan", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_titaneisen",1,"bambusfarm_inv_glass",4,"bambusfarm_inv_bp_sniperoptic",1]],							//Khalia Visier
						
						["bipod_01_F_blk", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_titaneisen",1,"bambusfarm_inv_ironr",5,"bambusfarm_inv_bp_bipod",1]],								//BIPOD
						["acc_pointer_IR", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_titaneisen",1,"bambusfarm_inv_ironr",2]]												//LASER
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
						["SmokeShellRed", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1,"bambusfarm_inv_phosphor",1]],													// smokegrenade
						["SmokeShellPurple", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1,"bambusfarm_inv_phosphor",1]],													// smokegrenade
						["SmokeShell", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1,"bambusfarm_inv_phosphor",1]],													// smokegrenade
						["SmokeShellBlue", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1,"bambusfarm_inv_phosphor",1]],													// smokegrenade
						["SmokeShellGreen", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1,"bambusfarm_inv_phosphor",1]],													// smokegrenade
						["1Rnd_SmokeRed_Grenade_shell", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1,"bambusfarm_inv_phosphor",1]],										// smokegrenade
						["1Rnd_SmokePurple_Grenade_shell", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1,"bambusfarm_inv_phosphor",1]],										// smokegrenade
						["1Rnd_SmokeBlue_Grenade_shell", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1,"bambusfarm_inv_phosphor",1]],										// smokegrenade
						["1Rnd_SmokeGreen_Grenade_shell", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1,"bambusfarm_inv_phosphor",1]],										// smokegrenade
						["1Rnd_Smoke_Grenade_shell", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1,"bambusfarm_inv_phosphor",1]],										// smokegrenade
						
						["ToolKit", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",2]],																						//TOOLKIT
						["Medikit", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",2,"bambusfarm_inv_redgull",1]],																//MEDIKIT
						["NVGoggles", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_glass",2]],																					//nvg
						["ItemGPS", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_glass",2]]																						//GPS
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
						["U_B_FullGhillie_lsh", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",2,"bambusfarm_inv_leder",2,"bambusfarm_inv_bp_ghillie",1]],							//GHILLIE NEU 1
						["U_B_FullGhillie_sard", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",2,"bambusfarm_inv_leder",2,"bambusfarm_inv_bp_ghillie",1]],							//GHILLIE NEU 2
						["U_B_FullGhillie_ard", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",2,"bambusfarm_inv_leder",2,"bambusfarm_inv_bp_ghillie",1]],							//GHILLIE NEU 3

						["U_I_GhillieSuit", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",2,"bambusfarm_inv_leder",2]],														//GHILLIE ALT 1
						["U_O_GhillieSuit", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",2,"bambusfarm_inv_leder",2]],														//GHILLIE ALT 2
						["U_B_GhillieSuit", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",2,"bambusfarm_inv_leder",2]],														//GHILLIE ALT 2
						
						["U_C_Poloshirt_burgundy", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",2,"bambusfarm_inv_leder",1]],												//DFB
						["U_C_Poloshirt_redwhite", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",2,"bambusfarm_inv_leder",1]]												//RAINBOW
						
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

						["V_TacVest_khk", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",1,"bambusfarm_inv_leder",1]],														//DON-VEST 1
						["V_BandollierB_cbr", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",1,"bambusfarm_inv_leder",1]],													//DON-VEST 2
						["V_HarnessO_brn", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",1,"bambusfarm_inv_leder",1]],														//DON-VEST 3
						["V_PlateCarrierSpec_mtp", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",3,"bambusfarm_inv_leder",10,"bambusfarm_inv_titaneisen",1,"bambusfarm_inv_bp_fatvest",1]],	 //DON-VEST 4
						["V_PlateCarrierIAGL_dgtl", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_stoff",2,"bambusfarm_inv_leder",2,"bambusfarm_inv_bp_lz_vest",1]]							//LZ-VEST 3
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
						["B_Carryall_oli", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_leder",3]],														//CARRYALL BP OLIV
						["B_Carryall_khk", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_leder",3]]														//CARRYALL CP KHAKI
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
						["bambusfarm_inv_bs_humm_civ", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_edelmetall",2,"bambusfarm_inv_ironr",10,"bambusfarm_inv_bp_humm_civ",1]],					// BAUSÄTZE FAHRZEUGE - HUMMINGBIRD CIV
						["bambusfarm_inv_bs_offroad", ["bambusfarm_inv_fahrzeugteile",20]],																									// BAUSÄTZE FAHRZEUGE - OFFROAD
						["bambusfarm_inv_bs_suv", ["bambusfarm_inv_fahrzeugteile",25]],																										// BAUSÄTZE FAHRZEUGE - SUV
					
						["bambusfarm_inv_flush", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_heroinu",3,"bambusfarm_inv_cannabis",3,"bambusfarm_inv_coke",3,"bambusfarm_inv_bottles",1]],
						["bambusfarm_inv_titanmantel", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_titaneisen",10]],
						["bambusfarm_inv_edelholz", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_bretter",4]],
						["bambusfarm_inv_stoff", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_faser",4]],
						["bambusfarm_inv_leder", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_unv_leder",3]],
						
						["bambusfarm_inv_edelmetall", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_silverr",20]],
						["bambusfarm_inv_alup", ["bambusfarm_inv_elektroschrott",40]],
						["bambusfarm_inv_plastik", ["bambusfarm_inv_oilp",3]],
						["bambusfarm_inv_carbonfaser", ["bambusfarm_inv_kohlenstoff",4]],
						["bambusfarm_inv_kohlenstoff", ["bambusfarm_inv_diamondr",5]],
						["bambusfarm_inv_phosphor", ["bambusfarm_inv_rock",10]],
						
						["bambusfarm_inv_lockpick", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_ironr",1]],
						["bambusfarm_inv_redgull", ["bambusfarm_inv_banana",2]],
						["bambusfarm_inv_obstsalat", ["bambusfarm_inv_apple",2,"bambusfarm_inv_pear",3,"bambusfarm_inv_peach",2,"bambusfarm_inv_cherry",1,"bambusfarm_inv_lemon",1]],

						["bambusfarm_inv_handcuffs", ["bambusfarm_inv_plastik",1]],
						["bambusfarm_inv_battery", ["bambusfarm_inv_redgull",1]],
						["bambusfarm_inv_gpstracker", ["bambusfarm_inv_ironr",1,"bambusfarm_inv_battery",1]],
						
						["bambusfarm_inv_rolex", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_goldbar",4,"bambusfarm_inv_battery",1,"bambusfarm_inv_alup",2,"bambusfarm_inv_carbonfaser",8,"bambusfarm_inv_bp_rolex",1]],
						["bambusfarm_inv_almanach", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_bp_sln9mm",1,"bambusfarm_inv_bp_sln556",1,"bambusfarm_inv_bp_sln65",1,"bambusfarm_inv_bp_sniperoptic",1,"bambusfarm_inv_bp_mk20",1,"bambusfarm_inv_bp_mx",1,"bambusfarm_inv_bp_katiba",1,"bambusfarm_inv_bp_sting",1,"bambusfarm_inv_bp_vermin",1,"bambusfarm_inv_bp_almanach",1]],
						["bambusfarm_inv_aktex", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_bp_aktex",1,"bambusfarm_inv_aktex1",1,"bambusfarm_inv_aktex2",1,"bambusfarm_inv_aktex3",1,"bambusfarm_inv_aktex4",1,"bambusfarm_inv_aktex5",1,"bambusfarm_inv_aktex6",1,"bambusfarm_inv_aktex7",1,"bambusfarm_inv_aktex8",1,"bambusfarm_inv_aktex9",1]],
						
						["bambusfarm_inv_furniture_05", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_edelmetall",2,"bambusfarm_inv_alup",2,"bambusfarm_inv_bp_furniture_05",1]],

						["bambusfarm_inv_schutthaufen", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_schutt",10]],
						["bambusfarm_inv_dreckhaufen", ["bambusfarm_inv_craftingtool_01",1,"bambusfarm_inv_dreck",10]]
																	
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
						["I_Truck_02_covered_F", ["bambusfarm_inv_bs_zamak_i",1,"bambusfarm_inv_bs_zamak_ii",1]],
						["I_Truck_02_fuel_F", ["bambusfarm_inv_bs_zamak_i",1,"bambusfarm_inv_bs_zamak_ii",1]],
						["C_Heli_Light_01_civil_F", ["bambusfarm_inv_bs_humm_civ",1]],
						["C_Offroad_01_F", ["bambusfarm_inv_apple",1]],
						["C_SUV_01_F", ["bambusfarm_inv_bs_suv",1]]
					]
				];
			};
		};
	};
};