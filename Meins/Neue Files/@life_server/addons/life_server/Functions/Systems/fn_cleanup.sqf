/*
	File: fn_cleanup.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Server-side cleanup script on vehicles.
	Sort of a lame way but whatever.
*/
private["_deleted"];
_deleted = false;
while {true} do
{
	private["_veh","_units"];
	sleep (60 * 60);
	{
		_veh = _x;
		_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");

		if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine","LandVehicle"]) then
		{
			_dbInfo = _veh getVariable["dbInfo",[]];
			_trunk = _veh getVariable["Trunk",[[],0]];
			_units = {(_x distance _veh < 1000)} count playableUnits;
			if(count crew _x == 0) then
			{
				switch (true) do
				{
					case ((_x getHitPointDamage "HitEngine") > 0.7 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case (_units == 0): {deleteVehicle _x; _deleted = true;};
				};
			};

			if(_deleted) then {
				
				_deleted = false;
		
				//systemChat "VEH NULL";
				if(count _dbInfo > 0) then
				{
					//systemChat "Fixing...";
					_uid = _dbInfo select 0;
					_plate = _dbInfo select 1;
					
					//Save vehicle inventory
					_cargo = [];

					_vehItems = getItemCargo _veh;
					_vehMags = getMagazineCargo _veh;
					_vehWeapons = getWeaponCargo _veh;
					_vehBackpacks = getBackpackCargo _veh;

					_cargo pushBack _vehItems;
					_cargo pushBack _vehMags;
					_cargo pushBack _vehWeapons;
					_cargo pushBack _vehBackpacks;
					//_cargo = [_cargo] call DB_fnc_mresArray;

					_damage = damage _veh;

					_query = format["vehicleUpdateActivePlate:0:%1:%2:%3:%4:%5",_trunk,_cargo,_damage,_uid,_plate];
					waitUntil {!DB_Async_Active};
					[_query,1] call DB_fnc_asyncCall;
				};
			};
		};
	} foreach vehicles;

	sleep (5 * 60); //3 minute cool-down before next cycle.
	{
		if((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then
		{
			deleteVehicle _x;
		};
	} foreach (allMissionObjects "Thing");

	sleep (3 * 60);
	{
		deleteVehicle _x;
	} foreach (allMissionObjects "GroundWeaponHolder");
};