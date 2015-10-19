/*
	File: warnVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_vehicle"];

_type = _this select 3; //type
_veh = vehicle player;
_weapon_vehicle = ["B_Heli_Light_01_armed_F","I_Heli_light_03_F","B_Heli_Transport_01_F"];
_vehicle = typeOf _veh;

if(_vehicle in _weapon_vehicle) then
{
	if( ((gunner _veh) != player) && ((driver _veh) != player)) exitWith {hint "Kann nur ein Schütze oder ein Pilot ausführen!";bk_warning = false;};
	if( !(_veh isKindOf "Air")) exitWith {systemChat "ERR: Not in aircraft";};
	if(bk_warning) exitWith { hint "Es wird schon ein Fahrzeug gewarnt!";};
	bk_warning = true;
	//Check if player is gunner or driver
	_maxdistance = 1;
	_time = 45;
	_timeUp = time + _time;

	/////////////////////////////////// PHASE 0: Ammo/Check for existance
	//Get veh inventory
	_inventory = _veh getVariable ["Trunk",[]];

	if(count _inventory != 2) exitWith { hint "Fahrzeug hat kein Inventar!";bk_warning = false; };
	_inventory = _inventory select 0;
	_inventory = + _inventory; //copy the array and work in copy


	//Check if the module is in the vehicle
	_hasweapon = false;
	_ammocount = 0;
	_maxdistance = 1;

	switch(_type) do 
	{
		case "BDMK1":
		{
			//set maxdistance here
			_maxdistance = 600;

			{
				__shrt = _x select 0;
				__count = _x select 1;

				if(__shrt == "bd_mk1_bleachweapon" && __count >= 1) then
				{
					_hasweapon = true;
				};
				if(__shrt == "bd_mk1_ammo") then
				{
					_ammocount = __count;

					//Remove one ammo!
					if(_ammocount > 0) then
					{
						_inventory set [_forEachIndex, ["bd_mk1_ammo", _ammocount - 1] ];
					};
				};
			}
			foreach _inventory;
		};
		case "BDMK2":
		{
			 //set maxdistance here
			_maxdistance = 400;

			{
				__shrt = _x select 0;
				__count = _x select 1;

				if(__shrt == "bd_mk2_microemp" && __count >= 1) then
				{
					_hasweapon = true;
				};
				if(__shrt == "bd_mk2_ammo") then
				{
					_ammocount = __count;

					//Remove one ammo!
					if(_ammocount > 0) then
					{
						_inventory set [_forEachIndex, ["bd_mk2_ammo", _ammocount - 1] ];
					};
				};
			}
			foreach _inventory;
		};
		default
		{
			_hasweapon = false;

			if(true) exitWith { bk_warning = false; hint "ERR: WRONG WEAPON!"; };
		};
	};

	if(!_hasweapon) exitWith { hint "Du hast nicht die benötigte Waffe!";bk_warning = false;};
	if(_ammocount < 1) exitWith { hint "Du hast keine Munition!";bk_warning = false;};
	if(!(alive _veh)) exitWith { hint "Fahrzeug ist zerstört!";bk_warning = false;};


	/////////////////////////////////// PHASE 1: Finding target
	//Find the target
	_nearest = nearestObjects[_veh, ["Air"], _maxdistance];
	_target_distance = 99999;
	_target = "";

	{
		if((_x != _veh) && ((_veh distance _x) < _target_distance)) then
		{
			//Check if target is under or same level of vehicle 
			_alt_veh = (getPosASL _veh) select 2;
			_alt_target = (getPosASL _x) select 2;
			_alt_diff = _alt_veh - _alt_target;
			_alt_diff = _alt_diff;

			if(_alt_diff >= -5) then
			{	
				_target = _x;
			};
		};
	}
	foreach _nearest;

	_crewlist = "";

		{
			_crewlist = _crewlist + name _x + "<br/>";
		}
		foreach crew _target;

	bg_time = true;
	sleep 1;
	call life_fnc_setupActions;
	if(isNull _target) exitWith {bk_warning = false;};
	[[_target], "life_fnc_bdVehicleWarned",(crew _target),false] spawn life_fnc_MP;
	_typ = getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName");
	_veh say3D "empwarn";
	while{true} do
	{
		if((round(_timeUp - time)) > 0) then {
				_countDown = [(_timeUp - time),"MM:SS"] call BIS_fnc_secondsToString;

				hintSilent parseText format["<img size='2' image='icons\schiessplatz.paa'/><br/>Waffensystem warnt:<br/>%1<br/>Crew:<br/>%3<br/>Warnzeit:<br/>%2",_typ,_countDown,_crewlist];
			};

			if((round(_timeUp - time)) == 0) exitWith {hint ""};
			sleep 0.1;	
	};
	_veh say3D "empwarn";
	_target setVariable["fuelkill_no_warning",false,true];
	_veh setVariable["bird_down_inuse",false,true];
	bk_warning = false;
	sleep (5*60);
	bg_time = false;
	sleep 1;
	call life_fnc_setupActions;
}else
{
	hint "Dieses Fahrzeug hat keine Abschussvorrichtung!";
	bk_warning = false;
};
