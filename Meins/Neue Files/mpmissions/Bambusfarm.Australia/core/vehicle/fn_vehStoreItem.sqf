#include <macro.h>
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_FuelTrucks","_FuelStuff"];
disableSerialization;

_ctrl = ctrlSelData(3503);
if(life_trunk_vehicle GVAR "trunk_in_use") exitWith {cutText[ localize "STR_MISC_VehInvUse","PLAIN DOWN"];closeDialog 0;};
if(life_trunk_vehicle GVAR "trunk_in_use_by" != name player) exitWith {cutText[ localize "STR_MISC_VehInvUse","PLAIN DOWN"];closeDialog 0;};
_num = ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Falsches Zahlenformat!";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst nichts unter 1 eingeben!";};

_boxslots = 0;
if ((life_trunk_vehicle isKindOf "House_F") OR (life_trunk_vehicle isKindOf "House")) then {
	_content = cursorTarget GVAR "content";
	{
		if (_x select 0 == "B_supplyCrate_F") then {_boxslots = _boxslots + 700;};
		if (_x select 0 == "Box_IND_AmmoVeh_F") then {_boxslots = _boxslots + 900;};
		if (_x select 0 == "Box_IND_WpsSpecial_F") then {_boxslots = _boxslots + 100;};
		if (_x select 0 == "Box_IND_Grenades_F") then {_boxslots = _boxslots + 80;};
	} forEach _content;
};

if((life_trunk_vehicle isKindOf "House_F") OR (life_trunk_vehicle isKindOf "House")) then {
	if((typeOf life_trunk_vehicle) in ["Land_Cargo_House_V3_F"]) then 
	{
		_mWeight = life_trunk_vehicle getVariable "slot";
		_veh_data = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
		_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
	}else{
		_mWeight = _boxslots;
		_totalWeight = [_mWeight,(life_trunk_vehicle GVAR["Trunk",[[],0]]) select 1];
	};
} else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle GVAR ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!((life_trunk_vehicle isKindOf "LandVehicle") OR ((life_trunk_vehicle isKindOf "House_F") OR (life_trunk_vehicle isKindOf "House")))}) exitWith {hint "Sie können das hier nicht einlagern!"};

_Truck = TypeOf life_trunk_vehicle;
_FuelStuff = ["oil_unprocessed","oil_processed"]; //Wich Items can be stored in?
_FuelTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","Land_Pod_Heli_Transport_04_fuel_F","Land_MetalBarrel_F"]; //Fuel Trucks, who are allowed to carry fuel

switch (true) do
{
	case ((_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 1}; //Fuel in FuelTruck -> Allowed
	case (!(_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 2}; //NonFuel in NonFuelTruck -> Allowed
	case (!(_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 3}; //NonFuel in FuelTruck -> Nope
	case ((_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 4}; //Fuel in NonFuelTruck -> Nope!
};
if (life_TankLaster == 3) exitWith {hint format["Ey Jung! Dat passt ni durch de Stutzen! Du kannst nur Öl oder Kerosin in einen Tanklaster füllen!)%1",_ctrl]};
if (life_TankLaster == 4) exitWith {hint "BISSU IRRE? Dat Zeusch würd überall auslaufe! (Du kannst Öl oder Kerosin NUR in einen Tanklaster füllen!)";};

_isTanker = false;
{
	if (life_trunk_vehicle isKindOf _x) then {_isTanker = true;};
} forEach ["C_Van_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","B_Truck_01_fuel_F","Land_Pod_Heli_Transport_04_fuel_F","Land_MetalBarrel_F"];

_isFluid = false;
{
	if (_ctrl == _x) then {_isFluid = true;};
} forEach ["oil_unprocessed","oil_processed","milku","milkp"];

//check
if (_isTanker && (!_isFluid)) exitWith {hint "Du kannst nur Fluessigkeiten in einen Tanklaster fuellen!"};
//check
if ((!_isTanker) && _isFluid) exitWith {hint "Du musst Fluessigkeiten in einen Tanklaster fuellen!"};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(CASH < _num) exitWith {hint "Du hast nicht so viel Geld mit dir um es im Fahrzeug zu verstauen."};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	CASH = CASH - _num;
	life_trunk_vehicle SVAR["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist entweder voll oder kann nicht so viel tragen."};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Items konnten nicht vom Inventar entfernt werden um sie im Auto zu lagern.";};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle SVAR["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};
