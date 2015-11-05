#include <macro.h>
/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_cop","_val","_display","_control"];
if(!isNull (findDisplay 2600)) exitwith {}; //Already at the ticket menu, block for abuse?
_cop = SEL(_this,0);
if(isNull _cop) exitWith {};
_val = SEL(_this,1);

createDialog "life_ticket_pay_adac";
disableSerialization;
waitUntil {!isnull (findDisplay 26000)};
_display = findDisplay 26000;
_control = _display displayCtrl 26010;
life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;
	
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>" +(localize "STR_ADAC_Ticket_GUI_Given"),_cop getVariable["realname",name _cop],_val];

[] spawn
	{
	disableSerialization;
	waitUntil {life_ticket_paid OR (isNull (findDisplay 26000))};
	if(isNull (findDisplay 26000) && !life_ticket_paid) then
	{
		[[0,"STR_ADAC_Ticket_Refuse",true,[profileName]],"life_fnc_broadcast",east,false] spawn life_fnc_MP;
		[[1,"STR_ADAC_Ticket_Refuse",true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
	};
};	