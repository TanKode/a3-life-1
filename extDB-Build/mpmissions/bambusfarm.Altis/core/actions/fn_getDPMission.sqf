/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp","_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(str(_target) in bambusfarm_dp_points) then
{
	private["_point"];
	_point = bambusfarm_dp_points - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
}
	else
{
	_dp = bambusfarm_dp_points call BIS_fnc_selectRandom;
};

bambusfarm_dp_start = _target;

bambusfarm_delivery_in_progress = true;
bambusfarm_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
bambusfarm_cur_task = player createSimpleTask [format["Delivery_%1",bambusfarm_dp_point]];
bambusfarm_cur_task setSimpleTaskDescription [format[localize "STR_NOTF_DPStart",toUpper _dp],"Delivery Job",""];
bambusfarm_cur_task setTaskState "Assigned";
player setCurrentTask bambusfarm_cur_task;

["DeliveryAssigned",[format[localize "STR_NOTF_DPTask",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn
{
	waitUntil {!bambusfarm_delivery_in_progress OR !alive player};
	if(!alive player) then
	{
		bambusfarm_cur_task setTaskState "Failed";
		player removeSimpleTask bambusfarm_cur_task;
		["DeliveryFailed",[localize "STR_NOTF_DPFailed"]] call BIS_fnc_showNotification;
		bambusfarm_delivery_in_progress = false;
		bambusfarm_dp_point = nil;
	};
};