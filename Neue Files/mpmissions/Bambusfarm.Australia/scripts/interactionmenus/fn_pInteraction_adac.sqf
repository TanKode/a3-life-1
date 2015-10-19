/*

	Shows pInteraction Menu
	for all civ players

*/

private["_display","_curTarget","_bTicket"];
if(!dialog) then 
{
    createDialog "pInteraction_adac";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget) exitWith {hint "Ziel ist kein Spieler"; closeDialog 0; };
//if(!license_civ_rebel) exitWith {hint "Du bist kein Rebelle"; closeDialog 0;}; //Bad side check?
/*
 * Converted rebInteraction to civInteraction
 * */


_display = findDisplay 37400;

_bTicket = _display displayCtrl 2401;

life_pInact_curTarget = _curTarget;

///////////////////////////////////////////////////////
/////////////Set actions

//Set Ticket Button
_bTicket buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

