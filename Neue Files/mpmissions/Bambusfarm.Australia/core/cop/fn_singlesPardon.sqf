/*
	File: fn_pardon.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pardons the selected player.
*/
private["_display","_list","_uid"];
disableSerialization;
if(playerside != west) exitWith {};

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2402,(lbCurSel 2402)];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};

_data = [_data,"STR_Crime_",""] call KRON_Replace;

_uid = _data select 0;
[[_uid],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;