//::::::::::::  ::::::::::::\\
//	Filename: bambusfarm_server/Functions/bambusfarm/fn_BuyHouseCheck.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Der an die Gang weitergegebene Schlüßel wird in die DB eingetragen
//::::::::::::  ::::::::::::\\
	private["_house","_uid","_housePos","_query"];

	_uid = [_this,0,"",[""]] call BIS_fnc_param;
	_player = _this select 1;
	
	_query = format["SELECT COUNT(*) FROM houses WHERE pid = '%1'", _uid];
	_queryResult = [_query,2] call DB_fnc_asyncCall;

	_DarfKaufen = _player setVariable ["bambusfarm_CanBuyHouse",_queryResult select 0,true];