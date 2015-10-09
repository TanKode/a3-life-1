/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer","_medicsOnline"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//if(playerside != independent)then{ [] spawn bambusfarm_fnc_DelGWH; };

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.

//Setup our camera view
bambusfarm_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
bambusfarm_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
bambusfarm_deathCamera camSetTarget _unit;
bambusfarm_deathCamera camSetRelPos [0,3.5,4.5];
bambusfarm_deathCamera camSetFOV .5;
bambusfarm_deathCamera camSetFocus [50,0];
bambusfarm_deathCamera camCommit 0;

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
		bambusfarm_respawn_timer = 3;        //3 Minuten, kann beliebig editiert werden!
	}else{
		bambusfarm_respawn_timer = .1;      //0,1 Minuten, auch hier kann editiert werden
	};
//-- ENDE


	_maxTime = time + (bambusfarm_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format["Respawn Available in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 OR isNull _this};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText "You can now respawn";
};

[] spawn bambusfarm_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; bambusfarm_deathCamera camSetTarget _unit; bambusfarm_deathCamera camSetRelPos [0,3.5,4.5]; bambusfarm_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"bambusfarm_fnc_wantedAdd",false,false] spawn bambusfarm_fnc_MP;
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[[2],"bambusfarm_fnc_removeLicenses",_killer,FALSE] spawn bambusfarm_fnc_MP;
		};
		[[-100,1,bambusfarm_Karma],"bambusfarm_fnc_KarmaNeg",_killer,false] call bambusfarm_fnc_MP;
	} else {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"bambusfarm_fnc_wantedAdd",false,false] spawn bambusfarm_fnc_MP;
		
		if(!local _killer) then {
			[[3],"bambusfarm_fnc_removeLicenses",_killer,FALSE] spawn bambusfarm_fnc_MP;
		};
		[[-100,1,bambusfarm_Karma],"bambusfarm_fnc_KarmaNeg",_killer,false] call bambusfarm_fnc_MP;
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	bambusfarm_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!bambusfarm_use_atm && {bambusfarm_TASCHENGELD > 0}) then {
		[format[localize "STR_Cop_RobberDead",[bambusfarm_TASCHENGELD] call bambusfarm_fnc_numberText],"bambusfarm_fnc_broadcast",true,false] spawn bambusfarm_fnc_MP;
		bambusfarm_TASCHENGELD = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	bambusfarm_removeWanted = true;
};

_handle = [_unit] spawn bambusfarm_fnc_dropItems;
waitUntil {scriptDone _handle};

bambusfarm_hunger = 100;
bambusfarm_thirst = 100;
bambusfarm_carryWeight = 0;
bambusfarm_TASCHENGELD = 0;

[] call bambusfarm_fnc_hudUpdate; //Get our HUD updated.
[[player,bambusfarm_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn bambusfarm_fnc_MP;

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;