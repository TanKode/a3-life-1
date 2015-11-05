#include <macro.h>
/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(EQUAL(playerSide,west)) then
{
	if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
	if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
	_val = ctrlText 2652;
	if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
	if((parseNumber _val) > 1000000) exitWith {hint localize "STR_Cop_TicketOver100"};
	[[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit GVAR ["realname",name life_ticket_unit]]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	[[player,(parseNumber _val)],"life_fnc_ticketPrompt",life_ticket_unit,false] call life_fnc_MP;
	closeDialog 0;
} else {
	_val2 = life_adac_ticket;
	if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
	if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
	_val = ctrlText 2652;
	val = call compile format["%1",_val];
	_val = call compile format["%1",_val];
	ADD(_val,life_adac_ticket);
	//if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
	if(_val > 1000000) exitWith {hint localize "STR_Cop_TicketOver100"};
	[[0,"STR_ADAC_TicketGive",true,[profileName,_val,life_ticket_unit GVAR ["realname",name life_ticket_unit]]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	[[player,_val],"life_fnc_ticketPromptAdac",life_ticket_unit,false] call life_fnc_MP;
	closeDialog 0;
};