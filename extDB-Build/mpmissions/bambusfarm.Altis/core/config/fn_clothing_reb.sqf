/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,5000 * DonatorBuyChange],
			["U_I_G_Story_Protagonist_F",nil,7500 * DonatorBuyChange],
			["U_I_G_resistanceLeader_F",nil,11500 * DonatorBuyChange],
			["U_O_SpecopsUniform_ocamo",nil,17500 * DonatorBuyChange],
			["U_O_PilotCoveralls",nil,15610 * DonatorBuyChange],
			["U_IG_leader","Guerilla Leader",15340 * DonatorBuyChange]
		];
	};
	
	//HatsU_B_CombatUniform_mcam_vest
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,850 * DonatorBuyChange],
			["H_Shemag_olive",nil,850 * DonatorBuyChange],
			["H_ShemagOpen_khk",nil,800 * DonatorBuyChange],
			["H_HelmetO_ocamo",nil,2500 * DonatorBuyChange],
			["H_MilCap_oucamo",nil,1200 * DonatorBuyChange],
			["H_Bandanna_camo",nil,650 * DonatorBuyChange]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25 * DonatorBuyChange],
			["G_Shades_Blue",nil,20 * DonatorBuyChange],
			["G_Sport_Blackred",nil,20 * DonatorBuyChange],
			["G_Sport_Checkered",nil,20 * DonatorBuyChange],
			["G_Sport_Blackyellow",nil,20 * DonatorBuyChange],
			["G_Sport_BlackWhite",nil,20 * DonatorBuyChange],
			["G_Squares",nil,10 * DonatorBuyChange],
			["G_Lowprofile",nil,30 * DonatorBuyChange],
			["G_Combat",nil,55 * DonatorBuyChange]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_khk",nil,12500 * DonatorBuyChange],
			["V_BandollierB_cbr",nil,4500 * DonatorBuyChange],
			["V_HarnessO_brn",nil,7500 * DonatorBuyChange]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500 * DonatorBuyChange],
			["B_Kitbag_mcamo",nil,4500 * DonatorBuyChange],
			["B_TacticalPack_oli",nil,3500 * DonatorBuyChange],
			["B_FieldPack_ocamo",nil,3000 * DonatorBuyChange],
			["B_Bergen_sgg",nil,4500 * DonatorBuyChange],
			["B_Kitbag_cbr",nil,4500 * DonatorBuyChange],
			["B_Carryall_oli",nil,5000 * DonatorBuyChange]
		];
	};
};