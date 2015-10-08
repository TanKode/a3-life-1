/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
bambusfarm_knockout = true;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"bambusfarm_fnc_animSync",nil,false] spawn bambusfarm_fnc_MP;
sleep 0.08;
[[_target,profileName],"bambusfarm_fnc_knockedOut",_target,false] spawn bambusfarm_fnc_MP;

sleep 3;
bambusfarm_knockout = false;