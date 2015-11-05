/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the robbing process?
*/
private["_target"];
_target = _this select 0;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(_target getVariable["rob_handy",false]) exitWith {};

if("ItemRadio" in assignedItems _target) then {
	_target setVariable ["rob_handy", true, true];
	_target removeweapon "ItemRadio";
	hint "Ein Smartphone ist auf den Boden gefallen";
	_defenceplace1 = "Item_ItemRadio" createVehicle (player modelToWorld[0,0,0]);
} else { hint "Die Person hat kein Smartphone!"; };