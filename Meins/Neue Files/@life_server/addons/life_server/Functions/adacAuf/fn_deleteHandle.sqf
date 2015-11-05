_playerID = [_this,0,-1] call BIS_fnc_param;
_fromID = [_this,1,-1] call BIS_fnc_param;

_query = format["AufBuchDeleteAdac:%1:%2",_playerID,_fromID];
//_query = format["DELETE FROM contract WHERE toID='%1' AND fromID='%2'",_playerID,_fromID];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,1] call DB_fnc_asyncCall;
diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";