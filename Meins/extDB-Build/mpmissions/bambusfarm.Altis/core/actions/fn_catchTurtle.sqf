/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/
private["_obj"];
_obj = cursorTarget;
if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!

if(life_skillFischen < 249) exitWith {hint format ["Um Schildkröten sammeln zu können, benötigst du 250 Punkte in der Fischkunst. (derzeit: %1/250)", life_skillFischen];};


if(([true,"turtle",1] call life_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
	life_skillFischen = life_skillFischen + 1;
};