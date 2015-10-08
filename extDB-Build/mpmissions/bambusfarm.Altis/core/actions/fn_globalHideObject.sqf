*
	File: fn_globalHideObject.sqf
*/
private["_obj","_bool"];
_obj = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_bool = [_this,1,false,[false]] call BIS_fnc_param;
if(isNull _obj) exitWith {};

_obj hideObject _bool;