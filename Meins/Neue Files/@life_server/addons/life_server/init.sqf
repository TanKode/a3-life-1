[] execVM "@AH\run.sqf";
#include "script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Initialize the server and required systems.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
life_server_extDB_notLoaded = "";
serv_sv_use = [];
PVAR_ALL("life_server_isReady");

/*
	Prepare extDB before starting the initialization process
	for the server.
*/
if(isNil {GVAR_UINS "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	CONSTVAR(life_sql_id);
	SVAR_UINS ["life_sql_id",life_sql_id];

	//Retrieve extDB version
	_result = EXTDB "9:VERSION";
	["diag_log",[format["extDB: Version: %1",_result]]] call TON_fnc_logIt;
	if(EQUAL(_result,"")) exitWith {EXTDB_FAILED("The server-side extension extDB was not loaded into the engine, report this to the server admin.")};
	if ((parseNumber _result) < 35) exitWith {EXTDB_FAILED("extDB version is not compatible with current Altis life version. Require version 35 or higher.")};
	//Lets start logging in extDB
	EXTDB "9:ADD:LOG:SPY_LOG:spyglass.log";
	//Initialize connection to Database
	_result = EXTDB format["9:DATABASE:%1",DATABASE_SELECTION];
	if(!(EQUAL(_result,"[1]"))) exitWith {EXTDB_FAILED("extDB: Error with Database Connection")};
	_result = EXTDB format["9:ADD:DB_CUSTOM_v5:%1:altis-life-rpg-4",FETCH_CONST(life_sql_id)];
	if(!(EQUAL(_result,"[1]"))) exitWith {EXTDB_FAILED("extDB: Error with Database Connection")};
	//Initialize Logging options from extDB
	if((EQUAL(EXTDB_SETTINGS("LOG"),1))) then {
		{
			EXTDB format["9:ADD:LOG:%1:%2",SEL(_x,0),SEL(_x,1)];
			["diag_log",[format["extDB: %1 is successfully added",SEL(_x,0)]]] call TON_fnc_logIt;
		} forEach EXTDB_LOGAR;
	};
	//Initialize RCON options from extDB
	if((EQUAL(EXTDB_SETTINGS("RCON"),1))) then {
		RCON_ID = round(random(9999));
		CONSTVAR(RCON_ID);
		SVAR_UINS ["RCON_ID",RCON_ID];

		EXTDB format["9:START_RCON:%1",RCON_SELECTION];
		EXTDB format["9:ADD:RCON:%1",FETCH_CONST(RCON_ID)];
		["diag_log",["extDB: RCON is enabled"]] call TON_fnc_logIt;
	};
	//Initialize VAC options from extDB
	if((EQUAL(EXTDB_SETTINGS("VAC"),1))) then {
		VAC_ID = round(random(9999));
		CONSTVAR(VAC_ID);
		SVAR_UINS ["VAC_ID",VAC_ID];

		EXTDB "9:START_VAC";
		EXTDB format["9:ADD:VAC:%1",FETCH_CONST(VAC_ID)];
		["diag_log",["extDB: VAC is enabled"]] call TON_fnc_logIt;
	};
	//Initialize MISC options from extDB
	if((EQUAL(EXTDB_SETTINGS("MISC"),1))) then {
		MISC_ID = round(random(9999));
		CONSTVAR(MISC_ID);
		SVAR_UINS ["MISC_ID",MISC_ID];

		EXTDB format["9:ADD:MISC:%1",FETCH_CONST(MISC_ID)];
		["diag_log",["extDB: MISC is enabled"]] call TON_fnc_logIt;
	};
	EXTDB "9:LOCK";
	["diag_log",["extDB: Connected to the Database"]] call TON_fnc_logIt;
} else {
	life_sql_id = GVAR_UINS "life_sql_id";
	CONSTVAR(life_sql_id);
	["diag_log",["extDB: Still Connected to the Database"]] call TON_fnc_logIt;
	if((EQUAL(EXTDB_SETTINGS("RCON"),1))) then {
		RCON_ID = GVAR_UINS "RCON_ID";
		CONSTVAR(RCON_ID);
		["diag_log",["extDB: RCON still enabled"]] call TON_fnc_logIt;
	};
	if((EQUAL(EXTDB_SETTINGS("VAC"),1))) then {
		VAC_ID = GVAR_UINS "VAC_ID";
		CONSTVAR(VAC_ID);
		["diag_log",["extDB: VAC still enabled"]] call TON_fnc_logIt;
	};
	if((EQUAL(EXTDB_SETTINGS("MISC"),1))) then {
		MISC_ID = GVAR_UINS "MISC_ID";
		CONSTVAR(MISC_ID);
		["diag_log",["extDB: MISC still enabled"]] call TON_fnc_logIt;
	};
};

if(!(EQUAL(life_server_extDB_notLoaded,""))) exitWith {}; //extDB did not fully initialize so terminate the rest of the initialization process.

/* Run stored procedures for SQL side cleanup */
["resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["deleteOldHouses",1] spawn DB_fnc_asyncCall;
["deleteOldGangs",1] spawn DB_fnc_asyncCall;
//["deleteOldContract",1] spawn DB_fnc_asyncCall;

/* Map-based server side initialization. */
master_group attachTo[bank_obj,[0,0,0]];
onMapSingleClick "if(_alt) then {vehicle player setPos _pos};"; //Local debug for myself

{
	_hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "NONE"];
	_hs setDir (markerDir _x);
	_hs setPosATL (getMarkerPos _x);
	_var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [4.69775,32.6045,-0.1125]];
	detach _var;
	_var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [-28.0336,-10.0317,0.0889387]];
	detach _var;
	{
		_var = createTrigger [ "EmptyDetector", _hs modelToWorld _x ];
		_var setVariable ["parent", _hs];
		_var setTriggerArea [5, 5, 0, false];
		_var setTriggerActivation ["ANY", "PRESENT", true];
		_var setTriggerStatements [ "this", format [ " (thisTrigger getVariable 'parent') animate ['Door_%1A_move', 1]; (thisTrigger getVariable 'parent') animate ['Door_%1B_move', 1]; ", _forEachIndex + 2 ], format [ " (thisTrigger getVariable 'parent') animate ['Door_%1A_move', 0]; (thisTrigger getVariable 'parent') animate ['Door_%1B_move', 0]; ", _forEachIndex + 2 ] ];
		_hs setVariable [format [ "bis_disabled_Door_%1", _forEachIndex + 2 ], 1, true];
	} forEach [ [2.80469,15.7993,-8.47323], [2.78027,7.52686,-8.4725], [-4.17358,-7.89453,-8.4725] ]
} foreach ["hospital_2","hospital_3"];

{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

[8,true,12] execFSM "\life_server\FSM\timeModule.fsm";

life_adminLevel = 0;
life_medicLevel = 0;
life_copLevel = 0;
life_adaclevel = 0;
life_rebellevel = 0;
D41_Blitze = 0;

CONST(JxMxE_PublishVehicle,"false");

/* Setup radio channels for west/independent/civilian */
life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

/* Set the amount of gold in the federal reserve at mission start */
fed_bank setVariable ["safe",count playableUnits,true];
[] spawn TON_fnc_federalUpdate;

/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] call compile PreProcessFileLineNumbers "\life_server\functions.sqf";
[] call compile PreProcessFileLineNumbers "\life_server\eventhandlers.sqf";
[] execVM "\life_server\scripts\Custom\fn_D41_RandomBlitze.sqf";

/* Gang */
life_gang_list = [];
publicVariable "life_gang_list";

/* Atlantis */
life_cops_online = 0;
publicVariable "life_cops_online";

/* Base */
baseShops1 = [];
baseShops2 = [];
baseFire = [];
publicVariable "baseShops1";
publicVariable "baseShops2";
publicVariable "baseFire";

/* Auftragsbuch */
life_auftraege = [];
publicVariable "life_auftraege";

/* Miscellaneous mission-required stuff */
//[] spawn TON_fnc_cleanup;
life_wanted_list = [];
//[] execFSM "\life_server\FSM\cleanup.fsm";

/*[] spawn
{
	private["_logic","_queue"];
	while {true} do {
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];

		{
			_x setVariable["sellers",[],true];
		} foreach [Kavala,Galati,Therisa];
	};
};*/

[] spawn 
{	// 6 Stunden
	_ServerTime = time + 21600;
	while{true} do
	{
		life_serverTime = [(_ServerTime - time),"HH:MM"] call BIS_fnc_secondsToString;
		publicVariable "life_serverTime";
		uiSleep 59;
		if((round(_ServerTime - time)) <= 18000) exitWith {hint ""};
	};
	// 5 Stunden
	_ServerTime = time + 18000;
	while{true} do
	{
		life_serverTime = [(_ServerTime - time),"HH:MM"] call BIS_fnc_secondsToString;
		publicVariable "life_serverTime";
		uiSleep 59;
		if((round(_ServerTime - time)) <= 14400) exitWith {hint ""};
	};
	// 4 Stunden
	_ServerTime = time + 14400;
	while{true} do
	{
		life_serverTime = [(_ServerTime - time),"HH:MM"] call BIS_fnc_secondsToString;
		publicVariable "life_serverTime";
		uiSleep 59;
		if((round(_ServerTime - time)) <= 10800) exitWith {hint ""};
	};
	// 3 Stunden
	_ServerTime = time + 18000;
	while{true} do
	{
		life_serverTime = [(_ServerTime - time),"HH:MM"] call BIS_fnc_secondsToString;
		publicVariable "life_serverTime";
		uiSleep 59;
		if((round(_ServerTime - time)) <= 7200) exitWith {hint ""};
	};
	// 2 Stunden
	_ServerTime = time + 7200;
	while{true} do
	{
		life_serverTime = [(_ServerTime - time),"HH:MM"] call BIS_fnc_secondsToString;
		publicVariable "life_serverTime";
		uiSleep 59;
		if((round(_ServerTime - time)) <= 3600) exitWith {hint ""};
	};
	// 1 Stunde
	_ServerTime = time + 3600;
	while{true} do
	{
		life_serverTime = [(_ServerTime - time),"HH:MM"] call BIS_fnc_secondsToString;
		publicVariable "life_serverTime";
		uiSleep 59;
	};
};

//spawn as thread
[] spawn TON_fnc_initHouses;
//[] spawn TON_fnc_vehicleRefresh;
//[] spawn TON_fnc_bruecke;
[] spawn TON_fnc_hausweg;
//[] spawn TON_fnc_zafarias_kartbahn;
//[] spawn TON_fnc_grenze;
//[] spawn TON_fnc_dealerMarker;
//[] spawn TON_fnc_dealerSpawnKavala;
//[] spawn TON_fnc_dealerSpawnDorida;
//[] spawn TON_fnc_dealerSpawnGalati;
//[] spawn TON_fnc_dealerAnzeige;
[] spawn life_fnc_scriptsave;
//[] spawn life_fnc_TaruScriptSave;
[] spawn life_fnc_CraftScriptSave;
[] spawn life_fnc_AufScriptSave;
[] spawn life_fnc_skillScriptSave;
[] spawn TON_fnc_initTrunk; // Base Sytem
[] spawn TON_fnc_initBase;	// Base Sytem
[] spawn TON_fnc_spawnobj;	// Base Sytem

[] execVM "\life_server\scripts\GunStore\GunStoreCreate.sqf";
[] execVM "\life_server\scripts\adac\script_australia_adac.sqf";
[] execVM "\life_server\scripts\militaer\script_australia_militaer.sqf";
[] execVM "\life_server\scripts\melbourne\script_australia_melbourne.sqf";
[] execVM "\life_server\scripts\minen\script_australia_aust_silber.sqf";
[] execVM "\life_server\scripts\minen\script_australia_gebirge_hoehlensystem.sqf";
//[] execVM "\life_server\scripts\Custom\fn_vehicleRefresh.sqf";
//[] execVM "\life_server\scripts\Custom\fn_bruecke.sqf";
//[] execVM "\life_server\scripts\Custom\fn_hausweg.sqf";
//[] execVM "\life_server\scripts\Custom\fn_zafarias_kartbahn.sqf";
//[] execVM "\life_server\scripts\paintball\zafarias_paintballarena.sqf";

/* DynMarket */
[] execVM "\life_server\Functions\DynMarket\fn_config.sqf";
/*
_handle = [] spawn compile PreprocessFileLineNumbers "\life_server\scripts\Custom\fn_vehicleRefresh.sqf";
waitUntil {scriptDone _handle};
_handle = [] spawn compile PreprocessFileLineNumbers "\life_server\scripts\Custom\fn_bruecke.sqf";
waitUntil {scriptDone _handle};
_handle = [] spawn compile PreprocessFileLineNumbers "\life_server\scripts\Custom\fn_hausweg.sqf";
waitUntil {scriptDone _handle};
_handle = [] spawn compile PreprocessFileLineNumbers "\life_server\scripts\Custom\fn_zafarias_kartbahn.sqf";
waitUntil {scriptDone _handle};
_handle = [] spawn compile PreprocessFileLineNumbers "\life_server\scripts\paintball\zafarias_paintballarena.sqf";
waitUntil {scriptDone _handle};
*/
/* Setup the federal reserve building(s) */
private["_dome","_rsb"];
_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;


//Custom Content
//[] execVM "\life_server\scripts\Custom\fn_spawnGold.sqf";
//call compile preProcessFileLineNumbers "\life_server\SHK_pos\shk_pos_init.sqf";
//gold_safe setVariable["gold",round(random 50),true];
//[] spawn TON_fnc_goldUpdate;

//Make Friends on the Server
east setFriend [west, 1];
west setFriend [east, 1];
civilian setFriend [east, 1];
east setFriend [civilian, 1];
independent setFriend [east, 1];
east setFriend [independent, 1];

[] execVM "\life_server\scripts\airdrop\config.sqf";

/* Initialize hunting zone(s) */
["hunting_zone",80] spawn TON_fnc_huntingZone;

//Atlantis
[] spawn {
	waitUntil{(life_cops_online > 2)};
	[] execVM "\life_server\scripts\Custom\fn_atlantis.sqf";
};

// Convoy
[] execVM "\life_server\scripts\ConvoySM\fn_startConvoy.sqf";
//AH
[] execVM "\life_server\scripts\Auktionshaus\fn_SAH_looper.sqf";

// ADD AT THE VERY BOTTOM
_query = format["gov_getTaxes"];
_queryResult = [_query,2] call DB_fnc_asyncCall;
life_taxes = _queryResult select 0;
publicVariable "life_taxes";

//paintball
life_paintball_group = [];
publicVariable "life_paintball_group";
paintballGroup1 = true;
publicVariable "paintballGroup1";
paintballGroup2 = true;
publicVariable "paintballGroup2";
life_GameOn = false;
publicVariable "life_GameOn";
pb_spieler = [[],[]];
pb_spielstatus = 0;
pb_maxspieler = 20;

/* Tell clients that the server is ready and is accepting queries */
life_server_isReady = true;
PVAR_ALL("life_server_isReady");