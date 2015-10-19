#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	All survival? things merged into one thread.
*/
private["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkDis","_lastPos","_curPos"];
_fnc_food =  {
	if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
	else
	{
		_change = 10;
		if(skill_civ_nourished) then {_change = 7};
		if(skill_civ_nourished && skill_civ_hungerGames) then {_change = 5};
		SUB(life_hunger,_change);
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(life_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {
				hint localize "STR_NOTF_EatMSG_3";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
		};
	};
};
	
_fnc_water = {
	if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
	else
	{
		_change = 10;
		if(skill_civ_nourished) then {_change = 7};
		if(skill_civ_nourished && skill_civ_hungerGames) then {_change = 5};
		SUB(life_thirst,_change);
		[] call life_fnc_hudUpdate;
		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
		switch(life_thirst) do  {
			case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
			case 20: {
				hint localize "STR_NOTF_DrinkMSG_2";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
			case 10: {
				hint localize "STR_NOTF_DrinkMSG_3";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
		};
	};
};

_fnc_battery =
	{
		if(life_battery < 2) then {hint "Dein Akku ist leer.";}
		else
		{
			SUB(life_battery,5);
			[] call life_fnc_hudUpdate;
			if(life_battery < 2) then {hint "Dein Akku ist leer.";};
			switch(life_battery) do 
			{
				case 30: {hint "Akku hat noch 30%.";};
				case 20: {hint "Akku hat noch 20%.";};
				case 10: {hint "Akku hat noch 10%.";};
			};
		};
	};

//Setup the time-based variables.
_foodTime = time;
_waterTime = time;
_batteryTime = time;
_walkDis = 0;
_bp = "";
_lastPos = visiblePosition player;
_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
_lastState = vehicle player;

while {true} do {
	/* Thirst / Hunger adjustment that is time based */
	if((time - _waterTime) > 600) then {[] call _fnc_water; _waterTime = time;};
	if((time - _foodTime) > 850) then {[] call _fnc_food; _foodTime = time;};
	if((time - _batteryTime) > 610) then {[] call _fnc_battery; _batteryTime = time;};
	
	/* Adjustment of carrying capacity based on backpack changes */
	if(EQUAL(backpack player,"")) then {
		life_maxWeight = life_maxWeightT;
		_bp = backpack player;
	} else {
		if(!(EQUAL(backpack player,"")) && {!(EQUAL(backpack player,_bp))}) then {
			_bp = backpack player;
			life_maxWeight = life_maxWeightT + (round(FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_bp,"maximumload") / 4));
		};
	};
	
	/* Check if the player's state changed? */
	if(vehicle player != _lastState OR {!alive player}) then {
		[] call life_fnc_updateViewDistance;
		_lastState = vehicle player;
	};
	
	/* Check if the weight has changed and the player is carrying to much */
	if(life_carryWeight > life_maxWeight && {!isForcedWalk player}) then {
		player forceWalk true;
		if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
		hint localize "STR_NOTF_MaxWeight";
	} else {
		if(isForcedWalk player) then {
			player forceWalk false;
		};
	};
	
	/* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
	if(!alive player) then {_walkDis = 0;} else {
		_curPos = visiblePosition player;
		_curPos = (SEL(_curPos,0)) + (SEL(_curPos,1));
		if(!(EQUAL(_curPos,_lastPos)) && {(vehicle player == player)}) then {
			ADD(_walkDis,1);
			if(EQUAL(_walkDis,650)) then {
				_walkDis = 0;
				SUB(life_thirst,5);
				SUB(life_hunger,5);
				[] call life_fnc_hudUpdate;
			};
		};
		_lastPos = visiblePosition player;
		_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
	};
	uiSleep 1;
	
	if(player getVariable "missingOrgan") then
	{
		life_max_health = .50;
		while{(player getVariable "missingOrgan")} do {
			life_thirst =  50;
			life_hunger =  50;
			if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			sleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		life_max_health = 1;
	};
	
	if(life_inv_carCharger > 0) then
	{
		if((!(EQUAL(life_battery,100))) && (vehicle player != player) && (isEngineOn vehicle player)) then 
		{ 
			hintSilent "Ihr Handyakku wird nun geladen";
			_loadBattery = 0;
			while{true} do 
			{	if(EQUAL(_loadBattery,72)) then
				{
					ADD(life_battery,5); 
					[] call life_fnc_hudUpdate;
					_loadBattery = 0;
				};
				if(EQUAL(life_battery,100)) exitWith {hintSilent "Ihr Handyakku ist nun vollstaending geladen!"};
				if(!(vehicle player != player)) exitWith {hintSilent "Sie haben das Farhzeug verlassen, ihr Handyakku wird nicht mehr geladen!"};
				if(!(isEngineOn vehicle player)) exitWith {hintSilent "Sie haben den Motor ausgeschaltet, ihr Handyakku wird nicht mehr geladen!"};  
				uiSleep 5;
				ADD(_loadBattery,1);
			};
		};
	};
	
	if ((player distance (getMarkerPos "Warm_Marker") < 250) && (player getVariable["Revive",TRUE])) then // 250 was the toxic area change
	{
		if(uniform player == "U_C_Scientist") then // you will be safe when you get this uniform
		{
			hint "!!! WARNUNG RADIOAKTIVEZONE !!! IHR SCHUTZANZUG SCHUETZT SIE VOR DER STRAHLUNG!";
			sleep 5;
		}else
			{
			hint "!!! WARNUNG RADIOAKTIVEZONE !!!Sie werden sterben wenn Sie das gebiet nicht verlassen!";
			_damage = damage player;
			_damage = _damage + 0.1; // player lose 10hp/5 sec
			player setDamage (_damage);
			[] call life_fnc_hudUpdate;
			sleep 5;
		};
	};
	
	if(player distance (getMarkerPos "safezone_kavalla") < 30) then
	{
		if(EQUAL(LEVEL,0) && life_firstSpawn) then
		{
			[true,1500] spawn life_fnc_expConfig;
		};
	};
	
	if(life_drug > 0) then {
		while {true} do
		{
			waitUntil {(life_drug > 0)};

			if(life_drug > 0.08) then {
				sleep 60;
				[] spawn life_fnc_suechtig;
				hint "Sie sollten bei einen Notarzt vorbei schauen! Sie sind stark Drogensuechtig!";
				sleep 240;
			};
		};
	};
	
	if (life_drink > 0) then
	{
		waitUntil {(life_drink > 0)};
		while{(life_drink > 0)} do {
		
			if(life_drink > 0.08) then {
				"radialBlur" ppEffectEnable true;
				"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
				"radialBlur" ppEffectCommit 3;
				sleep 240;
				life_drink = life_drink - 0.02;
			} else {
				"radialBlur" ppEffectEnable true;
				"radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
				"radialBlur" ppEffectCommit 1;
				sleep 180;
				life_drink = life_drink - 0.02;
			};
		};
		
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		life_thirst = 0;
		
	};
	
	{
		_vehicle = vehicle player;
		_heli = typeOf _vehicle;
		if(EQUAL(_heli,"O_Heli_Transport_04_F") && (_vehicle distance (getMarkerPos "ADAC_Container") < 20)) then
		{	
			sleep 2;
			while {(_vehicle distance (getMarkerPos "ADAC_Container") < 20) && (player distance (getMarkerPos "ADAC_Container") < 20)} do
			{
				_container = "Land_Pod_Heli_Transport_04_repair_F";
				_marker = getMarkerPos "ADAC_Container";
				_time = (1*60);
				_timeUp = time + _time;

				while{true} do
				{
					if((round(_timeUp - time)) > 0) then {
					_countDown = [(_timeUp - time),"MM:SS"] call BIS_fnc_secondsToString;

					hintSilent parseText format["Reperaturcontainer wird bereitgestellt in<br/>%1",_countDown];
					};

					if((round(_timeUp - time)) == 0) exitWith {hint ""};
					sleep 0.1;
				};

				if((_heli isEqualTo "O_Heli_Transport_04_F") && (playerSide isEqualTo east)) then
				{
					_adac = _container createVehicle _marker;
					_adac allowDamage false;
					[[_adac,0],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
					[[_adac,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
					[[_adac,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
					_adac setVariable["Trunk",[[],0],true];
					[[],"life_containerTexture",true,false] spawn life_fnc_MP;
					_adac setVariable["gpsTrackerActivate",false,true];
					_adac allowDamage true;
					sleep 2;
					hint "Reperaturcontainer wurde bereitgestellt!";
				};
				if(count(nearestObjects[(getMarkerPos "ADAC_Container"),[_container],5]) == 0) exitWith {hint localize "STR_Shop_Veh_Block";};
				sleep (10*60);
			};
		};
	};
	
	if(player distance (getMarkerPos "Remove_Container") < 20) then
	{
		_container = "Land_Pod_Heli_Transport_04_repair_F";
		while {(player distance (getMarkerPos "Remove_Container") < 20)} do
		{
			_nearVehicles = nearestObjects[(getMarkerPos "Remove_Container"),[_container],20];
			hint "Laden Sie den Container ab!";
			sleep 10;
			while {(count _nearVehicles > 0) && ((playerSide isEqualTo east) OR (playerSide isEqualTo independent))} do
			{
				vehicle1 = [];
				_time = (1*60);
				_timeUp = time + _time;
				while{true} do
				{
					if((round(_timeUp - time)) > 0) then {
					_countDown = [(_timeUp - time),"MM:SS"] call BIS_fnc_secondsToString;
	
					hintSilent parseText format["Container wird eingelagert in<br/>%1",_countDown];
					};
		
					if((round(_timeUp - time)) == 0) exitWith {hint ""};
					sleep 0.1;
				};
				{
					if(!isNil "_vehicle") exitWith {}; //Kill the loop.
					_vehData = _x getVariable["vehicle_info_owners",[]];
					if(count _vehData  > 0) then
					{
						_vehOwner = (_vehData select 0) select 0;
						if((getPlayerUID player) == _vehOwner) exitWith
						{
							vehicle1 = _x;
						};
					};
				} foreach _nearVehicles;
				deleteVehicle vehicle1;
				sleep 10;
				hint "Der Container wurde eingelagert!";
				if(player distance (getMarkerPos "Remove_Container") > 20) exitWith {hint ""};
			};
			if(player distance (getMarkerPos "Remove_Container") > 20) exitWith {hint ""};
		};
	};
	
	/*if((EQUAL(typeOf vehicle player),"Land_Pod_Heli_Transport_04_medevac_F") && ((vehicle player) distance (getMarkerPos "Medic_Container") < 20)) then
	{
		_vehicle = vehicle player;
		_heli = typeOf _vehicle;
		_container = "Land_Pod_Heli_Transport_04_medevac_F";
		_marker = getMarkerPos "Medic_Container";
		_time = (1*60);
		_timeUp = time + _time;
			
		while{true} do
		{
			if((round(_timeUp - time)) > 0) then {
			_countDown = [(_timeUp - time),"MM:SS"] call BIS_fnc_secondsToString;
	
			hintSilent parseText format["Mediccontainer wird bereitgestellt in<br/>%1",_countDown];
			};
		
			if((round(_timeUp - time)) == 0) exitWith {hint ""};
			sleep 0.1;
		};
			
		if((_heli isEqualTo "O_Heli_Transport_04_F") && (playerSide isEqualTo independent)) then
		{
			_adac = _container createVehicle _marker;
			_adac allowDamage false;
			[[_adac,1],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
			[[_adac,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
			[[_adac,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
			_adac setVariable["Trunk",[[],0],true];
			[[],"life_containerTexture",true,false] spawn life_fnc_MP;
			_adac setVariable["gpsTrackerActivate",false,true];
			_adac allowDamage true;
			sleep 2;
			hint "Mediccontainer wurde bereitgestellt!";
		};
		if(count(nearestObjects[(getMarkerPos "Medic_Container"),[_container],5]) == 0) exitWith {hint localize "STR_Shop_Veh_Block";};
		sleep (10*60);
	};*/


	enableSentences false;
	sleep 20;



	_copmarkers = ["Vod","gang_area_2","turle_dealer_2","turle_dealer_1","turle_dealer","cocaine_1","cocaine_processing","weed_1","Weed_p_1","heroin_1","heroin_p","uran_1","uranp_1","frogs_1","frog_processing","meth_1","meth processing_1","schwarzmarkt_trader","schwarzmarkt_trader_1","Rebelop_1","gang_area_3","Rebelop_2","gang_area_3_2","ADAC-Heli","ADAC-Zubehör","ADAC-Fahrzeuge","Fahrzeuggarage_1_1","Markt/Zubehör_1_1","ADAC-Heli_1_1","ADAC-Heli_1","Fahrzeuggarage_1","Markt/Zubehör_1","fish_market_1_3","boat_2_1_2","S_1","Gen_4_1","hospital_marker_1","Gen_3_1_1_4","civ_gar_1_1_1_1","Waffenhändler_2","Waffenhändler_1_1","Gen_3_1_2","hospital_marker_1_1","Waffenhändler","Waffenhändler_1","civ_gar_1_1_1_1_2","civ_gar_1_1_1_1_1_1","hospital_marker_1_1_2","boat_2_1_2_1_1","Waffenhändler_4","reb_1_3_2_1_1","Gen_3_1_2_2"];

	if (playerSide == west) then {

	{ deleteMarkerLocal _x; } forEach _copmarkers;

	};

	_civmarkers = ["Polizei_Boote_1","Polizei_Hubschrauber_1","Polizei_Auto_1","Checkpoint_2","Militär_Auto_2","Militär_Hubschrauber_2","Polizei_Auto_2","Polizei_Hubschrauber_2","Checkpoint_3","Checkpoint_1","Checkpoint_2_1","Boote_2","S","Militär_Auto´s_1","Militär_Hubschrauber_1","Polizei_Auto_3","Polizei_Boote_Hubschrauber","Polizei_Boote_Hubschrauber_1","Start_2","xx_2_1","Sprung über Straße","xx_2","xx_1","xx","Start","Waldkampfbahn","Waldkampfbahn_1","Start_1","xx_3","xx_3_2","xx_3_5","xx_3_6","Start_2_1","xx_3_4","xx_3_3","xx_3_1","bi","Fallschirmsprungziel","Y_2","Y_1","Y","Flugzeugziele GBU-12","Heli/Flugzeugziele GBU-12_1","Kommandantur","Scharfschützen Bahn","Scharfschützen Bahn_2","Scharfschützen Bahn_1","Scharfschützen Bahn_1_1","Zielgruppen","xx_2_2_5_1","xx_2_2_5_2","xx_2_2_5_3","ADAC-Heli_1","Fahrzeuggarage_1","Markt/Zubehör_1","Fahrzeuggarage_1_1","Markt/Zubehör_1_1","ADAC-Heli_1_1","ADAC-Heli","ADAC-Zubehör","ADAC-Fahrzeuge","Checkpoint_1_1","Checkpoint_3_1","Checkpoint_2_1_2"];

	if (playerSide == civilian) then {

	{ deleteMarkerLocal _x; } forEach _civmarkers;

	},

	_medicmarkers = ["Vod","gang_area_2","Polizei_Boote_1","Polizei_Hubschrauber_1","Polizei_Auto_1","Checkpoint_2","Militär_Auto_2","Militär_Hubschrauber_2","Polizei_Auto_2","Polizei_Hubschrauber_2","Checkpoint_3","Checkpoint_1","Checkpoint_2_1","Boote_2","S","Militär_Auto´s_1","Militär_Hubschrauber_1","Polizei_Auto_3","Polizei_Boote_Hubschrauber","Polizei_Boote_Hubschrauber_1","Start_2","xx_2_1","Sprung über Straße","xx_2","xx_1","xx","Start","Waldkampfbahn","Waldkampfbahn_1","Start_1","xx_3","xx_3_2","xx_3_5","xx_3_6","Start_2_1","xx_3_4","xx_3_3","xx_3_1","bi","Fallschirmsprungziel","Y_2","Y_1","Y","Flugzeugziele GBU-12","Heli/Flugzeugziele GBU-12_1","Kommandantur","Scharfschützen Bahn","Scharfschützen Bahn_2","Scharfschützen Bahn_1","Scharfschützen Bahn_1_1","Zielgruppen","xx_2_2_5_1","xx_2_2_5_2","xx_2_2_5_3","ADAC-Heli_1","Fahrzeuggarage_1","Markt/Zubehör_1","Fahrzeuggarage_1_1","Markt/Zubehör_1_1","ADAC-Heli_1_1","ADAC-Heli","ADAC-Zubehör","ADAC-Fahrzeuge","Checkpoint_1_1","Checkpoint_3_1","Checkpoint_2_1_2"];

	if (playerSide == independent) then {

	{ deleteMarkerLocal _x; } forEach _medicmarkers;

	},

	_adacmarkers = ["Vod","gang_area_2","Polizei_Boote_1","Polizei_Hubschrauber_1","Polizei_Auto_1","Checkpoint_2","Militär_Auto_2","Militär_Hubschrauber_2","Polizei_Auto_2","Polizei_Hubschrauber_2","Checkpoint_3","Checkpoint_1","Checkpoint_2_1","Boote_2","S","Militär_Auto´s_1","Militär_Hubschrauber_1","Polizei_Auto_3","Polizei_Boote_Hubschrauber","Polizei_Boote_Hubschrauber_1","Start_2","xx_2_1","Sprung über Straße","xx_2","xx_1","xx","Start","Waldkampfbahn","Waldkampfbahn_1","Start_1","xx_3","xx_3_2","xx_3_5","xx_3_6","Start_2_1","xx_3_4","xx_3_3","xx_3_1","bi","Fallschirmsprungziel","Y_2","Y_1","Y","Flugzeugziele GBU-12","Heli/Flugzeugziele GBU-12_1","Kommandantur","Scharfschützen Bahn","Scharfschützen Bahn_2","Scharfschützen Bahn_1","Scharfschützen Bahn_1_1","Zielgruppen","xx_2_2_5_1","xx_2_2_5_2","xx_2_2_5_3","Checkpoint_1_1","Checkpoint_3_1","Checkpoint_2_1_2"];

	if (playerSide == east) then {

	{ deleteMarkerLocal _x; } forEach _adacmarkers;

	};
};
	
	
	
