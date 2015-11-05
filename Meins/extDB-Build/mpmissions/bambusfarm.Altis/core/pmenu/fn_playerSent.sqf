/*

	Author life
	Triggers if player sends the message from the new message system to another player...

*/

if (isnil "player_Send_message") then {
	player_Send_message = false;
};

if (player_Send_message) exitwith { hint (localize "STR_messaging_helps_m3"); };

private["_mode","_reciever","_message","_index","_pos"];
_mode = [_this,0,3,[3]] call BIS_fnc_param;

_reciever = lbCurSel 2100;
_message = ctrlText 1400;

disableSerialization;
_display = findDisplay 10000;
_index =  cbChecked (_display displayCtrl 2800);
 

if ((lbText [2100,_reciever]) == profilename) exitwith {};

_sent = false;

if (!_index) then {
	_pos = [];
} else {
	_pos = getpos player;
};
if (_message == "" OR _message == (localize "STR_messaging_typein")) exitwith {};

switch (_mode) do {
	case 0: {
		if (_reciever == -1 OR (lbText [2100,_reciever]) == "") exitwith {hint (localize "STR_messaging_helps_m4");};	
		[[_mode, (lbText [2100,_reciever]),_message,_pos, profileName],"life_fnc_recieveMessage",true,false] spawn life_fnc_MP;
		_sent = true;
	};
	case 1: {	
		_reciever = (localize "STR_messaging_hpp_sendd2");		
		[[_mode, _message,_pos, profileName],"life_fnc_recieveMessage",true,false] spawn life_fnc_MP;
		_sent = true;
	};
	case 2: {	
		_reciever = (localize "STR_messaging_hpp_sendd");
		[[_mode, _message,_pos, profileName],"life_fnc_recieveMessage",true,false] spawn life_fnc_MP;
		_sent = true;
	};
	default {
		hint "Something went wrong... case sensitive has failed...!";			
	};
};

if (_sent) then {	

	hint parseText format ["%1<t color='#CD2B2B'> %2 </t>%3", (localize "STR_messaging_helps_m5"), _reciever, (localize "STR_messaging_helps_m6")];
		
	player_Send_message = true; //for trolls who think they can troll the other players with message dumps -.-
	sleep 5;
	player_Send_message = false;
};



