#include <macro.h>
/*
	
	file: fn_newMsg.sqf
	Author: Silex
	
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;
_pos = [_this,3,[],[[]]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Nachricht an: %1",name life_smartphoneTarget]];
		if((FETCH_CONST(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachrich eingeben!";ctrlShow[88885, true];};
		[[life_smartphoneTarget,_msg,player,0],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Sie senden %1 eine Nachricht: %2",name life_smartphoneTarget,_msg];	
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Die Polizei ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachrich eingeben!";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,1],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "Polizei";
		hint format["Sie senden %1 eine Nachricht: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachrich eingeben!";ctrlShow[888896,true];};
		[[ObjNull,_msg,player,2],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "Admins";
		hint format["Sie senden %1 eine Nachricht: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Arzt im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachrich eingeben!";ctrlShow[888899,true];};
		[[ObjNull,_msg,player,3],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Sie haben eine Nachricht an alle Sanitaeter geschickt.",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Sie sind kein Admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		if(_msg == "") exitWith {hint "Sie muessen eine Nachrich eingeben!";};
		[[life_smartphoneTarget,_msg,player,4],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Adminnachricht gesendet an: %1 - Nachricht: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((FETCH_CONST(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
		
		if((FETCH_CONST(life_coplevel) < 1)) then
		{
			ctrlShow[888901,false];
		} else {
			ctrlShow[888898,true];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Sie sind kein Admin!";};
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht eingeben!";};
		[[ObjNull,_msg,player,5],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Adminnachricht gesendet an alle: %1",_msg];
		closeDialog 887890;
	};
	//CopMsgAll
	case 8:
	{
		if((call life_coplevel) < 1) exitWith {hint "Sie sind kein Polizist!";};
		if(_msg == "") exitWith {hint "Sie muessen eine Nachricht eingeben!";};
		[[ObjNull,_msg,player,6],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Polizeinachricht gesendet an alle: %1",_msg];
		closeDialog 887890;
	};
	//adac
	case 9:
	{
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein ADAC-Mitarbeiter im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888900,false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachrich eingeben!";ctrlShow[888900,true];};
		[[ObjNull,_msg,player,7,_pos],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Sie haben eine Nachricht an alle ADAC-Mitarbeiter geschickt: %1",_msg];
		ctrlShow[888900,true];
		closeDialog 887890;
	};
	//Aufträege
	case 10:
	{	
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein ADAC-Mitarbeiter im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[889991,false];
		if(_msg == "") exitWith {hint "Sie muessen eine Nachrich eingeben!";ctrlShow[889991,true];};
		[[0,name player],"life_fnc_aufRequest",east,FALSE] spawn life_fnc_MP;
		life_auftraege pushBack [(getPlayerUID player),(name player),_msg,_pos,0];
		publicVariable "life_auftraege";
		ctrlShow[889991,true];
		closeDialog 889999;
	};
	//ADACtoPerson
	case 11:
	{
		if((call life_adaclevel) < 1) exitWith {hint "Sie sind kein ADAC-Mitglied!";};
		if(isNull life_aufTarget) exitWith {hint format["Keine Auftrag ausgwählt!"];};
		if(_msg == "") exitWith {hint "Sie muessen eine Nachrich eingeben!";};
		[[life_aufTarget,_msg,player,8],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Auftragsnachricht gesendet an: %1 - Nachricht: %2",name life_aufTarget,_msg];
		closeDialog 88883;
	};
};