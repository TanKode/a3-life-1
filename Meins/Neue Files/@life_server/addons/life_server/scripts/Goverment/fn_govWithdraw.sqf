
_cash = [_this,0,0] call BIS_fnc_param;
if (_cash == 0) exitWith {};

diag_log format ["Gov Bargeld geändert %1", _cash];

_cash = [_cash] call DB_fnc_numberSafe;
_query = format["gov_setCash:%1", _cash];
[_query,1] call DB_fnc_asyncCall;
[[0,format ["%1 wurden vom Goverment Bankkonto abgebucht!",_cash]], "TON_fnc_broadcast",true,false] spawn life_fnc_mp;
