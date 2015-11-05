/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches an id?
*/
private "_unit";
_unit = lbData[1500,lbCurSel (1500)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

[[_unit,player],"TON_fnc_getID",false,false] call life_fnc_MP;