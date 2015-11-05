#include <macro.h>
/*
	File: fn_joinGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Joins the selected gang if it is open.
*/
private["_dialog","_sel","_gangs","_gang","_group","_locked"];
disableSerialization;

_dialog = findDisplay 2520;
_gangs = _dialog displayCtrl 2521;
_sel = lbCurSel _gangs;
_data = _gangs lbData _sel;

_index = [_data,life_gang_list] call TON_fnc_index;
if(_index == -1) exitWith {hint "Konnte Gang nicht finden."};
_gang = SEL(life_gang_list,_index);
_group = SEL(_gang,1);
_locked = SEL(_gang,2);

if(!isNull _group) then
{
	if(!_locked) then
	{
		[player] join _group;
		life_my_gang = _group;
		hint format["Sie sind der Gang beigetreten: %1",SEL(_gang,0)];
		
		closeDialog 0;
	}
		else
	{
		hint "Diese Gang ist im Augenblick gesperrt. Du kannst nicht beitreten.";
	};
}
	else
{
	hint "Gang is not valid";
};