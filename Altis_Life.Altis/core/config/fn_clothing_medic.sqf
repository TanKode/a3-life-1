#include <macro.h>
/*
	File: fn_clothing_medic.sqf
	Author: TheTotenkopf
	Description:
	Configfile for the Medic Store
*/

private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

//Shop Title Name
ctrlSetText[3103,"Arzt Bekleidungsshop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret = 
		[
			["U_C_WorkerCoveralls","Artztuniform",500],
			["U_B_HeliPilotCoveralls","ADAC Uniform",500]
		];
	};
	
	//Hats
	case 1:
	{		
		if(__GETC__(life_mediclevel) > 4) then
		{
			_ret set[count _ret,["H_Beret_02",nil,1500]];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30]
		];
	};
	
	//Vest
	case 3:
	{		
		if(__GETC__(life_mediclevel) > 4) then
		{
			_ret pushBack ["V_PlateCarrier1_blk","Chef-Weste",2000];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_sgg","MEDIC-Backpack",250],
			["B_Kitbag_cbr","ADAC-Backpack",250]
		];
	};
};

_ret;