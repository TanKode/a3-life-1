_law = _this select 0;
_player = _this select 1;

_query = format["gov_getLaws"];

_queryResult = [_query,2] call DB_fnc_asyncCall;
_lawsArray = _queryResult select 0;

if (_law in _lawsArray) exitWith {
	_message = "Dieses Gesetzt existiert bereits!";
	[[1, _message], "life_fnc_broadcast", _player, false] spawn life_fnc_mp;
};

_lawsArray pushBack _law;

systemchat format ["%1",_lawsArray];
_query = format["gov_setLaws:%1",_lawsArray];
[_query,1] call DB_fnc_asyncCall;

_message = "Das Gesetzt wurde erfolgreich verarbschiedet!";
[[1, _message], "life_fnc_broadcast", _player, false] spawn life_fnc_mp;