/*
	File: fn_clothing_ems.sqf
	Author: Hungry?

	Description:
	Uniform Shop für EMS
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"EMS Uniform Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_I_HeliPilotCoveralls","Rettungsdienst Uniform",850 * DonatorBuyChange]
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
			["B_Carryall_cbr",nil,500 * DonatorBuyChange]
		];
	};
};