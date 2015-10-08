/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,bambusfarm_TASCHENGELD,bambusfarm_BANK,bambusfarm_Karma];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach bambusfarm_licenses;
_packet pushBack _array;

[] call bambusfarm_fnc_saveGear;
_packet pushBack bambusfarm_gear;
switch (playerSide) do {
	case civilian: {
		_packet pushBack bambusfarm_is_arrested;
	};
};

diag_log format [":::::::::::: fn_update_request.sqf: PlayerUID: %1 - ProfileName: %2 - playerSide: %3 - Geld: %4 - Bank: %5 - Karma: %6",getPlayerUID player,(profileName),playerSide,bambusfarm_TASCHENGELD,bambusfarm_BANK,bambusfarm_Karma];
[_packet,"DB_fnc_updateRequest",false,false] call bambusfarm_fnc_MP;