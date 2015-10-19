disableSerialization;
_dialog = findDisplay 50000;
_listbox = _dialog displayCtrl 50001;

_index = lbCurSel _listbox;
if (_index==-1) exitWith {hint "Nein";};
if (life_voted) exitWith {hint "Sie haben schon für einen Spieler gewaehlt!";};
_voteForString = _listbox lbData _index;
_voteFor = call compileFinal _voteForString;

[[_voteFor],"TON_fnc_recievedVote",false,false] spawn life_fnc_mp;

hint format ["Sie haben gestimmt fuer %1",name _voteFor];
life_voted = true;