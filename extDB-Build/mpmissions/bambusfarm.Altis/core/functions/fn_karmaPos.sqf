/*
	File: fn_life_KSys.sqf
	Author: Distrikt41 - Dscha

	Description:
	Karma is a bitch...
*/
private["_Mod"];

_Mod = _this select 0;

if(playerSide != civilian) exitWith {};
life_Karma = life_Karma + _Mod;