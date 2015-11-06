private["_query","_queryResult","_uid","_player"];
_type = [_this,0,-1] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_player = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

switch(_type) do
{
	case 0:
	{
		_query = format["aufBuchSelectAdac"];
		//_query = format["SELECT fromID, fromName, message, pos, toID FROM contract"];
		waitUntil{!DB_Async_Active};
		_queryResult = [_query,2,true] call DB_fnc_asyncCall;

		if(count _queryResult == 0) exitWith {};
		{
			[[1,_x],"life_fnc_auftragsBuch",_player,false] spawn life_fnc_MP;
		}forEach _queryResult;

		diag_log "------------- Client Query Request -------------";
		diag_log format["QUERY: %1",_query];
		diag_log format["Result: %1",_queryResult];
		diag_log "------------------------------------------------";
	};
	
	case 1:
	{
		_query = format["MyAufBuchSelectAdac:%1",_uid];
		//_query = format["SELECT fromID, fromName, message, pos, toID FROM contract WHERE toID='%1'",_uid];
		waitUntil{!DB_Async_Active};
		_queryResult = [_query,2,true] call DB_fnc_asyncCall;

		if(count _queryResult == 0) exitWith {};
		{
			[[2,"",_x],"life_fnc_auftragsBuch",_player,false] spawn life_fnc_MP;
		}forEach _queryResult;

		diag_log "------------- Client Query Request -------------";
		diag_log format["QUERY: %1",_query];
		diag_log format["Result: %1",_queryResult];
		diag_log "------------------------------------------------";
	};
};