/*
    File: fn_robShopReset.sqf
    Author: Stevo

    Description: Starts a server side reset of the shops in case of player(robber) disconnect.
*/

private["_shop","_marker","_loot","_time"];
if !(isServer) exitWith {};
_shop = _this select 0;
_marker = _this select 1;
_time = _this select 2;
if(isNil "_shop") exitwith {};
if(isNil "_marker") exitwith {};

sleep _time;
_loot = 1000 + round(random 9000);
_shop setVariable ["_funds",_loot,true];
_marker setMarkerColor "ColorGreen";