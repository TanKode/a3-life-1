/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_C_Poloshirt_blue","Abibas mit weiﬂer Hose",250 * DonatorBuyChange],
		["U_C_Poloshirt_burgundy","Abibas mit Totenkopf",275 * DonatorBuyChange],
		["U_C_Poloshirt_redwhite","Hello Kitty",150 * DonatorBuyChange],
		["U_C_Poloshirt_salmon","ThirtySeven Werber",175 * DonatorBuyChange],
		["U_C_Poloshirt_stripped","My Pony",125 * DonatorBuyChange],
		["U_B_CombatUniform_mcam_vest","ThirtySeven Werber 2",200 * DonatorBuyChange],
		["U_C_Poloshirt_tricolour","Pumba Shirt",350 * DonatorBuyChange],
		["U_C_Commoner1_3","Like ThirtySeven",400 * DonatorBuyChange],
		["U_C_Poor_2","Rag tagged clothes",250 * DonatorBuyChange],
		["U_IG_Guerilla2_2","Green stripped shirt & Pants",650 * DonatorBuyChange],
		["U_IG_Guerilla3_1","Brown Jacket & Pants",700 * DonatorBuyChange],
		["U_IG_Guerilla2_3","The Outback Rangler",800 * DonatorBuyChange],
		["U_C_HunterBody_grn","The Hunters Look",950 * DonatorBuyChange],
		["U_C_WorkerCoveralls","Mechanic Coveralls",1035 * DonatorBuyChange],
		["U_C_Scientist","Mechanic Coveralls White",1250 * DonatorBuyChange],
		["U_OrestesBody","Surfing On Land",600 * DonatorBuyChange],
		["U_NikosAgedBody","Business",750 * DonatorBuyChange],
        ["U_NikosBody","Dragon",500 * DonatorBuyChange],
        ["U_C_Journalist","Journalist",650 * DonatorBuyChange],
        ["U_Competitor","ION",450 * DonatorBuyChange]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Bandanna_camo","Camo Bandanna",120 * DonatorBuyChange],
			["H_Bandanna_surfer","Surfer Bandanna",130 * DonatorBuyChange],
			["H_Bandanna_gry","Grey Bandanna",150 * DonatorBuyChange],
			["H_Bandanna_cbr",nil,165 * DonatorBuyChange],
			["H_Bandanna_surfer",nil,135 * DonatorBuyChange],
			["H_Bandanna_khk","Khaki Bandanna",145 * DonatorBuyChange],
			["H_Bandanna_sgg","Sage Bandanna",160 * DonatorBuyChange],
			["H_StrawHat","Straw Fedora",225 * DonatorBuyChange],
			["H_BandMask_blk","Hat & Bandanna",300 * DonatorBuyChange],
			["H_Booniehat_tan",nil,425 * DonatorBuyChange],
			["H_Hat_blue",nil,310 * DonatorBuyChange],
			["H_Hat_brown",nil,276 * DonatorBuyChange],
			["H_Hat_checker",nil,340 * DonatorBuyChange],
			["H_Hat_grey",nil,280 * DonatorBuyChange],
			["H_Hat_tan",nil,265 * DonatorBuyChange],
			["H_Cap_blu",nil,150 * DonatorBuyChange],
			["H_Cap_grn",nil,150 * DonatorBuyChange],
			["H_Cap_grn_BI",nil,150 * DonatorBuyChange],
			["H_Cap_oli",nil,150 * DonatorBuyChange],
			["H_Cap_red",nil,150 * DonatorBuyChange],
			["H_Cap_tan",nil,150 * DonatorBuyChange]
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
			["G_Aviator",nil,100 * DonatorBuyChange],
			["G_Lowprofile",nil,30 * DonatorBuyChange],
			["G_Combat",nil,55 * DonatorBuyChange]
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,250 * DonatorBuyChange],
			["B_Kitbag_mcamo",nil,450 * DonatorBuyChange],
			["B_TacticalPack_oli",nil,350 * DonatorBuyChange],
			["B_FieldPack_ocamo",nil,300 * DonatorBuyChange],
			["B_Bergen_sgg",nil,450 * DonatorBuyChange],
			["B_Kitbag_cbr",nil,450 * DonatorBuyChange],
			["B_Carryall_oli",nil,500 * DonatorBuyChange]
		];
	};
};