_caller = _this select 0;

_query = format["gov_getGov"];

_queryResult = [_query,2] call DB_fnc_asyncCall;
_pid = _queryResult select 0;
//diag_log format ["Query: %1",_pid];
if (typeName _pid == typeName "") then {diag_log format ["GOVERMENT:_DATABASEENTRY WAS TYPE OF STRING: CORRECT"];};
if (typeName _pid == typeName 0) then {_pid = [_pid] call DB_fnc_numberSafe;};
diag_log format ["Spieler %1 joined, President PID %2",getplayerUID _caller,_pid];
if (getplayerUID _caller == _pid) then {
	[[1],"life_fnc_recievedCall",_caller,false] spawn life_fnc_mp;
};