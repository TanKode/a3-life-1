#include <macro.h>
/*
	File: fn_gangManagement.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for the gang 'management' menu.
*/
private["_sleep","_group","_gang","_owner","_ownerID","_units","_dialog","_members"];
disableSerialization;

_sleep = [_this,0,false,[false]] call BIS_fnc_param;
if(_sleep) then { sleep 1;};

_group = life_my_gang;
if(isNull _group) exitWith {closeDialog 0;};
_gang = [_group,life_gang_list] call TON_fnc_index;
_gang = SEL(life_gang_list,_gang);
_owner = call compile format["%1",SEL(_gang,3)];
_ownerID = SEL(_gang,4);
_units = units (group player);
waitUntil {!isNull (findDisplay 2620)};
_dialog = findDisplay 2620;
_members = _dialog displayCtrl 2621;

lbClear _members;

switch (true) do
{
	case (player == leader(group player)) :
	{
		if((SEL(_gang,2))) then
		{
			ctrlShow[2622,false];
			ctrlShow[2623,true];
		}
			else
		{
			ctrlShow[2622,true];
			ctrlShow[2623,false];
		};
	};
	
	case ((getPlayerUID player) == _ownerID) :
	{
		if((SEL(_gang,2))) then
		{
			ctrlShow[2622,false];
			ctrlShow[2623,true];
		}
			else
		{
			ctrlShow[2622,true];
			ctrlShow[2623,false];
		};
	};
	
	default
	{
		ctrlShow[2622,false];
		ctrlShow[2623,false];
		ctrlShow[2624,false];
		ctrlShow[2625,false];
	};
};

ctrlSetText[601,(SEL(_gang,0))];

for "_i" from 0 to (count _units)-1 do
{
	switch (true) do
	{
		case ((SEL(_units,_i)) == leader(group player)) :
		{
			_members lbAdd format["%1 [Leader]",name (SEL(_units,_i))];
		};
		
		case ((getPlayerUID (SEL(_units,_i)) == _ownerID)) :
		{
			_members lbAdd format["%1 [Gründer]", name (SEL(_units,_i))];
		};
		
		default 
		{
			_members lbAdd format["%1",name (SEL(_units,_i))];
		};
	};
	
	_members lbSetData [(lbSize _members)-1,str(SEL(_units,_i))];
};