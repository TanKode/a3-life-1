/*

	I Update table of player
	[II Check for remainingtime <= 0
	III delete and return money value]

*/
private["_player", "_playeruid", "_query", "_result", "_injail"];

_player = _this select 0;
_playeruid = _this select 1;

//SET PLAYER
_player = owner _player;



////I
_query = format["playerUpdateJailTime1:%1",_playeruid];
//_query = format["UPDATE players SET jail_time=(jail_time - 1) WHERE playerid='%1'", _playeruid];
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

////II
_query = format["playerSelectJailTime1:%1",_playeruid];
//_query = format["SELECT IF( remainingtime <= '0', TRUE, FALSE ) FROM players WHERE playerid='%1'", _playeruid];
waitUntil{!DB_Async_Active};
_money_result = [_query,2] call DB_fnc_asyncCall;