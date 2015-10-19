#include <macro.h>
/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.

private["_vehicle","_veh_data","_flag"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle OR !(("CargoNet_01_box_F" == typeOf _vehicle) OR ("CargoNet_01_barrels_F" == typeOf _vehicle) OR ("Land_CargoBox_V1_F" == typeOf _vehicle) OR _vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "LandVehicle" OR _vehicle isKindOf "House_F")) exitWith {}; //Either a null or invalid vehicle type.

if((_vehicle GVAR ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};
_vehicle SVAR ["trunk_in_use_by",name player,true];
if(!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;

[_vehicle] call life_fnc_updateVehTrunk;

if(_vehicle isKindOf "House_F") then {
	ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};

if(_vehicle isKindOf "House_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_vehicle GVAR["containers",[]]);
	_veh_data = [_mWeight,(_vehicle GVAR["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;
};

if(_vehicle isKindOf "House_F" && {count (_vehicle GVAR ["containers",[]]) == 0}) exitWith {hint localize "STR_MISC_NoStorageWarn"; closeDialog 0; _vehicle SVAR ["trunk_in_use",false,true];};
if(_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}) exitWith {closeDialog 0; _vehicle SVAR ["trunk_in_use",false,true]; hint localize "STR_MISC_NoStorageVeh";};

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_vehicle spawn
{							   
	waitUntil {isNull (findDisplay 3500)};
	["trunk_open"] call life_fnc_globalSound;
	_this SVAR ["trunk_in_use",false,true];
	["trunk_close"] call life_fnc_globalSound;
	if(_this isKindOf "House_F") then {
		[[_this],"TON_fnc_updateHouseTrunk",false,false] call life_fnc_MP;
	}else{
		hintSilent "Hinweis: Illegale Sachen werden nicht gespeichert, wenn du dein Fahrzeug in der Garage parkst.";
		
		[[_this],"TON_fnc_updateVehInventory",false,false] call life_fnc_MP;
	};
	[] call SOCK_fnc_updateRequest;
};*/
private["_vehicle","_veh_data"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle OR !(("Land_MetalBarrel_F" == typeOf _vehicle) OR ("CargoNet_01_box_F" == typeOf _vehicle) OR ("CargoNet_01_barrels_F" == typeOf _vehicle) OR ("Land_CargoBox_V1_F" == typeOf _vehicle) OR _vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "LandVehicle" OR (((_vehicle isKindOf "House_F") OR (_vehicle isKindOf "House"))))) exitWith {}; //Either a null or invalid vehicle type.

if(_vehicle getVariable ["trunk_in_use",false]) exitWith {hint localize "STR_MISC_VehInvUse"};
_vehicle setVariable["trunk_in_use_by",name player,true];
if(!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;

[_vehicle] call life_fnc_updateVehTrunk;

if(((_vehicle isKindOf "House_F") OR (_vehicle isKindOf "House"))) then {
	if((typeOf _vehicle) in ["Land_Cargo_House_V3_f"]) then
	{
		ctrlSetText[3501,format[("Clan Base")]];
	}else{
		ctrlShow[3509,false];
		ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
	};
} else {
	ctrlShow[3509,true];
	if(serverTime - (_vehicle getVariable["lastSync",-99999]) < 900) then {ctrlEnable[3509,false];};
	
	ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};

_boxslots = 0;
if (((_vehicle isKindOf "House_F") OR (_vehicle isKindOf "House"))) then {
	_content = cursorTarget getVariable "content";
	{
		if (_x select 0 == "B_supplyCrate_F") then {_boxslots = _boxslots + 700;};
		if (_x select 0 == "Box_IND_AmmoVeh_F") then {_boxslots = _boxslots + 900;};
		if (_x select 0 == "Box_IND_WpsSpecial_F") then {_boxslots = _boxslots + 100;};
		if (_x select 0 == "Box_IND_Grenades_F") then {_boxslots = _boxslots + 80;};
	} forEach _content;
};

if(((_vehicle isKindOf "House_F") OR (_vehicle isKindOf "House"))) then {
	private["_mWeight"];
	if((typeOf _vehicle) in ["Land_Cargo_House_V3_F"]) then 
	{
		_mWeight =_vehicle getVariable "slot";
		_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
	}else{
		_mWeight = _boxslots;
		_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
	};
} else {
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;
};

if((((_vehicle isKindOf "House_F") OR (_vehicle isKindOf "House"))) && {_boxslots == 0} && !((typeOf _vehicle) in ["Land_Cargo_House_V3_F"])) exitWith {hint localize "STR_MISC_NoStorageWarn"; closeDialog 0; _vehicle setVariable["trunk_in_use",false,true];};
if(_veh_data select 0 == -1 && {!(((_vehicle isKindOf "House_F") OR (_vehicle isKindOf "House")))}) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true]; hint localize "STR_MISC_NoStorageVeh";};

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_vehicle spawn
{							   
	waitUntil {isNull (findDisplay 3500)};
	["trunk_open"] call life_fnc_globalSound;
	_this SVAR ["trunk_in_use",false,true];
	["trunk_close"] call life_fnc_globalSound;
	if((_this isKindOf "House_F") OR (_this isKindOf "House")) then {
		if((typeOf _this) in ["Land_Cargo_House_V3_F"]) then 
		{
			[[_this],"TON_fnc_updateBaseTrunk",false,false] call life_fnc_MP;
		}else{
			[[_this],"TON_fnc_updateHouseTrunk",false,false] call life_fnc_MP;
		};
	}else{
		hintSilent "Hinweis: Illegale Sachen werden nicht gespeichert, wenn du dein Fahrzeug in der Garage parkst.";
		
		[[_this],"TON_fnc_updateVehInventory",false,false] call life_fnc_MP;
	};
	[] call SOCK_fnc_updateRequest;
};