#include <macro.h>
/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",
		'(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped' ]];
		//Rob person
		life_actions pushBack [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",
		'!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"] && !(cursorTarget getVariable["robbed",FALSE])' ]];
		
		//##90
		life_actions pushBack [player addAction["Ausrauben",life_fnc_robAction,"",0,false,false,"",
		'!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && !(cursorTarget getVariable["robbed",FALSE]) && (cursorTarget getVariable["restrained",FALSE])' ]];
		
		//Speedtrap hacking
        life_actions pushBack [player addAction["<t color='#FF0000'>Daten hacken</t>",king_fnc_speedtrapHack,0,10,false,false,"",
        '_speedtrap = nearestObjects[getPos player,["Land_Runway_PAPI_4"],8] select 0; !isNil "_speedtrap" && !(_speedtrap getVariable "speedtrap_registered")' ]];
		
		//skill Heal
		life_actions pushBack (player addAction["<t color='#FF0000'>Erste Hilfe 100%</t>",life_fnc_heal,"",99,false,false,"",
		' vehicle player == player && (damage player) > 0.25 && skill_civ_heal && ("FirstAidKit" in (items player)) && (currentWeapon player == "")']);

	};
	
	case west:
	{
		//Medikit self
		life_actions pushBack [player addAction["Medikit verwenden",life_fnc_fullheal,"self",99,false,false,"",' vehicle player == player && (damage player) > 0.01 && ("Medikit" in (items player))']]; 
		//Medikit cursorTarget
		life_actions pushBack [player addAction["Medikit verwenden",life_fnc_fullheal,"",99,false,false,"",' vehicle player == player && (damage cursorTarget) > 0.01 && ("Medikit" in (items player))']]; 
		//Strassensperre aufheben
		life_actions pushBack [player addAction[localize "STR_ISTR_Mauer_Pack",life_fnc_packupmauer,"RoadBarrier_F",0,false,false,"",
		'_mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && (_mauer getVariable "mauerDown")']];
		//Strassensperre Licht AN
		life_actions pushBack [player addAction[localize "STR_ISTR_Mauer_Licht_An",life_fnc_mauerLights,[cursorTarget,0],0,false,false,"",
		'_mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && (_mauer getVariable "lightsOn")']];
		//Strassensperre Licht AUS
		life_actions pushBack [player addAction[localize "STR_ISTR_Mauer_Licht_Aus",life_fnc_mauerLights,[cursorTarget,0],0,false,false,"",
		'_mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && !(_mauer getVariable "lightsOn")']];

		//Kegel aufheben
		life_actions pushBack [player addAction[localize "STR_ISTR_Vehhut_Pack",life_fnc_packupvehhut,cursorTarget,0,false,false,"",
		'_vehhut = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_vehhut" && !isNil {(_vehhut getVariable "item")} && (_vehhut getVariable "vehhutDown")']];
		
		//Seize Objects
		life_actions pushBack [player addAction["<t color='#FF0000'>Gegenstände beschlagnahmen</t>",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
		//##106
		//BD MK1
		life_actions pushBack [player addAction["<t color='#FF0000'>BD-MKI 'Fuel Killer' WARNUNG</t>",life_fnc_BirdDownWarning,"BDMK1",1,false,true,"",'!bg_time && (!(isNull (vehicle player))) && (vehicle player) isKindOf "Air" ']];		
		
		life_actions pushBack [player addAction["<t color='#FF0000'>BD-MKI 'Fuel Killer' abfeuern</t>",life_fnc_fireBirdDown,"BDMK1",1,false,true,"",'bg_time && (!(isNull (vehicle player))) && (vehicle player) isKindOf "Air" ']];
		//Speedtrap
        life_actions pushBack [player addAction["<t color='#FF0000'>Einschalten</t>",king_fnc_speedtrapActivate,cursorTarget,10,false,false,"",
        '_speedtrap = nearestObjects[getPos player,["Land_Runway_PAPI_4"],8] select 0; !isNil "_speedtrap" && !(_speedtrap getVariable "speedtrap_active") && !(_speedtrap getVariable "speedtrap_registered") ']];
        life_actions pushBack [player addAction["<t color='#FF0000'>Ausschalten</t>",king_fnc_speedtrapActivate,cursorTarget,10,false,false,"",
        '_speedtrap = nearestObjects[getPos player,["Land_Runway_PAPI_4"],8] select 0; !isNil "_speedtrap" && (_speedtrap getVariable "speedtrap_active") && !(_speedtrap getVariable "speedtrap_registered") ']]; 
        life_actions pushBack [player addAction["<t color='#FF0000'>Film rausholen</t>",king_fnc_speedtrapGetPhotoList,1,10,false,false,"",
        '_speedtrap = nearestObjects[getPos player,["Land_Runway_PAPI_4"],8] select 0; !isNil "_speedtrap" && (_speedtrap getVariable "speedtrap_registered") ']];       
        life_actions pushBack [player addAction["<t color='#FF0000'>Daten anschauen</t>",king_fnc_speedtrapGetPhotoList,0,10,false,false,"",
        '_speedtrap = nearestObjects[getPos player,["Land_Runway_PAPI_4"],8] select 0; !isNil "_speedtrap" && (_speedtrap getVariable "speedtrap_registered") ']];       
        life_actions pushBack [player addAction["<t color='#FF0000'>Geschwindigkeit setzen</t>",king_fnc_speedtrapSetSpeedLimit,cursorTarget,10,false,false,"",
        '_speedtrap = nearestObjects[getPos player,["Land_Runway_PAPI_4"],8] select 0; !isNil "_speedtrap" && (_speedtrap getVariable "speedtrap_registered") ']];
        life_actions pushBack [player addAction["<t color='#FF0000'>Abbauen</t>",king_fnc_speedtrapRemove,cursorTarget,10,false,false,"",
        '_speedtrap = nearestObjects[getPos player,["Land_Runway_PAPI_4"],8] select 0; !isNil "_speedtrap" && (_speedtrap getVariable "speedtrap_registered") ']];
	};
	
	case independent:
	{
		// take them organs
		life_actions pushBack [player addAction["<t color='#00FF00'>Organ Transplantieren</t>",life_fnc_organTransplantKit,"",0,false,false,"",
		'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && (cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
	};
	
	case east:
	{
		//werkzeugkasten
		life_actions pushBack [player addAction["<t color='#FF0000'>Werkzeugkasten aufheben</t>",life_fnc_packupwkasten,"",0,false,false,"",' _wkasten = nearestObjects[getPos player,["Land_ToolTrolley_02_F"],8] select 0; !isNil "_wkasten" && !isNil {(_wkasten getVariable "item")}']];
		
		//Kegel aufheben
		life_actions pushBack [player addAction[localize "STR_ISTR_Vehhut_Pack",life_fnc_packupvehhut,cursorTarget,0,false,false,"",
		'_vehhut = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_vehhut" && !isNil {(_vehhut getVariable "item")} && (_vehhut getVariable "vehhutDown")']];
		
		//Strassensperre aufheben
		life_actions pushBack [player addAction[localize "STR_ISTR_Mauer_Pack",life_fnc_packupmauer,"RoadBarrier_F",0,false,false,"",
		'_mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && (_mauer getVariable "mauerDown")']];
		//Strassensperre Licht AN
		life_actions pushBack [player addAction[localize "STR_ISTR_Mauer_Licht_An",life_fnc_mauerLights,[cursorTarget,1],0,false,false,"",
		'_mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && (_mauer getVariable "lightsOn")']];
		//Strassensperre Licht AUS
		life_actions pushBack [player addAction[localize "STR_ISTR_Mauer_Licht_Aus",life_fnc_mauerLights,[cursorTarget,1],0,false,false,"",
		'_mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && !(_mauer getVariable "lightsOn")']];

		//ADAC Service
		//life_actions pushBack [player addAction["<t color='#0000FF'>ADAC</t>",life_fnc_serviceTruck,"",99,false,false,"",' (call life_adaclevel) > 0 && (typeOf (vehicle player) == "C_Offroad_01_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
	};
};
//JailWork
//life_actions pushBack [player addAction["<t color='#00FF00'>Steine sammeln</t>",king_fnc_jailWorkGather,1,10,true,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_AncientPillar_fallen_F") && (cursorTarget getVariable "king_jail_work_source_registered")']];
//life_actions pushBack [player addAction["<t color='#00FF00'>Steine ablegen</t>",king_fnc_jailWorkDrop,1,10,true,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 10 && (cursorTarget isKindOf "Land_CratesWooden_F") && (cursorTarget getVariable "king_jail_work_destination_registered")']];


//Action key link BUGGY //HACKFIX working?
//life_actions pushBack [player addAction["Aktion ...",life_fnc_actionKeyHandler,"",0,false,true]];

//life_actions pushBack [player addAction["<t color='#0000FF'>ADAC</t>",life_fnc_serviceTruck,"",99,false,false,"",' (call life_adaclevel) > 0 && (typeOf (vehicle player) == "C_Offroad_01_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];

//Hinsetzen
life_actions pushBack [player addAction["<t color='#0099FF'>Hinsetzen</t>",life_fnc_sitDown,cursorTarget,10,false,false,"",
' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V1_F" || cursorTarget isKindOf "Land_ChairWood_F")']];
//Aufstehen
life_actions pushBack [player addAction["<t color='#0099FF'>Aufstehen</t>", life_fnc_sitDown,cursorTarget,10,false,false,"",
'life_sitting']];

/*
	Undecided actions
life_actions pushBack [player addAction["Repair Vehicle ($500)",life_fnc_pumpRepair,"",999,false,false,"",
' vehicle player != player && (typeOf cursorTarget == "Land_fs_feed_F") && (vehicle player) distance cursorTarget < 6 ']];
life_actions pushBack [player addAction["Place Spike Strip",{if(!isNull life_spikestrip) then {detach life_spikeStrip; life_spikeStrip = ObjNull;};},"",999,false,false,"",'!isNull life_spikestrip']];
//Use Chemlights in hand
life_actions pushBack [player addAction["Chemlight (RED) in Hand",life_fnc_chemlightUse,"red",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_red" in (magazines player) && vehicle player == player ']];
life_actions pushBack [player addAction["Chemlight (YELLOW) in Hand",life_fnc_chemlightUse,"yellow",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_yellow" in (magazines player) && vehicle player == player ']];
life_actions pushBack [player addAction["Chemlight (GREEN) in Hand",life_fnc_chemlightUse,"green",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_green" in (magazines player) && vehicle player == player ']];
life_actions pushBack [player addAction["Chemlight (BLUE) in Hand",life_fnc_chemlightUse,"blue",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_blue" in (magazines player) && vehicle player == player ']];
//Drop Chemlight
life_actions pushBack [player addAction["Drop Chemlight",{if(isNil "life_chemlight") exitWith {};if(isNull life_chemlight) exitWith {};detach life_chemlight; life_chemlight = nil;},"",-1,false,false,"",'!isNil "life_chemlight" && !isNull life_chemlight && vehicle player == player ']];
//Custom Heal
life_actions pushBack [player addAction["<t color='#FF0000'>Heal Self</t>",life_fnc_heal,"",99,false,false,"",' vehicle player == player && (damage player) > 0.25 && ("FirstAidKit" in (items player)) && (currentWeapon player == "")']];
//Custom Repair
life_actions pushBack [player addAction["<t color='#FF0000'>Repair Vehicle</t>",life_fnc_repairTruck,"",99,false,false,"", ' vehicle player == player && !isNull cursorTarget && ((cursorTarget isKindOf "Car") OR (cursorTarget isKindOf "Air") OR (cursorTarget isKindOf "Ship")) && (damage cursorTarget) > 0.001 && ("ToolKit" in (backpackItems player)) && (player distance cursorTarget < ((boundingBox cursorTarget select 1) select 0) + 2) ']];
//Service Truck Stuff
life_actions pushBack [player addAction["<t color='#0000FF'>Service Nearest Car</t>",life_fnc_serviceTruck,"",99,false,false,"",' (typeOf (vehicle player) == "C_Offroad_01_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
life_actions pushBack
[player addAction["Push",life_fnc_pushVehicle,"",0,false,false,"",
'!isNull cursorTarget && player distance cursorTarget < 4.5 && cursorTarget isKindOf "Ship"']];
*/
