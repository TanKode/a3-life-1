//_law = _this select 0;
_law = [_this,0,""] call BIS_fnc_param;
if (_law == "") exitWith {};

_query = format["gov_getLaws"];
_queryResult = [_query,2] call DB_fnc_asyncCall;

_lawsArray = _queryResult select 0;

_lawsArray = _lawsArray - [_law];

_query = format["gov_setLaws:%1",_lawsArray];
[_query,1] call DB_fnc_asyncCall;