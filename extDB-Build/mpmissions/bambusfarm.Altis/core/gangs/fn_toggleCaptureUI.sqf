/*
	File: fn_toggleCaptureUI.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Toggles the display of capture point user interface.
*/
private ["_point","_data"];

_point = [_this,0,0,[0]] call BIS_fnc_param;

bambusfarm_capture_zone = _point;
if (_point == 0) exitWith
{
	5 cutText ["","PLAIN"];
	systemChat "Du hast das Kontrol Gebiet verlassen.";
};

_data = bambusfarm_capture_list select (_point - 1);
systemChat format["Du betritz das Kontrol Gebiet %1!", _data select 1];

// Setup our progress bar.
_upp = format["%2 Eigentuemer - %1", _data select 0, _data select 1];
disableSerialization;
5 cutRsc ["bambusfarm_progress","PLAIN"];
_ui = uiNameSpace getVariable "bambusfarm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (%3%1)...","%",_upp,round((_data select 2) * 100)];
_progress progressSetPosition (_data select 2);