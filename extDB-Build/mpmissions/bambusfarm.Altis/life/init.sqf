/////////////////////////////////
//
// life Initializing
//
/////////////////////////////////
private["_handle","_timeStamp"];
_TStimeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "------------------------------------- Initializing life System -------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

// Custom Vars
Scripts = true;

diag_log "::life System Client:: life System setting up main Variables done!";

if (Scripts) then {
_handle = [] execVM "life\mods.sqf";
waitUntil {ScriptDone _handle};
diag_log "::life System Client:: External Scripts done";
};

diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["       End of life Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _TStimeStamp];
diag_log "------------------------------------------------------------------------------------------------------";