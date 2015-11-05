#include <macro.h>
/*
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private ["_veh","_player","_crewList","_markerName","_marker","_markerName2"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_crewList = "";

_markerName = format["%1_%2_gpstracker",_veh,_player];
_marker = createMarkerLocal [_markerName, visiblePosition _veh];
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTypeLocal "Mil_dot";

while {true} do
{
	_crewList = "";
	if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
	{
		_crewList = _crewList + name _x + ", ";
	} forEach crew _veh;
	_markerName2 = formatText["||GPS-Tracker: %1 || Crew: %2||",getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName"),_crewList];
	_marker setMarkerTextLocal str(_markerName2);
	_marker setMarkerPosLocal getPos _veh;
	uiSleep 0.5;
};