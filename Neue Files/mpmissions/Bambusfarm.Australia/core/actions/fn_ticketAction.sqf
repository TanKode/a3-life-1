#include <macro.h>
/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/

if(EQUAL(playerSide,west)) then
{
	private["_unit"];
	_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	disableSerialization;
	if(!(_unit getVariable["restrained",FALSE])) exitWith {
		hint "Der andere Spieler muss gefesselt sein.";
		sleep 3;
		hint "Benutze die Shift+R, um den Spieler zu fesseln.";
	}; //Error check?
	if(!(createDialog "life_ticket_give")) exitWith {hint localize "STR_Cop_TicketError"};
	if(isNull _unit OR !isPlayer _unit) exitwith {};
	ctrlSetText[2651,format[localize "STR_Cop_Ticket",_unit getVariable["realname",name _unit]]];
	life_ticket_unit = _unit;
} else {
	private["_unit"];
	_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	disableSerialization;
	if(!(createDialog "life_ticket_give")) exitWith {hint localize "STR_Cop_TicketError"};
	if(isNull _unit OR !isPlayer _unit) exitwith {};
	ctrlSetText[2651,format[localize "STR_ADAC_Ticket",_unit getVariable["realname",name _unit]]];
	life_ticket_unit = _unit;	
};