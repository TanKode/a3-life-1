_cash = [_this,0,-1] call BIS_fnc_param;
//_cash = _this select 0;
if (_cash == -1) exitWith {diag_log "Error: Addcash.sqf - Cash war undefined"};
//_query = format["SELECT laws FROM goverment WHERE id='3'"];
//_query = format["gov_getValue:%1",3];

//waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = ["gov_getCash",2] call DB_fnc_asyncCall;

_cashCur = [_queryResult,0,0] call BIS_fnc_param;
//_cashCur = call compile _cashCur;
//_cashCur = call compile (_queryResult select 0);

_cashCur = _cashCur + _cash;

//diag_log ["%1",_cashCur];
//_query = format["UPDATE goverment SET laws='%1' WHERE id='3'",[_cashCur] call DB_fnc_numberSafe];

_cashCur = [_cashCur] call DB_fnc_numberSafe;
_query = format["gov_setCash:%1",_cashCur];
[_query,1] call DB_fnc_asyncCall;