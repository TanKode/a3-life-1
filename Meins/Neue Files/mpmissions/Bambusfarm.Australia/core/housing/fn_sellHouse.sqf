#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!((_house isKindOf "House_F") OR (_house isKindOf "House"))) exitWith {};
if(isNil {_house GVAR "house_owner"}) exitWith {hint "There is no owner for this house."};
closeDialog 0;

_houseCfg = [M_CONFIG(getNumber,"Houses",typeOf(_house),"price"),M_CONFIG(getNumber,"Houses",typeOf(_house),"maxStorage")];
if(count _houseCfg == 0) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round(SEL(_houseCfg,0)/2)) call life_fnc_numberText,
	SEL(_houseCfg,1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	_house SVAR ["house_sold",true,true];
	[[_house],"TON_fnc_sellHouse",false,false] call life_fnc_MP;
	_house SVAR ["locked",false,true];
	_house SVAR ["Trunk",nil,true];
	_house SVAR ["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house GVAR "uid"];
	_house SVAR ["uid",nil,true];
	
	BANK = BANK + (round(SEL(_houseCfg,0)/2));
	_index = life_vehicles find _house;
	if(_index != -1) then {
		life_vehicles set[_index,-1];
		life_vehicles = life_vehicles - [-1];
	};
	
	_index = [str(getPosATL _house),life_houses] call TON_fnc_index;
	if(_index != -1) then {
		life_houses set[_index,-1];
		life_houses = life_houses - [-1];
	};
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house SVAR [format["bis_disabled_Door_%1",_i],0,true];
	};
};
