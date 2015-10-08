#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private["_group"];
bambusfarm_action_gangInUse = nil;

if(bambusfarm_BANK < (__GETC__(bambusfarm_gangPrice))) exitWith {
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(bambusfarm_gangPrice))-bambusfarm_BANK)] call bambusfarm_fnc_numberText];
	{(group player) setVariable[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

__SUB__(bambusfarm_BANK,(__GETC__(bambusfarm_gangPrice)));

hint format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(__GETC__(bambusfarm_gangPrice))] call bambusfarm_fnc_numberText];