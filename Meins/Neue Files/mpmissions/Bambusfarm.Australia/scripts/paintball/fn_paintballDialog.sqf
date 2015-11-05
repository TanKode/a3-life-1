#include <macro.h>
/*
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/

private["_type","_dialog","_modus","_time","_number","_displayName","_mode"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
disableSerialization;
_dialog = findDisplay 450000;
_modus = _dialog displayCtrl 450001;
//_time = _dialog displayCtrl 450002;

_time = ctrlText 450002;
_number = parseNumber _time;
_time = round _number;

_paintball_action = 
[
	["Team Deathmatch",0],
	["Deathmatch",1]
];

switch(_type) do
{
	case 0:
	{
		{
			_displayName = _x select 0;
			_mode = _x select 1;
			_modus lbAdd format["%1",_displayName];
			_modus lbSetValue[(lbSize _modus)-1, _mode];
		}forEach _paintball_action;
	};
	
	case 1:
	{
		if(_number > 30) exitWith {hint parseText "<t color='#FF0000'>--ERROR--</t><br/><t color='#FF0000'>Zu hoch, max. 30min</t>";};
		if((lbCurSel 450001) == -1) exitWith {hint parseText "<t color='#FF0000'>--ERROR--</t><br/><t color='#FF0000'>Kein Spielmodus ausgeweahlt!</t>";};
		_mode = lbValue[450001,(lbCurSel 450001)];
		
		life_paintballMode = _mode;
		publicVariable "life_paintballMode";
		life_paintballTime = _time;
		publicVariable "life_paintballTime";
		life_GameOn = true;
		publicVariable "life_GameOn";
		
		[] execVM "scripts\paintball\pb_join.sqf";
		closeDialog 0;
	};
};
