disableSerialization;
_display = findDisplay 50200;
_textEdit = _display displayCtrl 50201;

_text = ctrlText _textEdit;

if (_text=="") exitWith {hint parseText "<t color='#FF0000'>--ERROR--</t><br/><t color='#FF0000'>UNGÜLTIGE EINGABE</t>";};

_text2 = format ["Der Governor hat ein neues Gesetz verabschiedet: %1",_text];

[[1,_text2], "life_fnc_broadcast", true, false] spawn life_fnc_mp;
[[_text, getPlayerUID player], "TON_fnc_newLaw", false, false] spawn life_fnc_mp;