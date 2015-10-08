/*
	File: fn_wantedRemove.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes a person from the wanted list.
*/
private["_uid","_index"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {}; //Bad data

_index = [_uid,bambusfarm_wanted_list] call TON_fnc_index;
if(_index == -1) exitWith {};
bambusfarm_wanted_list set[_index,-1];
bambusfarm_wanted_list = bambusfarm_wanted_list - [-1];