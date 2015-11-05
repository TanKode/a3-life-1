/*
    File: fn_packupmauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_vehhut"];
_vehhut = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_vehhut") exitWith {};

if(([true,"uitem_vehhut",1] call life_fnc_handleInv)) then
{
	_vehhut setVariable["vehhutDown",false,true];
    cutText["Sie haben das Verkehrshütchen aufgehoben.","PLAIN DOWN"];
    deleteVehicle _vehhut;
};