

_type = [_this,0,0] call BIS_fnc_param;
_aufData = [_this,1,0,["",[],0]] call BIS_fnc_param;
_aufMyData = [_this,2,0,["",[],0]] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 103450};
_display = findDisplay 103450;
_messageList = _display displayCtrl 103451;
_myMessageList = _display displayCtrl 103454;
ctrlEnable[103452,false];
ctrlEnable[103456,false];
ctrlEnable[103457,false];

switch(_type) do
{
	case 0:
	{
		[[0],"TON_fnc_contractRequest",false,false] spawn life_fnc_MP;
		[[1,getPlayerUID player, player],"TON_fnc_contractRequest",false,false] spawn life_fnc_MP;
	};
	
	case 1:
	{
		//_time = _data select 4;
		//_hour = _time select 3;
		//_min = _time select 4;
		
		_onOff = "[OFFLINE]";
		{
			if(getPlayerUID _x == _aufData select 0) then
			{
				_onOff = "[ONLINE]";
			};
		}forEach playableUnits;
		
		_status = "IN BEARBEITUNG";
		if(_aufData select 4 isEqualTo "0")	then
		{
			_status = "OFFEN";
		};
		_icon = "icons\wrench.paa";
		_msg = [_aufData select 2, 10] call KRON_StrLeft;
		data23 = _aufData;
		_messageList lbAdd format["Von: %1%4							%5							MSG: %2...",(_aufData select 1),_msg,(_aufData select 3),_onOff,_status];
		_messageList lbSetPicture [(lbSize _messageList)-1,_icon];
		_messageList lnbSetData[[((lnbSize _messageList) select 0)-1,0],str(_aufData)];
		_messageList lnbSetColor [[]]
	};
	
	case 2:
	{
		_onOff = "[OFFLINE]";
		{
			if(getPlayerUID _x == _aufMyData select 0) then
			{
				_onOff = "[ONLINE]";
			};
		}forEach playableUnits;
		
		data21 = _aufMyData;
		_status = "MEIN AUFTRAG";
		_icon = "icons\wrench.paa";
		_msg = [_aufMyData select 2, 10] call KRON_StrLeft;
		_myMessageList lbAdd format["Von: %1%4							%5							MSG: %2...",(_aufMyData select 1),_msg,(_aufMyData select 3),_onOff,_status];
		_myMessageList lbSetPicture [(lbSize _myMessageList)-1,_icon];
		_myMessageList lnbSetData[[((lnbSize _myMessageList) select 0)-1,0],str(_aufMyData)];
	};
	
	case 3:
	{
		createDialog "Life_auf_schreiben";
		ctrlSetText[88991, format["Nachricht an: %1",name life_aufTarget]];
	
	};
};