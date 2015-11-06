#include <macro.h>
/*
	File: fn_gpsTracker.sqf
	Author: PierreAmyf
	
	Description:
	marker vehicle per GPS
*/
 
private["_curTarget"];
_curTarget = cursorTarget;
life_interrupted = false;
_distance = 5;
_bool = true;

if(player distance _curTarget > 7) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget GVAR ["restrained",false])) exitWith {};

_title = format[localize "STR_ISTR_GPS_Process",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")];
life_action_inUse = true;

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace GVAR "life_progress";
_progress = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
while {true} do
{
	[] spawn {
					_bool = false;
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic0";
					sleep 7;
					_bool = true;
			};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace GVAR "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.02;
	_progress progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(life_istazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Tazed
	if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if((player GVAR ["restrained",false])) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

	_curTarget SVAR ["gpsTrackerActivate",true,true];
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
	if((player GVAR ["restrained",false])) exitWith {life_action_inUse = false;};
	if(!isNil "_badDistance") exitWith {titleText["Das Fahrzeug befindet sich nicht in Reichweite.","PLAIN"]; life_action_inUse = false;};
	if(life_interrupted) exitWith {life_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; life_action_inUse = false;};
	if(!([false,"uitem_gpstracker",1] call life_fnc_handleInv)) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	cutText["Du hast einen Peilsender angebracht.","PLAIN DOWN"];
	sleep 0.5;
	life_action_inUse = false;
 
 [_curTarget] spawn
{
	_veh = SEL(_this,0);
	_markerName = format["%1_gpstracker",_veh];
	_marker = createMarkerLocal [_markerName, visiblePosition _veh];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "GPS Tracker "+getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName");
	_marker setMarkerPosLocal getPos _veh;
	
	_time = (15*60);
	_timeUp = time + _time;
	
	
	while {_veh GVAR ["gpsTrackerActivate",true];} do {
		if((round(_timeUp - time)) > 0) then {
			if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
			_marker setMarkerPosLocal getPos _veh;
			sleep 0.5;
		};
		
		if((round(_timeUp - time)) == 0) exitWith {hint ""};
		sleep 0.1;	
	};
	_dice = random(100);
	if (_dice > 70) then {hint "Hmm...da ist ja ein Peilsender...";};
	
	while {_veh GVAR ["gpsTrackerActivate",true];} do {
		if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
		_marker setMarkerPosLocal getPos _veh;
		sleep 0.5;		
	};
	sleep 2;
	hint "Der Peilsender ist nun nicht mehr aktive";
	deleteMarker _marker;
};