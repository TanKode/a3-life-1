/*

	Author bambusfarm
	Gets the user from the RSC edit and the messages bla...

*/
private ["_new","_search","_got_it"];

_in = bambusfarm_player;
_message = ctrlText 1401;

if (_message == "") exitWith { [] spawn bambusfarm_fnc_initMessages; };

lbClear 2100;
lbClear 1500;

_search = _message;
_new = [];

{	
	_got_it = [_search, (_x getVariable["realname",name _x])] call KK_fnc_inString;
	if (_got_it) then {
		lbAdd [1500, (_x getVariable["realname",name _x])];	
		lbAdd [2100, (_x getVariable["realname",name _x])];
	};
} foreach _in;



KK_fnc_inString = {
/*
		Author: Killzone_Kid
		_got_it = ["needle", "Needle in Haystack"] call KK_fnc_inString;
*/

    private ["_searching","_completestring","_imsearching","_buckit","_got_it"];
    _searching = [_this, 0, "", [""]] call BIS_fnc_param;
    _completestring = toArray ([_this, 1, "", [""]] call BIS_fnc_param);
    _imsearching = count toArray _searching;
    _buckit = +_completestring;
    _buckit resize _imsearching;
    _got_it = false;
    for "_i" from _imsearching to count _completestring do {
        if (toString _buckit == _searching) exitWith {_got_it = true};
        _buckit set [_imsearching, _completestring select _i];
        _buckit set [0, "x"];
        _buckit = _buckit - ["x"]
    };
    _got_it
};