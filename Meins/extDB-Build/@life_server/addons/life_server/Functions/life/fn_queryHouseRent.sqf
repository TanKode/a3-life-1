/*
	File: fn_queryHouseRent.sqf
	Author: Dscha

	Description:
	query Stuff from DB or updates the rentdate
*/
private["_pos","_player","_mode","_query","_queryResult","_life_MietZeit"];
_pos = _this select 0;
_player = _this select 1;
_mode = _this select 2;

if(_mode == 0)then
{
	_query = format["SELECT rentdate FROM houses WHERE pos='%1' AND owned='1'", _pos];

	_queryResult = [_query,2] call DB_fnc_asyncCall;
	_life_MietZeit = _player setVariable ["life_MietZeit",_queryResult,true];
};

if(_mode == 1)then
{
	_query = format["UPDATE houses SET rentdate = rentdate + 42 WHERE pos='%1'",_pos];
	_thread = [_query,false] spawn DB_fnc_asyncCall;
	waitUntil {scriptDone _thread};
};