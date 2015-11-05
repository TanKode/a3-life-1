/*
	Author: Matthias Bun
	
	Description:
	Updates the Invetory .
*/
private["_container","_containerID","_containers","_query","_arr","_weapons","_magazines","_items","_backpacks"];
_container = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {systemChat "container null";};
_containerID = _container getVariable["obj_id",-1];
if(_containerID == -1) exitWith {systemChat "Object id invalid";};

_weapons = getWeaponCargo _container;
_magazines = getMagazineCargo _container;
_items = getItemCargo _container;
_backpacks = getBackpackCargo _container;

_arr = [];

_arr pushBack _weapons;
_arr pushBack _magazines;
_arr pushBack _items;
_arr pushBack _backpacks;

//_arr = [_arr] call DB_fnc_mresArray;
//_query = format["UPDATE object SET inventory='%1' WHERE id='%2'",_arr,_containerID];
_query = format["UpdateObject:%1:%2",_arr,_containerID];
waitUntil{!DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;
