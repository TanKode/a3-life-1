/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lights up the house.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if(isNull (_house getVariable ["lightSource",ObjNull])) then {
	[[_house,true],"bambusfarm_fnc_lightHouse",true,false] spawn bambusfarm_fnc_MP;
} else {
	[[_house,false],"bambusfarm_fnc_lightHouse",true,false] spawn bambusfarm_fnc_MP;
};