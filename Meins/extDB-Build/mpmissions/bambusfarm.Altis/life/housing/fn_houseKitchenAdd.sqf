/* 
----------------------------------------------|
Author: Backer
Description: Place the Kitchen into a House and call DB query!
----------------------------------------------|
*/

private["_house","_uid","_housePos","_houseName"];
_house = nearestBuilding (getPosATL player);
_uid = getPlayerUID player;
_housePos = getPos _house;
_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};

if(_house getVariable["Kitchen",false]) exitWith {hint "Sie haben bereits eine Drogenkueche im Haus";};

if(([false,"kitchen",1] call life_fnc_handleInv)) then {
_house setVariable["Kitchen",true,true];
hint "Sie haben erfolgreich eine Drogenküche ins Haus gebaut";
closeDialog 0;


[[_uid,_house],"TON_fnc_housekitchen",false,false] spawn life_fnc_MP;

};