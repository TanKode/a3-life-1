#include <macro.h>
/*
Filename: fn_insurance.sqf
Author: Kevin Webb
Description: Simple way of insuring the vehicle. Will be modified in the future.
*/
private["_nearVehicles","_vehicle","_price"];
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
else
{
	_nearVehicles = nearestObjects[getPos player,["Car","Air","Ship"],50];
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(!(EQUAL(playerSide,civilian))) then {
	if(isNil "_vehicle") exitWith {hint "Ueberpruefen Sie ob ihr Fahrzeug in der naeh steht!";};
	if(isNull _vehicle) exitWith {};
	if(_vehicle getVariable["isInsured",false]) exitWith { hint "Dieses Fahrzeug hat schon eine Versicherung"; };
	if(!(_vehicle in life_vehicles)) exitWith {hint "Das Fahrzeug gehoert nicht Ihnen."; };
	_price = M_CONFIG(getNumber,CONFIG_VEHICLES,(typeOf _vehicle),"insurance");
	if(_price == -1) exitWith { hint "Sie koennen dieses Fahrzeug nicht Versichern es ist vermutlich Illegal!";};
	_price = _price / 4;
	if(BANK < _price) exitWith { hint format["Sie haben nicht genung Geld auf ihrem Bankkonto fuer die Versicherung, Sie benoetigen %1",_price]; };
	hint format["Fuer die Versicherung wurde Ihnen %1 berechnet. Wenn ihr Fahrzeug Zerstoert wird steht es wieder in Ihrer Garage",_price];
	//["atm","take",_price] call life_fnc_updateCash;
	SUB(BANK,_price);
	closeDialog 0;
	_vehicle setVariable["isInsured",true,true];
	[_vehicle] spawn
	{
		_vehicle = _this select 0;
		waitUntil {sleep 1; !alive _vehicle};
		[[_vehicle],"TON_fnc_vehicleInsurance",false,false] spawn life_fnc_MP;
	};
}else{
	if(!(LEVEL >= 4)) exitWith {hint "Sie haben noch nicht Level 4 erreicht!"};
	if(isNil "_vehicle") exitWith {hint "Ueberpruefen Sie ob ihr Fahrzeug in der naeh steht!";};
	if(isNull _vehicle) exitWith {};
	if(_vehicle getVariable["isInsured",false]) exitWith { hint "Dieses Fahrzeug hat schon eine Versicherung!"; };
	if(!(_vehicle in life_vehicles)) exitWith {hint "Das Fahrzeug gehoert nicht Ihnen."; };
	_price = M_CONFIG(getNumber,CONFIG_VEHICLES,(typeOf _vehicle),"insurance");
	if(_price == -1) exitWith { hint "Sie koennen dieses Fahrzeug nicht Versichern es ist vermutlich Illegal!";};
	//if(_price > life_atmcash) exitWith {hint format["Sie haben keine $%1 Auf ihrem Bankkonto um die Fahrzeugversicherung zu bezahlen!",[_price] call life_fnc_numberText];};
	//_price = (_price * __GETC__(life_vip_discount));
	if(BANK < _price) exitWith { hint format["Sie haben nicht genung Geld auf ihrem Bankkonto fuer die Versicherung, Sie benoetigen %1",_price]; };
	hint format["Fuer die Versicherung wurde Ihnen %1 berechnet. Wenn ihr Fahrzeug Zerstoert wird steht es wieder in Ihrer Garage",_price];
	//["atm","take",_price] call life_fnc_updateCash;
	SUB(BANK,_price);
	closeDialog 0;
	_vehicle setVariable["isInsured",true,true];
	[_vehicle] spawn
	{
		_vehicle = _this select 0;
		waitUntil {sleep 1; !alive _vehicle};
		[[_vehicle],"TON_fnc_vehicleInsurance",false,false] spawn life_fnc_MP;
	};
};