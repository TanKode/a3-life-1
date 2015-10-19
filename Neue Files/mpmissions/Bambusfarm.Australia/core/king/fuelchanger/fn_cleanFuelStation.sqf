#include <macro.h>
/*
	File: fn_cleanFuelStation.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	cleans all fuelstation in range
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

private["_fuelstations"];

while {true} do
{
	waitUntil {sleep 2; ((vehicle player != player) && ((driver (vehicle player)) == player) && (speed (vehicle player)) > 0 && count (nearestObjects [player, ["Land_fs_feed_F"], 50]) > 0)};

	_fuelstations = nearestObjects [player, ["Land_fs_feed_F"], 50];

	{
		if((getFuelCargo _x) > 0) then
		{
			//hint "cleaning up fuelstations";
			_x setFuelCargo 0;
		};
	} foreach _fuelstations;
};