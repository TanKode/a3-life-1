#include "\life_server\script_macros.hpp"
/*
	File: fn_craft_update.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
private["_dialog","_inv","_mats","_item","_struct","_str","_invSize","_matsNeed","_matsNum","_config"]; //Declare all private variables
disableSerialization; //Disable Serialization
_filter = craft_filter;
_dialog = findDisplay 766; //find the craft dialog/window
_inv = _dialog displayCtrl 769; //find the listbox of items can be created
_mats = _dialog displayCtrl 772;

_struct = "";
if((lbCurSel 769) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[769,(lbCurSel 769)];

_config = [_filter] call life_fnc_craftCfg;
if(EQUAL(_filter,0))then
{
	{
		if(EQUAL(_item,SEL(_x,0)))then
		{
			_matsNeed = SEL(_x,1);
			_invSize = count _matsNeed;
			for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
				_str = M_CONFIG(getText,"VirtualItems",(SEL(_matsNeed,_i)),"displayName");
				_matsNum = SEL(_matsNeed,(_i+1));
				_struct = _struct + format["%1x %2<br/>",_matsNum,(localize _str)];

			};
		};
	} foreach _config;
};

if(EQUAL(_filter,1))then
{
	{
		if(EQUAL(_item,SEL(_x,0)))then
		{
			_matsNeed = SEL(_x,1);
			_invSize = count _matsNeed;
			for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
				_str = M_CONFIG(getText,"VirtualItems",(SEL(_matsNeed,_i)),"displayName");
				_matsNum = SEL(_matsNeed,(_i+1));
				_struct = _struct + format["%1x %2<br/>",_matsNum,(localize _str)];

			};
		};
	} foreach _config;	
};

if(_struct == "") then
{
	_struct = "No material needed";
};

_mats ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct];