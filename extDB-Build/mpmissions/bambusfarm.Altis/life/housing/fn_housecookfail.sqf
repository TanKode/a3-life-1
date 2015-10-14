/* 
----------------------------------------------|
Author: Backer
Description: If Cook is fail, CREATE SOME FUCKING SMOKE!
----------------------------------------------|
*/
private["_house","_uid","_housePos","_houseName"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

_smoke = "SmokeShellRed" createVehicle position player;
_smoke attachTo [_house, [0,10,0]];

_smoke2 = "SmokeShellRed" createVehicle position player;
_smoke2 attachTo [_house, [5,5,5]];

_smoke3 = "SmokeShellRed" createVehicle position player;
_smoke3 attachTo [_house, [0,0,0]];