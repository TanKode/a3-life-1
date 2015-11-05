/*
	File: fn_drunkenCheck.sqf
	Author: LAW and ORDER LAW
	
	Description:
	Checks if Civ is drunkend.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hint "Promille Test...";

if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Kann Person nicht testen."};
if(!(_unit getVariable "drunken")) exitWith {hint "Alkoholgehalt 0,0 Promille"};
if((_unit getVariable "drunken")) exitWith {hint "Alkoholgehalt 2,3 Promille"};