/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(EQUAL(_type,"")) exitWith {-1};

M_CONFIG(getNumber,"Licenses",_type,"displayName");