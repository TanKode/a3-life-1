#include <macro.h>
/*
	File: fn_initADAC.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	ADAC Initialization file.
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

_igiload = execVM "scripts\IgiLoad\IgiLoadInit.sqf";
[] execVM "scripts\=BTC=_Logistic\=BTC=_Logistic_Init.sqf";

if((FETCH_CONST(life_adaclevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

//paychack
life_paycheck = (FETCH_CONST(life_adaclevel) * 15000);

//Show Ranks
player SVAR ["adacRank", FETCH_CONST(life_adacLevel), true];
//player setVariable["adminlevel", __GETC__(life_adminlevel), true];

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn life_fnc_wkADAC;
[] call life_fnc_updateClothing;
[] execVM "scripts\autoTexture.sqf";
[] spawn life_fnc_placeablesInit;