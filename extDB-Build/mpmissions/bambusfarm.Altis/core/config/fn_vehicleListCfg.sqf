#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",9000 * DonatorBuyChangeCar],
			["C_Kart_01_Fuel_F",9200 * DonatorBuyChangeCar],
			["C_Kart_01_Red_F",9400 * DonatorBuyChangeCar],
			["C_Kart_01_Vrana_F",9600 * DonatorBuyChangeCar]
		];
	};
	
	case "adac_shop":
	{
		_return = [
			["C_Offroad_01_F",20000 * DonatorBuyChangeCar],
			["B_Truck_01_mover_F",39500 * DonatorBuyChangeCar],
			["B_Truck_01_transport_F",69650 * DonatorBuyChangeCar]
		];
	};
	
	case "adac_air_hs": 
	{
		if(__GETC__(bambusfarm_adaclevel) > 1) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",95000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["I_Heli_Transport_02_F",350000 * DonatorBuyChangeCar]];
		};
	};
	
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",20000 * DonatorBuyChangeCar],
			["C_SUV_01_F",32500 * DonatorBuyChangeCar],
			["C_Van_01_box_F",45650 * DonatorBuyChangeCar],
			["B_Truck_01_mover_F", 70000 * DonatorBuyChangeCar]
		];
	};
	
	case "med_air_hs": 
	{
		if(__GETC__(bambusfarm_mediclevel) > 1) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",95000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",350000 * DonatorBuyChangeCar]];
		};
	};
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500 * DonatorBuyChangeCar],
			["C_Hatchback_01_F",19000 * DonatorBuyChangeCar],
			["C_Hatchback_01_sport_F",48000 * DonatorBuyChangeCar],
			["C_Offroad_01_F",26000 * DonatorBuyChangeCar],
			["C_SUV_01_F",39500 * DonatorBuyChangeCar],
			["C_Van_01_transport_F",65000 * DonatorBuyChangeCar]
		];
	};
	
	case "don_car":
	{
		_return = 
		[
			["C_SUV_01_F",39500 * DonatorBuyChangeCar]
		];
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",145000 * DonatorBuyChangeCar],
			["I_Truck_02_transport_F",195000 * DonatorBuyChangeCar],
			["I_Truck_02_covered_F",275000 * DonatorBuyChangeCar],
			["I_Truck_02_box_F",295000 * DonatorBuyChangeCar],
			["B_Truck_01_transport_F",350000 * DonatorBuyChangeCar],
			["B_Truck_01_covered_F",500000 * DonatorBuyChangeCar],
			["B_Truck_01_box_F",650000 * DonatorBuyChangeCar]
		];
	};
	
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",1000 * DonatorBuyChangeCar],
			["B_G_Offroad_01_F",75633 * DonatorBuyChangeCar],
			["B_Heli_Light_01_F",1000000 * DonatorBuyChangeCar]
		];

		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",2000000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["B_MRAP_01_F",850000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Truck_03_transport_F",400000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Truck_03_covered_F",450000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Truck_03_repair_F",600000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_MRAP_02_F",900000 * DonatorBuyChangeCar]];
		};
	};
	
	case "cop_car":
	{
		_return set[count _return,
		["C_Offroad_01_F",13500 * DonatorBuyChangeCar]];
		if(__GETC__(bambusfarm_coplevel) > 1) then
		{
			_return set[count _return,
			["C_SUV_01_F",29300 * DonatorBuyChangeCar]];
		};
		if(__GETC__(bambusfarm_coplevel) > 2) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",32500 * DonatorBuyChangeCar]];
			//_return set [count _return,
			//["O_Truck_02_covered_F",80000 * DonatorBuyChangeCar]];
		};
		if(__GETC__(bambusfarm_coplevel) > 4) then
		{
			_return set[count _return,
			["I_MRAP_03_F",75000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["B_MRAP_01_F",75000 * DonatorBuyChangeCar]];
		};
		if(__GETC__(bambusfarm_coplevel) > 6) then
		{
			_return set[count _return,
			["O_MRAP_02_F",95000 * DonatorBuyChangeCar]];
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["C_Heli_Light_01_civil_F",950000 * DonatorBuyChangeCar],
			["O_Heli_Light_02_unarmed_F",2000000 * DonatorBuyChangeCar],
			["I_Heli_Transport_02_F",3500000 * DonatorBuyChangeCar]
		];
	};
	
	case "cop_air":
	{
		if(__GETC__(bambusfarm_coplevel) > 1) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",120000 * DonatorBuyChangeCar]];
		};
		if(__GETC__(bambusfarm_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_ammo_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["B_Heli_Transport_03_unarmed_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["C_Heli_Light_01_civil_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_bench_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_covered_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_box_F",235000 * DonatorBuyChangeCar]];
		};
	};
	
	case "cop_air_kv":
	{
		if(__GETC__(bambusfarm_coplevel) > 1) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",120000 * DonatorBuyChangeCar]];
		};
		if(__GETC__(bambusfarm_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_ammo_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["B_Heli_Transport_03_unarmed_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["C_Heli_Light_01_civil_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_bench_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_covered_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_box_F",235000 * DonatorBuyChangeCar]];
		};
	};
	
	case "cop_airhq":
	{
		if(__GETC__(bambusfarm_coplevel) > 1) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",120000 * DonatorBuyChangeCar]];
		};
		if(__GETC__(bambusfarm_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_ammo_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["B_Heli_Transport_03_unarmed_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["C_Heli_Light_01_civil_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_bench_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_covered_F",235000 * DonatorBuyChangeCar]];
			_return set[count _return,
			["O_Heli_Transport_04_box_F",235000 * DonatorBuyChangeCar]];
		};
	};
	
	case "donator_car":
	{
		if(__GETC__(bambusfarm_donator) == 4) then
		{
			_return set[count _return,
			["O_Truck_03_device_F",320000 * DonatorBuyChangeCar]];
		};
		if(__GETC__(bambusfarm_donator) == 5) then
		{
			_return set[count _return,
			["O_Truck_03_device_F",235000 * DonatorBuyChangeCar]];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000 * DonatorBuyChangeCar],
			["C_Boat_Civil_01_F",82000 * DonatorBuyChangeCar],
			["B_SDV_01_F",260000 * DonatorBuyChangeCar]
		];
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",15000 * DonatorBuyChangeCar],
			["C_Boat_Civil_01_police_F",22500 * DonatorBuyChangeCar],
			["B_Boat_Armed_01_minigun_F",237500 * DonatorBuyChangeCar]
		];
	};
};

_return;
