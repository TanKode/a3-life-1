/////////////////////////////////
//
// bambusfarm Initializing
//
/////////////////////////////////
private["_handle","_timeStamp"];
_TStimeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "------------------------------------- Initializing bambusfarm System -------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

// Custom Vars
Scripts = true;

diag_log "::bambusfarm System Client:: bambusfarm System setting up main Variables done!";

if (Scripts) then {
_handle = [] execVM "bambusfarm\mods.sqf";
waitUntil {ScriptDone _handle};
diag_log "::bambusfarm System Client:: External Scripts done";
};

diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["       End of bambusfarm Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _TStimeStamp];
diag_log "------------------------------------------------------------------------------------------------------";