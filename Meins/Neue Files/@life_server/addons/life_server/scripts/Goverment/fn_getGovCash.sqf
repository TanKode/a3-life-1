_caller = _this select 0;

_query = format["gov_getCash"];

_queryResult = [_query,2] call DB_fnc_asyncCall;
_cash = _queryResult select 0;
[[4,_cash],"life_fnc_recievedCall",_caller,false] spawn life_fnc_mp;