/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches all the players houses and sets them up.
*/
private["_query","_houses"];
if(_this == "") exitWith {};

//_query = format["SELECT pid, pos FROM base WHERE pid='%1' AND owned='1'",_this];
_query = format["SelectBase2"];
waitUntil{!DB_Async_Active};
_houses = [_query,2,true] call DB_fnc_asyncCall;
//diag_log format["QueryHallo: %1",_houses];

_return = [];
{
	if((_this == (_x select 2)) OR (_this in (_x select 3))) then
	{
		_pos = call compile format["%1",_x select 1];
		_house = _pos nearestObject "house";
		_house allowDamage false;

		_return pushBack [_x select 1];
		//diag_log format["Member %1",(_x select 3)];
	};
} foreach _houses;
//diag_log format["return: %2 this: %1",_this, _return];
missionNamespace setVariable[format["base_%1",_this],_return];