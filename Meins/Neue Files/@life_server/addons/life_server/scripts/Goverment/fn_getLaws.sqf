_player = _this select 0;

_query = format["gov_getLaws"];

_queryResult = [_query,2] call DB_fnc_asyncCall;
_lawsArray = _queryResult select 0;
[[3,_lawsArray],"life_fnc_recievedCall",_player,false] spawn life_fnc_mp;