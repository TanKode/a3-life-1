/*
    File: fn_handleDowned.sqf
    Author: Skalicon modded by Mahribar
    
    Description: Original Script for rubber bullets Modified for Airsoft
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_isdowned = false;};

if(_unit isKindOf "Man" && alive player) then
{
	 hint format ["Sie haben %1 getroffen er wird nun zum Eingang zuruech geportet!", name _unit];
	
};


if(_shooter isKindOf "Man" && alive player) then
{
    hint format ["Sie wurden von %1 getroffen und werden nun zum Eingang zurueck geportet!", name _shooter];
    player allowDamage true;
    _pos = getMarkerPos "Airsoft_Spawn";
    (vehicle player) setpos [_pos select 0, _pos select 1, 0];
}
    else
{
    _unit allowDamage true;
};