#include "\life_server\script_macros.hpp"
/*
	File: fn_removeObj.sqf
	Autor: Unknown 
	Edit: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/

_id = [_this,0,-1] call BIS_fnc_param;
_kind = [_this,1,"",[""]] call BIS_fnc_param;

_query = format["DeleteObject:%1:%2",_id,_kind];
//_query = format["DELETE FROM contract WHERE toID='%1' AND fromID='%2'",_playerID,_fromID];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,1] call DB_fnc_asyncCall;
diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";