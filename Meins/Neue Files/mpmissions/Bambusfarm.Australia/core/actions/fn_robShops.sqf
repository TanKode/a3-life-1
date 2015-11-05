/*
file: fn_robShops.sqf
Author: MrKraken, modded by Teej
 - Added randomized marker name
 - Various fixes & string changes
 - Added attempted robbery
 - Added abort for being restrained
 - Added abort for being arrested
 - Added fix for being killed
 
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Description:
Executes the rob shop action!
Idea developed by PEpwnzya v1.0
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_Pos","_rndmrk","_mrkstring"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_action = [_this,2] call BIS_fnc_param;//Action name
_cops = (west countSide playableUnits);

if(_cops < 3) exitWith {hint "Die Kasse ist leer, komm später vorbei!";};
if(isNull _shop OR isNull _robber) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(side _robber != civilian) exitWith { hint "Haste nichts besseres zu tun? " };// We do not want anyone but civilianz to rob the stations.
if (currentWeapon _robber == "") exitWith { hint "HaHa, du machst mir keine Angst , ab raus hier du Lappen !!" };//is he trying to rob without a weapon? Lets taunt him a bit!
if(_robber distance _shop > 5) exitWith { hint "Du bist zu weit weg!" };
if (vehicle player != _robber) exitWith { hint "Raus aus dem Fahrzeug du Pussy!" };
[[_shop,_robber,_action],"TON_fnc_robShops",true,false] spawn life_fnc_MP;//now we send the info to the server to be processed further there.