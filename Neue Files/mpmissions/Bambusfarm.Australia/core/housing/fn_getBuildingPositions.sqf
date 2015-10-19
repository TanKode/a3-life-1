#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrieves all 3D-world positions in a building and also restricts
	certain positions due to window positioning.
*/
private["_building","_arr","_restricted","_exitLoop","_i"];
_building = SEL(_this,0);
_arr = [];

_restricted = switch(typeOf _building) do
{
case "Land_i_House_Big_02_V1_F": {[0,1,2,3,4]};
case "Land_i_House_Big_02_V2_F": {[0,1,2,3,4]};
case "Land_i_House_Big_02_V3_F": {[0,1,2,3,4]};
case "Land_i_House_Big_01_V1_F": {[2,3]};
case "Land_i_House_Big_01_V2_F": {[2,3]};
case "Land_i_House_Big_01_V3_F": {[2,3]};
case "Land_i_Stone_HouseSmall_V1_F": {[0,1,3,4]};
case "Land_i_Stone_HouseSmall_V2_F": {[0,1,3,4]};
case "Land_i_Stone_HouseSmall_V3_F": {[0,1,3,4]};
case "Land_HouseDoubleAL2": {[0,1,2,3,4]};
case "Land_HouseDoubleAL": {[0,1,2,3,4]};
case "Land_HouseA": {[0,1,3,4]};
case "Land_HouseA1": {[0,1,3,4]};
case "Land_HouseB": {[0,1,3,4]};
case "Land_HouseB1": {[0,1,3,4]};
case "Land_HouseC_R": {[0,1,3,4]};
case "Land_HouseC1_L": {[0,1,3,4]};
case "Land_HouseA1_L": {[0,1,3,4]};
case "Land_HouseB1_L": {[0,1,3,4]};
// dealer/Atlantis Houses
case "Land_u_House_Small_02_V1_F": {[0,1,3,4]};
case "Land_u_Addon_02_V1_F": {[0,1,3,4]};
case "Land_u_House_Big_01_V1_F": {[2,3]};
case "Land_u_House_Big_02_V1_F": {[2,3]};
case "Land_u_House_Big_02_V1_dam_F": {[2,3]};
case "Land_u_House_Big_01_V1_dam_F": {[2,3]};
case "Land_u_Shop_01_V1_F": {[0,1,3,4]};
case "Land_u_Shop_01_V1_dam_F": {[0,1,3,4]};
case "Land_u_Shop_02_V1_F": {[0,1,3,4]};
case "Land_u_Shop_02_V1_dam_F": {[0,1,3,4]};
case "Land_u_House_Small_01_V1_F": {[0,1,3,4]};
case "Land_u_House_Small_01_V1_dam_F": {[0,1,3,4]};
case "Land_u_House_Small_02_V1_F": {[0,1,3,4]};
case "Land_i_House_Big_01_V2_dam_F": {[2,3]};
case "Land_i_House_Big_01_V3_dam_F": {[2,3]};
case "Land_i_House_Big_01_V1_dam_F": {[2,3]};
case "Land_i_House_Big_02_V1_dam_F": {[2,3]};
case "Land_i_House_Big_02_V2_dam_F": {[2,3]};
case "Land_i_House_Big_02_V3_dam_F": {[2,3]};
case "Land_i_Shop_01_V1_dam_F": {[0,1,3,4]};
case "Land_i_Shop_01_V2_dam_F": {[0,1,3,4]};
case "Land_i_Shop_01_V3_dam_F": {[0,1,3,4]};
case "Land_i_Shop_02_V1_dam_F": {[0,1,3,4]};
case "Land_i_Shop_02_V2_dam_F": {[0,1,3,4]};
case "Land_i_Shop_02_V3_dam_F": {[0,1,3,4]};
case "Land_i_House_Small_01_V1_dam_F": {[0,1,3,4]};
case "Land_i_House_Small_01_V2_dam_F": {[0,1,3,4]};
case "Land_i_House_Small_01_V3_dam_F": {[0,1,3,4]};
case "Land_i_House_Small_03_V1_dam_F": {[0,1,3,4]};
case "Land_i_Stone_HouseBig_V1_F": {[2,3]};
case "Land_i_Stone_HouseBig_V1_dam_F": {[2,3]};
case "Land_i_Stone_HouseBig_V2_F": {[2,3]};
case "Land_i_Stone_HouseBig_V2_dam_F": {[2,3]};
case "Land_i_Stone_HouseBig_V3_F": {[2,3]};
case "Land_i_Stone_HouseBig_V3_dam_F": {[2,3]};
case "Land_i_Stone_Shed_V1_F": {[2,3]};
case "Land_i_Stone_Shed_V1_dam_F": {[2,3]};
case "Land_i_Stone_Shed_V2_F": {[2,3]};
case "Land_i_Stone_Shed_V3_F": {[2,3]};
case "Land_i_Stone_HouseSmall_V1_F": {[0,1,3,4]};
case "Land_i_Stone_HouseSmall_V1_dam_F": {[0,1,3,4]};
case "Land_i_Stone_HouseSmall_V2_F": {[0,1,3,4]};
case "Land_i_Stone_HouseSmall_V2_dam_F": {[0,1,3,4]};
case "Land_i_Stone_HouseSmall_V3_F": {[0,1,3,4]};
case "Land_i_Stone_HouseSmall_V3_dam_F": {[0,1,3,4]};
case "Land_Unfinished_Building_02_F": {[0,1,3,4]};
case "Land_Unfinished_Building_01_F": {[0,1,3,4]};
case "Land_i_House_Small_02_V1_dam_F": {[0,1,3,4]};
case "Land_d_House_Small_01_V1_F": {[0,1,3,4]};
case "Land_d_House_Small_02_V1_F": {[0,1,3,4]};
case "Land_d_House_Big_01_V1_F": {[2,3]};
//Gangbase Houses
case "Land_Cargo_House_V3_f": {[2,3]};
default {[]};
};

_i = 0;
_exitLoop = false; //Loops are not fun.
while {true} do {
	if(!(_i in _restricted)) then {
	_pos = _building buildingPos _i;
	if(_pos isEqualTo [0,0,0]) exitWith {_exitLoop = true;};
	_arr pushBack _pos;
	};
	if(_exitLoop) exitWith {};
	_i = _i + 1;
};

_arr;
