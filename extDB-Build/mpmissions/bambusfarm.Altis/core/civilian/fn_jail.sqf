/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(bambusfarm_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call bambusfarm_fnc_removeLicenses;
if(bambusfarm_inv_heroinu > 0) then {[false,"heroinu",bambusfarm_inv_heroinu] call bambusfarm_fnc_handleInv;};
if(bambusfarm_inv_heroinp > 0) then {[false,"heroinp",bambusfarm_inv_heroinp] call bambusfarm_fnc_handleInv;};
if(bambusfarm_inv_coke > 0) then {[false,"cocaine",bambusfarm_inv_coke] call bambusfarm_fnc_handleInv;};
if(bambusfarm_inv_cokep > 0) then {[false,"cocainep",bambusfarm_inv_cokep] call bambusfarm_fnc_handleInv;};
if(bambusfarm_inv_turtle > 0) then {[false,"turtle",bambusfarm_inv_turtle] call bambusfarm_fnc_handleInv;};
if(bambusfarm_inv_cannabis > 0) then {[false,"cannabis",bambusfarm_inv_cannabis] call bambusfarm_fnc_handleInv;};
if(bambusfarm_inv_marijuana > 0) then {[false,"marijuana",bambusfarm_inv_marijuana] call bambusfarm_fnc_handleInv;};
bambusfarm_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[[player,_bad],"bambusfarm_fnc_jailSys",false,false] spawn bambusfarm_fnc_MP;
[5] call SOCK_fnc_updatePartial;