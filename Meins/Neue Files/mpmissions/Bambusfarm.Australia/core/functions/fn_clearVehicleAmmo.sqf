#include <macro.h>
/*
	File: fn_clearVehicleAmmo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Clears the vehicle of ammo types that we don't want.
*/
private["_vehicle","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;

if(EQUAL(_veh,"B_Boat_Armed_01_minigun_F")) then {
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
};

if(EQUAL(_veh,"B_APC_Wheeled_01_cannon_F")) then  {
	_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
	_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
};

if(EQUAL(_veh,"O_Heli_Attack_02_black_F")) then {
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};

if(EQUAL(_veh,"B_Heli_Light_01_armed_F")) then 
{
	_vehicle removeMagazinesTurret ["5000Rnd_762x51_Belt",[-1]];
	_vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
};

if(EQUAL(_veh,"I_Heli_light_03_F")) then 
{
	_vehicle removeMagazinesTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
	_vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
};

if(EQUAL(_veh,"B_Boat_Armed_01_minigun_F")) then 
{
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[-1]];
};

if(EQUAL(_veh,"O_Heli_Light_02_F")) then 
{
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
	_vehicle removeMagazinesTurret ["12Rnd_PG_missiles",[-1]];
};

if(EQUAL(_veh,"I_Plane_Fighter_03_AA_F")) then 
{
	_vehicle removeMagazinesTurret ["300Rnd_20mm_shells",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_AAA_missiles",[-1]];
	_vehicle removeMagazinesTurret ["4Rnd_GAA_missiles",[-1]];
};

if(EQUAL(_veh,"O_Plane_CAS_02_F")) then 
{
	_vehicle removeMagazinesTurret ["500Rnd_Cannon_30mm_Plane_CAS_02_F",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_Missile_AA_03_F",[-1]];
	_vehicle removeMagazinesTurret ["4Rnd_Missile_AGM_01_F",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_Bomb_03_F",[-1]];
	_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_HE_F",[-1]];
	_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_AP_F",[-1]];
};

if(EQUAL(_veh,"O_Plane_CAS_02_F")) then 
{
	_vehicle removeMagazinesTurret ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["6Rnd_LG_scalpel",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_GBU12_LGB",[-1]];
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;