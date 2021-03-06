#include <macro.h>
/*
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
//["Setting up Server","Creating Risk-Your-life essential event handlers to operation."] call TON_fnc_showMsg;
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
//Setup initial client core functions
diag_log "::Risk-Your-life:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
//["::Risk-Your-life::"," Variables initialized"] call TON_fnc_showMsg;
0 cutFadeOut 9999999;
diag_log "::Risk-Your-life:: Variables initialized";
diag_log "::Risk-Your-life:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;
//["::Risk-Your-life::"," Setting up Eventhandlers"] call TON_fnc_showMsg;
0 cutFadeOut 9999999;
diag_log "::Risk-Your-life:: Eventhandlers completed";
diag_log "::Risk-Your-life:: Setting up user actions";
[] call life_fnc_setupActions;
diag_log "::Risk-Your-life:: User actions completed";
diag_log "::Risk-Your-life:: Waiting for server functions to transfer..";
//["::life Community::"," Waiting for server functions to transfer.."] call TON_fnc_showMsg;
0 cutFadeOut 9999999;
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::life Community:: Received server functions.";
//["::life Community::"," Received server functions."] call TON_fnc_showMsg;
0 cutFadeOut 9999999;
diag_log "::life Community:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
/*waitUntil{(life_server_isReady OR !isNil "life_server_extDB2_notLoaded")};
if(!isNil "life_server_extDB2_notLoaded") exitWith {
	diag_log "::life Community:: Server did not load extDB";
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};*/
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
//["::Client::"," We are almost Done."] call TON_fnc_showMsg;
0 cutFadeOut 9999999;

//diag_log "::life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	
	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	
	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
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
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;
life_ID_PlayerTags = ["life_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
life_ID_RevealObjects = ["life_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call life_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

life_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	life_BANK = life_BANK + _price;
";

[] execVM "core\init_survival.sqf";
[] execVM "core\initHTB.sqf";
[] spawn life_fnc_showDirect;

__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(life_enableFatigue));

DYNAMICMARKET_boughtItems = [];
[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;
[] spawn life_fnc_CAH_fetchDetails;
[] spawn life_fnc_CAH_loggedIn;