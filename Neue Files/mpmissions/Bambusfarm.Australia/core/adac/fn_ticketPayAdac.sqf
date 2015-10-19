#include <macro.h>
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(CASH < life_ticket_val) exitWith
	{
		if(BANK < life_ticket_val) exitWith 
		{
			hint localize "STR_ADAC_Ticket_NotEnough";
			[[1,"STR_ADAC_Ticket_NotEnoughNOTF",true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
			closeDialog 0;
		};
		hint format[localize "STR_ADAC_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
		SUB(BANK,life_ticket_val);
		life_ticket_paid = true;
		[[0,"STR_ADAC_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",east,false] spawn life_fnc_MP;
		[[1,"STR_ADAC_Ticket_PaidNOTF_2",true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
		[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;
		//[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		closeDialog 0;
	};

SUB(CASH,life_ticket_val);
life_ticket_paid = true;

//[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
[[0,"STR_ADAC_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",east,false] spawn life_fnc_MP;
closeDialog 0;
[[1,"STR_ADAC_Ticket_PaidNOTF_2",true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;