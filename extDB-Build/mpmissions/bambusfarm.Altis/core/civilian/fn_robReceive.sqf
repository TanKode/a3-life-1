/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash == 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD + _cash;
titleText[format[localize "STR_Civ_Robbed",[_cash] call bambusfarm_fnc_numberText],"PLAIN"];