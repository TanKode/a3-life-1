#include <macro.h>
/*
	File: fn_lockGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks the gang
*/
private["_gang","_index","_name","_group","_owner","_ownerID"];
_index = [life_my_gang,life_gang_list] call TON_fnc_index;
if(_index == -1) exitWith {};
_gang = SEL(life_gang_list,_index);
_name = SEL(_gang,0);
_group = SEL(_gang,1);
_owner = SEL(_gang,3);
_ownerID = SEL(_gang,4);

switch (true) do
{
	case (player == leader(group player)) :
	{
		life_gang_list set[_index,[_name,_group,true,_owner,_ownerID]];
		publicVariable "life_gang_list";

		ctrlShow[2622,false];
		ctrlShow[2623,true];
	};
	
	case (getPlayerUID player == _ownerID) :
	{
		life_gang_list set [_index,[_name,_group,true,_owner,_ownerID]];
		publicVariable "life_gang_list";

		ctrlShow[2622,false];
		ctrlShow[2623,true];
	};
};

[false] spawn life_fnc_gangManagement;
