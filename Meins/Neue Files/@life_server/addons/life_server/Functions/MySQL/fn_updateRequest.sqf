/*
	File: fn_updateRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;
_position = [_this,8,[],[[]]] call BIS_fnc_param;
_plate = [_this,10,[],[[]]] call BIS_fnc_param;
_level = [_this,10,0,[0]] call BIS_fnc_param;
_exp = [_this,12,0,[0]] call BIS_fnc_param;
_skill = [_this,13,[],[[]]] call BIS_fnc_param;
_skillPoints = [_this,14,0,[0]] call BIS_fnc_param;
//Get to those error checks.
if((_uid == "") OR (_name == "")) exitWith {};

//Parse and setup some data.
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;
_level = [_level] call DB_fnc_numberSafe;
_exp = [_exp] call DB_fnc_numberSafe;
_skillPoints = [_skillPoints] call DB_fnc_numberSafe;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
	_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

//Does something skill related but I can't remember I only know it's important?
for "_i" from 0 to count(_skill)-1 do {
	_bool = [(_skill select _i) select 1] call DB_fnc_bool;
	_skill set[_i,[(_skill select _i) select 0,_bool]];
};

switch (_side) do {
	case west: {_query = format["playerWestUpdate:%1:%2:%3:%4:%5:%6",_name,_cash,_bank,_gear,_licenses,_uid];};
	case civilian: {_query = format["playerCivilianUpdate:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14",_name,_cash,_bank,_licenses,_gear,[_this select 7] call DB_fnc_bool,_level,_exp,_skill,_skillPoints,_position,[_this select 9] call DB_fnc_bool,_plate,_uid];};
	case independent: {_query = format["playerIndependentUpdate:%1:%2:%3:%4:%5:%6",_name,_cash,_bank,_licenses,_gear,_uid];};
	case east: {_query = format["playerEastUpdate:%1:%2:%3:%4:%5:%6",_name,_cash,_bank,_licenses,_gear,_uid];};
};

waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;

["diag_log",[
		"------------- Vehicle Trunk Query Request -------------",
		format["Query: %1",_query],
		format["QueryResult: %1",_QueryResult],
		"-------------------------------------------------"
]] call TON_fnc_logIt;