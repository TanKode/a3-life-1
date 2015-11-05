#include <macro.h>
/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;

//##80
_time = [_this,2,15,[0]] call BIS_fnc_param;  // <-- Add This Line

player SVAR ["restrained",false,true];
player SVAR ["Escorting",false,true];
player SVAR ["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");

if(_bad) then {
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then {
	player setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;
if(life_inv_heroin_unprocessed > 0) then {[false,"heroin_unprocessed",life_inv_heroin_unprocessed] call life_fnc_handleInv;};
if(life_inv_heroin_processed > 0) then {[false,"heroin_processed",life_inv_heroin_processed] call life_fnc_handleInv;};
if(life_inv_cocaine_unprocessed > 0) then {[false,"cocaine_unprocessed",life_inv_cocaine_unprocessed] call life_fnc_handleInv;};
if(life_inv_cocaine_processed > 0) then {[false,"cocaine_processed",life_inv_cocaine_processed] call life_fnc_handleInv;};
if(life_inv_turtle_raw > 0) then {[false,"turtle_raw",life_inv_turtle_raw] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_meth_unprocessed > 0) then {[false,"meth_unprocessed",life_inv_meth_unprocessed] call life_fnc_handleInv;};
if(life_inv_meth_processed > 0) then {[false,"meth_processed",life_inv_meth_processed] call life_fnc_handleInv;};
if(life_inv_frogs > 0) then {[false,"frogs",life_inv_frogs] call life_fnc_handleInv;};
if(life_inv_frogslsd> 0) then {[false,"frogslsd",life_inv_frogslsd] call life_fnc_handleInv;};
if(life_inv_uran_unprocessed > 0) then {[false,"uran_unprocessed",life_inv_uran_unprocessed] call life_fnc_handleInv;};
if(life_inv_uran_processed > 0) then {[false,"uran_processed",life_inv_uran_processed] call life_fnc_handleInv;};
life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[[player,_bad,_time],"life_fnc_jailSys",false,false] call life_fnc_MP; //Give time ##80 to jailSys, if not BAD save time variable in DB, if not, load <-- Replace Old Line With This
[5] call SOCK_fnc_updatePartial;