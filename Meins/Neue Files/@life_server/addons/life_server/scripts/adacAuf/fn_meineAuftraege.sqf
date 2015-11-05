#include "\life_server\script_macros.hpp"

/*
	File: fn_meineAuftraege.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/

private["_display","_messageList","_myMessageList","_amessageShow","_data"];

disableSerialization;
_messageList = CONTROL(103450,103451);
_myMessageList = CONTROL(103450,103454);
_amessageShow = CONTROL(103450,103455);
_data = lbData[103451,(lbCurSel 103451)];
_data = call compile format["%1",_data];
_datau = SEL(_data,4);
_index = -1;


if(!(EQUAL(_datau,0))) exitWith {hint "Dieser Auftrag wird schon bearbeitet!"};

lbClear _messageList;
lbClear _myMessageList;
_amessageShow ctrlSetText "";

_toID = getPlayerUID player;

{
	ADD(_index,1);
	_fromID = SEL(_x,0);
	_fromName = SEL(_x,1);
	_fromMsg = SEL(_x,2);
	_fromPos = SEL(_x,3);
	if(EQUAL(SEL(_data,2),_fromMsg)) then
	{
		life_auftraege set [_index,[_fromID,_fromName,_fromMsg,_fromPos,_toID]];
		publicVariable "life_auftraege";
	}
}forEach life_auftraege;
[0] call life_fnc_auftragsBuch;