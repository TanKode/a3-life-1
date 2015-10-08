#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop","_coplevel"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.
_coplevel = call bambusfarm_coplevel;


switch(_shop) do
{
	case "cop_basic":
	{
		switch ( _coplevel ) do
		{
			//case (playerSide != west && !(__GETC__(bambusfarm_coplevel))): {"Du bist kein Polizist!"};
			case (1):
			{
				["Anwärter",
					[
						["hgun_Pistol_heavy_01_snds_F",nil,3000 * DonatorBuyChange],
						["11Rnd_45ACP_Mag",nil,50 * DonatorBuyChange],
						["arifle_SDAR_F",nil,3000 * DonatorBuyChange],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,50 * DonatorBuyChange],
						["SMG_02_F",nil,5000 * DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,50 * DonatorBuyChange],
						["optic_ACO_grn_smg",nil,100 * DonatorBuyChange]
					]
				];
			};
			case (2):
			{
				["Polizeimeister",
					[
						["hgun_Pistol_heavy_01_snds_F",nil,3000 * DonatorBuyChange],
						["11Rnd_45ACP_Mag",nil,50 * DonatorBuyChange],
						["arifle_SDAR_F",nil,3000 * DonatorBuyChange],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,50 * DonatorBuyChange],
						["SMG_02_F",nil,5000 * DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,50 * DonatorBuyChange],
						["optic_ACO_grn_smg",nil,100 * DonatorBuyChange],

						["arifle_MX_Black_F",nil,10000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MX",100 * DonatorBuyChange],
						["arifle_MX_SW_Black_F",nil,10000 * DonatorBuyChange],
						["100Rnd_65x39_caseless_mag","MX-SW",100 * DonatorBuyChange],

						["muzzle_snds_H",nil,100 * DonatorBuyChange],
						["optic_Hamr",nil,100 * DonatorBuyChange],
						["optic_MRCO",nil,100 * DonatorBuyChange],
						["bipod_01_F_blk",nil,100 * DonatorBuyChange]
					]
				];
			};
			case (3):
			{
				["Polizeihauptmeister",
					[
						["hgun_Pistol_heavy_01_snds_F",nil,3000 * DonatorBuyChange],
						["11Rnd_45ACP_Mag",nil,50 * DonatorBuyChange],
						["arifle_SDAR_F",nil,3000 * DonatorBuyChange],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,50 * DonatorBuyChange],
						["SMG_02_F",nil,5000 * DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,50 * DonatorBuyChange],
						["optic_ACO_grn_smg",nil,100 * DonatorBuyChange],

						["arifle_MX_Black_F",nil,10000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MX",100 * DonatorBuyChange],
						["arifle_MX_SW_Black_F",nil,10000 * DonatorBuyChange],
						["100Rnd_65x39_caseless_mag","MX-SW",100 * DonatorBuyChange],

						["arifle_MXM_Black_F",nil,20000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MXM",200 * DonatorBuyChange],

						["muzzle_snds_H",nil,100 * DonatorBuyChange],
						["optic_Hamr",nil,100 * DonatorBuyChange],
						["optic_MRCO",nil,100 * DonatorBuyChange],
						["bipod_01_F_blk",nil,100 * DonatorBuyChange],
						["GrenadeHand_stone","Blendgranate",100 * DonatorBuyChange]
					]
				];
			};
			case (4):
			{
				["Kommissar",
					[
						["hgun_Pistol_heavy_01_snds_F",nil,3000 * DonatorBuyChange],
						["11Rnd_45ACP_Mag",nil,50 * DonatorBuyChange],
						["arifle_SDAR_F",nil,3000 * DonatorBuyChange],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,50 * DonatorBuyChange],
						["SMG_02_F",nil,5000 * DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,50 * DonatorBuyChange],
						["optic_ACO_grn_smg",nil,100 * DonatorBuyChange],

						["arifle_MX_Black_F",nil,10000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MX",100 * DonatorBuyChange],
						["arifle_MX_SW_Black_F",nil,10000 * DonatorBuyChange],
						["100Rnd_65x39_caseless_mag","MX-SW",100 * DonatorBuyChange],

						["arifle_MXM_Black_F",nil,20000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MXM",200 * DonatorBuyChange],

						["LMG_Mk200_F",nil,30000 * DonatorBuyChange],
						["200Rnd_65x39_cased_Box","MK200",300 * DonatorBuyChange],

						["muzzle_snds_H",nil,100 * DonatorBuyChange],
						["optic_Hamr",nil,100 * DonatorBuyChange],
						["optic_MRCO",nil,100 * DonatorBuyChange],
						["bipod_01_F_blk",nil,100 * DonatorBuyChange],
						["GrenadeHand_stone","Blendgranate",100 * DonatorBuyChange]
					]
				];
			};
			case (5):
			{
				["Oberkommissar",
					[
						["hgun_Pistol_heavy_01_snds_F",nil,3000 * DonatorBuyChange],
						["11Rnd_45ACP_Mag",nil,50 * DonatorBuyChange],
						["arifle_SDAR_F",nil,3000 * DonatorBuyChange],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,50 * DonatorBuyChange],
						["SMG_02_F",nil,5000 * DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,50 * DonatorBuyChange],
						["optic_ACO_grn_smg",nil,100 * DonatorBuyChange],

						["arifle_MX_Black_F",nil,10000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MX",100 * DonatorBuyChange],
						["arifle_MX_SW_Black_F",nil,10000 * DonatorBuyChange],
						["100Rnd_65x39_caseless_mag","MX-SW",100 * DonatorBuyChange],

						["arifle_MXM_Black_F",nil,20000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MXM",200 * DonatorBuyChange],

						["LMG_Mk200_F",nil,30000 * DonatorBuyChange],
						["200Rnd_65x39_cased_Box","MK200",300 * DonatorBuyChange],

						["srifle_EBR_F",nil,40000 * DonatorBuyChange],
						["20Rnd_762x51_Mag","MK18 MK-I EMR",400 * DonatorBuyChange],
						["muzzle_snds_B","MK18 MK-I EMR",100 * DonatorBuyChange],

						["optic_KHS_blk",nil,100 * DonatorBuyChange],
						["optic_SOS",nil,100 * DonatorBuyChange],
						["muzzle_snds_H","MX MX-SW MXM",100 * DonatorBuyChange],
						["optic_Hamr",nil,100 * DonatorBuyChange],
						["optic_MRCO",nil,100 * DonatorBuyChange],
						["bipod_01_F_blk",nil,100 * DonatorBuyChange],
						["GrenadeHand_stone","Blendgranate",100 * DonatorBuyChange]
					]
				];
			};
			case (6):
			{
				["Hauptkommissar",
					[
						["hgun_Pistol_heavy_01_snds_F",nil,3000 * DonatorBuyChange],
						["11Rnd_45ACP_Mag",nil,50 * DonatorBuyChange],
						["arifle_SDAR_F",nil,3000 * DonatorBuyChange],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,50 * DonatorBuyChange],
						["SMG_02_F",nil,5000 * DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,50 * DonatorBuyChange],
						["optic_ACO_grn_smg",nil,100 * DonatorBuyChange],

						["arifle_MX_Black_F",nil,10000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MX",100 * DonatorBuyChange],
						["arifle_MX_SW_Black_F",nil,10000 * DonatorBuyChange],
						["100Rnd_65x39_caseless_mag","MX-SW",100 * DonatorBuyChange],

						["arifle_MXM_Black_F",nil,20000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MXM",200 * DonatorBuyChange],

						["LMG_Mk200_F",nil,30000 * DonatorBuyChange],
						["200Rnd_65x39_cased_Box","MK200",300 * DonatorBuyChange],

						["srifle_EBR_F",nil,40000 * DonatorBuyChange],
						["srifle_DMR_03_F",nil,40000 * DonatorBuyChange],
						["20Rnd_762x51_Mag","MK18 MK-I EMR",400 * DonatorBuyChange],
						["muzzle_snds_B","MK18 MK-I EMR",100 * DonatorBuyChange],

						["optic_LRPS",nil,100 * DonatorBuyChange],
						["optic_KHS_blk",nil,100 * DonatorBuyChange],
						["optic_SOS",nil,100 * DonatorBuyChange],
						["muzzle_snds_H","MX MX-SW MXM",100 * DonatorBuyChange],
						["optic_Hamr",nil,100 * DonatorBuyChange],
						["optic_MRCO",nil,100 * DonatorBuyChange],
						["bipod_01_F_blk",nil,100 * DonatorBuyChange],
						["GrenadeHand_stone","Blendgranate",100 * DonatorBuyChange]
					]
				];
			};
			case (7):
			{
				["Polizeileitung",
					[
						["hgun_Pistol_heavy_01_snds_F",nil,3000 * DonatorBuyChange],
						["11Rnd_45ACP_Mag",nil,50 * DonatorBuyChange],
						["arifle_SDAR_F",nil,3000 * DonatorBuyChange],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,50 * DonatorBuyChange],
						["SMG_02_F",nil,5000 * DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,50 * DonatorBuyChange],
						["optic_ACO_grn_smg",nil,100 * DonatorBuyChange],

						["arifle_MX_Black_F",nil,10000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MX",100 * DonatorBuyChange],
						["arifle_MX_SW_Black_F",nil,10000 * DonatorBuyChange],
						["100Rnd_65x39_caseless_mag","MX-SW",100 * DonatorBuyChange],

						["arifle_MXM_Black_F",nil,20000 * DonatorBuyChange],
						["30Rnd_65x39_caseless_mag","MXM",200 * DonatorBuyChange],

						["LMG_Mk200_F",nil,30000 * DonatorBuyChange],
						["200Rnd_65x39_cased_Box","MK200",300 * DonatorBuyChange],

						["srifle_EBR_F",nil,40000 * DonatorBuyChange],
						["srifle_DMR_03_F",nil,40000 * DonatorBuyChange],
						["20Rnd_762x51_Mag","MK18  MK-I EMR",400 * DonatorBuyChange],
						["muzzle_snds_B","MK18 MK-I EMR",100 * DonatorBuyChange],

						["srifle_LRR_F",nil,60000 * DonatorBuyChange],
						["7Rnd_408_Mag","M320",500 * DonatorBuyChange],

						["optic_LRPS",nil,100 * DonatorBuyChange],
						["optic_KHS_blk",nil,100 * DonatorBuyChange],
						["optic_SOS",nil,100 * DonatorBuyChange],
						["muzzle_snds_H","MX MX-SW | MXM",100 * DonatorBuyChange],
						["optic_Hamr",nil,100 * DonatorBuyChange],
						["optic_MRCO",nil,100 * DonatorBuyChange],
						["bipod_01_F_blk",nil,100 * DonatorBuyChange],
						["GrenadeHand_stone","Blendgranate",100 * DonatorBuyChange]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein Notarzt"};
			default {
				["Sani Shop",
					[
						["ItemGPS",nil,100 * DonatorBuyChange],
						["Binocular",nil,150 * DonatorBuyChange],
						["ToolKit",nil,250 * DonatorBuyChange],
						["FirstAidKit",nil,150 * DonatorBuyChange],
						["Medikit",nil,500 * DonatorBuyChange],
						["NVGoggles",nil,1200 * DonatorBuyChange],
						["ItemRadio","Handy",500 * DonatorBuyChange]
					]
				];
			};
		};
	};
	
	case "adac_basic":
	{
		switch (true) do 
		{
			case (playerSide != east): {"Du bist kein ADAC"};
			default {
				["ADAC Shop",
					[
						["ItemGPS",nil,100 * DonatorBuyChange],
						["Binocular",nil,150 * DonatorBuyChange],
						["ToolKit",nil,250 * DonatorBuyChange],
						["FirstAidKit",nil,150 * DonatorBuyChange],
						["NVGoggles",nil,1200 * DonatorBuyChange],
						["ItemRadio","Handy",500 * DonatorBuyChange]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"Du hast keine Rebellen Liezens!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
           				["hgun_Pistol_heavy_01_F",nil,12000 * DonatorBuyChange],
           				["11Rnd_45ACP_Mag",nil,360 * DonatorBuyChange],
           				["hgun_Pistol_heavy_02_F",nil,25000 * DonatorBuyChange],
           				["6Rnd_45ACP_Cylinder",nil,750 * DonatorBuyChange],
           				["hgun_Pistol_Signal_F","Leuchtpistole",50000 * DonatorBuyChange],
           				["6Rnd_GreenSignal_F",nil,1500 * DonatorBuyChange],
           				["SMG_01_F",nil,75000 * DonatorBuyChange],
           				["30Rnd_45ACP_Mag_SMG_01",nil,2250 * DonatorBuyChange],
           				["arifle_SDAR_F",nil,100000 * DonatorBuyChange],
           				["20Rnd_556x45_UW_mag",nil,3000 * DonatorBuyChange],
           				["30Rnd_556x45_Stanag",nil,3000 * DonatorBuyChange],
           				["arifle_TRG21_F",nil,150000 * DonatorBuyChange],
           				["arifle_TRG21_GL_F",nil,400000 * DonatorBuyChange],
           				["30Rnd_556x45_Stanag",nil,4500 * DonatorBuyChange],
           				["UGL_FlareWhite_F",nil,10000 * DonatorBuyChange],
           				["1Rnd_SmokeGreen_Grenade_shell",nil,10000 * DonatorBuyChange],
           				["arifle_Katiba_F",nil,275000 * DonatorBuyChange],
           				["arifle_Katiba_GL_F",nil,500000 * DonatorBuyChange],
           				["30Rnd_65x39_caseless_green",nil,8250 * DonatorBuyChange],
           				["UGL_FlareGreen_F",nil,10000 * DonatorBuyChange],
           				["1Rnd_SmokeGreen_Grenade_shell",nil,10000 * DonatorBuyChange],
           				["srifle_DMR_01_F",nil,500000 * DonatorBuyChange],
           				["10Rnd_762x54_Mag",nil,15000 * DonatorBuyChange],
           				["srifle_DMR_06_camo_F",nil,600000 * DonatorBuyChange],
           				["20Rnd_762x51_Mag", nil,18000 * DonatorBuyChange],
           				["LMG_Zafir_F",nil,1000000 * DonatorBuyChange],
           				["150Rnd_762x54_Box",nil,30000 * DonatorBuyChange],
           				["srifle_LRR_F",nil,1200000 * DonatorBuyChange],
           				["7Rnd_408_Mag",nil,36000 * DonatorBuyChange],
           				//Visir
           				["optic_Aco",nil,2400 * DonatorBuyChange],
           				["optic_MRCO",nil,10000 * DonatorBuyChange],
           				["optic_Hamr",nil,15000 * DonatorBuyChange],
           				["optic_Arco",nil,20000 * DonatorBuyChange],
           				["optic_DMS",nil,25000 * DonatorBuyChange],
           				["optic_LRPS",nil,30000 * DonatorBuyChange],
           				//Granaten
           				["SmokeShellGreen",nil,10000 * DonatorBuyChange],
           				["ItemGPS",nil,100 * DonatorBuyChange],
           				["Binocular",nil,150 * DonatorBuyChange],
           				["ToolKit",nil,250 * DonatorBuyChange],
           				["FirstAidKit",nil,150 * DonatorBuyChange],
           				["NVGoggles_INDEP",nil,80000 * DonatorBuyChange],
           				["ItemRadio","Smartphone",125 * DonatorBuyChange],
           				["ItemMap","Karte",50 * DonatorBuyChange]
					]
				];
			};
		};
	};

	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"Du hast keine Rebellen Liezens!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
           				["hgun_Pistol_heavy_01_F",nil,12000 * DonatorBuyChange],
           				["11Rnd_45ACP_Mag",nil,360 * DonatorBuyChange],
           				["hgun_Pistol_heavy_02_F",nil,25000 * DonatorBuyChange],
           				["6Rnd_45ACP_Cylinder",nil,750 * DonatorBuyChange],
           				["hgun_Pistol_Signal_F","Leuchtpistole",50000 * DonatorBuyChange],
           				["6Rnd_GreenSignal_F",nil,1500 * DonatorBuyChange],
           				["SMG_01_F",nil,75000 * DonatorBuyChange],
           				["30Rnd_45ACP_Mag_SMG_01",nil,2250 * DonatorBuyChange],
           				["arifle_SDAR_F",nil,100000 * DonatorBuyChange],
           				["20Rnd_556x45_UW_mag",nil,3000 * DonatorBuyChange],
           				["30Rnd_556x45_Stanag",nil,3000 * DonatorBuyChange],
           				["arifle_TRG21_F",nil,150000 * DonatorBuyChange],
           				["arifle_TRG21_GL_F",nil,400000 * DonatorBuyChange],
           				["30Rnd_556x45_Stanag",nil,4500 * DonatorBuyChange],
           				["UGL_FlareWhite_F",nil,10000 * DonatorBuyChange],
           				["1Rnd_SmokeGreen_Grenade_shell",nil,10000 * DonatorBuyChange],
           				["arifle_Katiba_F",nil,275000 * DonatorBuyChange],
           				["arifle_Katiba_GL_F",nil,500000 * DonatorBuyChange],
           				["30Rnd_65x39_caseless_green",nil,8250 * DonatorBuyChange],
           				["UGL_FlareGreen_F",nil,10000 * DonatorBuyChange],
           				["1Rnd_SmokeGreen_Grenade_shell",nil,10000 * DonatorBuyChange],
           				["srifle_DMR_01_F",nil,500000 * DonatorBuyChange],
           				["10Rnd_762x54_Mag",nil,15000 * DonatorBuyChange],
           				["srifle_DMR_06_camo_F",nil,600000 * DonatorBuyChange],
           				["20Rnd_762x51_Mag", nil,18000 * DonatorBuyChange],
           				["LMG_Zafir_F",nil,1000000 * DonatorBuyChange],
           				["150Rnd_762x54_Box",nil,30000 * DonatorBuyChange],
           				["srifle_LRR_F",nil,1200000 * DonatorBuyChange],
           				["7Rnd_408_Mag",nil,36000 * DonatorBuyChange],
           				//Visir
           				["optic_Aco",nil,2400 * DonatorBuyChange],
           				["optic_MRCO",nil,10000 * DonatorBuyChange],
           				["optic_Hamr",nil,15000 * DonatorBuyChange],
           				["optic_Arco",nil,20000 * DonatorBuyChange],
           				["optic_DMS",nil,25000 * DonatorBuyChange],
           				["optic_LRPS",nil,30000 * DonatorBuyChange],
           				//Granaten
           				["SmokeShellGreen",nil,10000 * DonatorBuyChange],
           				["ItemGPS",nil,100 * DonatorBuyChange],
           				["Binocular",nil,150 * DonatorBuyChange],
           				["ToolKit",nil,250 * DonatorBuyChange],
           				["FirstAidKit",nil,150 * DonatorBuyChange],
           				["NVGoggles_INDEP",nil,80000 * DonatorBuyChange],
           				["ItemRadio","Smartphone",125 * DonatorBuyChange],
           				["ItemMap","Karte",50 * DonatorBuyChange]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Polizist!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["SMG_01_F",nil,25000 * DonatorBuyChange],
						["30Rnd_45ACP_Mag_SMG_01",nil,125 * DonatorBuyChange],
						["arifle_SDAR_F",nil,35000 * DonatorBuyChange],
						["20Rnd_556x45_UW_mag",nil,350 * DonatorBuyChange],
						["hgun_PDW2000_F",nil,20000 * DonatorBuyChange],
						["hgun_Rook40_F",nil,7500 * DonatorBuyChange],
						["11Rnd_45ACP_Mag",nil,75 * DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,125 * DonatorBuyChange],
						["hgun_ACPC2_F",nil,10000 * DonatorBuyChange],
						["9Rnd_45ACP_Mag",nil,75 * DonatorBuyChange],
						["hgun_Pistol_heavy_02_Yorris_F",nil,12500 * DonatorBuyChange],
						["6Rnd_45ACP_Cylinder",nil,100 * DonatorBuyChange],
						["optic_Aco_smg",nil,2500 * DonatorBuyChange],
						["optic_ACO_grn_smg",nil,2500 * DonatorBuyChange],
						["V_Rangemaster_belt",nil,2500 * DonatorBuyChange],
						["ItemRadio","Handy",500 * DonatorBuyChange]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Werkzeugladen",
			[
				["Binocular",nil,150 * DonatorBuyChange],
				["ItemGPS",nil,250 * DonatorBuyChange],
				["ToolKit",nil,350 * DonatorBuyChange],
				["FirstAidKit",nil,250 * DonatorBuyChange],
				["NVGoggles",nil,10000 * DonatorBuyChange],
				["Chemlight_red",nil,300 * DonatorBuyChange],
				["Chemlight_yellow",nil,300 * DonatorBuyChange],
				["Chemlight_green",nil,300 * DonatorBuyChange],
				["Chemlight_blue",nil,300 * DonatorBuyChange],
				["ItemRadio","Handy",500 * DonatorBuyChange]
			]
		];
	};
	
	case "gasstore":
	{
		["Tankstellenladen",
			[
				["ToolKit",nil,350 * DonatorBuyChange],
				["Binocular",nil,250 * DonatorBuyChange],
				["FirstAidKit",nil,750 * DonatorBuyChange],
				["Chemlight_red",nil,300 * DonatorBuyChange],
				["Chemlight_yellow",nil,300 * DonatorBuyChange],
				["Chemlight_green",nil,300 * DonatorBuyChange],
				["Chemlight_blue",nil,300 * DonatorBuyChange],
				["ItemRadio","Handy",500 * DonatorBuyChange]
			]
		];
	};
};
