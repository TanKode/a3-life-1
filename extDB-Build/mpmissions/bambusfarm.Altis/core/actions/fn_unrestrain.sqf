/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

if(bambusfarm_inv_handcuffs > 0) then
{
    bambusfarm_inv_handcuffs = bambusfarm_inv_handcuffs + 1;
} else {
    [true,"handcuffs",1] call bambusfarm_fnc_handleInv;
};


_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;

[[0,"STR_NOTF_Unrestrain",true,[_unit getVariable["realname",name _unit], profileName]],"bambusfarm_fnc_broadcast",west,FALSE] call bambusfarm_fnc_MP;