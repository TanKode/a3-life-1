/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Stores the vehicle in the 'Garage'
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound_perm = [_this,3,false,[true]] call BIS_fnc_param;

if(isNull _vehicle OR isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.

_vInfo = _vehicle getVariable["dbInfo",[]];
_trunk = _vehicle getVariable["Trunk",[[],0]];
//_trunk = [_trunk] call DB_fnc_mresArray;

if(count _vInfo > 0) then {
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};
//Save vehicle inventory
_cargo = [];

_vehItems = getItemCargo _vehicle;
_vehMags = getMagazineCargo _vehicle;
_vehWeapons = getWeaponCargo _vehicle;
_vehBackpacks = getBackpackCargo _vehicle;

_cargo pushBack _vehItems;
_cargo pushBack _vehMags;
_cargo pushBack _vehWeapons;
_cargo pushBack _vehBackpacks;
//_cargo = [_cargo] call DB_fnc_mresArray;

_damage = damage _vehicle;

//positions save
_position = getPos _vehicle;
_dir = getDir _vehicle;

if(_impound) then {
	if(count _vInfo == 0) then  {
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
	} else {
		if(_impound_perm) then {
			diag_log "Impound Permanent";
			_query = format["vehicleUpdateActivePlate:2:%1:%2:%3:%4:%5:%6:%7",_trunk,_cargo,_damage,_position,_dir,_uid,_plate];
			waitUntil {!DB_Async_Active};
			_thread = [_query,1] call DB_fnc_asyncCall;
		} else {
			diag_log "Impound Nomral";
			_query = format["vehicleUpdateActivePlate:0:%1:%2:%3:%4:%5:%6:%7",_trunk,_cargo,_damage,_position,_dir,_uid,_plate];
			waitUntil {!DB_Async_Active};
			_thread = [_query,1] call DB_fnc_asyncCall;
			diag_log ["Impound Query%1",_query];
		};
		//waitUntil {scriptDone _thread};
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
	};
} else {
	if(count _vInfo == 0) exitWith {
		[[1,(localize "STR_Garage_Store_NotPersistent")],"life_fnc_broadcast",(owner _unit),false] call life_fnc_MP;
		life_garage_store = false;
		(owner _unit) publicVariableClient "life_garage_store";
	};

	if(_uid != getPlayerUID _unit) exitWith {
		[[1,(localize "STR_Garage_Store_NoOwnership")],"life_fnc_broadcast",(owner _unit),false] call life_fnc_MP;
		life_garage_store = false;
		(owner _unit) publicVariableClient "life_garage_store";
	};
	
	_query = format["vehicleUpdateActivePlate:0:%1:%2:%3:%4:%5:%6:%7",_trunk,_cargo,_damage,_position,_dir,_uid,_plate];
	waitUntil {!DB_Async_Active};
	_thread = [_query,1] call DB_fnc_asyncCall;
	["diag_log",[
		"------------- Vehicle Query Request -------------",
		format["QUERY: %1",_query],
		"-------------------------------------------------"
	]] call TON_fnc_logIt;
	//waitUntil {scriptDone _thread};
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		deleteVehicle _vehicle;
	};
	life_garage_store = false;
	(owner _unit) publicVariableClient "life_garage_store";
	[[1,(localize "STR_Garage_Store_Success")],"life_fnc_broadcast",(owner _unit),false] call life_fnc_MP;
};