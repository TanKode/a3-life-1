/*
	File: fn_housewarn.sqf
	
	Description:
	Updated die Datenbank 
*/
private["_house","_uid","_query","_housePos"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _house OR _uid == "") exitWith {hint "Problem bei Update"};

_housePos = getPosATL _house;

_query = format["UPDATE houses SET kitchen='false' WHERE pid='%1' AND pos='%2' AND owned='1'",_uid,_housePos];
diag_log format["Küche: %1",_query];
waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;