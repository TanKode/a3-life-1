/*
File: fn_vehicleRefresh.sqf
Author: Torsten "Demon" Ennenbach

Description:
Logs all active Vehicles for debug to logfile
deletes vehicles in vehNotAllowed list! (anti cheat)
Also fixes the "Vehicle Lost Owner info" the BIS Garbage Collecter is tricked by accessing the Variables over and over again. Well not everytime :/ but its better now

*/
private["_allVeh","_owners","_trunk","_dbInfo","_uid","_plate","_typeof","_e","_exception","_vehNotAllowed"];

// The not allowed vehicle list (put every vehicle in there you dont have on your mission_vehNotAllowed = ["I_UGV_01_rcws_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_gmg_F","I_UAV_02_CAS_F","I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F","O_UGV_01_rcws_F","I_Heli_light_03_F","O_MRAP_02_gmg_F","O_UAV_02_CAS_F","O_UAV_02_F","O_MBT_02_arty_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_Plane_CAS_02_F","O_Heli_Attack_02_black_F","O_Heli_Attack_02_F","O_Heli_Light_02_F","B_UAV_01_F"];
_vehNotAllowed = [];
_allVeh = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";while {true} do
{
	{
		_typeof = typeOf _x;
		if ( _typeof in _vehNotAllowed ) then { //diag_log format["OBS - NPC VEHICLE TYPE DETECTED!!!: %1", _typeof];
			diag_log "DELETING VEHICLE FROM MAP";
			deleteVehicle _x;
		} else {
			_owners = _x getVariable ["vehicle_info_owners",[]];
			_trunk = _x getVariable ["Trunk",[]];
			_dbInfo = _x getVariable["dbInfo",[]];

		if(count _dbInfo > 0) then {
			_uid = _dbInfo select 0;
			_plate = _dbInfo select 1;
		} else {
			_uid = "UNDEFINED";
			_plate = "UNDEFINED";
		};
		diag_log "########################### OBSERVE ALL PLAYER VEHICLES ACTIVE ON MAP START ############################################################";
		diag_log format["OBS - VEHICLE TYPE: %1", _typeof];
		diag_log format["OBS - VEHICLE OWNER: %1", _owners];
		diag_log format["OBS - VEHICLE TRUNK: %1", _trunk];
		diag_log format["OBS - dbInfo: %1", str _dbInfo];
		diag_log format["OBS - VEHICLE UID: %1", _uid];
		diag_log format["OBS - VEHICLE PLATE: %1", _plate];
		diag_log "########################### OBSERVE ALL PLAYER VEHICLES ACTIVE ON MAP END ############################################################"; 
		};
	} foreach _allVeh;
sleep 240; // your timer in seconds. well not exactly seconds...
};