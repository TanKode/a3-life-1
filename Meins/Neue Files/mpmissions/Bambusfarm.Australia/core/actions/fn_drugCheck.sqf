/*
	File: fn_drunkenCheck.sqf
	Author: PierreAmyf
	
	Description:
	Checks if Civ used Drug.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hint "Drogen Test...";

if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Kann Person nicht testen."};
if(!(_unit getVariable "dazed")) exitWith {hint "Drogen Test Negativ"};
if((_unit getVariable "dazed")) exitWith {hint "Drogen Test Positiv"};