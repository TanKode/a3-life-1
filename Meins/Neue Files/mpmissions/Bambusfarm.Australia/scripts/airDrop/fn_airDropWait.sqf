/*
	File: fn_airDropWait.sqf
	Author: PierreAmyf
	
	Description:
	AirDrop event wait time!
     
*/
private["_ui","_eventAirDropWait","_time","_timeUp","_countDown"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};

_eventAirDropWait = _ui displayCtrl 23545;

_time = (10*60);
_timeUp = _time + time;


while {true} do {
	if((round(_timeUp - time)) > 0) then {
		_countDown = [(_timeUp - time),"MM:SS"] call BIS_fnc_secondsToString;
		
		_eventAirDropWait ctrlSetText format["Die Waffenkiste wird in %1 min abgeworfen!",_countDown] spawn life_fnc_MP;
	};
	
	if((round(_timeUp - time)) == 0) exitWith {hint ""};
};