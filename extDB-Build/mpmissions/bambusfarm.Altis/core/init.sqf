#include <macro.h>
/*
	Master client initialization file
*/
bambusfarm_firstSpawn = true;
bambusfarm_session_completed = false;
private["_handle","_timeStamp"];
//["Setting up Server","Creating Risk-Your-bambusfarm essential event handlers to operation."] call TON_fnc_showMsg;
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis bambusfarm Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
//Setup initial client core functions
diag_log "::Risk-Your-bambusfarm:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
//["::Risk-Your-bambusfarm::"," Variables initialized"] call TON_fnc_showMsg;
0 cutFadeOut 9999999;
diag_log "::Risk-Your-bambusfarm:: Variables initialized";
diag_log "::Risk-Your-bambusfarm:: Setting up Eventhandlers";
[] call bambusfarm_fnc_setupEVH;
//["::Risk-Your-bambusfarm::"," Setting up Eventhandlers"] call TON_fnc_showMsg;
0 cutFadeOut 9999999;
diag_log "::Risk-Your-bambusfarm:: Eventhandlers completed";
diag_log "::Risk-Your-bambusfarm:: Setting up user actions";
[] call bambusfarm_fnc_setupActions;
diag_log "::Risk-Your-bambusfarm:: User actions completed";
diag_log "::Risk-Your-bambusfarm:: Waiting for server functions to transfer..";
//["::Bambusfarm Community::"," Waiting for server functions to transfer.."] call TON_fnc_showMsg;
0 cutFadeOut 9999999;
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::Bambusfarm Community:: Received server functions.";
//["::Bambusfarm Community::"," Received server functions."] call TON_fnc_showMsg;
0 cutFadeOut 9999999;
diag_log "::Bambusfarm Community:: Waiting for the server to be ready..";
waitUntil{!isNil "bambusfarm_server_isReady"};
/*waitUntil{(bambusfarm_server_isReady OR !isNil "bambusfarm_server_extDB2_notLoaded")};
if(!isNil "bambusfarm_server_extDB2_notLoaded") exitWith {
	diag_log "::Bambusfarm Community:: Server did not load extDB";
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};*/
[] call SOCK_fnc_dataQuery;
waitUntil {bambusfarm_session_completed};
//["::Client::"," We are almost Done."] call TON_fnc_showMsg;
0 cutFadeOut 9999999;

//diag_log "::bambusfarm Client:: Group Base Execution";
[] spawn bambusfarm_fnc_escInterupt;

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn bambusfarm_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	
	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn bambusfarm_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	
	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn bambusfarm_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
};

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call bambusfarm_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis bambusfarm Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
bambusfarm_sidechat = true;
[[player,bambusfarm_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn bambusfarm_fnc_MP;
0 cutText ["","BLACK IN"];
[] call bambusfarm_fnc_hudSetup;
bambusfarm_ID_PlayerTags = ["bambusfarm_PlayerTags","onEachFrame","bambusfarm_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
bambusfarm_ID_RevealObjects = ["bambusfarm_RevealObjects","onEachFrame","bambusfarm_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call bambusfarm_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
bambusfarm_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

bambusfarm_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	bambusfarm_BANK = bambusfarm_BANK + _price;
";

[] execVM "core\init_survival.sqf";
[] execVM "core\initHTB.sqf";
[] spawn bambusfarm_fnc_showDirect;

__CONST__(bambusfarm_paycheck,bambusfarm_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(bambusfarm_enableFatigue));

DYNAMICMARKET_boughtItems = [];
[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn bambusfarm_fnc_MP;
[] spawn bambusfarm_fnc_CAH_fetchDetails;
[] spawn bambusfarm_fnc_CAH_loggedIn;