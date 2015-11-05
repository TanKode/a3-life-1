/*
	File: fn_medicRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the medics that someone has requested emergency and prompts them
	if they want to take the request or not.
*/

private["_callerName"];
_type = [_this,0,0] call BIS_fnc_param;
_callerName = [_this,1,"Unknown Player",[""]] call BIS_fnc_param;
_player = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNil "_callerName") exitWith {}; //Bad data

switch(_type) do
{
	case 0:
	{
		["MedicalRequestEmerg",[format[localize "STR_Auf_Request",_callerName]]] call BIS_fnc_showNotification;
	};

	case 1:
	{
		["MedicalRequestEmerg",[format[localize "STR_Auf_RequestRe",_callerName]]] call BIS_fnc_showNotification;
	
		while{true} do
		{
			_distance = _player distance player;
			hintSilent parseText format["Der ADAC-Mitarbeiter ist noch %1m von ihnen entfernt!",[_distance] call life_fnc_numberText];
			if((_player distance player) < 10) exitWith {hint ""};
		};
	};
};