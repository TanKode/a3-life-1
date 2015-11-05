/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Queries to see if the player belongs to any gang.
*/
private["_query","_queryResult"];

_query = format["gangInfo:%2%1%2",_this,"%"];
//diag_log format["GabgInfo2 %1",_query];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
//diag_log format["GangInfo %1",_queryResult];

missionNamespace setVariable[format["gang_%1",_this],_queryResult];