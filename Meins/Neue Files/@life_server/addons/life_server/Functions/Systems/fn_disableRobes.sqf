/*
	File: fn_disableRobes.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Robs für Civ´s entfernen!
     
*/
private ["_vehicle","_side","_veh","_heli"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;

life_car = ["C_Kart_01_Vrana_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Blu_F","B_Quadbike_01_F","C_Hatchback_01_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_01_fuel_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_F","O_MRAP_02_F","B_MRAP_01_F","I_MRAP_03_F","C_Rubberboat","C_Boat_Civil_01_F","B_Boat_Transport_01_F","C_Boat_Civil_01_police_F","B_Boat_Armed_01_minigun_F","B_SDV_01_F","Land_Pod_Heli_Transport_04_bench_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_fuel_F"];

if(_veh in life_car) then 
{
	_vehicle enableRopeAttach false;
};