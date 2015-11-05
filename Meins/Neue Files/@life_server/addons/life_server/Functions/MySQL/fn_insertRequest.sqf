#include "\life_server\script_macros.hpp"
/*
	File: fn_insertRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with inserting... Don't have time for
	descriptions... Need to write it...
*/
private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_money = [_this,2,0,[""]] call BIS_fnc_param;
_civBank = [_this,3,10000,[""]] call BIS_fnc_param;
_copBank = [_this,4,10000,[""]] call BIS_fnc_param;
_medBank = [_this,5,10000,[""]] call BIS_fnc_param;
_adacBank = [_this,6,10000,[""]] call BIS_fnc_param;
_level = [_this,7,0,[""]] call BIS_fnc_param;
_exp = [_this,8,0,[""]] call BIS_fnc_param;
_skillPoint = [_this,9,0,[""]] call BIS_fnc_param;
_returnToSender = [_this,10,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction'
if(isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to!

_query = format["playerInfo:%1",_uid];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- Insert Query Request -------------",
		format["QUERY: %1",_query],
		format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
		format["Result: %1",_queryResult],
		"------------------------------------------------"
	]] call TON_fnc_logIt;
};

//Double check to make sure the client isn't in the database...
if(typeName _queryResult == "STRING") exitWith {[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] call life_fnc_MP;}; //There was an entry!
if(count _queryResult != 0) exitWith {[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] call life_fnc_MP;};

//Clense and prepare some information.
_alias = [[_name]];
_money = [_money] call DB_fnc_numberSafe;
_civBank = [_civBank] call DB_fnc_numberSafe;
_copBank = [_copBank] call DB_fnc_numberSafe;
_medBank = [_medBank] call DB_fnc_numberSafe;
_adacBank = [_adacBank] call DB_fnc_numberSafe;
_guid = 0;
//Prepare the query statement..
_query = format["playerInfoInsert:%1:%2:%3:%4:%5:%6:%5:%7:%5:%8:%5:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18:%19:%20:%21:%22:%23",
	_uid,
	_name,
	_guid,
	_alias,
	_money,
	_civBank,
	_copBank,
	_medBank,
	_adacBank,
	[],	// Cop Licenses
    [], // Med Licenses
    [], // Civ Licenses
	[], // adac Licenses			
    [], // Civ Gear
    [], // Cop Gear
    [],  // Med Gear
	[],  // adac Gear
	_level, //level
	_exp, //exp
	[], //skills
	_skillPoint, // skillpoints	
	[], //position
	[] //vehicle plate
	
];

waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] call life_fnc_MP;