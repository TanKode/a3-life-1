/*

	Fires a "Bird Down" bullet

	fireBirdDown(0,1,2, TYPE);

*/

private["_type","_inventory","_veh","_hasweapon","_ammocount","__shrt","__count","_target","_nearest","_target_distance","_targettime","_target_locked", "_crewlist","_maxdistance","_alt_veh","_alt_target","_alt_diff"];

_type = _this select 3; //type
_veh = vehicle player;
_weapon_vehicle = ["B_Heli_Light_01_armed_F","I_Heli_light_03_F","B_Heli_Transport_01_F"];
_vehicle = typeOf _veh;

if(_vehicle in _weapon_vehicle)  then
{
	if( !(_veh isKindOf "Air")) exitWith {systemChat "ERR: Not in aircraft";};

	//Check if player is gunner or driver
	if( ((gunner _veh) != player) && ((driver _veh) != player)) exitWith {hint "Kann nur ein Schütze oder ein Pilot ausführen!";}; 

	/////////////////////////////////// PHASE 0: Ammo/Check for existance
	//Get veh inventory
	_inventory = _veh getVariable ["Trunk",[]];

	if(count _inventory != 2) exitWith { hint "Fahrzeug hat kein Inventar!"; };
	_inventory = _inventory select 0;
	_inventory = + _inventory; //copy the array and work in copy

	if(bk_warning) exitWith {cutText ["Es wird gerade ein Fahrzeug gewarnt!","PLAIN DOWN"],bk_warning = false;};
	//Only one can be used in time
	if( _veh getVariable["bird_down_inuse",true] ) exitWith { cutText ["Waffensystem arbeitet bereits!","PLAIN DOWN"] };
	_veh setVariable["bird_down_inuse",true,true];

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
						_inventory set [_forEachIndex, ["uitem_bd_mk1_ammo", _ammocount - 1] ];
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

			if(true) exitWith { _veh setVariable["bird_down_inuse",false,true]; hint "ERR: WRONG WEAPON!"; bk_warning = false;};
		};
	};

	if(!_hasweapon) exitWith { hint "Du hast nicht die benötigte Waffe!"; _veh setVariable["bird_down_inuse",false,true];bk_warning = false;};
	if(_ammocount < 1) exitWith { hint "Du hast keine Munition!"; _veh setVariable["bird_down_inuse",false,true];bk_warning = false;};
	if(!(alive _veh)) exitWith { hint "Fahrzeug ist zerstört!"; _veh setVariable["bird_down_inuse",false,true];bk_warning = false;};

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

	/*if(count _nearest > 1) then
	{
		_target = _nearest select 1;
	};*/
	_typ = getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName");

	if(isNil("_target")) exitWith { hint "Kein Ziel gefunden!"; _veh setVariable["bird_down_inuse",false,true];bk_warning = false;};

	if(_target getVariable["fuelkill_warning",true]) exitWith {cutText format["Dieses Fahrzeug wird gerade gewarnt!","PLAIN DOWN"];_veh setVariable["bird_down_inuse",false,true];bk_warning = false;};
	if(_target getVariable["fuelkill_no_warning",true]) exitWith {hint "Dieses Fahrzeug wurde nocht nicht gewarnt";_veh setVariable["bird_down_inuse",false,true];bk_warning = false;};
	hint parseText format["<img size='2' image='icons\schiessplatz.paa'/>Waffensystem zielt auf %1.",_typ];
	[player,"target_beep"] call life_fnc_globalSound;
	playSound "target_beep";

	sleep 3;

	 ////////////////////////////////////////////////////////////
	 //PHASE 2: Targeting
	 _targettime = -1;

	 switch(_type) do 
	{
		case "BDMK1":
		{
			_targettime = 8; //x2
		};
		case "BDMK2":
		{
			_targettime = 16; //x2
		};
	};

	if(_targettime == -1) exitWith { hint "ERR: targetTime is -1???"; };

	//Lock target 
	_target_locked = true; //assume everything is correct

	for "_i" from 0 to _targettime do 
	{	
		[player,"target_beep"] call life_fnc_globalSound;
		 playSound "target_beep";

		//Check distance 
		_target_distance = (_veh distance _target);	

		//List the crew as info
		_crewlist = "";

		{
			_crewlist = _crewlist + name _x + "<br/>";
		}
		foreach crew _target;

		//Check if target is under or same level of vehicle 
		_alt_veh = (getPosASL _veh) select 2;
		_alt_target = (getPosASL _target) select 2;
		_alt_diff = _alt_veh - _alt_target; //if negative => cancel

		hintSilent parseText format["<img size='2' image='icons\schiessplatz.paa'/>Ziel<br/>%1<br/><br/>Crew<br/>%3<br/>Distanz<br/><t size='1.2'>%2m / %4m</t><br/><br/>Höhendifferenz<br/><t size='1.2'>%5m</t>", 
		_typ, 
		[round _target_distance] call life_fnc_numberText,
		_crewlist, 
		[_maxdistance] call life_fnc_numberText,
		[round _alt_diff] call life_fnc_numberText];	

		if((_veh != (vehicle player)) || !(alive _veh) || _target_distance > _maxdistance  ||  _alt_diff < -5) exitWith { _target_locked = false; sleep 2;}; //5m room

		sleep 2;
	};

	if(!_target_locked) exitWith { hint parseText "<img size='2' image='icons\schiessplatz.paa'/>Zielvorgang abgebrochen!"; _veh setVariable["bird_down_inuse",false,true];bk_warning = false;};


	 ////////////////////////////////////////////////////////////
	 //PHASE 3: Actual Shoot 
	  hint parseText "<img size='2' image='icons\schiessplatz.paa'/>Zielvorgang abgeschlossen!";
	 [player,"target_shoot"] call life_fnc_globalSound;
	 playSound "target_shoot";
	 sleep 1;
	 hint parseText "<img size='2' image='icons\schiessplatz.paa'/>Waffe wurde abgeschossen!";
	 _flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"adac"};};
	//Save stuff to vehicle
	_veh setVariable ["Trunk",[_inventory,0]]; 
	 //[_veh] call life_fnc_vehicleUpdateTrunkWeight;
	[[_veh,_flag],"TON_fnc_updateVehTrunk",false,false] spawn life_fnc_MP;

	 //Shoot the target 
	switch(_type) do 
	{
		case "BDMK1":
		{
			if(!local _target) then
			{
				[[player, _target, _type, _veh],"life_fnc_birdDownShot",_target,false] spawn life_fnc_MP;
			}
			else
			{
				while{true} do
				{
					_target setFuel (fuel _target)-0.005;

					if((fuel _target) <= 0.09) exitWith {hint ""};
					sleep 0.1;
				};
				_vehicle setFuel 0.09;
			};
		};
		case "BDMK2":
		{
			if(!local _target) then
			{
				[[player, _target, _type, _veh],"life_fnc_birdDownShot",_target,false] spawn life_fnc_MP;
			}
			else
			{
				_target setFuel 0;
				_target setDamage 0.95;
			};
		};
	};

	//Reenable weapon
	_veh setVariable["bird_down_inuse",false,true];
	_target setVariable["fuelkill_no_warning",true,true];
	bk_warning = false;
}else{
	hint "Dieses Fahrzeug hat keine Abschussvorrichtung!";
	bk_warning = false;
};