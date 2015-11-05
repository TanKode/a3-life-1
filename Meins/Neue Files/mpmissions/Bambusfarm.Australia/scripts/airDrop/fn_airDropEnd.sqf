/*
	File: fn_airDropEnd.sqf
	Author: PierreAmyf
	
	Description:
	AirDrop event end time!
     
*/
private["_ui","_eventAirDropEnd","_time","_timeUp","_countDown"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};

_eventAirDropEnd = _ui displayCtrl 23546;

_time = (10*60);
_timeUp = _time + time;

while {true} do {
	if((round(_timeUp - time)) > 0) then {
		_countDown = [(_timeUp - time),"MM:SS"] call BIS_fnc_secondsToString;
		
		_eventAirDropEnd ctrlSetText format["Die Selbstzerstoerung der Waffenkiste wird in %1 ausgeloest!",_countDown] spawn life_fnc_MP;
		//_event1 ctrlSetTextColor [1, 0, 0, 1];
	};
	
	if((round(_timeUp - time)) == 0) exitWith {hint ""};
};