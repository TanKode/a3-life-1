/*
	File: fn_bambusfarm_KSys.sqf
	Author: Distrikt41 - Dscha

	Description:
	Karma is a bitch...
*/
private["_Mod"];

_Mod = _this select 0;

if(playerSide != civilian) exitWith {};
bambusfarm_Karma = bambusfarm_Karma + _Mod;