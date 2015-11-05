#include "\life_server\script_macros.hpp"
/*
	File: fn_getVehiclePos.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life)/Mysterious Monkeys Australia Life Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_ownerID = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_side = side _ownerID;
_name = name _ownerID;
_container = ["Land_Pod_Heli_Transport_04_bench_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_fuel_F"];

if(isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

_posPlate = format["getVehiclePlate:%1",_uid];
waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResultPos = [_posPlate,2] call DB_fnc_asyncCall;
diag_log format["QueryPos:%1",SEL(_queryResultPos,0)];
if(EQUAL(_queryResultPos,[[]])) exitWith {};
{
	_plate = _x;
	diag_log format["plate:%1",_plate];
	_query = format["getVehiclePos:%1:%2",_uid,_plate];

	waitUntil{sleep (random 0.3); !DB_Async_Active};
	_tickTime = diag_tickTime;
	_queryResult = [_query,2] call DB_fnc_asyncCall;
	diag_log format ["QueryResult:%1",_queryResult];
	_position = SEL(_queryResult,11);
	_dir= SEL(_queryResult,12);

	_vehicle = createVehicle [(SEL(_queryResult,2)),[0,0,999],[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_vehicle setPos [(SEL(_position,0)),(SEL(_position,1)),0];
	_vehicle setVectorUp (surfaceNormal _position);
	_vehicle setDir _dir;

	_vehicle allowDamage true;
	//Send keys over the network.
	[[_vehicle],"life_fnc_addVehicle2Chain",_ownerID,false] call life_fnc_MP;
	[_uid,_side,_vehicle,1] call TON_fnc_keyManagement;
	_vehicle lock 2;
	//Reskin the vehicle
	[[_vehicle,(SEL(_queryResult,8))],"life_fnc_colorVehicle",nil,false] call life_fnc_MP;
	_vehicle setVariable["vehicle_info_owners",[[_uid,_name]],true];
	_vehicle setVariable["dbInfo",[(SEL(_queryResult,4)),(SEL(_queryResult,7))]];
	_vehicle setVariable["gpsTrackerActivate",false,true];
	_vehicle setVariable["adacCheck",false,true];
	
	_veh = typeOf _vehicle;
	//OelFass
	if(_veh in ["C_Offroad_01_F"]) then
	{
		_vehicle setVariable ["OelSlot",0,true];
	};
	
	//Robes disable
	if(_veh in _container) then 
	{

	}else
	{
		[[_vehicle],"TON_fnc_disableRobes",false,false] spawn life_fnc_MP;
	};

	////Damage
	_damage = [_queryResult select 11] call DB_fnc_numberSafe;
	_damage = parseNumber _damage;
	_vehicle setDamage _damage;

	///// Trunk
	_trunk = _queryResult select 9;
	if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
	{
		_itemName = _x select 0;

		if(_itemName in _illegalItems) then
		{
			_x set [1,0];
			diag_log format["VEH-SPAWN: Cleaned of item %1", _x];
		};
	} forEach (_trunk select 0);
	_vehicle setVariable["Trunk",_trunk,true];

	/////Inventory
	_gear = _queryResult select 10;
	if(typeName _gear == "STRING") then {_gear = call compile format["%1", _gear];};
	/////
	[_vehicle] call life_fnc_clearVehicleAmmo;
	/////
	if (count _gear > 0) then
	{
		_items = _gear select 0;
		_mags = _gear select 1;
		_weapons = _gear select 2;
		_backpacks = _gear select 3;

		for "_i" from 0 to ((count (_items select 0)) - 1) do 
		{
			_vehicle addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
		};
		for "_i" from 0 to ((count (_mags select 0)) - 1) do
		{
			_vehicle addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
		};
		for "_i" from 0 to ((count (_weapons select 0)) - 1) do
		{
			_vehicle addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
		};
		for "_i" from 0 to ((count (_backpacks select 0)) - 1) do
		{
			_vehicle addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
		};
	};
	/////

	//Sets of animations

	if(EQUAL(SEL(_queryResult,1),"civ") && EQUAL(SEL(_queryResult,2),"B_Heli_Light_01_F") && !(EQUAL(SEL(_queryResult,8),13))) then {
		[[_vehicle,"civ_littlebird",true],"life_fnc_vehicleAnimate",_ownerID,false] call life_fnc_MP;
	};

	if(EQUAL(SEL(_queryResult,1),"cop") && (SEL(_queryResult,2) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","I_MRAP_03_F"])) then {
		[[_vehicle,"cop_offroad",true],"life_fnc_vehicleAnimate",_ownerID,false] call life_fnc_MP;
	};

	if(EQUAL(SEL(_queryResult,1),"med") && (SEL(_queryResult,2) in ["C_Offroad_01_F","C_SUV_01_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","B_MRAP_01_F","C_Van_01_box_F"])) then {
		[[_vehicle,"med_offroad",true],"life_fnc_vehicleAnimate",_ownerID,false] call life_fnc_MP;
	};

	if(EQUAL(SEL(_queryResult,1),"adac") && (SEL(_queryResult,2) in ["C_Offroad_01_F","C_SUV_01_F","B_Heli_Light_01_F","I_Heli_Transport_02_F","B_Truck_01_transport_F","C_SUV_01_F","B_MRAP_01_F"])) then {
		[[_vehicle,"adac_offroad",true],"life_fnc_vehicleAnimate",_ownerID,false] call life_fnc_MP;
	};
	[[1,"Ihr Fahrzeug ist gespawnt!"],"life_fnc_broadcast",_ownerID,false,true] call life_fnc_MP;
	
	_query = format["updateVehicleSavePos:1:0:%1:%2",_uid,_plate];
	waitUntil{sleep (random 0.3); !DB_Async_Active};
	_tickTime = diag_tickTime;
	_queryResult = [_query,2] call DB_fnc_asyncCall;
	
}forEach SEL(_queryResultPos,0);