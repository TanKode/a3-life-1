/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {bambusfarm_ticket_val} OR isNil {bambusfarm_ticket_cop}) exitWith {};
if(bambusfarm_TASCHENGELD < bambusfarm_ticket_val) exitWith
{
	if(bambusfarm_BANK < bambusfarm_ticket_val) exitWith
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]],"bambusfarm_fnc_broadcast",bambusfarm_ticket_cop,false] spawn bambusfarm_fnc_MP;
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[bambusfarm_ticket_val] call bambusfarm_fnc_numberText];
	bambusfarm_BANK = bambusfarm_BANK - bambusfarm_ticket_val;
	bambusfarm_ticket_paid = true;
	[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[bambusfarm_ticket_val] call bambusfarm_fnc_numberText]],"bambusfarm_fnc_broadcast",west,false] spawn bambusfarm_fnc_MP;
	[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"bambusfarm_fnc_broadcast",bambusfarm_ticket_cop,false] spawn bambusfarm_fnc_MP;
	[[bambusfarm_ticket_val,player,bambusfarm_ticket_cop],"bambusfarm_fnc_ticketPaid",bambusfarm_ticket_cop,false] spawn bambusfarm_fnc_MP;
	[[getPlayerUID player],"bambusfarm_fnc_wantedRemove",false,false] spawn bambusfarm_fnc_MP;
	closeDialog 0;
};

bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD - bambusfarm_ticket_val;
bambusfarm_ticket_paid = true;

[[getPlayerUID player],"bambusfarm_fnc_wantedRemove",false,false] spawn bambusfarm_fnc_MP;
[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[bambusfarm_ticket_val] call bambusfarm_fnc_numberText]],"bambusfarm_fnc_broadcast",west,false] spawn bambusfarm_fnc_MP;
closeDialog 0;
[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"bambusfarm_fnc_broadcast",bambusfarm_ticket_cop,false] spawn bambusfarm_fnc_MP;
[[bambusfarm_ticket_val,player,bambusfarm_ticket_cop],"bambusfarm_fnc_ticketPaid",bambusfarm_ticket_cop,false] spawn bambusfarm_fnc_MP;