private["_query","_pid","_fromName","_msg","_player","_pos"];
_msg = [_this,0,"",[""]] call BIS_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_pos = [_this,2,[],[[]]] call BIS_fnc_param;
_type = [_this,3,-1] call BIS_fnc_param;
_fromid = [_this,4,-1] call BIS_fnc_param;
_toid = [_this,5,-1] call BIS_fnc_param;
_id = 0;
switch(_type) do
{
	case 0:
	{
		_msg = [_msg,":",""] call KRON_Replace;
		_pid = getPlayerUID _player;
		_fromName = name _player;
		_query = format["aufBuchInsertAdac:%1:%2:%3:%4:0",_pid,_fromName,_msg,_pos];
		life_auftraege pushBack [_pid,_fromName,_msg,_pos,_id];
		//_query = format["INSERT INTO contract (fromID, fromName, message, pos, toID) VALUES('%1', '%2', '""%3""', '%4','0')",_pid,_fromName,_msg,_pos];
		waitUntil {sleep (random 0.3); !DB_Async_Active};
		_tickTime = diag_tickTime;
		_queryResult = [_query,1] call DB_fnc_asyncCall;	


		diag_log "------------- Client Query Request -------------";
		diag_log format["QUERY: %1",_query];
		diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
		diag_log format["Result: %1",_queryResult];
		diag_log "------------------------------------------------";	
	};
	
	case 1:
	{
		_query = format["aufBuchUpdateAdac:%1:%2",_toid,_fromid];
		//_query = format["UPDATE contract SET toID='%2' WHERE fromID='%1'",_fromid,_toid];
		waitUntil {sleep (random 0.3); !DB_Async_Active};
		_tickTime = diag_tickTime;
		_queryResult = [_query,1] call DB_fnc_asyncCall;
		diag_log "------------- Client Query Request -------------";
		diag_log format["QUERY: %1",_query];
		diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
		diag_log format["Result: %1",_queryResult];
		diag_log "------------------------------------------------";
	};
};