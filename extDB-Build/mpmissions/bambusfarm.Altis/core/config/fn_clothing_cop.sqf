#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(__GETC__(bambusfarm_coplevel) < 3) then
		{
			_ret set[count _ret,["U_Rangemaster","Rekrut/Streife",0]];
		};
		if(__GETC__(bambusfarm_coplevel) >= 5) then
		{
			_ret set[count _ret,["U_B_SpecopsUniform_sgg","Hauptkommisar",0]];
		};
		if(__GETC__(bambusfarm_coplevel) >= 7) then
		{
			_ret set[count _ret,["U_B_SpecopsUniform_sgg","Polizeikleidung",0]];
			_ret set[count _ret,["U_B_CombatUniform_mcam_vest","FBI",0]];
			_ret set[count _ret,["U_B_CombatUniform_mcam_worn","DEA",0]];
		};
	};

	//Hats
	case 1:
	{
		_ret set[count _ret,["H_Beret_blk_POLICE",nil,50 * DonatorBuyChange]];
	};

	//Glasses
	case 2:
	{
		if(__GETC__(bambusfarm_coplevel) > 4) then
		{
			_ret set[count _ret,["G_Aviator",nil,100 * DonatorBuyChange]];
		};
	};

	//Vest
	case 3:
	{
		_ret set[count _ret,["V_TacVest_blk_POLICE",nil,1500 * DonatorBuyChange]];
	};

	//Backpacks
	case 4:
	{
		_ret set[count _ret,["B_Carryall_cbr",nil,500 * DonatorBuyChange]];
	};
};

_ret;