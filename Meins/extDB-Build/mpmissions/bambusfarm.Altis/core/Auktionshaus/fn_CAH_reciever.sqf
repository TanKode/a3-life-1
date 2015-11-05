_mode = [_this,0,-1] call BIS_FNC_PARAM;
_info = [_this,1,-1] call BIS_FNC_PARAM;

switch (_mode) do
{
	case 0:
	{
		_item = _info select 0;
		_price = _info select 1;
		_seller = _info select 2;
		hint parseText format
		[
			"Du hast:<br/><br/>
			<t color='#FF0000'>%1</t> for<br/>
			<t color='#228B22'>%3%2</t><br/>
			von %4 gekauft",
			(([_item] call VAS_fnc_fetchCfgDetails) select 1),_price,"€",name _seller
		];
		life_BANK = life_BANK - _price;
		[_item,true] spawn life_fnc_handleItem;
		closeDialog 0;
	};
	case 1:
	{
		_seller = _info select 0;
		_price = _info select 1;
		hint parseText format
		[
			"%1 akzeptierte eines deiner Angebote, du erhälst<br/>
			<t color='#228B22'>%3%2</t><br/>", name _seller,_price,"€"
		];
		life_BANK = life_BANK + _price;
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
	case 3: {hint "Bei dem Versuch das Angebot zu kaufen ist ein Fehler aufgetreten";};
};