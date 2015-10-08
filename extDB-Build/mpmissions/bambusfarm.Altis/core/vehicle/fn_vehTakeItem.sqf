#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if(isNull bambusfarm_trunk_vehicle OR !alive bambusfarm_trunk_vehicle) exitWith {hint localize "STR_MISC_VehDoesntExist"};
if(!alive player) exitwith {closeDialog 0;};

if((lbCurSel 3502) == -1) exitWith {hint localize "STR_Global_NoSelection";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint localize "STR_MISC_Under1";};

_index = [_ctrl,((bambusfarm_trunk_vehicle getVariable "Trunk") select 0)] call TON_fnc_index;
_data = (bambusfarm_trunk_vehicle getVariable "Trunk") select 0;
_old = bambusfarm_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {hint localize "STR_MISC_NotEnough"};
_num = [_ctrl,_num,bambusfarm_carryWeight,bambusfarm_maxWeight] call bambusfarm_fnc_calWeightDiff;
if(_num == 0) exitWith {hint localize "STR_NOTF_InvFull"};
_weight = ([_ctrl] call bambusfarm_fnc_itemWeight) * _num;
if(_ctrl == "money") then
{
	if(_num == _value) then
	{
		_data set[_index,-1];
		_data = _data - [-1];
	}
		else
	{
		_data set[_index,[_ctrl,(_value - _num)]];
	};
	
	bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD + _num;
	bambusfarm_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
	[bambusfarm_trunk_vehicle] call bambusfarm_fnc_vehInventory;
}
	else
{
	if([true,_ctrl,_num] call bambusfarm_fnc_handleInv) then
	{
		if(_num == _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		bambusfarm_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[bambusfarm_trunk_vehicle] call bambusfarm_fnc_vehInventory;
	}
		else
	{
		hint localize "STR_NOTF_InvFull";
	};
};