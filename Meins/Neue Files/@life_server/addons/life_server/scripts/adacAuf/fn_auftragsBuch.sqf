#include "\life_server\script_macros.hpp"

/*
	File: fn_auftragsBuch.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_type","_aufData","_aufMyData","_display","_messageList","_myMessageList","_onOff","_status","_icon","_msg"];
_type = [_this,0,0] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 103450};
_messageList = CONTROL(103450,103451);
_myMessageList = CONTROL(103450,103454);

_aufData = life_auftraege;
_aufMyData = [];
{
	_aufDataNew = SEL(_x,4);
	if(EQUAL((getPlayerUID player),_aufDataNew)) then
	{
		_aufMyData pushBack _x;
	}
} forEach _aufData;

switch(_type) do
{
	case 0:
	{
		{
			_data = _x;
			_onOff = "[OFFLINE]";
			{
				if(EQUAL((getPlayerUID _x),(SEL(_data,0)))) then
				{
					_onOff = "[ONLINE]";
				};
			}forEach playableUnits;

			_status = "IN BEARBEITUNG";
			if(EQUAL((SEL(_x,4)),0)) then
			{
				_status = "OFFEN";
			};
			_icon = "icons\wrench.paa";
			_msg = [(SEL(_x,2)), 10] call KRON_StrLeft;
			_messageList lbAdd format["Von: %1%4							%5							MSG: %2...",(_x select 1),_msg,(_x select 3),_onOff,_status];
			_messageList lbSetPicture [(lbSize _messageList)-1,_icon];
			_messageList lnbSetData[[(SEL((lnbSize _messageList),0))-1,0],str(_x)];
		}forEach _aufData;
		
		{
			_myData = _x;
			_onOffMy = "[OFFLINE]";
			{
				if(EQUAL((getPlayerUID _x),(SEL(_myData,0)))) then
				{
					_onOffMy = "[ONLINE]";
				};
			}forEach playableUnits;

			_statusMy = "MEIN AUFTRAG";
			_icon = "icons\wrench.paa";
			_msg = [(SEL(_x,2)), 10] call KRON_StrLeft;
			_myMessageList lbAdd format["Von: %1%4							%5							MSG: %2...",(SEL(_x,1)),_msg,(SEL(_x,3)),_onOffMy,_statusMy];
			_myMessageList lbSetPicture [(lbSize _myMessageList)-1,_icon];
			_myMessageList lnbSetData[[(SEL((lnbSize _myMessageList),0))-1,0],str(_x)];
		}forEach _aufMyData;
	};
	
	case 1:
	{
		createDialog "Life_auf_schreiben";
		ctrlSetText[88991, format["Nachricht an: %1",name life_aufTarget]];
	
	};
};