/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the robbing process?
*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(_target getVariable["restrained",false]) exitWith {};

if(_target getVariable["robbed",false]) exitWith {};
[[player],"bambusfarm_fnc_robPerson",_target,false] spawn bambusfarm_fnc_MP;
_target setVariable["robbed",TRUE,TRUE];