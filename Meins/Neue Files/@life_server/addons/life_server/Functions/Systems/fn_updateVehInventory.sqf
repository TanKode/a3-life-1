/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the storage for a house blah blah
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_plate = [];
_uid = [];
_cargo = [];

if(isNull _vehicle) exitWith {};
_vInfo = _vehicle getVariable["dbInfo",[]];
_trunk = _vehicle getVariable["Trunk",[[],0]];
//_trunk = [_trunk] call DB_fnc_mresArray;

if(count _vInfo > 0) then {
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

//Save vehicle inventory

_vehItems = getItemCargo _vehicle;
_vehMags = getMagazineCargo _vehicle;
_vehWeapons = getWeaponCargo _vehicle;
_vehBackpacks = getBackpackCargo _vehicle;

_cargo pushBack _vehItems;
_cargo pushBack _vehMags;
_cargo pushBack _vehWeapons;
_cargo pushBack _vehBackpacks;

["diag_log",[
		"------------- Vehicle Trunk Query Request -------------",
		format["Cargo: %1",_cargo],
		"-------------------------------------------------"
]] call TON_fnc_logIt;

//if(isNil {_uid}) exitWith {};
//_query = format["UPDATE vehicles SET trunk='%1' WHERE pid='%2' AND plate='%3' AND side='%3'",_trunk,_cargo,_uid,_plate];
_query = format["UpdateVehicleInventory:%1:%2:%3:%4",_trunk,_cargo,_uid,_plate];
waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

["diag_log",[
		"------------- Vehicle Trunk Query Request -------------",
		format["QUERY: %1",_query],
		"-------------------------------------------------"
]] call TON_fnc_logIt;