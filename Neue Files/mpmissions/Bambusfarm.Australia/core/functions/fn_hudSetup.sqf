#include <macro.h>
/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setups the hud for the player?
*/
private["_alpha","_version","_p","_pg"];
disableSerialization;
_alpha = CONTROL(46,1001);
_version = CONTROL(46,1000);

2 cutRsc ["playerHUD","PLAIN"];
_version ctrlSetText format["BETA: 0.%1.%2",(productVersion select 2),(productVersion select 3)];
[] call life_fnc_hudUpdate;

[] spawn
{
	private["_dam","_gbbCash","_gbbBank"];
	while {true} do
	{
		_gbbLevel = LEVEL;
		_gbbExp = EXP;
		_gbbSkillPoint = SKILLPOINT;
		_dam = damage player;
		_gbbCash = CASH;
		_gbbBank = BANK;
		waitUntil {((damage player) != _dam) || (CASH != _gbbCash) || (BANK != _gbbBank) || (LEVEL != _gbbLevel) || (EXP != _gbbExp) || (SKILLPOINT != _gbbSkillPoint)};
		[] call life_fnc_hudUpdate;
	};
};