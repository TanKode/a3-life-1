/*
Author: H4SHK3KS
File: fn_syncGear.sqf
Description: calles the function to save the cop gear
*/
_manuelSync = [_this,0,"0",["0"]] call BIS_fnc_param; // By Nukefliege
if(isNil "life_copGearSaved") then {life_copGearSaved = false;};
if(life_copGearSaved && _manuelSync == "0") exitWith {hint localize "STR_Session_SyncdAlready";}; // By Nukefliege

if(life_copGearSaved) exitWith {hint "Sie koennen ihr Gear nur alle 30 sec speichern!"};

//[2] call SOCK_fnc_updatePartial;
[7] call SOCK_fnc_updatePartial;
hint "Gear gespeichert! Sie spawnen jetzt jedes mal mit diesem Gear bis Sie erneut speichern!";

if(_manuelSync == "0") then {
	[] spawn
	{
		life_copGearSaved = true;
		sleep 30;
		life_copGearSaved = false;
	};
};