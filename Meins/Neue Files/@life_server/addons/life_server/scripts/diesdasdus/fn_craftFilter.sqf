#include "\life_server\script_macros.hpp"
/*
	File: fn_craftFilter.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/

disableSerialization;
private["_control","_selection"];
_control = SEL(_this,0);
_selection = SEL(_this,1);
craft_filter = _selection;
_shop = craft_shop;

if(isNull (findDisplay 666)) exitWith {};

_inv = CONTROL(666,669);
lbClear _inv;

_config = [_selection] call life_fnc_craftCfg;
//_shopItems = M_CONFIG(getArray,"VirtualShops",_shop,"items");
if(count _config == 0) exitWith {};

if(EQUAL(_selection,0)) then
{
	{
		_level = SEL(_x,3);
		if(!(EQUAL(_level,-1))) then
		{
			if(LEVEL >= _level) then
			{
				_item = SEL(_x,0);
				_itemInfo = [_item] call life_fnc_fetchCfgDetails;
				_inv lbAdd format["%1",SEL(_itemInfo,1)]; //add a gun to the listbox
				_inv lbSetData[(lbSize _inv)-1,SEL(_itemInfo,0)]; //set the data of the gun
				_inv lbSetPicture[(lbSize _inv)-1,SEL(_itemInfo,2)];
			};
		}else{
			_item = SEL(_x,0);
			_itemInfo = [_item] call life_fnc_fetchCfgDetails;
			_inv lbAdd format["%1",SEL(_itemInfo,1)]; //add a gun to the listbox
			_inv lbSetData[(lbSize _inv)-1,SEL(_itemInfo,0)]; //set the data of the gun
			_inv lbSetPicture[(lbSize _inv)-1,SEL(_itemInfo,2)];
		};
	} foreach _config;
};

if(EQUAL(_selection,1)) then
{
	{
		_item = SEL(_x,0);
		_itemInfos = M_CONFIG(getText,"VirtualItems",_item,"displayName");
		_level = M_CONFIG(getNumber,"VirtualItems",_item,"level");
		
		if(!(EQUAL(_level,-1))) then
		{
			if(LEVEL >= _level) then
			{
				_inv lbAdd format["%1", (localize _itemInfos)];
				_inv lbSetData [(lbSize _inv)-1,_x];
				_icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
				if(!(EQUAL(_icon,""))) then {
					_inv lbSetPicture [(lbSize _inv)-1,_icon];
				};
			};
		}else{
			_inv lbAdd format["%1", (localize _itemInfos)];
				_inv lbSetData [(lbSize _inv)-1,_item];
				_icon = M_CONFIG(getText,"VirtualItems",_item,"icon");
				if(!(EQUAL(_icon,""))) then {
					_inv lbSetPicture [(lbSize _inv)-1,_icon];
				};
		}
	} foreach _config;
};