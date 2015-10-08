#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

if(bambusfarm_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call bambusfarm_fnc_vehicleWeightCfg);} foreach (bambusfarm_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(bambusfarm_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [bambusfarm_trunk_vehicle] call bambusfarm_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call bambusfarm_fnc_itemWeight) * _num;
_veh_data = bambusfarm_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(bambusfarm_trunk_vehicle isKindOf "LandVehicle" OR bambusfarm_trunk_vehicle isKindOf "House_F")}) exitWith {hint "You cannot store that in anything but a land vehicle!"};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(bambusfarm_TASCHENGELD < _num) exitWith {hint "You don't have that much cash on you to store in the vehicle!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD - _num;
	bambusfarm_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[bambusfarm_trunk_vehicle] call bambusfarm_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "The vehicle is either full or cannot hold that much."};

	if(!([false,_ctrl,_num] call bambusfarm_fnc_handleInv)) exitWith {hint "Couldn't remove the items from your inventory to put in the vehicle.";};
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
	
	bambusfarm_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[bambusfarm_trunk_vehicle] call bambusfarm_fnc_vehInventory;
};
