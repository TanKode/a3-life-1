#include "\life_server\script_macros.hpp"
/*
	File: init_fuel_action.sqf
	Author: Paradox
	Description: AddActions an alle 28 Tanken hinzufügen
*/
sleep 2;

fuel_stations = [];

for "_i" from 1 to 34 do {
    _fuelstations = nearestObjects[getMarkerPos format["fuelshop_%1",_i],["Land_fs_feed_F"], 50];

    {
        _x setFuelCargo 0;
        _x addaction ["Auftanken","call life_fnc_vehicleCheck"];
        _x addaction ["Spritpreise","call life_fnc_fuelPrices"];
    } foreach _fuelstations;
};