/*
	File: fn_initFuelstations.sqf

	Description:
	Emtpy the Fuelstations and add the Refill action
*/

private["_stations"];

waitUntil{!isNil "bambusfarm_fuelstation_stationlist"};
sleep 1;

{
	_x setFuelCargo 0;
	if((typeOf _x) == "Land_fs_feed_F" && _x getVariable ["ga_id", -1] == -1) then {
		_x addAction["Befüllen",bambusfarm_fnc_fuelStationMenu,["CAR",0.5],0,false,false,"","vehicle player == player && !bambusfarm_action_inUse"];
	};
} foreach bambusfarm_fuelstation_stationlist;

// Init all existing Fueltrucks as well
{
	if((typeOf _x) in bambusfarm_fuelstation_cfgTrucks) then {
		_x addAction["Andere befüllen",bambusfarm_fnc_fuelStationMenu,["FUELTRUCK",0.5],-1,false,false,"","vehicle player == player && !bambusfarm_action_inUse && _target in bambusfarm_vehicles"];
	};
} foreach vehicles;