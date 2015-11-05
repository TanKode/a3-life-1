#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((FETCH_CONST(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

//paychack
life_paycheck = (FETCH_CONST(life_mediclevel) * 15000);

//Show Ranks
player SVAR ["MedicRank", FETCH_CONST(life_medicLevel), true];

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn life_fnc_wkMedic;
[] call life_fnc_updateClothing;
[] execVM "scripts\autoTexture.sqf";
[] spawn life_fnc_placeablesInit;