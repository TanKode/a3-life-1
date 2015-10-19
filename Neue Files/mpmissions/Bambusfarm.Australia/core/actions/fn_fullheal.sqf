#include <macro.h>
/*
FullHeal
*/
_type = [_this,3,0] call BIS_fnc_param;

if(EQUAL(_type,"self")) then
{
	if((damage player) < 0.01) exitWith {};
	if(!("Medikit" in (items player))) exitWith {};
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 5;
	player setDamage 0.00; 
} else
{
	if((damage cursorTarget) < 0.01) exitWith {};
	if(!("Medikit" in (items player))) exitWith {};
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 5;
	cursorTarget setDamage 0.00; 
;}