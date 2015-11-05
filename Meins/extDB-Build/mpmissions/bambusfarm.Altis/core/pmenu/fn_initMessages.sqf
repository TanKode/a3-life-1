/*

	Author life
	Inits the Messages System with For Each player on Server etc...
	Asking for Messages from others and bla

*/
lbClear 2100;
lbClear 1500;
life_player = [];
{
	if (_x != player) then {
		lbAdd [2100, (_x getVariable["realname",name _x])];	
		life_player pushback _x;
	};
} foreach playableUnits;

if ((count life_names ) >0) then {
	{
		lbAdd [1500, _x];	
	} foreach life_names;
} else {
	_text = (localize "STR_messaging_none");
	lbAdd [1500, _text];	
};

_message = (localize "STR_messaging_typein");

disableSerialization;
_display = findDisplay 10000;

(_display displayCtrl 1400) ctrlSetText format["%1", _message];

_textx = localize "STR_messaging_advisep";
(_display displayCtrl 1100) ctrlSetStructuredText (parseText format["<t><t color='#CD2B2B'>ACHTUNG: </t>%1</t>", _textx]);

