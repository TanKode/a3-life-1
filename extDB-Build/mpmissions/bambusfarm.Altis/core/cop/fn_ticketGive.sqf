/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {bambusfarm_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull bambusfarm_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 999999999) exitWith {hint localize "STR_Cop_TicketOver100"};
[player, "ticket", 25] call bambusfarm_fnc_globalSound;
[[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call bambusfarm_fnc_numberText,bambusfarm_ticket_unit getVariable["realname",name bambusfarm_ticket_unit]]],"bambusfarm_fnc_broadcast",true,false] spawn bambusfarm_fnc_MP;
[[player,(parseNumber _val)],"bambusfarm_fnc_ticketPrompt",bambusfarm_ticket_unit,false] spawn bambusfarm_fnc_MP;
closeDialog 0;