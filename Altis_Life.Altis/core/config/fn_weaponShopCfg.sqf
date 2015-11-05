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
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			default
			{
				["Praktikanten Polizei Shop",
					[
						["Rangefinder",nil,3500],
						["hgun_Rook40_F","Taser-Pistole",5000],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000],
						["16Rnd_9x21_Mag","16er Magazin",10],
						["arifle_sdar_F","Taser Sturmgewehr",7500],
						["20Rnd_556x45_UW_mag","556er Magazin",100],
                        ["SMG_02_F",nil,7500],
						["30Rnd_9x21_Mag",nil,100],
						["muzzle_snds_L",nil,1000],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellYellow",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
			};
		};
	};

	case "cop_visier":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 1): {"Du kannst erst als Polizist hier Zugreifen !"};
			default
			{
				["Altis Visiere & Sonstiges",
					[
						["ItemMap",nil,10],
						["ItemWatch",nil,10],
						["ItemCompass",nil,10],
						["ItemGPS",nil,10],
						["ToolKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Chemlight_red",nil,10],
						["Chemlight_yellow",nil,10],
						["Chemlight_green",nil,10],
						["Chemlight_blue",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["bipod_03_F_blk",nil,7500],
						["B_UavTerminal",nil,10],
						["Rangefinder",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_smg",nil,10],
						["optic_MRCO",nil,10],
						["optic_LRPS",nil,10],
						["optic_DMS",nil,10],
						["optic_NVS",nil,10],
						["optic_Arco",nil,10],
						["muzzle_snds_L",nil,10],
						["muzzle_snds_M",nil,10],
						["muzzle_snds_H",nil,10]
					]
				];
			};
		};
	};
	
	case "adac_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein ADAC"};
			case (__GETC__(life_mediclevel) < 2): {"Du kannst erst als ADAC hier Zugreifen !"}; 
			default {
				["ADAC Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ToolKit",nil,10],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles",nil,10],
						["Chemlight_red",nil,20],
						["Chemlight_yellow",nil,20],
						["Chemlight_green",nil,20],
						["Chemlight_blue",nil,20]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein MEDIC"};
			case (__GETC__(life_mediclevel) < 1): {"Du kannst erst als MEDIC hier Zugreifen !"}; 
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ToolKit",nil,10],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles",nil,10],
						["Chemlight_red",nil,20],
						["Chemlight_yellow",nil,20],
						["Chemlight_green",nil,20],
						["Chemlight_blue",nil,20]
					]
				];
			};
		};
	};
	
	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 2): {"Du bist noch kein Komissar !"};
			default
			{
				["Beamter Waffen Laden",
					[
                        ["arifle_sdar_F","Taser Sturmgewehr",7500],
						["20Rnd_556x45_UW_mag","556er Magazin",100],
						["hgun_Rook40_F","Taser-Pistole",5000],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000],
						["16Rnd_9x21_Mag","16er Magazin",100],
						["arifle_MXM_Black_F",nil,10000],
						["arifle_MX_Black_F",nil,10000],
						["arifle_MXC_Black_F",nil,10000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["muzzle_snds_H",nil,1000],
						["SMG_02_F",nil,7500],
						["30Rnd_9x21_Mag",nil,100],
						["muzzle_snds_L",nil,1000],
						["hgun_PDW2000_F",nil,7500],
						["30Rnd_9x21_Mag",nil,100],
						["muzzle_snds_L",nil,1000],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellYellow",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 3): {"Du bist noch kein Kommissar"};
			default
			{
				["Kommisar Waffen Shop",
					[
                        ["arifle_sdar_F","Taser Sturmgewehr",7500],
						["20Rnd_556x45_UW_mag","556er Magazin",100],
						["hgun_Rook40_F","Taser-Pistole",5000],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000],
						["16Rnd_9x21_Mag","16er Magazin",100],
						["arifle_MX_Black_F",nil,10000],
						["arifle_MXC_Black_F",nil,10000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["muzzle_snds_H",nil,1000],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellYellow",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
			};
		};
	};
	
	case "cop_kommisar":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 4): {"Du bist kein HauptKommissar"};
			default
			{
				["HauptKommisar Waffen Shop",
					[
                        ["arifle_sdar_F","Taser Sturmgewehr",7500],
						["20Rnd_556x45_UW_mag","556er Magazin",100],
						["hgun_Rook40_F","Taser-Pistole",5000],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000],
						["16Rnd_9x21_Mag","16er Magazin",100],
						["arifle_MXM_Black_F",nil,10000],
						["arifle_MX_Black_F",nil,10000],
						["arifle_MXC_Black_F",nil,10000],
						["arifle_MX_SW_Black_F",nil,10000],
						["100Rnd_65x39_caseless_mag",nil,100],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100],
						["30Rnd_65x39_caseless_mag",nil,100],
						["muzzle_snds_H",nil,1000],
						["srifle_EBR_F",nil,15000],
						["20Rnd_762x51_Mag",nil,100],
						["muzzle_snds_B",nil,1000],
						["srifle_DMR_03_F",nil,25000],
						["20Rnd_762x51_Mag",nil,1000],
						["muzzle_snds_B",nil,1000],
						["srifle_DMR_05_blk_F",nil,50000],
						["10Rnd_93x64_DMR_05_Mag",nil,100],
						["muzzle_snds_93mmg",nil,1000],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellYellow",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
			};
		};
	};	
	
	case "cop_sek":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 5): {"Du bist kein SEK-Beamter"};
			default
			{
				["SEK Waffen Shop",
					[
		                ["arifle_sdar_F","Taser Sturmgewehr",7500],
						["20Rnd_556x45_UW_mag","556er Magazin",100],
						["hgun_Rook40_F","Taser-Pistole",5000],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000],
						["16Rnd_9x21_Mag","16er Magazin",100],
						["arifle_MXM_Black_F",nil,10000],
						["arifle_MX_Black_F",nil,10000],
						["arifle_MXC_Black_F",nil,10000],
						["arifle_MX_SW_Black_F",nil,10000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["30Rnd_65x39_caseless_mag_Tracer",nil,100],
						["100Rnd_65x39_caseless_mag",nil,100],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100],
						["muzzle_snds_H",nil,1000],
						["srifle_EBR_F",nil,35000],
						["20Rnd_762x51_Mag",nil,500],
						["muzzle_snds_B",nil,1000],
						["srifle_DMR_05_blk_F",nil,50000],
						["10Rnd_93x64_DMR_05_Mag",nil,500],
						["muzzle_snds_93mmg",nil,1000],
						["srifle_DMR_03_F",nil,50000],
						["20Rnd_762x51_Mag",nil,100],
						["muzzle_snds_B",nil,1000],
						["srifle_DMR_02_F",nil,50000],
						["10Rnd_338_Mag",nil,500],
						["muzzle_snds_338_black",nil,1000],
						["srifle_GM6_F",nil,50000],
						["5Rnd_127x108_Mag",nil,100],
						["srifle_LRR_F",nil,50000],
						["7Rnd_408_Mag",nil,100],
						["LMG_Mk200_F",nil,10000],
						["200Rnd_65x39_cased_Box",nil,100],
						["MMG_02_black_F",nil,10000],
						["130Rnd_338_Mag",nil,100],
						["MMG_01_hex_F",nil,10000],
						["150Rnd_93x64_Mag",nil,100],
						["LMG_Zafir_F",nil,10000],
						["150Rnd_762x54_Box",nil,100],
						["150Rnd_762x54_Box_Tracer",nil,100],
						["SmokeShellBlue","CE-Gas",20000],
						["HandGrenade_Stone","Blendgranate",20000],
						["SmokeShellOrange",nil,10],
						["SmokeShellRed",nil,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellYellow",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
			};
		};
	};
	
	case "cop_gsg":
	{
		switch(true) do
		{
			case (playerSide !=west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) < 6): {"Du bist nicht bei der GSG9"};
			default
			{
				["GSG9 Waffen Shop",
					[
                        ["arifle_sdar_F","Taser Sturmgewehr",7500],
						["20Rnd_556x45_UW_mag","5.56er Magazin",100],
						["hgun_Rook40_F","Taser-Pistole",5000],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000],
						["16Rnd_9x21_Mag","16er Magazin",100],
						["arifle_MXM_Black_F",nil,10000],
						["arifle_MX_Black_F",nil,10000],
						["arifle_MXC_Black_F",nil,10000],
						["arifle_MX_SW_Black_F",nil,10000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["30Rnd_65x39_caseless_mag_Tracer",nil,100],
						["100Rnd_65x39_caseless_mag",nil,100],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100],
						["muzzle_snds_H",nil,1000],
						["srifle_EBR_F",nil,35000],
						["20Rnd_762x51_Mag",nil,500],
						["muzzle_snds_B",nil,1000],
					    ["srifle_DMR_05_blk_F",nil,50000],
						["10Rnd_93x64_DMR_05_Mag",nil,500],
						["muzzle_snds_93mmg",nil,1000],
						["srifle_DMR_03_F",nil,50000],
						["20Rnd_762x51_Mag",nil,100],
						["muzzle_snds_B",nil,1000],
						["srifle_DMR_02_F",nil,50000],
						["10Rnd_338_Mag",nil,500],
						["muzzle_snds_338_sand",nil,1000],
						["srifle_GM6_F",nil,50000],
						["srifle_GM6_camo_F",nil,50000],
						["5Rnd_127x108_Mag",nil,100],
						["5Rnd_127x108_APDS_Mag",nil,5000],
						["srifle_LRR_F",nil,50000],
						["7Rnd_408_Mag",nil,100],
						["LMG_Mk200_F",nil,10000],
						["200Rnd_65x39_cased_Box",nil,100],
						["MMG_02_black_F",nil,10000],
						["130Rnd_338_Mag",nil,100],
						["MMG_01_hex_F",nil,10000],
						["150Rnd_93x64_Mag",nil,100],
						["LMG_Zafir_F",nil,10000],
						["150Rnd_762x54_Box",nil,100],
						["150Rnd_762x54_Box_Tracer",nil,100],
						["SmokeShellBlue","CE-Gas",20000],
						["HandGrenade_Stone","Blendgranate",15000],
						["SmokeShellOrange",nil,10],
                        ["SmokeShellRed",nil,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellYellow",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_rebel): {"Du besitz keine Rebellen Lizenz!"};
			default
			{
				["Mohammed's Waffen Laden",
					[
						["SMG_01_F",nil,25000],
						["30Rnd_45ACP_Mag_SMG_01",nil,500],
						["muzzle_snds_acp",nil,5000],
						["SMG_02_F",nil,25000],
						["30Rnd_9x21_Mag",nil,500],
						["muzzle_snds_L",nil,5000],
						["arifle_Mk20_plain_F",nil,50000],
						["30Rnd_556x45_Stanag",nil,500],
					    ["muzzle_snds_M",nil,15000],
						["arifle_TRG21_F",nil,50000],
						["30Rnd_556x45_Stanag",nil,500],
						["muzzle_snds_M",nil,15000],
						["arifle_Katiba_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,500],
						["acc_pointer_IR",nil,15000],
						["arifle_MXM_F",nil,75000],
						["arifle_MX_F",nil,65000],
						["30Rnd_65x39_caseless_mag",nil,500],
						["muzzle_snds_H",nil,15000],
						["srifle_EBR_F",nil,175000],
						["20Rnd_762x51_Mag",nil,500],
						["muzzle_snds_B",nil,15000],
						["srifle_DMR_01_F",nil,175000],
						["10Rnd_762x54_Mag",nil,500],
						["muzzle_snds_B",nil,15000],
						["srifle_GM6_F",nil,1500000],
						["srifle_GM6_camo_F",nil,1500000],
						["5Rnd_127x108_Mag",nil,2500],
						["srifle_LRR_F",nil,1500000],
						["srifle_LRR_camo_F",nil,1500000],
						["7Rnd_408_Mag",nil,2500],
						["srifle_DMR_02_F",nil,400000],
						["10Rnd_338_Mag",nil,500],
						["muzzle_snds_338_black",nil,15000],
						["srifle_DMR_03_F",nil,400000],
						["20Rnd_762x51_Mag",nil,500],
						["muzzle_snds_B",nil,15000],
						["srifle_DMR_04_F",nil,400000],
						["10Rnd_127x54_Mag",nil,500],
						["srifle_DMR_05_blk_F",nil,450000],
						["srifle_DMR_05_hex_F",nil,450000],
						["10Rnd_93x64_DMR_05_Mag",nil,500],
						["muzzle_snds_93mmg",nil,15000],
						["bipod_01_F_snd",nil,7500],
						["bipod_03_F_oli",nil,7500],
						["bipod_02_F_hex",nil,7500],
						["bipod_03_F_blk",nil,7500],
						["acc_pointer_IR",nil,7500],
						["acc_flashlight",nil,7500],
						["optic_Arco",nil,7500],
						["optic_Hamr",nil,7500],
						["optic_Holosight",nil,7500],
						["optic_SOS",nil,7500],
						["optic_MRCO",nil,7500],
						["optic_NVS",nil,7500],
						["optic_DMS",nil,7500],
						["optic_LRPS",nil,7500],
						["optic_KHS_blk",nil,20000],
						["optic_KHS_hex",nil,20000],
						["optic_AMS",nil,20000],
						["SmokeShellRed",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellYellow",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Billy Joe's Firearms",
					[
                        ["hgun_P07_F",nil,7500],
                        ["16Rnd_9x21_Mag",nil,100],
						["30Rnd_9x21_Mag",nil,500],
						["muzzle_snds_L",nil,1000],
						["hgun_Pistol_heavy_02_F",nil,7500],
						["6Rnd_45ACP_Cylinder",nil,100],
						["SMG_01_F",nil,30000],
						["30Rnd_45ACP_Mag_SMG_01",nil,500],
						["muzzle_snds_acp",nil,5000],
						["SMG_02_F",nil,30000],
					    ["30Rnd_9x21_Mag",nil,500],
						["muzzle_snds_L",nil,5000],
						["hgun_PDW2000_F",nil,30000],
						["30Rnd_9x21_Mag",nil,500],
						["muzzle_snds_L",nil,5000],
						["optic_Hamr",nil,10000],
						["optic_Aco",nil,4500],
						["optic_Holosight",nil,7500],
						["acc_pointer_IR",nil,4500]
					]
				];
			};
		};
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator!"};
			case (__GETC__(life_donator) == 1):
			{
				["STS Donator Shop Rang 1",
					[
						["SMG_01_F",nil,5000],
						["30Rnd_45ACP_Mag_SMG_01",nil,500],
						["muzzle_snds_acp",nil,100],
						["SMG_02_F",nil,500],
						["30Rnd_9x21_Mag",nil,100],
						["muzzle_snds_L",nil,1000],
						["arifle_Mk20_plain_F",nil,10000],
						["30Rnd_556x45_Stanag",nil,100],
					    ["muzzle_snds_M",nil,3000],
						["arifle_TRG21_F",nil,10000],
						["30Rnd_556x45_Stanag",nil,100],
						["muzzle_snds_M",nil,3000],
						["arifle_Katiba_F",nil,10000],
						["30Rnd_65x39_caseless_green",nil,100],
						["acc_pointer_IR",nil,3000],
						["arifle_MXM_F",nil,15000],
						["arifle_MX_F",nil,13000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["muzzle_snds_H",nil,3000],
						["srifle_EBR_F",nil,35000],
						["20Rnd_762x51_Mag",nil,100],
						["muzzle_snds_B",nil,3000],
						["srifle_DMR_01_F",nil,35000],
						["10Rnd_762x54_Mag",nil,100],
						["muzzle_snds_B",nil,3000],
						["srifle_GM6_F",nil,300000],
						["srifle_GM6_camo_F",nil,300000],
						["5Rnd_127x108_Mag",nil,500],
						["srifle_LRR_F",nil,300000],
						["srifle_LRR_camo_F",nil,300000],
						["7Rnd_408_Mag",nil,500],
						["srifle_DMR_02_F",nil,80000],
						["10Rnd_338_Mag",nil,100],
						["muzzle_snds_338_black",nil,3000],
						["srifle_DMR_03_F",nil,80000],
						["20Rnd_762x51_Mag",nil,100],
						["muzzle_snds_B",nil,3000],
						["srifle_DMR_04_F",nil,80000],
						["10Rnd_127x54_Mag",nil,100],
						["srifle_DMR_05_blk_F",nil,90000],
						["srifle_DMR_05_hex_F",nil,90000],
						["10Rnd_93x64_DMR_05_Mag",nil,100],
						["muzzle_snds_93mmg",nil,3000],
						["bipod_01_F_snd",nil,1500],
						["bipod_03_F_oli",nil,1500],
						["bipod_02_F_hex",nil,1500],
						["bipod_03_F_blk",nil,1500],
						["acc_pointer_IR",nil,1500],
						["acc_flashlight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_Hamr",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_SOS",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_NVS",nil,1500],
						["optic_DMS",nil,1500],
						["optic_LRPS",nil,1500],
						["optic_KHS_blk",nil,4000],
						["optic_KHS_hex",nil,4000],
						["optic_AMS",nil,4000],
						["SmokeShellRed",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellYellow",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["STS Donator Shop Rang 2",
					[
						["SMG_01_F",nil,11250],
						["30Rnd_45ACP_Mag_SMG_01",nil,225],
						["muzzle_snds_acp",nil,2250],
						["SMG_02_F",nil,11250],
						["30Rnd_9x21_Mag",nil,225],
						["muzzle_snds_L",nil,2250],
						["arifle_Mk20_plain_F",nil,22500],
						["30Rnd_556x45_Stanag",nil,225],
					    ["muzzle_snds_M",nil,6750],
						["arifle_TRG21_F",nil,22500],
						["30Rnd_556x45_Stanag",nil,225],
						["muzzle_snds_M",nil,6750],
						["arifle_Katiba_F",nil,22500],
						["30Rnd_65x39_caseless_green",nil,225],
						["acc_pointer_IR",nil,6750],
						["arifle_MXM_F",nil,33750],
						["arifle_MX_F",nil,29250],
						["30Rnd_65x39_caseless_mag",nil,225],
						["muzzle_snds_H",nil,6750],
						["srifle_EBR_F",nil,78750],
						["20Rnd_762x51_Mag",nil,225],
						["muzzle_snds_B",nil,6750],
						["srifle_DMR_01_F",nil,78750],
						["10Rnd_762x54_Mag",nil,225],
						["muzzle_snds_B",nil,6750],
						["srifle_GM6_F",nil,675000],
						["srifle_GM6_camo_F",nil,675000],
						["5Rnd_127x108_Mag",nil,1125],
						["srifle_LRR_F",nil,675000],
						["srifle_LRR_camo_F",nil,675000],
						["7Rnd_408_Mag",nil,1125],
						["srifle_DMR_02_F",nil,180000],
						["10Rnd_338_Mag",nil,225],
						["muzzle_snds_338_black",nil,6750],
						["srifle_DMR_03_F",nil,180000],
						["20Rnd_762x51_Mag",nil,225],
						["muzzle_snds_B",nil,6750],
						["srifle_DMR_04_F",nil,180000],
						["10Rnd_127x54_Mag",nil,225],
						["srifle_DMR_05_blk_F",nil,202500],
						["srifle_DMR_05_hex_F",nil,202500],
						["10Rnd_93x64_DMR_05_Mag",nil,225],
						["muzzle_snds_93mmg",nil,6750],
						["bipod_01_F_snd",nil,3375],
						["bipod_03_F_oli",nil,3375],
						["bipod_02_F_hex",nil,3375],
						["bipod_03_F_blk",nil,3375],
						["acc_pointer_IR",nil,3375],
						["acc_flashlight",nil,3375],
						["optic_Arco",nil,3375],
						["optic_Hamr",nil,3375],
						["optic_Holosight",nil,3375],
						["optic_SOS",nil,3375],
						["optic_MRCO",nil,3375],
						["optic_NVS",nil,3375],
						["optic_DMS",nil,3375],
						["optic_LRPS",nil,3375],
						["optic_KHS_blk",nil,9000],
						["optic_KHS_hex",nil,9000],
						["optic_AMS",nil,9000],
						["SmokeShellRed",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellYellow",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
			};

			case (__GETC__(life_donator) == 3):
			{
				["Söldner Waffen Händler",
					[
						["SMG_01_F",nil,15000],
						["30Rnd_45ACP_Mag_SMG_01",nil,300],
						["muzzle_snds_acp",nil,3000],
						["SMG_02_F",nil,15000],
						["30Rnd_9x21_Mag",nil,300],
						["muzzle_snds_L",nil,3000],
						["arifle_Mk20_plain_F",nil,30000],
						["30Rnd_556x45_Stanag",nil,500],
					    ["muzzle_snds_M",nil,9000],
						["arifle_TRG21_F",nil,30000],
						["30Rnd_556x45_Stanag",nil,300],
						["muzzle_snds_M",nil,9000],
						["arifle_Katiba_F",nil,30000],
						["30Rnd_65x39_caseless_green",nil,300],
						["acc_pointer_IR",nil,9000],
						["arifle_MXM_F",nil,45000],
						["arifle_MX_F",nil,39000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["muzzle_snds_H",nil,9000],
						["srifle_EBR_F",nil,105000],
						["20Rnd_762x51_Mag",nil,300],
						["muzzle_snds_B",nil,9000],
						["srifle_DMR_01_F",nil,105000],
						["10Rnd_762x54_Mag",nil,300],
						["muzzle_snds_B",nil,9000],
						["srifle_GM6_F",nil,900000],
						["srifle_GM6_camo_F",nil,900000],
						["5Rnd_127x108_Mag",nil,1500],
						["srifle_LRR_F",nil,900000],
						["srifle_LRR_camo_F",nil,900000],
						["7Rnd_408_Mag",nil,1500],
						["srifle_DMR_02_F",nil,240000],
						["10Rnd_338_Mag",nil,300],
						["muzzle_snds_338_black",nil,9000],
						["srifle_DMR_03_F",nil,240000],
						["20Rnd_762x51_Mag",nil,300],
						["muzzle_snds_B",nil,9000],
						["srifle_DMR_04_F",nil,240000],
						["10Rnd_127x54_Mag",nil,300],
						["srifle_DMR_05_blk_F",nil,270000],
						["srifle_DMR_05_hex_F",nil,270000],
						["10Rnd_93x64_DMR_05_Mag",nil,300],
						["muzzle_snds_93mmg",nil,9000],
						["bipod_01_F_snd",nil,4500],
						["bipod_03_F_oli",nil,4500],
						["bipod_02_F_hex",nil,4500],
						["bipod_03_F_blk",nil,4500],
						["acc_pointer_IR",nil,4500],
						["acc_flashlight",nil,4500],
						["optic_Arco",nil,4500],
						["optic_Hamr",nil,4500],
						["optic_Holosight",nil,4500],
						["optic_SOS",nil,4500],
						["optic_MRCO",nil,4500],
						["optic_NVS",nil,4500],
						["optic_DMS",nil,4500],
						["optic_LRPS",nil,4500],
						["optic_KHS_blk",nil,12000],
						["optic_KHS_hex",nil,12000],
						["optic_AMS",nil,12000],
						["SmokeShellRed",nil,10],
						["SmokeShellOrange",nil,10],
						["SmokeShellGreen",nil,10],
						["SmokeShellYellow",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
		    };
		};
	};
	
	case "genstore":
	{
		["Altis Elektro-Händler",
			[
				["Binocular",nil,150],
				["Rangefinder",nil,2500],
				["ItemGPS",nil,100],
				["ItemMap",nil,50],
				["ItemCompass",nil,50],
				["ItemWatch",nil,50],
				["ToolKit",nil,25000],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,1500],
				["NVGoggles_OPFOR",nil,1500],
				["NVGoggles_INDEP",nil,1500],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};

	case "uranium":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Du bist kein Zivilist"};
            case (!license_civ_uranium): {"Du benötigst eine Uran-Lizenz"};
            default
            {
                ["Uran Verkäufer",
                    [
                        ["ToolKit",nil,25000],
                        ["FirstAidKit",nil,100],
                        ["U_I_HeliPilotCoveralls","Anti-Strahlungs Anzug",50000]
                    ]
                ];
            };
        };
    }; 
};
