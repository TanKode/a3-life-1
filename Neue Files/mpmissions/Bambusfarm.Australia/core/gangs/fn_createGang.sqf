#include <macro.h>
/*
	File: fn_createGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Functionality meant for creating gangs.
*/
private["_value","_len","_group"];
_value = ctrlText 2522;
_len = [_value] call KRON_StrLen;

if(_len > 25) exitWith {hint "Der Name ist zu lang. Er darf maximal 25 Zeichen lang sein."};
if(CASH < 10000) exitWith {hint "Sie haben nicht die nötigen $10,000!"};
if(isNil {life_gang_list}) exitWith {hint "Server not authorized for feature."};
if(([_value,life_gang_list] call TON_fnc_index) != -1) exitWith {hint "Es gibt bereits eine Gang mit diesem Namen!"};

_group = createGroup civilian;

//Set Array
life_gang_list pushBack [_value,_group,false,str(player),getPlayerUID player];
publicVariable "life_gang_list";
[player] joinSilent _group;
player setRank "COLONEL";
life_my_gang = _group;
if(!isNull life_my_gang) then
{
	CASH = CASH - 10000;
	closeDialog 0;
	createDialog "Life_My_Gang_Diag";
	publicVariable "life_gang_list";
};