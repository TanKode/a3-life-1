/*
	File: fn_wantedPardon.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unwants / pardons a person from the wanted list.
*/
private["_uid"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {};

_index = [_uid,bambusfarm_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	bambusfarm_wanted_list set[_index,-1];
	bambusfarm_wanted_list = bambusfarm_wanted_list - [-1];
	//publicVariable "bambusfarm_wanted_list";
};