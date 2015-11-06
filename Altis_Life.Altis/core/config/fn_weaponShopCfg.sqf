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
						["Rangefinder",nil,3500* DonatorBuyChange],
						["hgun_Rook40_F","Taser-Pistole",5000* DonatorBuyChange],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000* DonatorBuyChange],
						["16Rnd_9x21_Mag","16er Magazin",10* DonatorBuyChange],
						["arifle_sdar_F","Taser Sturmgewehr",7500* DonatorBuyChange],
						["20Rnd_556x45_UW_mag","556er Magazin",100* DonatorBuyChange],
                        ["SMG_02_F",nil,7500* DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_L",nil,1000* DonatorBuyChange],
						["SmokeShellOrange",nil,10* DonatorBuyChange],
						["SmokeShellRed",nil,10* DonatorBuyChange],
						["SmokeShellGreen",nil,10* DonatorBuyChange],
						["SmokeShellYellow",nil,10* DonatorBuyChange],
						["SmokeShellPurple",nil,10* DonatorBuyChange]
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
						["ItemMap",nil,10* DonatorBuyChange],
						["ItemWatch",nil,10* DonatorBuyChange],
						["ItemCompass",nil,10* DonatorBuyChange],
						["ItemGPS",nil,10* DonatorBuyChange],
						["ToolKit",nil,10* DonatorBuyChange],
						["Medikit",nil,10* DonatorBuyChange],
						["NVGoggles_OPFOR",nil,10* DonatorBuyChange],
						["Chemlight_red",nil,10* DonatorBuyChange],
						["Chemlight_yellow",nil,10* DonatorBuyChange],
						["Chemlight_green",nil,10* DonatorBuyChange],
						["Chemlight_blue",nil,10* DonatorBuyChange],
						["acc_flashlight",nil,10* DonatorBuyChange],
						["acc_pointer_IR",nil,10* DonatorBuyChange],
						["bipod_03_F_blk",nil,7500* DonatorBuyChange],
						["B_UavTerminal",nil,10* DonatorBuyChange],
						["Rangefinder",nil,10* DonatorBuyChange],
						["optic_Holosight",nil,10* DonatorBuyChange],
						["optic_ACO_smg",nil,10* DonatorBuyChange],
						["optic_MRCO",nil,10* DonatorBuyChange],
						["optic_LRPS",nil,10* DonatorBuyChange],
						["optic_DMS",nil,10* DonatorBuyChange],
						["optic_NVS",nil,10* DonatorBuyChange],
						["optic_Arco",nil,10* DonatorBuyChange],
						["muzzle_snds_L",nil,10* DonatorBuyChange],
						["muzzle_snds_M",nil,10* DonatorBuyChange],
						["muzzle_snds_H",nil,10* DonatorBuyChange]
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
						["ItemGPS",nil,10* DonatorBuyChange],
						["Binocular",nil,10* DonatorBuyChange],
						["ToolKit",nil,10* DonatorBuyChange],
						["FirstAidKit",nil,10* DonatorBuyChange],
						["Medikit",nil,10* DonatorBuyChange],
						["NVGoggles",nil,10* DonatorBuyChange],
						["Chemlight_red",nil,20* DonatorBuyChange],
						["Chemlight_yellow",nil,20* DonatorBuyChange],
						["Chemlight_green",nil,20* DonatorBuyChange],
						["Chemlight_blue",nil,20* DonatorBuyChange]
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
						["ItemGPS",nil,10* DonatorBuyChange],
						["Binocular",nil,10* DonatorBuyChange],
						["ToolKit",nil,10* DonatorBuyChange],
						["FirstAidKit",nil,10* DonatorBuyChange],
						["Medikit",nil,10* DonatorBuyChange],
						["NVGoggles",nil,10* DonatorBuyChange],
						["Chemlight_red",nil,20* DonatorBuyChange],
						["Chemlight_yellow",nil,20* DonatorBuyChange],
						["Chemlight_green",nil,20* DonatorBuyChange],
						["Chemlight_blue",nil,20* DonatorBuyChange]
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
                        ["arifle_sdar_F","Taser Sturmgewehr",7500* DonatorBuyChange],
						["20Rnd_556x45_UW_mag","556er Magazin",100* DonatorBuyChange],
						["hgun_Rook40_F","Taser-Pistole",5000* DonatorBuyChange],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000* DonatorBuyChange],
						["16Rnd_9x21_Mag","16er Magazin",100* DonatorBuyChange],
						["arifle_MXM_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MX_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MXC_Black_F",nil,10000* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag",nil,100* DonatorBuyChange],
						["muzzle_snds_H",nil,1000* DonatorBuyChange],
						["SMG_02_F",nil,7500* DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_L",nil,1000* DonatorBuyChange],
						["hgun_PDW2000_F",nil,7500* DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_L",nil,1000* DonatorBuyChange],
						["SmokeShellOrange",nil,10* DonatorBuyChange],
						["SmokeShellRed",nil,10* DonatorBuyChange],
						["SmokeShellGreen",nil,10* DonatorBuyChange],
						["SmokeShellYellow",nil,10* DonatorBuyChange],
						["SmokeShellPurple",nil,10* DonatorBuyChange]
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
                        ["arifle_sdar_F","Taser Sturmgewehr",7500* DonatorBuyChange],
						["20Rnd_556x45_UW_mag","556er Magazin",100* DonatorBuyChange],
						["hgun_Rook40_F","Taser-Pistole",5000* DonatorBuyChange],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000* DonatorBuyChange],
						["16Rnd_9x21_Mag","16er Magazin",100* DonatorBuyChange],
						["arifle_MX_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MXC_Black_F",nil,10000* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag",nil,100* DonatorBuyChange],
						["muzzle_snds_H",nil,1000* DonatorBuyChange],
						["SmokeShellOrange",nil,10* DonatorBuyChange],
						["SmokeShellRed",nil,10* DonatorBuyChange],
						["SmokeShellGreen",nil,10* DonatorBuyChange],
						["SmokeShellYellow",nil,10* DonatorBuyChange],
						["SmokeShellPurple",nil,10* DonatorBuyChange]
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
                        ["arifle_sdar_F","Taser Sturmgewehr",7500* DonatorBuyChange],
						["20Rnd_556x45_UW_mag","556er Magazin",100* DonatorBuyChange],
						["hgun_Rook40_F","Taser-Pistole",5000* DonatorBuyChange],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000* DonatorBuyChange],
						["16Rnd_9x21_Mag","16er Magazin",100* DonatorBuyChange],
						["arifle_MXM_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MX_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MXC_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MX_SW_Black_F",nil,10000* DonatorBuyChange],
						["100Rnd_65x39_caseless_mag",nil,100* DonatorBuyChange],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag",nil,100* DonatorBuyChange],
						["muzzle_snds_H",nil,1000* DonatorBuyChange],
						["srifle_EBR_F",nil,15000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_B",nil,1000* DonatorBuyChange],
						["srifle_DMR_03_F",nil,25000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,1000* DonatorBuyChange],
						["muzzle_snds_B",nil,1000* DonatorBuyChange],
						["srifle_DMR_05_blk_F",nil,50000* DonatorBuyChange],
						["10Rnd_93x64_DMR_05_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_93mmg",nil,1000* DonatorBuyChange],
						["SmokeShellOrange",nil,10* DonatorBuyChange],
						["SmokeShellRed",nil,10* DonatorBuyChange],
						["SmokeShellGreen",nil,10* DonatorBuyChange],
						["SmokeShellYellow",nil,10* DonatorBuyChange],
						["SmokeShellPurple",nil,10* DonatorBuyChange]
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
		                ["arifle_sdar_F","Taser Sturmgewehr",7500* DonatorBuyChange],
						["20Rnd_556x45_UW_mag","556er Magazin",100* DonatorBuyChange],
						["hgun_Rook40_F","Taser-Pistole",5000* DonatorBuyChange],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000* DonatorBuyChange],
						["16Rnd_9x21_Mag","16er Magazin",100* DonatorBuyChange],
						["arifle_MXM_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MX_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MXC_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MX_SW_Black_F",nil,10000* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag",nil,100* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag_Tracer",nil,100* DonatorBuyChange],
						["100Rnd_65x39_caseless_mag",nil,100* DonatorBuyChange],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100* DonatorBuyChange],
						["muzzle_snds_H",nil,1000* DonatorBuyChange],
						["srifle_EBR_F",nil,35000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_B",nil,1000* DonatorBuyChange],
						["srifle_DMR_05_blk_F",nil,50000* DonatorBuyChange],
						["10Rnd_93x64_DMR_05_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_93mmg",nil,1000* DonatorBuyChange],
						["srifle_DMR_03_F",nil,50000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_B",nil,1000* DonatorBuyChange],
						["srifle_DMR_02_F",nil,50000* DonatorBuyChange],
						["10Rnd_338_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_338_black",nil,1000* DonatorBuyChange],
						["srifle_GM6_F",nil,50000* DonatorBuyChange],
						["5Rnd_127x108_Mag",nil,100* DonatorBuyChange],
						["srifle_LRR_F",nil,50000* DonatorBuyChange],
						["7Rnd_408_Mag",nil,100* DonatorBuyChange],
						["LMG_Mk200_F",nil,10000* DonatorBuyChange],
						["200Rnd_65x39_cased_Box",nil,100* DonatorBuyChange],
						["MMG_02_black_F",nil,10000* DonatorBuyChange],
						["130Rnd_338_Mag",nil,100* DonatorBuyChange],
						["MMG_01_hex_F",nil,10000* DonatorBuyChange],
						["150Rnd_93x64_Mag",nil,100* DonatorBuyChange],
						["LMG_Zafir_F",nil,10000* DonatorBuyChange],
						["150Rnd_762x54_Box",nil,100* DonatorBuyChange],
						["150Rnd_762x54_Box_Tracer",nil,100* DonatorBuyChange],
						["SmokeShellBlue","CE-Gas",20000* DonatorBuyChange],
						["HandGrenade_Stone","Blendgranate",20000* DonatorBuyChange],
						["SmokeShellOrange",nil,10* DonatorBuyChange],
						["SmokeShellRed",nil,10* DonatorBuyChange],
						["SmokeShellGreen",nil,10* DonatorBuyChange],
						["SmokeShellYellow",nil,10* DonatorBuyChange],
						["SmokeShellPurple",nil,10* DonatorBuyChange]
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
                        ["arifle_sdar_F","Taser Sturmgewehr",7500* DonatorBuyChange],
						["20Rnd_556x45_UW_mag","5.56er Magazin",100* DonatorBuyChange],
						["hgun_Rook40_F","Taser-Pistole",5000* DonatorBuyChange],
						["hgun_Rook40_snds_F","Taser-Pistole Silenced",5000* DonatorBuyChange],
						["16Rnd_9x21_Mag","16er Magazin",100* DonatorBuyChange],
						["arifle_MXM_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MX_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MXC_Black_F",nil,10000* DonatorBuyChange],
						["arifle_MX_SW_Black_F",nil,10000* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag",nil,100* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag_Tracer",nil,100* DonatorBuyChange],
						["100Rnd_65x39_caseless_mag",nil,100* DonatorBuyChange],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100* DonatorBuyChange],
						["muzzle_snds_H",nil,1000* DonatorBuyChange],
						["srifle_EBR_F",nil,35000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_B",nil,1000* DonatorBuyChange],
					    ["srifle_DMR_05_blk_F",nil,50000* DonatorBuyChange],
						["10Rnd_93x64_DMR_05_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_93mmg",nil,1000* DonatorBuyChange],
						["srifle_DMR_03_F",nil,50000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_B",nil,1000* DonatorBuyChange],
						["srifle_DMR_02_F",nil,50000* DonatorBuyChange],
						["10Rnd_338_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_338_sand",nil,1000* DonatorBuyChange],
						["srifle_GM6_F",nil,50000* DonatorBuyChange],
						["srifle_GM6_camo_F",nil,50000* DonatorBuyChange],
						["5Rnd_127x108_Mag",nil,100* DonatorBuyChange],
						["5Rnd_127x108_APDS_Mag",nil,5000* DonatorBuyChange],
						["srifle_LRR_F",nil,50000* DonatorBuyChange],
						["7Rnd_408_Mag",nil,100* DonatorBuyChange],
						["LMG_Mk200_F",nil,10000* DonatorBuyChange],
						["200Rnd_65x39_cased_Box",nil,100* DonatorBuyChange],
						["MMG_02_black_F",nil,10000* DonatorBuyChange],
						["130Rnd_338_Mag",nil,100* DonatorBuyChange],
						["MMG_01_hex_F",nil,10000* DonatorBuyChange],
						["150Rnd_93x64_Mag",nil,100* DonatorBuyChange],
						["LMG_Zafir_F",nil,10000* DonatorBuyChange],
						["150Rnd_762x54_Box",nil,100* DonatorBuyChange],
						["150Rnd_762x54_Box_Tracer",nil,100* DonatorBuyChange],
						["SmokeShellBlue","CE-Gas",20000* DonatorBuyChange],
						["HandGrenade_Stone","Blendgranate",15000* DonatorBuyChange],
						["SmokeShellOrange",nil,10* DonatorBuyChange],
                        ["SmokeShellRed",nil,10* DonatorBuyChange],
						["SmokeShellGreen",nil,10* DonatorBuyChange],
						["SmokeShellYellow",nil,10* DonatorBuyChange],
						["SmokeShellPurple",nil,10* DonatorBuyChange]
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
						["SMG_01_F",nil,25000* DonatorBuyChange],
						["30Rnd_45ACP_Mag_SMG_01",nil,500* DonatorBuyChange],
						["muzzle_snds_acp",nil,5000* DonatorBuyChange],
						["SMG_02_F",nil,25000* DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_L",nil,5000* DonatorBuyChange],
						["arifle_Mk20_plain_F",nil,50000* DonatorBuyChange],
						["30Rnd_556x45_Stanag",nil,500* DonatorBuyChange],
					    ["muzzle_snds_M",nil,15000* DonatorBuyChange],
						["arifle_TRG21_F",nil,50000* DonatorBuyChange],
						["30Rnd_556x45_Stanag",nil,500* DonatorBuyChange],
						["muzzle_snds_M",nil,15000* DonatorBuyChange],
						["arifle_Katiba_F",nil,50000* DonatorBuyChange],
						["30Rnd_65x39_caseless_green",nil,500* DonatorBuyChange],
						["acc_pointer_IR",nil,15000* DonatorBuyChange],
						["arifle_MXM_F",nil,75000* DonatorBuyChange],
						["arifle_MX_F",nil,65000* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag",nil,500* DonatorBuyChange],
						["muzzle_snds_H",nil,15000* DonatorBuyChange],
						["srifle_EBR_F",nil,175000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_B",nil,15000* DonatorBuyChange],
						["srifle_DMR_01_F",nil,175000* DonatorBuyChange],
						["10Rnd_762x54_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_B",nil,15000* DonatorBuyChange],
						["srifle_GM6_F",nil,1500000* DonatorBuyChange],
						["srifle_GM6_camo_F",nil,1500000* DonatorBuyChange],
						["5Rnd_127x108_Mag",nil,2500* DonatorBuyChange],
						["srifle_LRR_F",nil,1500000* DonatorBuyChange],
						["srifle_LRR_camo_F",nil,1500000* DonatorBuyChange],
						["7Rnd_408_Mag",nil,2500* DonatorBuyChange],
						["srifle_DMR_02_F",nil,400000* DonatorBuyChange],
						["10Rnd_338_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_338_black",nil,15000* DonatorBuyChange],
						["srifle_DMR_03_F",nil,400000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_B",nil,15000* DonatorBuyChange],
						["srifle_DMR_04_F",nil,400000* DonatorBuyChange],
						["10Rnd_127x54_Mag",nil,500* DonatorBuyChange],
						["srifle_DMR_05_blk_F",nil,450000* DonatorBuyChange],
						["srifle_DMR_05_hex_F",nil,450000* DonatorBuyChange],
						["10Rnd_93x64_DMR_05_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_93mmg",nil,15000* DonatorBuyChange],
						["bipod_01_F_snd",nil,7500* DonatorBuyChange],
						["bipod_03_F_oli",nil,7500* DonatorBuyChange],
						["bipod_02_F_hex",nil,7500* DonatorBuyChange],
						["bipod_03_F_blk",nil,7500* DonatorBuyChange],
						["acc_pointer_IR",nil,7500* DonatorBuyChange],
						["acc_flashlight",nil,7500* DonatorBuyChange],
						["optic_Arco",nil,7500* DonatorBuyChange],
						["optic_Hamr",nil,7500* DonatorBuyChange],
						["optic_Holosight",nil,7500* DonatorBuyChange],
						["optic_SOS",nil,7500* DonatorBuyChange],
						["optic_MRCO",nil,7500* DonatorBuyChange],
						["optic_NVS",nil,7500* DonatorBuyChange],
						["optic_DMS",nil,7500* DonatorBuyChange],
						["optic_LRPS",nil,7500* DonatorBuyChange],
						["optic_KHS_blk",nil,20000* DonatorBuyChange],
						["optic_KHS_hex",nil,20000* DonatorBuyChange],
						["optic_AMS",nil,20000* DonatorBuyChange],
						["SmokeShellRed",nil,10* DonatorBuyChange],
						["SmokeShellOrange",nil,10* DonatorBuyChange],
						["SmokeShellGreen",nil,10* DonatorBuyChange],
						["SmokeShellYellow",nil,10* DonatorBuyChange],
						["SmokeShellPurple",nil,10* DonatorBuyChange]
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
                        ["hgun_P07_F",nil,7500* DonatorBuyChange],
                        ["16Rnd_9x21_Mag",nil,100* DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_L",nil,1000* DonatorBuyChange],
						["hgun_Pistol_heavy_02_F",nil,7500* DonatorBuyChange],
						["6Rnd_45ACP_Cylinder",nil,100* DonatorBuyChange],
						["SMG_01_F",nil,30000* DonatorBuyChange],
						["30Rnd_45ACP_Mag_SMG_01",nil,500* DonatorBuyChange],
						["muzzle_snds_acp",nil,5000* DonatorBuyChange],
						["SMG_02_F",nil,30000* DonatorBuyChange],
					    ["30Rnd_9x21_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_L",nil,5000* DonatorBuyChange],
						["hgun_PDW2000_F",nil,30000* DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,500* DonatorBuyChange],
						["muzzle_snds_L",nil,5000* DonatorBuyChange],
						["optic_Hamr",nil,10000* DonatorBuyChange],
						["optic_Aco",nil,4500* DonatorBuyChange],
						["optic_Holosight",nil,7500* DonatorBuyChange],
						["acc_pointer_IR",nil,4500* DonatorBuyChange]
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
						["SMG_01_F",nil,5000* DonatorBuyChange],
						["30Rnd_45ACP_Mag_SMG_01",nil,500* DonatorBuyChange],
						["muzzle_snds_acp",nil,100* DonatorBuyChange],
						["SMG_02_F",nil,500* DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_L",nil,1000* DonatorBuyChange],
						["arifle_Mk20_plain_F",nil,10000* DonatorBuyChange],
						["30Rnd_556x45_Stanag",nil,100* DonatorBuyChange],
					    ["muzzle_snds_M",nil,3000* DonatorBuyChange],
						["arifle_TRG21_F",nil,10000* DonatorBuyChange],
						["30Rnd_556x45_Stanag",nil,100* DonatorBuyChange],
						["muzzle_snds_M",nil,3000* DonatorBuyChange],
						["arifle_Katiba_F",nil,10000* DonatorBuyChange],
						["30Rnd_65x39_caseless_green",nil,100* DonatorBuyChange],
						["acc_pointer_IR",nil,3000* DonatorBuyChange],
						["arifle_MXM_F",nil,15000* DonatorBuyChange],
						["arifle_MX_F",nil,13000* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag",nil,100* DonatorBuyChange],
						["muzzle_snds_H",nil,3000* DonatorBuyChange],
						["srifle_EBR_F",nil,35000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_B",nil,3000* DonatorBuyChange],
						["srifle_DMR_01_F",nil,35000* DonatorBuyChange],
						["10Rnd_762x54_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_B",nil,3000* DonatorBuyChange],
						["srifle_GM6_F",nil,300000* DonatorBuyChange],
						["srifle_GM6_camo_F",nil,300000* DonatorBuyChange],
						["5Rnd_127x108_Mag",nil,500* DonatorBuyChange],
						["srifle_LRR_F",nil,300000* DonatorBuyChange],
						["srifle_LRR_camo_F",nil,300000* DonatorBuyChange],
						["7Rnd_408_Mag",nil,500* DonatorBuyChange],
						["srifle_DMR_02_F",nil,80000* DonatorBuyChange],
						["10Rnd_338_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_338_black",nil,3000* DonatorBuyChange],
						["srifle_DMR_03_F",nil,80000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_B",nil,3000* DonatorBuyChange],
						["srifle_DMR_04_F",nil,80000* DonatorBuyChange],
						["10Rnd_127x54_Mag",nil,100* DonatorBuyChange],
						["srifle_DMR_05_blk_F",nil,90000* DonatorBuyChange],
						["srifle_DMR_05_hex_F",nil,90000* DonatorBuyChange],
						["10Rnd_93x64_DMR_05_Mag",nil,100* DonatorBuyChange],
						["muzzle_snds_93mmg",nil,3000* DonatorBuyChange],
						["bipod_01_F_snd",nil,1500* DonatorBuyChange],
						["bipod_03_F_oli",nil,1500* DonatorBuyChange],
						["bipod_02_F_hex",nil,1500* DonatorBuyChange],
						["bipod_03_F_blk",nil,1500* DonatorBuyChange],
						["acc_pointer_IR",nil,1500* DonatorBuyChange],
						["acc_flashlight",nil,1500* DonatorBuyChange],
						["optic_Arco",nil,1500* DonatorBuyChange],
						["optic_Hamr",nil,1500* DonatorBuyChange],
						["optic_Holosight",nil,1500* DonatorBuyChange],
						["optic_SOS",nil,1500* DonatorBuyChange],
						["optic_MRCO",nil,1500* DonatorBuyChange],
						["optic_NVS",nil,1500* DonatorBuyChange],
						["optic_DMS",nil,1500* DonatorBuyChange],
						["optic_LRPS",nil,1500* DonatorBuyChange],
						["optic_KHS_blk",nil,4000* DonatorBuyChange],
						["optic_KHS_hex",nil,4000* DonatorBuyChange],
						["optic_AMS",nil,4000* DonatorBuyChange],
						["SmokeShellRed",nil,10* DonatorBuyChange],
						["SmokeShellOrange",nil,10* DonatorBuyChange],
						["SmokeShellGreen",nil,10* DonatorBuyChange],
						["SmokeShellYellow",nil,10* DonatorBuyChange],
						["SmokeShellPurple",nil,10* DonatorBuyChange]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["STS Donator Shop Rang 2",
					[
						["SMG_01_F",nil,11250* DonatorBuyChange],
						["30Rnd_45ACP_Mag_SMG_01",nil,225* DonatorBuyChange],
						["muzzle_snds_acp",nil,2250* DonatorBuyChange],
						["SMG_02_F",nil,11250* DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,225* DonatorBuyChange],
						["muzzle_snds_L",nil,2250* DonatorBuyChange],
						["arifle_Mk20_plain_F",nil,22500* DonatorBuyChange],
						["30Rnd_556x45_Stanag",nil,225* DonatorBuyChange],
					    ["muzzle_snds_M",nil,6750* DonatorBuyChange],
						["arifle_TRG21_F",nil,22500* DonatorBuyChange],
						["30Rnd_556x45_Stanag",nil,225* DonatorBuyChange],
						["muzzle_snds_M",nil,6750* DonatorBuyChange],
						["arifle_Katiba_F",nil,22500* DonatorBuyChange],
						["30Rnd_65x39_caseless_green",nil,225* DonatorBuyChange],
						["acc_pointer_IR",nil,6750* DonatorBuyChange],
						["arifle_MXM_F",nil,33750* DonatorBuyChange],
						["arifle_MX_F",nil,29250* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag",nil,225* DonatorBuyChange],
						["muzzle_snds_H",nil,6750* DonatorBuyChange],
						["srifle_EBR_F",nil,78750* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,225* DonatorBuyChange],
						["muzzle_snds_B",nil,6750* DonatorBuyChange],
						["srifle_DMR_01_F",nil,78750* DonatorBuyChange],
						["10Rnd_762x54_Mag",nil,225* DonatorBuyChange],
						["muzzle_snds_B",nil,6750* DonatorBuyChange],
						["srifle_GM6_F",nil,675000* DonatorBuyChange],
						["srifle_GM6_camo_F",nil,675000* DonatorBuyChange],
						["5Rnd_127x108_Mag",nil,1125* DonatorBuyChange],
						["srifle_LRR_F",nil,675000* DonatorBuyChange],
						["srifle_LRR_camo_F",nil,675000* DonatorBuyChange],
						["7Rnd_408_Mag",nil,1125* DonatorBuyChange],
						["srifle_DMR_02_F",nil,180000* DonatorBuyChange],
						["10Rnd_338_Mag",nil,225* DonatorBuyChange],
						["muzzle_snds_338_black",nil,6750* DonatorBuyChange],
						["srifle_DMR_03_F",nil,180000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,225* DonatorBuyChange],
						["muzzle_snds_B",nil,6750* DonatorBuyChange],
						["srifle_DMR_04_F",nil,180000* DonatorBuyChange],
						["10Rnd_127x54_Mag",nil,225* DonatorBuyChange],
						["srifle_DMR_05_blk_F",nil,202500* DonatorBuyChange],
						["srifle_DMR_05_hex_F",nil,202500* DonatorBuyChange],
						["10Rnd_93x64_DMR_05_Mag",nil,225* DonatorBuyChange],
						["muzzle_snds_93mmg",nil,6750* DonatorBuyChange],
						["bipod_01_F_snd",nil,3375* DonatorBuyChange],
						["bipod_03_F_oli",nil,3375* DonatorBuyChange],
						["bipod_02_F_hex",nil,3375* DonatorBuyChange],
						["bipod_03_F_blk",nil,3375* DonatorBuyChange],
						["acc_pointer_IR",nil,3375* DonatorBuyChange],
						["acc_flashlight",nil,3375* DonatorBuyChange],
						["optic_Arco",nil,3375* DonatorBuyChange],
						["optic_Hamr",nil,3375* DonatorBuyChange],
						["optic_Holosight",nil,3375* DonatorBuyChange],
						["optic_SOS",nil,3375* DonatorBuyChange],
						["optic_MRCO",nil,3375* DonatorBuyChange],
						["optic_NVS",nil,3375* DonatorBuyChange],
						["optic_DMS",nil,3375* DonatorBuyChange],
						["optic_LRPS",nil,3375* DonatorBuyChange],
						["optic_KHS_blk",nil,9000* DonatorBuyChange],
						["optic_KHS_hex",nil,9000* DonatorBuyChange],
						["optic_AMS",nil,9000* DonatorBuyChange],
						["SmokeShellRed",nil,10* DonatorBuyChange],
						["SmokeShellOrange",nil,10* DonatorBuyChange],
						["SmokeShellGreen",nil,10* DonatorBuyChange],
						["SmokeShellYellow",nil,10* DonatorBuyChange],
						["SmokeShellPurple",nil,10* DonatorBuyChange]
					]
				];
			};

			case (__GETC__(life_donator) == 3):
			{
				["Söldner Waffen Händler",
					[
						["SMG_01_F",nil,15000* DonatorBuyChange],
						["30Rnd_45ACP_Mag_SMG_01",nil,300* DonatorBuyChange],
						["muzzle_snds_acp",nil,3000* DonatorBuyChange],
						["SMG_02_F",nil,15000* DonatorBuyChange],
						["30Rnd_9x21_Mag",nil,300* DonatorBuyChange],
						["muzzle_snds_L",nil,3000* DonatorBuyChange],
						["arifle_Mk20_plain_F",nil,30000* DonatorBuyChange],
						["30Rnd_556x45_Stanag",nil,500* DonatorBuyChange],
					    ["muzzle_snds_M",nil,9000* DonatorBuyChange],
						["arifle_TRG21_F",nil,30000* DonatorBuyChange],
						["30Rnd_556x45_Stanag",nil,300* DonatorBuyChange],
						["muzzle_snds_M",nil,9000* DonatorBuyChange],
						["arifle_Katiba_F",nil,30000* DonatorBuyChange],
						["30Rnd_65x39_caseless_green",nil,300* DonatorBuyChange],
						["acc_pointer_IR",nil,9000* DonatorBuyChange],
						["arifle_MXM_F",nil,45000* DonatorBuyChange],
						["arifle_MX_F",nil,39000* DonatorBuyChange],
						["30Rnd_65x39_caseless_mag",nil,300* DonatorBuyChange],
						["muzzle_snds_H",nil,9000* DonatorBuyChange],
						["srifle_EBR_F",nil,105000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,300* DonatorBuyChange],
						["muzzle_snds_B",nil,9000* DonatorBuyChange],
						["srifle_DMR_01_F",nil,105000* DonatorBuyChange],
						["10Rnd_762x54_Mag",nil,300* DonatorBuyChange],
						["muzzle_snds_B",nil,9000* DonatorBuyChange],
						["srifle_GM6_F",nil,900000* DonatorBuyChange],
						["srifle_GM6_camo_F",nil,900000* DonatorBuyChange],
						["5Rnd_127x108_Mag",nil,1500* DonatorBuyChange],
						["srifle_LRR_F",nil,900000* DonatorBuyChange],
						["srifle_LRR_camo_F",nil,900000* DonatorBuyChange],
						["7Rnd_408_Mag",nil,1500* DonatorBuyChange],
						["srifle_DMR_02_F",nil,240000* DonatorBuyChange],
						["10Rnd_338_Mag",nil,300* DonatorBuyChange],
						["muzzle_snds_338_black",nil,9000* DonatorBuyChange],
						["srifle_DMR_03_F",nil,240000* DonatorBuyChange],
						["20Rnd_762x51_Mag",nil,300* DonatorBuyChange],
						["muzzle_snds_B",nil,9000* DonatorBuyChange],
						["srifle_DMR_04_F",nil,240000* DonatorBuyChange],
						["10Rnd_127x54_Mag",nil,300* DonatorBuyChange],
						["srifle_DMR_05_blk_F",nil,270000* DonatorBuyChange],
						["srifle_DMR_05_hex_F",nil,270000* DonatorBuyChange],
						["10Rnd_93x64_DMR_05_Mag",nil,300* DonatorBuyChange],
						["muzzle_snds_93mmg",nil,9000* DonatorBuyChange],
						["bipod_01_F_snd",nil,4500* DonatorBuyChange],
						["bipod_03_F_oli",nil,4500* DonatorBuyChange],
						["bipod_02_F_hex",nil,4500* DonatorBuyChange],
						["bipod_03_F_blk",nil,4500* DonatorBuyChange],
						["acc_pointer_IR",nil,4500* DonatorBuyChange],
						["acc_flashlight",nil,4500* DonatorBuyChange],
						["optic_Arco",nil,4500* DonatorBuyChange],
						["optic_Hamr",nil,4500* DonatorBuyChange],
						["optic_Holosight",nil,4500* DonatorBuyChange],
						["optic_SOS",nil,4500* DonatorBuyChange],
						["optic_MRCO",nil,4500* DonatorBuyChange],
						["optic_NVS",nil,4500* DonatorBuyChange],
						["optic_DMS",nil,4500* DonatorBuyChange],
						["optic_LRPS",nil,4500* DonatorBuyChange],
						["optic_KHS_blk",nil,12000* DonatorBuyChange],
						["optic_KHS_hex",nil,12000* DonatorBuyChange],
						["optic_AMS",nil,12000* DonatorBuyChange],
						["SmokeShellRed",nil,10* DonatorBuyChange],
						["SmokeShellOrange",nil,10* DonatorBuyChange],
						["SmokeShellGreen",nil,10* DonatorBuyChange],
						["SmokeShellYellow",nil,10* DonatorBuyChange],
						["SmokeShellPurple",nil,10* DonatorBuyChange]
					]
				];
		    };
		};
	};
	
	case "genstore":
	{
		["Altis Elektro-Händler",
			[
				["Binocular",nil,150* DonatorBuyChange],
				["Rangefinder",nil,2500* DonatorBuyChange],
				["ItemGPS",nil,100* DonatorBuyChange],
				["ItemMap",nil,50* DonatorBuyChange],
				["ItemCompass",nil,50* DonatorBuyChange],
				["ItemWatch",nil,50* DonatorBuyChange],
				["ToolKit",nil,25000* DonatorBuyChange],
				["FirstAidKit",nil,150* DonatorBuyChange],
				["NVGoggles",nil,1500* DonatorBuyChange],
				["NVGoggles_OPFOR",nil,1500* DonatorBuyChange],
				["NVGoggles_INDEP",nil,1500* DonatorBuyChange],
				["Chemlight_red",nil,300* DonatorBuyChange],
				["Chemlight_yellow",nil,300* DonatorBuyChange],
				["Chemlight_green",nil,300* DonatorBuyChange],
				["Chemlight_blue",nil,300* DonatorBuyChange]
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
                        ["ToolKit",nil,25000* DonatorBuyChange],
                        ["FirstAidKit",nil,100* DonatorBuyChange],
                        ["U_I_HeliPilotCoveralls","Anti-Strahlungs Anzug",50000* DonatorBuyChange]
                    ]
                ];
            };
        };
    }; 
};
