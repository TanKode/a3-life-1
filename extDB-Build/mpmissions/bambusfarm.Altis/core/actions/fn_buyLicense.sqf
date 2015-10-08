/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call bambusfarm_fnc_licensePrice;
_license = [_type,0] call bambusfarm_fnc_licenseType;

if(bambusfarm_TASCHENGELD < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call bambusfarm_fnc_numberText,_license select 1];};

bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD - _price;
titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call bambusfarm_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];