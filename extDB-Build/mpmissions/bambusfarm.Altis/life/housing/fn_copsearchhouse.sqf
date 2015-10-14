/* 
----------------------------------------------|
Author: Backer
Description: Search in House for Kitchen and Remove it if True
----------------------------------------------|
*/

_house = nearestBuilding (getPosATL player);
_uid = (_house getVariable "house_owner") select 0;

if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};
if(_house getVariable["Kitchen",false]) then
	{
		_house setVariable["Kitchen",false,true];
		hint "Dieses Haus hat eine Drogenküche eingebaut und Sie haben diese erfolgreich entfernt";
		closeDialog 0;
		[[_uid,_house],"TON_fnc_housekitchencop",false,false] spawn life_fnc_MP;
	} else {
	hint "In diesem Haus gibt es keine illegalen verbauten Gegenstände";
	};
	