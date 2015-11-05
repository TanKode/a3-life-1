/*
	Author: Matthias Bun
	
	Description:
	Sets up the Base Trunk

*/
private["_queryResult","_query","_count","_tickTime"];



	waitUntil{!DB_Async_Active};
	//_query = format["SELECT  pos, inventory, slots FROM realbase"];
	_query = format["SelectRealBase"];
	waitUntil{sleep (random 0.3); !DB_Async_Active};
	_tickTime = diag_tickTime;
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	//diag_log format["QueryResulRealtBase: %1",_queryResult];

	{
		_pos = call compile format["%1",_x select 0];
		_base = _pos nearestObject "house";
		//diag_log format["pos: %1 base: %2", _x select 0,_base];
		_base setVariable["slot",_x select 2,true];
		_trunk = _x select 1;
		if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
		_base setVariable["Trunk",_trunk,true];
		
	
		
	} foreach _queryResult;