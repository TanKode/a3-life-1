/*

	Author life
	Player select another message and ... it appears!!! WTF IS THIS MAGIC O_O?

*/
private ["_ui","_control_ch","_data","_pos"];
_control = 1500;
_index = lbCurSel _control;
_data =  lbText [_control, _index];

if (_index == -1) exitwith {};
if ((_index == 0) && (_data == (localize "STR_messaging_none"))) exitwith {};

_message = life_messages select _index;
_pos = life_positions select _index;

disableSerialization;
_display = findDisplay 10000;
(_display displayCtrl 1400) ctrlSetText format["%1", _message];


disableSerialization;
_display = findDisplay 10000;
_control_ch =  cbChecked (_display displayCtrl 2800);

if ( (count _pos)>1 ) then {
	[_data, _pos] spawn life_fnc_getMessagePos;
	hintsilent parseText format ["%1<t color='#CD2B2B'> %2 </t>%3", (localize"STR_messaging_helps_m7"),_data,(localize "STR_messaging_helps_m8")];	
	(_display displayCtrl 2800) cbSetChecked true;
} else {
	(_display displayCtrl 2800) cbSetChecked false;
};