#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
DB_Async_ExtraLock = false;
bambusfarm_server_isReady = false;
publicVariable "bambusfarm_server_isReady";

[] execVM "\bambusfarm_server\functions.sqf";
[] execVM "\bambusfarm_server\eventhandlers.sqf";

//I am aiming to confuse people including myself, ignore the ui checks it's because I test locally.

//_extDB = false;

//Only need to setup extDB once.
if ( isNil {uiNamespace getVariable "bambusfarm_sql_id"}) then
{

	_result = call compile ("extDB2" callExtension "9:ADD_DATABASE:Database2");

	_bambusfarm_sql_id = str(round(random(999999)));
	bambusfarm_sql_id = compileFinal _bambusfarm_sql_id;
	_result = call compile ("extDB2" callExtension "9:START_RCON:RCON");
	_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:Database2:SQL_RAW:%1:ADD_QUOTES",_bambusfarm_sql_id]);
	"extDB2" callExtension "9:LOCK";

	uiNamespace setVariable ["bambusfarm_sql_id", _bambusfarm_sql_id];
}
else
{
	bambusfarm_sql_id = uiNamespace getVariable "bambusfarm_sql_id";
	__CONST__(bambusfarm_sql_id,bambusfarm_sql_id);
};

//Broadbase PV to Clients, to warn about extDB Error.
//	exitWith to stop trying to run rest of Server Code
/*
if (!_extDB) exitWith {
	bambusfarm_server_extDB_notLoaded = true;
	publicVariable "bambusfarm_server_extDB_notLoaded";
	diag_log "extDB: Error checked extDB/logs for more info";
};
*/

//Run procedures for SQL cleanup on mission start.
["CALL resetbambusfarmVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteOldHouses",1] spawn DB_fnc_asyncCall;
["CALL deleteOldGangs",1] spawn DB_fnc_asyncCall; //Maybe delete old gangs

bambusfarm_adminlevel = 0;
bambusfarm_medicLevel = 0;
bambusfarm_coplevel = 0;
bambusfarm_donatorlevel = 0;
//bambusfarm_civilcop = 0;

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");

//[] execVM "\bambusfarm_server\fn_initHC.sqf";

bambusfarm_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
bambusfarm_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
bambusfarm_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

serv_sv_use = [];

fed_bank setVariable["safe",(count playableUnits),true];

//General cleanup for clients disconnecting.
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}]; //Do not second guess this, this can be stacked this way.

[] spawn TON_fnc_cleanup;
bambusfarm_gang_list = [];
publicVariable "bambusfarm_gang_list";
bambusfarm_wanted_list = [];
client_session_list = [];

[] execFSM "\bambusfarm_server\cleanup.fsm";
[
    60*10, // seconds to delete dead bodies (0 means don't delete)
    8*60, // seconds to delete dead vehicles (0 means don't delete)
    6*60, // seconds to delete immobile vehicles (0 means don't delete)
    2*60, // seconds to delete dropped weapons (0 means don't delete)
    10*60, // seconds to deleted planted explosives (0 means don't delete)
    60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM "\bambusfarm_server\repetitive_cleanup.sqf";

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[] spawn TON_fnc_federalUpdate;

[] spawn
{
	while {true} do
	{
		sleep (30 * 60);
		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2,Dealer_3];
	};
};

//Strip NPC's of weapons
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

[] spawn TON_fnc_initHouses;

//Lockup the dome
private["_dome","_rsb"];
_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;
bambusfarm_server_isReady = true;
publicVariable "bambusfarm_server_isReady";

[] execVM "\bambusfarm_server\Functions\DynMarket\fn_config.sqf";