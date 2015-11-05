#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in ["cop_1111"])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};


player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

//Introcam
[] spawn life_fnc_IntroCam;

//Skins und Backpacks für Cops
// CopLevel 1
[] spawn
{
	while {true} do
	{
		if(__GETC__(life_coplevel) == 1) then
		{
			waitUntil {uniform player == "U_B_CombatUniform_mcam"};
			player setObjectTextureGlobal [0,"textures\polizei_uniform1.jpg"];
		};
		
		if(__GETC__(life_coplevel) == 2) then
		{
			waitUntil {uniform player == "U_B_CombatUniform_mcam"};
			player setObjectTextureGlobal [0,"textures\polizei_uniform2.jpg"];
		};
		
		if(__GETC__(life_coplevel) == 3) then
		{
			waitUntil {uniform player == "U_B_CombatUniform_mcam"};
			player setObjectTextureGlobal [0,"textures\polizei_uniform3.jpg"];
		};
		
		if(__GETC__(life_coplevel) == 4) then
		{
			waitUntil {uniform player == "U_B_CombatUniform_mcam"};
			player setObjectTextureGlobal [0,"textures\polizei_uniform4.jpg"];
		};
		
		if(__GETC__(life_coplevel) == 5) then
		{
			waitUntil {uniform player == "U_B_CombatUniform_mcam"};
			player setObjectTextureGlobal [0,"textures\polizei_uniform5.jpg"];
		};
		
		if(__GETC__(life_coplevel) == 6) then
		{
			waitUntil {uniform player == "U_B_CombatUniform_mcam"};
			player setObjectTextureGlobal [0,"textures\polizei_uniform6.jpg"];
		};
		
		if(__GETC__(life_coplevel) == 7) then
		{
			waitUntil {uniform player == "U_B_CombatUniform_mcam"};
			player setObjectTextureGlobal [0,"textures\polizei_uniform7.jpg"];
		};
		sleep 10;
    };
};