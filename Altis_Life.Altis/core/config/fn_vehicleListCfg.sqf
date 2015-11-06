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
	case "med_air_1":
	{
		_return = 
		[
			["B_Heli_Light_01_F",10* DonatorBuyChange],
			["O_Heli_Light_02_unarmed_F",10* DonatorBuyChange],
			["I_Heli_Transport_02_F",10* DonatorBuyChange],
			["I_Heli_light_03_unarmed_F",10* DonatorBuyChange]
		];
	};

	case "med_shop":
	{
		if(__GETC__(life_mediclevel) > 0) then
		{
			_return set[count _return,
			["C_Offroad_01_F",1500* DonatorBuyChange]];
			_return set[count _return,
			["C_Offroad_01_repair_F",1000* DonatorBuyChange]];
			_return set[count _return,
			["B_Truck_01_transport_F",1000* DonatorBuyChange]];
		};
		if(__GETC__(life_mediclevel) > 1) then
		{
			_return set[count _return,
			["C_Van_01_box_F",2500* DonatorBuyChange]];
			_return set[count _return,
			["C_SUV_01_F",10000* DonatorBuyChange]];
		};
		if (__GETC__(life_mediclevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_F",10000* DonatorBuyChange]];
			_return set[count _return,
			["C_Hatchback_01_sport_F",10000* DonatorBuyChange]];
			_return set[count _return,
			["I_Truck_02_medical_F",10000* DonatorBuyChange]];
			_return set[count _return,
			["O_Truck_03_medical_F",10000* DonatorBuyChange]];
			_return set[count _return,
			["B_Truck_01_medical_F",10000* DonatorBuyChange]];
		};
		if (__GETC__(life_mediclevel) > 4) then
		{
			_return set[count _return,
			["I_MRAP_03_F",10000* DonatorBuyChange]];
			_return set[count _return,
			["B_UAV_01_F",10* DonatorBuyChange]];
		};
	};

	case "civ_car_1":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500* DonatorBuyChange],
			["C_Hatchback_01_F",9500* DonatorBuyChange],
			["C_Offroad_01_F",12500* DonatorBuyChange],
			["C_SUV_01_F",35000* DonatorBuyChange],
			["C_Van_01_fuel_F",40000* DonatorBuyChange],
			["C_Van_01_transport_F",60000* DonatorBuyChange],
			["C_Hatchback_01_sport_F",150000* DonatorBuyChange]
		];
	}; 

	case "civ_servt_1":
	{
		_return =
		[
			["C_Offroad_01_F",15000] //Service Truck
		];
	};
	
	case "civ_truck_1":
	{
		_return =
		[
			["B_G_Van_01_fuel_F",40000* DonatorBuyChange],
			["C_Van_01_transport_F",60000* DonatorBuyChange],
			["C_Van_01_box_white_F",75000* DonatorBuyChange],
			["I_Truck_02_fuel_F",300000* DonatorBuyChange],
			["I_Truck_02_transport_F",300000* DonatorBuyChange],
			["I_Truck_02_covered_F",450000* DonatorBuyChange],
            ["O_Truck_03_fuel_F",700000* DonatorBuyChange],
			["O_Truck_03_transport_F",750000* DonatorBuyChange],
			["O_Truck_03_covered_F",950000* DonatorBuyChange],
			["O_Truck_03_device_F",2850000* DonatorBuyChange],
			["B_Truck_01_fuel_F",1000000* DonatorBuyChange],
			["B_Truck_01_transport_F",1700000* DonatorBuyChange],
			["B_Truck_01_covered_F",1800000* DonatorBuyChange],
			["B_Truck_01_box_F",3250000* DonatorBuyChange]
		];	
	};

	case "reb_v_1":
	{
		_return =
		[
			["B_Quadbike_01_F",2500* DonatorBuyChange],
			["B_G_Offroad_01_F",15000* DonatorBuyChange],
			["C_SUV_01_F",35000* DonatorBuyChange],
			["C_Hatchback_01_F",10000* DonatorBuyChange],
			["C_Hatchback_01_sport_F",150000* DonatorBuyChange]
			
			
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",1500000* DonatorBuyChange]];
			_return set[count _return,
			["O_MRAP_02_F",1650000* DonatorBuyChange]];
			_return set[count _return,
			["I_MRAP_03_F",1650000* DonatorBuyChange]];
		};
	};

	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500* DonatorBuyChange],
			["B_G_Offroad_01_F",13000* DonatorBuyChange]
		];
	};
	
	case "reb_car2":
	{
		_return set[count _return,
		["B_Quadbike_01_F",2500* DonatorBuyChange]];
		_return set[count _return,
		["C_Offroad_01_F",9000* DonatorBuyChange]];
		_return set[count _return,
		["O_MRAP_02_F",950000* DonatorBuyChange]];
	};
	
	case "reb_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",275000* DonatorBuyChange]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",350000* DonatorBuyChange]];
		_return set[count _return,
		["O_Heli_Transport_04_F",550000* DonatorBuyChange]];
	};
	
	case "cop_car_1":
	{
		if(__GETC__(life_coplevel) > 0) then
		{
			_return set[count _return,
			["C_SUV_01_F",1500* DonatorBuyChange]];
			_return set[count _return,
			["C_Offroad_01_F",1000* DonatorBuyChange]];
		};
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Hatchback_01_F",2500* DonatorBuyChange]];
		};
		if (__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",5000* DonatorBuyChange]];
			_return set[count _return,
			["B_MRAP_01_F",10000* DonatorBuyChange]];
			_return set[count _return,
			["I_MRAP_03_F",10000* DonatorBuyChange]];
		};
		if (__GETC__(life_coplevel) > 4) then
		{
		};
		if (__GETC__(life_coplevel) > 5) then
		{
		};
	};
	
	case "civ_air_1":
	{
		_return =
		[
			["B_Heli_Light_01_F",250000* DonatorBuyChange],
			["O_Heli_Light_02_unarmed_F",2000000* DonatorBuyChange],
			["I_Heli_Transport_02_F",2800000* DonatorBuyChange],
			["O_Heli_Transport_04_bench_F",2000000* DonatorBuyChange],
			["O_Heli_Transport_04_fuel_F",2250000* DonatorBuyChange],
			["O_Heli_Transport_04_covered_F",3000000* DonatorBuyChange],
			["O_Heli_Transport_04_box_F",3750000* DonatorBuyChange],
			["B_Heli_Transport_03_unarmed_F",5750000* DonatorBuyChange]
		];
	};
	
	case "cop_air_1":
	{
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",30000* DonatorBuyChange]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",30000* DonatorBuyChange]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Heli_Transport_02_F",30000* DonatorBuyChange]];
			_return set[count _return,
			["B_Heli_Transport_01_F",20000* DonatorBuyChange]];
			_return set[count _return,
			["B_Heli_Transport_03_F",22500* DonatorBuyChange]];
		};
	};
	
	case "civ_ship_1":
	{
		_return =
		[
			["C_Rubberboat",5000* DonatorBuyChange],
			["O_SDV_01_F",30000* DonatorBuyChange],
			["C_Boat_Civil_01_F",22000* DonatorBuyChange]
		];
	};
	
	case "cop_ship_1":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000* DonatorBuyChange],
			["C_Boat_Civil_01_police_F",20000* DonatorBuyChange],
			["B_SDV_01_F",10000* DonatorBuyChange]
		];
	};
	
	case "soldner_1":
	{
		if(__GETC__(life_donator) == 3) then
		{
			_return set[count _return,
			["I_MRAP_03_F",2000000* DonatorBuyChange]];
			_return set[count _return,
			["O_MRAP_02_F",1800000* DonatorBuyChange]];
			_return set[count _return,
			["I_Heli_Transport_02_F",650000* DonatorBuyChange]];
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",175000* DonatorBuyChange]];
			_return set[count _return,
			["B_Heli_Light_01_F",100000* DonatorBuyChange]];
			_return set[count _return,
			["B_Truck_01_box_F",2500000* DonatorBuyChange]];
			_return set[count _return,
			["B_MRAP_01_F",2000000* DonatorBuyChange]];
			_return set[count _return,
			["C_Hatchback_01_sport_F",1250000* DonatorBuyChange]];
		};
	}; 
	
	case "kart_shop":
	{
		_return = 
		[
			["C_Kart_01_Blu_F",15000* DonatorBuyChange],
			["C_Kart_01_Fuel_F",15000* DonatorBuyChange],
			["C_Kart_01_Red_F",15000* DonatorBuyChange],
			["C_Kart_01_Vrana_F",15000* DonatorBuyChange]
		];
	};
};
_return;