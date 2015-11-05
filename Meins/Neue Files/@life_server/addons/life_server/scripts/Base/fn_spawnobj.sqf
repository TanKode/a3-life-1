/*
	Author: Matthias Bun
	
	Description:
	WHAT THE HELL DO YOU THINK IT DOES?!?!!??!?!!?!??!
*/
private["_queryResult","_query","_count","_tickTime"];



	waitUntil{!DB_Async_Active};
	//_query = format["SELECT id, pos, dir, kind, inventory FROM object"];
	_query = format["SelectObject"];
	waitUntil{sleep (random 0.3); !DB_Async_Active};
	_tickTime = diag_tickTime;
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	
	diag_log "------------- Object INIT -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
	diag_log format["Result: %1",_queryResult];
	diag_log "------------------------------------------------";
	
	_index = 0;

	if(count _queryResult == 0) exitWith {};
	{
		_pos = call compile format["%1",_x select 1];
		_dir = _x select 2;
		_dir = parseNumber _dir;
		_kind = _x select 3;
		_obj = _kind createVehicle _pos;
		_obj setPosAtl _pos;
		_obj setDir _dir;
		_obj enableRopeAttach false;
		_obj enableSimulationGlobal false;
		
		if (_obj isKindOf "House_F" )then
		{
			_obj setVariable["locked",true,true]; //Lock up all the stuff.
			_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _obj) >> "numberOfDoors");
			for "_i" from 1 to _numOfDoors do {
				_obj setVariable[format["bis_disabled_Door_%1",_i],1,true];
			};
		};
		
		if (_kind == "Land_Cargo_HQ_V1_F" ) then
		{
			_index = _index + 1;
			_b = "Land_InfoStand_V1_F" createVehicle position _obj;      
			_b attachTo [_obj,[3.3,2,-2.7]];
			_b allowDamage false; 
			_b enableSimulation false; 
			
			baseShops1 pushBack [_index,[_b]];

			_a = "Land_InfoStand_V1_F" createVehicle position _obj; 
			_a attachTo [_obj,[6,2,-2.7]];
			_a allowDamage false; 
			_a enableSimulation false; 

			baseShops2 pushBack [_index,[_a]];
		}else
		{
			if(_kind == "FirePlace_burning_F") then
			{
				_index = _index + 1;
				_obj enableSimulation false; 
				_obj allowDamage false; 
				baseFire pushBack [_index,[_obj]];
			}else{
				if(_kind in ["Box_NATO_AmmoVeh_F","B_supplyCrate_F","Box_IND_AmmoVeh_F"]) then
				{
					_containerData = _x select 4;
					if(typeName _containerData == "STRING") then {_containerData = call compile format["%1", _containerData];};
					if(count _containerData != 0) then 
					{
						_weapons = _containerData select 0;
						_magazines = _containerData select 1;
						_items = _containerData select 2;
						_backpacks = _containerData select 3;

						clearWeaponCargoGlobal _obj;
						clearItemCargoGlobal _obj;
						clearMagazineCargoGlobal _obj;
						clearBackpackCargoGlobal _obj;

						//Add weapons to the crate.
						{
							_weaponCount = (_weapons select 1) select _forEachIndex;
							_obj addWeaponCargoGlobal [_x,_weaponCount];
						} foreach (_weapons select 0);

						//Add magazines
						{
							_magazineCount = (_magazines select 1) select _forEachIndex;
							_obj addMagazineCargoGlobal [_x,_magazineCount];
						} foreach (_magazines select 0);

						//Add items
						{
							_itemCount = (_items select 1) select _forEachIndex;
							_obj addItemCargoGlobal [_x,_itemCount];
						} foreach (_items select 0);

						//Add backpacks
						{
							_backpackCount = (_backpacks select 1) select _forEachIndex;
							_obj addBackpackCargoGlobal [_x,_backpackCount];
						} foreach (_backpacks select 0);
					};	
				};
			};
		};
		
		[[_obj,"obj_id",_x select 0,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		_obj setVariable["obj_id",_x select 0,true];	
	} foreach _queryResult;

publicVariable "baseShops1";
publicVariable "baseShops2";
publicVariable "baseFire";
