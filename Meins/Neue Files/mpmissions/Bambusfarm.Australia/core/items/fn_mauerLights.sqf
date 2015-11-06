#include <macro.h>
/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_mauer"];
_mauer = cursorTarget;
_side = [(_this select 3),1,0,[0]] call BIS_fnc_param;;
if(isNil "_mauer") exitWith {}; //Bad entry!

if(_mauer GVAR "lightsOn") then {
	_mauer SVAR ["lightsOn",FALSE,TRUE];
	[[_mauer,0,_side],"life_fnc_adaclicht",true,false] call life_fnc_MP;
} else {
	_mauer SVAR ["lightsOn",TRUE,TRUE];
	_mauer SVAR ["lights",false,true];
};