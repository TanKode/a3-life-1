/*
    File: fn_werkzeugkasten.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz
    Description:
    Packs up a deployed wall.
*/
private["_wkasten"];
_wkasten = nearestObjects[getPos player,["Land_ToolTrolley_02_F"],8] select 0;
if(isNil "_wkasten") exitWith {};
if(([true,"wkasten",1] call life_fnc_handleInv)) then
{
    titleText["Sie haben den Werkzeugkasten aufgehoben.","PLAIN"];
    deleteVehicle _wkasten;
};