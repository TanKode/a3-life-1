#include <macro.h>
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_shopSide","_license"];
_mode = SEL(_this,0);
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {life_spyglassamount = life_spyglassamount +1;[[profileName,format["Geldglitch beim Markt einkauf, Anzahl: %1",life_spyglassamount]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;};
life_nottoofast = time;
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];

_vehicleList = M_CONFIG(getArray,"CarShops",SEL(life_veh_shop,0),"vehicles");
_shopSide = M_CONFIG(getText,"CarShops",SEL(life_veh_shop,0),"side");
_basePrice = SEL(SEL(_vehicleList,_vIndex),1);

if(_mode) then {_basePrice = round(_basePrice * 1.5)};
if(skill_civ_silver_tg) then {_basePrice = round(_basePrice * 0.98)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];
_success = false;

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
//if(CASH < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - CASH] call life_fnc_numberText];};

_license = SEL(SEL(_vehicleList,_vIndex),2);
if(!(EQUAL(_license,"")) && {!(LICENSE_VALUE(_license,_shopSide))}) exitWith {closeDialog 0;hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = SEL(life_veh_shop,1);
_spawnPoint = "";

if((SEL(life_veh_shop,0) == "med_air_hs")) then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	if((SEL(life_veh_shop,0) in ["base_air","base_reb"])) then {
		_spawnPoint = life_pInact_curTarget;
	}else{
		if((SEL(life_veh_shop,0) in ["cop_car","cop_air"])) then {
			_spawn = [];
			if(EQUAL((typeOf _spawnPoints),"Land_PoliceStation")) then
			{
				_spawn = (_spawnPoints modelToWorld [13,15,0]);
			}else{
				_spawn = (_spawnPoints modelToWorld [3.5,-9.5,5.5]);
			};
			if(count(nearestObjects[_spawn,["Car","Ship","Air","landVehicle"],2]) == 0) exitWith {_spawnPoint = _spawnPoints};
		}else{
		//Check if there is multiple spawn points and find a suitable spawnpoint.
			if(EQUAL(typeName _spawnPoints,typeName [])) then {
				//Find an available spawn point.
				{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air","landVehicle"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
			} else {
				if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air","LandVehicle"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
			};
		};
	};
};
	
if(EQUAL(_spawnPoint,"")) exitWith {closeDialog 0;hint localize "STR_Shop_Veh_Block";};

if(CASH >= _basePrice) then
{
	SUB(CASH,_basePrice);
	hint format[localize "STR_NOTF_Bargeld",[_basePrice] call life_fnc_numberText,getText(configFile >> "CfgVehicles" >> _className >> "displayName")];
	_success = true;
	//Spawn the vehicle and prep it.
	if((life_veh_shop select 0) == "med_air_hs") then {
		_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		_vehicle allowDamage false;
		_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
		_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
		_vehicle lock 2;
		[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
		[_vehicle] call life_fnc_clearVehicleAmmo;
		[[_vehicle],"TON_fnc_disableRobes",false,false] spawn life_fnc_MP;
		[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		_vehicle setVariable["Trunk",[[],0],true];
		_vehicle setVariable["gpsTrackerActivate",false,true];
		_vehicle setVariable["fuelkill_no_warning",true,true];
		_vehicle setVariable["fuelkill_warning",false,true];
		_vehicle setVariable["adacCheck",false,true];
		//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
	} else {
		if((SEL(life_veh_shop,0)) in ["base_air","base_reb"]) then {
			_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
			waitUntil {!isNil "_vehicle"}; //Wait?
			_vehicle allowDamage false;
			//_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
			if((SEL(life_veh_shop,0)) == "base_reb") then {
				_vehicle setPosATL (_spawnPoint modelToWorld [0,0,-3.5]);
			}else{
				_vehicle setPosATL (_spawnPoint modelToWorld [0,0,4.5]);
			};
			_vehicle setDir (getDir _spawnPoint);
			_vehicle lock 2;
			//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
		}else{
			if((SEL(life_veh_shop,0)) in ["cop_car","cop_air"]) then
			{
				_vehicle = createVehicle [_className,[0,0,999], [], 0, "NONE"];
				waitUntil {!isNil "_vehicle"}; //Wait?
				_vehicle allowDamage false; //Temp disable damage handling..
				if(EQUAL((SEL(life_veh_shop,0)),"cop_car")) then {
					_vehicle setPos (_spawnPoint modelToWorld [13,15,0]);
					_vehicle setDir ((getDir _spawnPoint)-180);
				}else{
					_vehicle setPos (_spawnPoint modelToWorld [3.5,-9.5,5.5]);
					_vehicle setDir ((getDir _spawnPoint)-180);
				};
				_vehicle lock 2;
				//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
			}else{
				_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
				waitUntil {!isNil "_vehicle"}; //Wait?
				_vehicle allowDamage false; //Temp disable damage handling..
				_vehicle lock 2;
				_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
				_vehicle setDir (markerDir _spawnPoint);
				_vehicle setPos (getMarkerPos _spawnPoint);
				//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
			};
		};
		[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
		[_vehicle] call life_fnc_clearVehicleAmmo;
		[[_vehicle],"TON_fnc_disableRobes",false,false] spawn life_fnc_MP;
		[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		_vehicle setVariable["Trunk",[[],0],true];
		_vehicle setVariable["gpsTrackerActivate",false,true];
		_vehicle setVariable["fuelkill_no_warning",true,true];
		_vehicle setVariable["fuelkill_warning",false,true];
		_vehicle setVariable["adacCheck",false,true];
	};
		
	_veh = typeOf _vehicle;
	//OelFass
	if(_veh in ["C_Offroad_01_F"]) then
	{
		_vehicle setVariable ["OelSlot",0,true];
	};
	
	if(_veh == "B_UAV_02_F") then
	{
		createVehicleCrew _vehicle;
	};
	
	//Side Specific actions.
	switch(playerSide) do {
		case west: {
			[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
		};

		case civilian: {
			if(EQUAL(SEL(life_veh_shop,2),"civ") && {_className == "B_Heli_Light_01_F"}) then {
				[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
			};
		};

		case independent: {
			[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
		};
		
		case east: {
			[_vehicle,"adac_offroad",true] spawn life_fnc_vehicleAnimate;
		};
	};

	_vehicle allowDamage true;

	//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
	life_vehicles pushBack _vehicle;
	[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;

	if(_mode) then {
		if(!(_className in ["C_Kart_01_Blu_F", "C_Kart_01_Fuel_F", "C_Kart_01_Red_F", "C_Kart_01_Vrana_F"])) then {
			[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
		};
	};

	_box = boundingBox _vehicle;  
	_offset = _box select 1;  //Gets an array with the maximum bounding values
	_offset = _offset select 2; //Gets the Maxmimum Z height
	_offset = _offset + 0.8; //Just a few inches more...

	_sp = visiblePosition _vehicle;
	_sp = _sp vectorAdd [0,0,_offset]; 
	_vh = createVehicle ["Sign_Arrow_Large_F", _sp ,[],0,"NONE"];
	_vh setPos _sp; 

	[0] call SOCK_fnc_updatePartial;
	closeDialog 0; //Exit the menu.
	true;
			 
	sleep 15;
	deleteVehicle _vh;
}
else
{
	if(life_inv_debitcard > 0) then
	{ 
		if(BANK < _basePrice) then {hint format[localize "STR_NOTF_NoBank",[_basePrice] call life_fnc_numberText,getText(configFile >> "CfgVehicles" >> _className >> "displayName")]}
		else
		{
			hint format[localize "STR_NOTF_Kreditkart",[_basePrice] call life_fnc_numberText,getText(configFile >> "CfgVehicles" >> _className >> "displayName")];
			SUB(BANK,_basePrice);
			_success = true;
			if((life_veh_shop select 0) == "med_air_hs") then {
				_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
				waitUntil {!isNil "_vehicle"}; //Wait?
				_vehicle allowDamage false;
				_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
				_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
				_vehicle lock 2;
				[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
				[_vehicle] call life_fnc_clearVehicleAmmo;
				[[_vehicle],"TON_fnc_disableRobes",false,false] spawn life_fnc_MP;
				[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
				[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
				_vehicle setVariable["Trunk",[[],0],true];
				_vehicle setVariable["gpsTrackerActivate",false,true]
				//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
			} else {
				if((SEL(life_veh_shop,0)) in ["base_air","base_reb"]) then {
					_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
					waitUntil {!isNil "_vehicle"}; //Wait?
					_vehicle allowDamage false;
					//_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
					if((SEL(life_veh_shop,0)) == "base_reb") then {
						_vehicle setPosATL (_spawnPoint modelToWorld [0,0,-3.5]);
					}else{
						_vehicle setPosATL (_spawnPoint modelToWorld [0,0,4.5]);
					};
					_vehicle setDir (getDir _spawnPoint);
					_vehicle lock 2;
					//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
				}else{
					if((SEL(life_veh_shop,0)) in ["cop_car","cop_air"]) then
					{
						_vehicle = createVehicle [_className,[0,0,999], [], 0, "NONE"];
						waitUntil {!isNil "_vehicle"}; //Wait?
						_vehicle allowDamage false; //Temp disable damage handling..
						if(EQUAL((SEL(life_veh_shop,0)),"cop_car")) then {
							_vehicle setPos (_spawnPoint modelToWorld [13,15,0]);
							_vehicle setDir ((getDir _spawnPoint)-180);
						}else{
							_vehicle setPos (_spawnPoint modelToWorld [3.5,-9.5,5.5]);
							_vehicle setDir ((getDir _spawnPoint)-180);
						};
						_vehicle lock 2;
						//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
					}else{
						_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
						waitUntil {!isNil "_vehicle"}; //Wait?
						_vehicle allowDamage false; //Temp disable damage handling..
						_vehicle lock 2;
						_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
						_vehicle setDir (markerDir _spawnPoint);
						_vehicle setPos (getMarkerPos _spawnPoint);
						//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
					};
				};
				[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
				[_vehicle] call life_fnc_clearVehicleAmmo;
				[[_vehicle],"TON_fnc_disableRobes",false,false] spawn life_fnc_MP;
				[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
				[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
				_vehicle setVariable["Trunk",[[],0],true];
				_vehicle setVariable["gpsTrackerActivate",false,true];
				_vehicle setVariable["fuelkill_no_warning",true,true];
				_vehicle setVariable["fuelkill_warning",false,true];
				_vehicle setVariable["adacCheck",false,true];
			};
			
			_veh = typeOf _vehicle;
			//OelFass
			if(_veh in ["C_Offroad_01_F"]) then
			{
				_vehicle setVariable ["OelSlot",0,true];
			};
			
			if(_veh == "B_UAV_02_F") then
			{
				createVehicleCrew _vehicle;
			};

			//Side Specific actions.
			switch(playerSide) do {
				case west: {
					[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
				};

				case civilian: {
					if(EQUAL(SEL(life_veh_shop,2),"civ") && {_className == "B_Heli_Light_01_F"}) then {
						[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
					};
				};

				case independent: {
					[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
				};

				case east: {
					[_vehicle,"adac_offroad",true] spawn life_fnc_vehicleAnimate;
				};
			};

			_vehicle allowDamage true;

			//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
			life_vehicles pushBack _vehicle;
			[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;

			if(_mode) then {
				if(!(_className in ["C_Kart_01_Blu_F", "C_Kart_01_Fuel_F", "C_Kart_01_Red_F", "C_Kart_01_Vrana_F"])) then {
					[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
				};
			};

			_box = boundingBox _vehicle;  
			_offset = _box select 1;  //Gets an array with the maximum bounding values
			_offset = _offset select 2; //Gets the Maxmimum Z height
			_offset = _offset + 0.8; //Just a few inches more...

			_sp = visiblePosition _vehicle;
			_sp = _sp vectorAdd [0,0,_offset]; 
			_vh = createVehicle ["Sign_Arrow_Large_F", _sp ,[],0,"NONE"];
			_vh setPos _sp; 

			[0] call SOCK_fnc_updatePartial;
			closeDialog 0; //Exit the menu.
			true;

			sleep 15;
			deleteVehicle _vh;	
		};
	}
	else
	{
		hint format[localize "STR_NOTF_NoKreditkart",[_basePrice] call life_fnc_numberText,getText(configFile >> "CfgVehicles" >> _className >> "displayName")];
		closeDialog 0;
		true
	};
};
_success;