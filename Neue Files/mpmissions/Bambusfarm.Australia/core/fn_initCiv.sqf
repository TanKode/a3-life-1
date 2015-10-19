#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
/*civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};*/

if((EQUAL((GVAR_MNS "LEVEL"),0)) OR (FETCH_CONST(life_rebellevel) < 1) OR (FETCH_CONST(life_adminlevel) < 1)) then {
	rulesok = false;
	diag_log "::Life Client:: Creating AGB Dialog";
	// AGB
	if(!createDialog "agb") exitWith {};
	waitUntil{!isNull (findDisplay 32154)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 32154)}; //Wait for the spawn selection to be done.
	if(!rulesok)then {
		player enableSimulation false;
		["agb",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
	rulesok = nil;
};

[] spawn life_fnc_wkCiv;

if(life_is_arrested) then
{
	//life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
player addRating 9999999;
[] call life_fnc_updateClothing;
[] execVM "scripts\autoTexture.sqf";
//[] execVM "core\civilian\fn_airSoftWeaponRemove.sqf";