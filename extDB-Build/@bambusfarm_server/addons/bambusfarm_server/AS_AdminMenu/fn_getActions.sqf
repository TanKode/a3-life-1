_player = _this select 0;
_pid = getPlayerUID _player;


diag_log format ["%1",_pid];
[] call TON_fnc_ASconfig;

_allowed = false;
_level = 0;
{
	if ((_x select 0) isEqualTo _pid) then {_level = _x select 1; _allowed = true;};
} forEach AS_Allowed;

if (_level < 1 OR !_allowed) exitWith {[[1,0],"bambusfarm_fnc_ASreceiver",_player,false] spawn bambusfarm_fnc_mp;};

_actions = [];
{
	_arr = _x select 1;
	if ((_x select 0) == _level) then
	{
		_actions = _arr;
	};
} forEach AS_Actions;

[[0,_actions],"bambusfarm_fnc_ASreceiver",_player,false] spawn bambusfarm_fnc_mp;
[[1,_level],"bambusfarm_fnc_ASreceiver",_player,false] spawn bambusfarm_fnc_mp;