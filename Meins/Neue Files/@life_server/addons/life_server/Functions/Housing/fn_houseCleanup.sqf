/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Cleans up containers inside the house.
*/
private["_query","_houses"];
_query = format["housingCleanup:%1",_this];
waitUntil{!DB_Async_Active};
_houses = [_query,2,true] call DB_fnc_asyncCall;

diag_log format["House:%1,this:%2,Query:%3",_houses,_this,_query];

if(count _houses == 0) exitWith {};
{
	_pos = call compile format["%1",_x select 1];
	_house = _pos nearestObject "house";

	if(!isNil {(_house getVariable "content")}) then {
		//{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
		_house setVariable["content",nil,true];
	};
} foreach _houses;