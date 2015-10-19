/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
if((side player == west) && (side _unit == west)) exitWith {}; //WEST-WEST nono
if((side player == civilian) && !license_civ_rebel) exitWith {}; //no rebel license => nono
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

player say3D "handcuffs";

_unit setVariable["restrained",true,true];
[[player], "life_fnc_restrainCiv", _unit, false] spawn life_fnc_MP;
[[0,"STR_NOTF_Restrained2",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;