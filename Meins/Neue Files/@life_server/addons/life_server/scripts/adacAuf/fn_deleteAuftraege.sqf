#include "\life_server\script_macros.hpp"

/*
	File: fn_deleteAuftraege.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_index","_uid","_display","_messageList","_myMessageList","_amessageShow","_myData"];
disableSerialization;
waitUntil {!isNull findDisplay 103450};
_messageList = CONTROL(103450,103451);
_myMessageList = CONTROL(103450,103454);
_amessageShow = CONTROL(103450,103455);
_myData = lbData[103454,(lbCurSel 103454)];
_myData = call compile format["%1",_myData];
_uid = getPlayerUID player;
_index = -1;

if(isNil "_myData") exitWith {};

{
	_data = _x;
	ADD(_index,1);
	if(EQUAL((SEL(_data,2)),(SEL(_myData,2)))) then
	{
		if(EQUAL(_uid,(SEL(_myData,4)))) then
		{
			life_auftraege deleteAt _index;
			publicVariable "life_auftraege";
		}else{
			hint "Sie koennen nur ihere Auftraege loeschen!";
		};
	};
}forEach life_auftraege;

lbClear _messageList;
lbClear _myMessageList;
_amessageShow ctrlSetText "";

[0] call life_fnc_auftragsBuch;