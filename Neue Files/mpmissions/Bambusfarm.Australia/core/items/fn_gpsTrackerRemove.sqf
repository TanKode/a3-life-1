#include <macro.h>
/*
	File: fn_gpsTrackerRemove.sqf
	Author: PierreAmyf
	
	Description:
	remove GPS from vehicle 
*/
private["_curTarget","_distance","_bool","_isVehicle","_ui","_progress","_titleText","_title","_cP","_progressBar","_veh"];

_curTarget = cursorTarget;
life_interrupted = false;
_distance = 5;
_bool = true;
_veh = _curTarget getVariable["gpsTrackerActivate",true];

if(player distance _curTarget >7) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};

_title = format[localize "STR_ISTR_GPS_ProcessRemove",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")];
life_action_inUse = true;

if(_veh) then
{
	hint format["Es wurde ein GPS-Tracker an dem %1 gefunden!",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")];
	sleep 6;
	hint "Der GPS-Tracker wird nun deaktiviert!";
	sleep 6;
	
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
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
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(life_istazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Tazed
	if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if((player getVariable["restrained",false])) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

	_curTarget SVAR ["gpsTrackerActivate",false,true];
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
	if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
	if(!isNil "_badDistance") exitWith {titleText["Das Fahrzeug befindet sich nicht in Reichweite.","PLAIN"]; life_action_inUse = false;};
	if(life_interrupted) exitWith {life_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; life_action_inUse = false;};
	if(!([false,"uitem_gpssuchgeraet",1] call life_fnc_handleInv)) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	cutText["Der GPS-Tracker wurde deaktiviert.","PLAIN DOWN"];
	sleep 0.5;
	life_action_inUse = false;
	
}else{
	hint format["An diesem %1 wurde nichts gefunden",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")];
	life_action_inUse = false;
};