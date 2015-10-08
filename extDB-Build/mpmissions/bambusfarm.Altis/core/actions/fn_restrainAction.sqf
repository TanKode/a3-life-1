/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

if(bambusfarm_inv_handcuffs < 1) then
{
    hint "Du hast keine Handfesseln";
} else {
    bambusfarm_inv_handcuffs = bambusfarm_inv_handcuffs - 1;
    _unit say3D "handcuffs";
    _unit setVariable["restrained",true,true];
    hint "Du hast deinem Ziel Handfesseln angelegt";
    [[player], "bambusfarm_fnc_restrain", _unit, false] spawn bambusfarm_fnc_MP;
    [[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]],"bambusfarm_fnc_broadcast",west,false] spawn bambusfarm_fnc_MP;
};