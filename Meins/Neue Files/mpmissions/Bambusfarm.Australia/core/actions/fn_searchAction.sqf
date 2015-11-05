/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!(_unit getVariable["restrained",FALSE])) exitWith {
	hint "Der andere Spieler muss gefesselt sein.";
	sleep 3;
	hint "Benutze die Shift+R, um den Spieler zu fesseln.";
}; //Error check?
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSearchPerson"};
[[player],"life_fnc_searchClient",_unit,false] call life_fnc_MP;
life_action_inUse = true;