#include <macro.h>
/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
cutText ["","BLACK IN"];
if(count life_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = [playerSide] call life_fnc_spawnPointCfg;
	_sp = SEL(_spCfg,0);
	
	if(EQUAL(playerSide,civilian)) then
	{
		if(isNil {(call compile format["%1", SEL(_sp,0)])}) then {
			player setPos (getMarkerPos ( SEL(_sp,0)));
		} else {
			_spawnPos = (call compile format["%1",  SEL(_sp,0)]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos ( SEL(_sp,0)));
	};
	titleText[format["%2 %1", SEL(_sp,1),localize "STR_Spawn_Spawned"],"BLACK IN"];
}
	else
{
	if(EQUAL(playerSide,civilian)) then
	{
		_lastPos = SEL(life_spawn_point,0);
		if(EQUAL(_lastPos,"last_pos")) then
		{
			player setPos [SEL(life_last_position,0),SEL(life_last_position,1),0];
			_rndmrk = getPlayerUID player;
			_marker = format ["lastPos%1", _rndmrk];
			deleteMarker _marker;
			[[_rndmrk,player],"TON_fnc_getVehiclePos",false,false] call life_fnc_MP;
		}else{
			
			life_isPlayer_alive = true;
			if(isNil {(call compile format["%1",SEL(life_spawn_point,0)])}) then {
				if((["house",SEL(life_spawn_point,0)] call BIS_fnc_inString)) then {
					private["_bPos","_house","_pos"];
					_house = nearestObjects [getMarkerPos (SEL(life_spawn_point,0)),["House"],10] select 0;
					_bPos = [_house] call life_fnc_getBuildingPositions;

					if(count _bPos == 0) exitWith {
						player setPos (getMarkerPos (SEL(life_spawn_point,0)));
					};

					{_bPos = _bPos - [(_house buildingPos _x)];} foreach (_house getVariable ["slots",[]]);
					_pos = _bPos call BIS_fnc_selectRandom;
					player setPosATL _pos;
				} else {
					player setPos (getMarkerPos (SEL(life_spawn_point,0)));
				};
			} else {
				_spawnPos = (call compile format["%1", SEL(life_spawn_point,0)]) call BIS_fnc_selectRandom;
				_spawnPos = _spawnPos buildingPos 0;
				player setPos _spawnPos;
			};
		};
	}
		else
	{
		player setPos (getMarkerPos (SEL(life_spawn_point,0)));
	};
	titleText[format["%2 %1",SEL(life_spawn_point,1),localize "STR_Spawn_Spawned"],"BLACK IN"];
};

if(life_firstSpawn) then {
	if(EQUAL(playerSide,civilian)) then
	{
		if(EQUAL((GVAR_MNS "LEVEL"),0)) then {

			[] call life_fnc_welcomeNotification;
		}else{
			life_firstSpawn = false;
		};
	}else{
		life_firstSpawn = false;
		[] call life_fnc_welcomeNotification;
	};
};
[] call life_fnc_hudSetup;