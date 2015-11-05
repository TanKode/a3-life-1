/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright © 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!
*/

private["_posPlayer","_this","_dest","_mygroup1","_mygroup2","_mygroup3","_markerText","_container","_para","_smoke","_light","_flare","_pos_container","_var"];
_pos = [_this,0,[],[[]]] call BIS_fnc_param;

_dest = _pos;

heli1 = CreateVehicle [airdrop_helicopter_main, [7950, 9667, 200], [], 0, "FLY"];
heli2 = CreateVehicle [airdrop_helicopter_scnd, [7950, 9700, 200], [], 0, "FLY"];
heli3 = CreateVehicle [airdrop_helicopter_scnd, [7950, 9630, 200], [], 0, "FLY"];

heli1 allowDamage false;
heli2 allowDamage false;
heli3 allowDamage false;

_mygroup1 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_mygroup2 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_mygroup3 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

{_x moveInDriver heli1} forEach units _mygroup1;
{_x moveInDriver heli2} forEach units _mygroup2;
{_x moveInDriver heli3} forEach units _mygroup3;

_mygroup1 addWaypoint [_dest, 0];
_mygroup1 addWaypoint [[2380.47,22267.8,0], 0];
_mygroup2 addWaypoint [_dest, 0];
_mygroup2 addWaypoint [[2380.47,22267.8,0], 0];
_mygroup3 addWaypoint [_dest, 0];
_mygroup3 addWaypoint [[2380.47,22267.8,0], 0];

_markerText = createMarker ["airbox_marker", [14028.5,18719.7,0.0014267]];
"airbox_marker" setMarkerColor "ColorBlue";
"airbox_marker" setMarkerText " Airdrop-Box";
"airbox_marker" setMarkerType "mil_destroy";
/*
_containerdummy = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_containerdummy attachTo [heli1,[0,0,-3.5]];
_containerdummy setDir 90;
*/

while { _dest distance heli1 > 250 } do { "airbox_marker" setMarkerPos getPos heli1; sleep 1; };
[[3,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>Die Waffenlieferung wurde abgeworfen! Sie haben 30 min bis zur Selbtzerstoerung!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

// Drop the container

//deleteVehicle _containerdummy;
sleep 0.1;
_container = createVehicle ["Land_Cargo10_grey_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_para = createVehicle ["O_Parachute_02_F", [getPos heli1 select 0, getPos heli1 select 1, getPos heli1 select 2], [], 0, ""];
_para setPosATL (heli1 modelToWorld[0,0,100]);
_para attachTo [heli1,[0,0,-10]];
detach _para;
_container attachTo [_para,[0,0,-2]];
_container setDir 90;
playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss", _container];
_smoke="SmokeShellGreen" createVehicle [getpos _container select 0, getpos _container select 1,0];
_smoke attachTo [_container,[0,0,0]];
_light = "Chemlight_green" createVehicle getPos _container;
_light attachTo [_container,[0,0,0]];
_flare = "F_40mm_Green" createVehicle getPos _container;
_flare attachTo [_container,[0,0,0]];
sleep 0.1;
while { (getPos _container select 2) > 2 } do { "airbox_marker" setMarkerPos getPos _container;sleep 1; };
detach _container;
_container setPos [getPos _container select 0, getPos _container select 1, (getPos _container select 2)+0.5];
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _container];
sleep 6;
"M_NLAW_AT_F" createVehicle [getPos _container select 0, getPos _container select 1, 0];
_pos_container = getPos _container;
deleteVehicle _container;
sleep 0.5;
airBoxM = createVehicle ["CargoNet_01_box_F", _pos_container, [], 0, "CAN_COLLIDE"];
airBoxM allowDamage false;
_smoke="SmokeShellGreen" createVehicle [getpos airBoxM select 0,getpos airBoxM select 1,0];
_flare = "F_40mm_Green" createVehicle getPos _container;
_light attachTo [airBoxM,[0,0,0]];
_flare attachTo [airBoxM,[0,0,0]];

// Fill box

clearWeaponCargoGlobal airBoxM;
clearMagazineCargoGlobal airBoxM;
clearItemCargoGlobal airBoxM;

sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["arifle_MXC_Black_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["arifle_MXM_Black_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["arifle_Mk20C_plain_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["arifle_Mk20_GL_plain_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["arifle_MX_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["arifle_MX_GL_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["arifle_MXM_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["LMG_Mk200_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["launch_NLAW_F", 2];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["srifle_LRR_camo_F", 2];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addWeaponCargoGlobal ["arifle_MX_SW_F", 2];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 100];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addMagazineCargoGlobal ["20Rnd_762x51_Mag", 100];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer",50];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 100];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 4];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addMagazineCargoGlobal ["NLAW_F", 4];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addMagazineCargoGlobal ["7Rnd_408_Mag", 20];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {airBoxM addMagazineCargoGlobal ["UGL_FlareWhite_F", 20];};
sleep 0.1;


// Fill box end
