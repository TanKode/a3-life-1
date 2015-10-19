#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater"];
_curTarget = cursorTarget;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_action_gathering) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (visiblePositionASL player);

//Check if the player is near an ATM.
if((call life_fnc_nearATM) && {!dialog}) exitWith {
	[] call life_fnc_atmMenu;
};

if(isNull _curTarget) exitWith {
	if(_isWater) then {
		private "_fish";
		_fish = (nearestObjects[visiblePosition player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call life_fnc_catchFish;
		};
	} else {
		if(playerSide == civilian && !life_action_gathering) then {
			_handle = [] spawn life_fnc_gather;
			waitUntil {scriptDone _handle};
			life_action_gathering = false;
		};
	};
};


if(!alive _curTarget && _curTarget isKindOf "Animal" && !(EQUAL((typeOf _curTarget),"Turtle_F") && !life_action_gathering)) exitWith {
	[_curTarget]call life_fnc_gutAnimal;
};

if(((_curTarget isKindOf "House_F") OR (_curTarget isKindOf "House")) && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
[] spawn {
	sleep 60;
	life_action_inUse = false;
};
_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {!(typeOf _curTarget in _animalTypes)} && {playerSide in [west,independent,civilian]}) exitWith {
	//Hotfix code by ins0
	if(((playerSide == blufor && {(EQUAL(LIFE_SETTINGS(getNumber,"revive_cops"),1))}) || playerSide == independent) && {"Medikit" in (items player)}) then {
		[_curTarget] call life_fnc_revivePlayer;
	}else{
		if((EQUAL(playerSide,civilian)) && skill_civ_heal && skill_civ_heal1) then
		{
			[_curTarget] call life_fnc_revivePlayer;
		};
	};
};

//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if(EQUAL(playerSide,west)) then {
		if(!dialog) then {
			[_curTarget] call life_fnc_pInteraction_cop;
		}else{
			hint "Es wird bereits ein Dialig angezeigt.";
		};
	};
	   
	if(EQUAL(playerSide,civilian)) then {
		if((_curTarget GVAR ["restrained",false]) && !dialog && license_civ_rebel) then {
			[_curTarget] call life_fnc_pInteraction_adac;
		}else{
			hint "Der andere Spieler muss gefesselt sein.";
			sleep 3;
			hint "Benutze die Shift+R, um den Spieler zu fesseln.";
		};
	};
	   
	if(EQUAL(playerSide,east)) then {
		if(!dialog) then {
			[_curTarget] call life_fnc_pInteraction_civ;
		}else{
			hint "Es wird bereits ein Dialog angezeigt.";
		};
	};

	if(EQUAL(playerSide,independent)) then {
		if(!dialog) then {
			[_curTarget] call life_fnc_pInteraction_med;
		}else{
			hint "Es wird bereits ein Dialog angezeigt.";
		};
	};

} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money","_list"];
	
	_list = ["landVehicle","Ship","Air"];
	_isVehicle = if(KINDOF_ARRAY(_curTarget,_list)) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_money = "Land_Money_F";
	
	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog) then {
        switch(playerSide)do{
            case east:{[_curTarget] call life_fnc_vInteraction_adac;};
		    case west:{[_curTarget] call life_fnc_vInteraction_cop;};
            default {[_curTarget] call life_fnc_vInteraction_cop;};
            };
        };
	} else {
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then {
			if(EQUAL((typeOf _curTarget),"Turtle_F") && !alive _curTarget) then {
				private "_handle";
				_handle = [_curTarget] spawn life_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else {
				private "_handle";
				_handle = [_curTarget] spawn life_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		} else {
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then {
				[[_curTarget,player,false],"TON_fnc_pickupAction",false,false,true] call life_fnc_MP;
			} else {
				//It wasn't a misc item so is it money?
				if(EQUAL((typeOf _curTarget),_money) && {!(_curTarget GVAR ["inUse",false])}) then {
					[[_curTarget,player,true],"TON_fnc_pickupAction",false,false,true] call life_fnc_MP;
				};
			};
		};
	};
};

_fass = nearestObjects [player, ["Land_MetalBarrel_F"], 3];
if((count _fass) > 0) then
{
	_nearVehicle = ["C_Offroad_01_F"];
	if((EQUAL(((_fass select 0) GVAR "myOelFass"),(getPlayerUID player))) && (!((typeOf cursorTarget) in _nearVehicle))) then
	{
		[_fass select 0] call life_fnc_fInteractionMenu;
	};
};