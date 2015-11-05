#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_priceA"];
disableSerialization;
if(lbCurSel 8802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[8802,(lbCurSel 8802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[8802,(lbCurSel 8802)];
_pid = steamid;
_unit = player;
_myMarker = false;

if(skill_civ_gps && (_vehicle isKindOf "LandVehicle")) then
{
	_myMarker = true;
}else{
	if(skill_civ_gpsAir && skill_civ_gps && ( _vehicle isKindOf "Air")) then
	{
		_myMarker = true;
	};
};

if((_vehicle in LIFE_SETTINGS(getArray,"small_car")) && (life_pInact_curTarget isKindOf "House")) then
{
	if((typeOf life_pInact_curTarget) in LIFE_SETTINGS(getArray,"big_house")) then
	{
		life_garage_sp = [(life_pInact_curTarget modelToWorld [-6,-9,0]),(getDir life_pInact_curTarget)-180];
	}else{
		life_garage_sp = [(life_pInact_curTarget modelToWorld [5,-2,0]),(getDir life_pInact_curTarget)-180];
	};
};

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_vehicle,"storageFee"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_vehicle,"storageFee"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_vehicle,"storageFee"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_vehicle,"storageFee"),3)};
};

if(!(EQUAL(typeName _price,typeName 0)) OR _price < 1) then {_price = 1000};
_price = (_price *5);
if(BANK < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

if(EQUAL(typeName life_garage_sp,typeName [])) then {
	[[_vid,_pid,SEL(life_garage_sp,0),_unit,_price,SEL(life_garage_sp,1)],"TON_fnc_spawnVehicle",false,false] call life_fnc_MP;
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[[_vid,_pid,life_garage_sp,_unit,_price],"TON_fnc_spawnVehicle",false,false] call life_fnc_MP;
	} else {
		[[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,_myMarker],"TON_fnc_spawnVehicle",false,false] call life_fnc_MP;
	};
};

hint localize "STR_Garage_SpawningVeh";
SUB(BANK,_price);