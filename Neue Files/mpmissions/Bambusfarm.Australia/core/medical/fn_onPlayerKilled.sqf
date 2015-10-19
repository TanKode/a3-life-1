#include <macro.h>
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
//positions save
_unit setVariable["life_isPlayer_alive", FALSE,TRUE];

//Organ
_unit setVariable["missingOrgan",FALSE,TRUE]; //I DONT KNOW WHY SOMETIMES THEY ARE CAPS or not
_unit setVariable["hasOrgan",FALSE,TRUE]; 
_unit enableFatigue false;

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
life_deathCamera cameraEffect ["Internal","Back"];
showCinemaBorder TRUE;
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

_wasted = {
	"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0.72],[5, 5, 5, -0.48],[0.2, 0.59, 0.11, 0]];
	"ColorCorrections" ppEffectCommit 0;
	"ColorCorrections" ppEffectEnable true;
	sleep 2;
	for "_x" from 0 to 20 do {
    _x cutRsc ["wasted","PLAIN"];
	};
	playsound "wasted";
	sleep 8;
	"colorCorrections" ppEffectEnable false; 
};

_handle = [] spawn _wasted;
waitUntil {scriptDone _handle};

createDialog "DeathScreen";
(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
		//-- NEUER CODE
	_medicsOnline = {_x != player && side _x == independent} count playableUnits;
	if(_medicsOnline > 0)then{
		life_respawn_timer = 6; //3 Minuten, kann beliebig editiert werden!
	}else{
		life_respawn_timer = .1; //0,1 Minuten, auch hier kann editiert werden
	};
//-- ENDE
	
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 OR isNull _this};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

if(life_nlrtimer_running) then
{
life_nlrtimer_stop = true;
waitUntil {!life_nlrtimer_running};
};
[] spawn life_fnc_newLifeRule;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[[2],"life_fnc_removeLicenses",_killer,FALSE] call life_fnc_MP;
		};
	} else {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
		
		if(!local _killer) then {
			[[3],"life_fnc_removeLicenses",_killer,FALSE] call life_fnc_MP;
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {CASH > 0}) then {
		[format[localize "STR_Cop_RobberDead",[CASH] call life_fnc_numberText],"life_fnc_broadcast",true,false] call life_fnc_MP;
		CASH = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_isPlayer_alive = false;
life_hunger = 100;
life_thirst = 100;
life_battery = 100;
life_carryWeight = 0;
CASH = 0;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] call life_fnc_MP;

[0] call SOCK_fnc_updatePartial;
if(playerSide in[civilian,independent,east]) then
{
	[3] call SOCK_fnc_updatePartial;
};