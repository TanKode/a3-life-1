/*
    File: vehicleWarned.sqf
    Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_vehicle"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_time = 45;
_timeUp = time + _time;
if(_vehicle getVariable ["fuelkill_warning",true]) exitWith {};

if(isNull _vehicle) exitWith {};
_vehicle setVariable["fuelkill_warning",true,true];
_vehicle say3D "empwarn";

while{true} do
{
	if((round(_timeUp - time)) > 0) then {
		_countDown = [(_timeUp - time),"MM:SS"] call BIS_fnc_secondsToString;
	
		hintSilent parseText format["<t color='#FF0000'>!Polizei-Warnung!</t><br/>Bitte drehen Sie bei und landen Sie Ihren Helikopter, ansonsten werden Sie zum Landen gezwungen!<br/><br/>WARNZEIT:<br/>%1",_countDown];
	};
		
	if((round(_timeUp - time)) == 0) exitWith {hint ""};
	sleep 0.1;	
};
_vehicle say3D "empwarn";
_vehicle setVariable["fuelkill_warning",false,true];