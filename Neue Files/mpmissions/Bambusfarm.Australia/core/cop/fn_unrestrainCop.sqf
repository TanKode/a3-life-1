/*
	File: fn_unrestrainCop.sqf
*/
private["_unit"];
_unit = player;
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];

//player say3D "handcuffs";

[[0,"STR_NOTF_UnrestrainCop",true,[profileName]],"life_fnc_broadcast",west,FALSE] call life_fnc_MP;