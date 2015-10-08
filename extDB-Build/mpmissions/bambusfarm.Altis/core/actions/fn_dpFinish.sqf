/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
bambusfarm_delivery_in_progress = false;
bambusfarm_dp_point = nil;
_dis = round((getPos bambusfarm_dp_start) distance (getPos _dp));
_price = round(1.7 * _dis);

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call bambusfarm_fnc_numberText]]] call bis_fnc_showNotification;
bambusfarm_cur_task setTaskState "Succeeded";
player removeSimpleTask bambusfarm_cur_task;
bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD + _price;