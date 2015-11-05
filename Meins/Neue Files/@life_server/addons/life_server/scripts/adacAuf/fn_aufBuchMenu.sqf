#include "\life_server\script_macros.hpp"
/*
	File: fn_aufBuchMenu.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_display","_messageList","_myMessageList"];
disableSerialization;
closeDialog 0;
createDialog "life_adacAuftragsbuch";
waitUntil {!isNull findDisplay 103450};
_messageList = CONTROL(103450,103451);
_myMessageList = CONTROL(103450,103454);
ctrlEnable[103452,false];
ctrlEnable[103456,false];
ctrlEnable[103457,false];

[] call life_fnc_auftragsBuch;