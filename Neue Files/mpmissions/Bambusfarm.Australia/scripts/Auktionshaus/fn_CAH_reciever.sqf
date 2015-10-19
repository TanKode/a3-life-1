#include <macro.h>
_mode = [_this,0,-1] call BIS_FNC_PARAM;
_info = [_this,1,-1] call BIS_FNC_PARAM;

_vItem = [];
{_vItem pushBack (configName _x);} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

switch (_mode) do
{
	case 0:
	{
		_item = _info select 0;
		_price = _info select 1;
		_seller = _info select 2;
		_name = M_CONFIG(getText,"VirtualItems",_item,"displayName");
		if(_item in _vItem) then
		{
			hint parseText format
			[
				"Sie haben erworben:<br/><br/>
				<t color='#FF0000'>%1</t> fuer<br/>
				<t color='#228B22'>%3%2</t><br/>
				von %4",
				(localize _name),([_price] call life_fnc_numberText),"$",name _seller
			];
			SUB(BANK,_price);
			[true,_item,1] call life_fnc_handleInv;
			closeDialog 0;
		}else{
			hint parseText format
			[
				"Sie haben erworben:<br/><br/>
				<t color='#FF0000'>%1</t> fuer<br/>
				<t color='#228B22'>%3%2</t><br/>
				von %4",
				(([_item] call VAS_fnc_fetchCfgDetails) select 1),([_price] call life_fnc_numberText),"$",name _seller
			];
			SUB(BANK,_price);
			[_item,true] spawn life_fnc_handleItem;
			closeDialog 0;
		};
	};
	case 1:
	{
		_seller = _info select 0;
		_price = _info select 1;
		hint parseText format
		[
			"%1 aktzeptiert ihr Angebot, Sie erhalten<br/>
			<t color='#228B22'>%3%2</t><br/>",
			name _seller,([_price] call life_fnc_numberText),"$"
		];
		ADD(BANK,_price);
		_listings = profileNamespace getVariable "listings";
		//_listings = _listings - (_info select 2);
		_index = -1;
		_handled = false;
		{
			_index = _index + 1;
			if (_x isEqualTo (_info select 2) AND !_handled) then {_listings deleteAt _index;_handled=true;};
		} forEach _listings;
		profileNamespace setVariable ["listings",_listings];
	};
	case 2:
	{
		AH_offers = _info;
		AH_loaded = true;
	};
	case 3: {hint "Bei dem Versuch, den Gegenstand zu kaufen ist ein Fehler aufgetreten";};
};