#include <macro.h>
/*
	File: fn_vehInventory.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used a refresher for the vehicle inventory / trunk menu items.
*/
private["_veh","_tInv","_pInv","_veh_data"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _veh OR !alive _veh) exitWith {closeDialog 0;}; //If null / dead exit menu
disableSerialization;

_tInv = CONTROL(3500,3502);
_pInv = CONTROL(3500,3503);
lbClear _tInv;
lbClear _pInv;

_boxslots = 0;
if ((_veh isKindOf "House_F") OR (_veh isKindOf "House")) then {
	_content = cursorTarget getVariable "content";
	{
		if (_x select 0 == "B_supplyCrate_F") then {_boxslots = _boxslots + 700;};
		if (_x select 0 == "Box_IND_AmmoVeh_F") then {_boxslots = _boxslots + 900;};
		if (_x select 0 == "Box_IND_WpsSpecial_F") then {_boxslots = _boxslots + 100;};
		if (_x select 0 == "Box_IND_Grenades_F") then {_boxslots = _boxslots + 80;};
	} forEach _content;
};

if((_veh isKindOf "House_F") OR(_veh isKindOf "House")) then {
	private "_mWeight";
	if((typeOf _veh) in ["Land_Cargo_House_V3_F"]) then 
	{ 
		_mWeight = _veh getVariable "slot";
		_veh_data = [_mWeight,(_veh getVariable["Trunk",[[],0]]) select 1];
	}else{
		_mWeight = _boxslots;
		_veh_data = [_mWeight,(_veh GVAR ["Trunk",[[],0]]) select 1];
	};
} else {
	_veh_data = [_veh] call life_fnc_vehicleWeight;
};

if(EQUAL(SEL(_veh_data,0),-1)) exitWith {closeDialog 0};

ctrlSetText[3504,format["Weight: %1/%2",_veh_data select 1,_veh_data select 0]];
_data = _veh GVAR ["Trunk",[[],0]];
if(EQUAL(count _data,0)) then {_veh SVAR ["Trunk",[[],0],true]; _data = [];} else {_data = _data select 0;};
//Player Inventory Items
{
	_val = ITEM_VALUE(configName _x);
	
	if(_val > 0) then {
		_pInv lbAdd format["[%1] - %2",_val,localize (getText(_x >> "displayName"))];
		_pInv lbSetData [(lbSize _pInv)-1,configName _x];
		_icon = M_CONFIG(getText,"VirtualItems",configName _x,"icon");
		if(!(EQUAL(_icon,""))) then {
			_pInv lbSetPicture [(lbSize _pInv)-1,_icon];
		};
	};
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

//Trunk Inventory Items
{
	_name = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"displayName");
	_val = SEL(_x,1);
		
	if(_val > 0) then {
		_tInv lbAdd format["[%1] - %2",_val,localize _name];
		_tInv lbSetData [(lbSize _tInv)-1,SEL(_x,0)];
		_icon = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"icon");
		if(!(EQUAL(_icon,""))) then {
			_tInv lbSetPicture [(lbSize _tInv)-1,_icon];
		};
	};
} foreach _data;
