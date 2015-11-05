/*
----------------------------------------------|
Description: If house == garage then lets park the fucking vehicle inside it
----------------------------------------------|
*/

private ["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;


if(!(_house isKindOf "Land_i_Garage_V1_F" or _house isKindOf "Land_i_Garage_V2_F")) then
	{
		hint "Dieses Haus hat keine Eingebaute Garage?";

	}else{

		[life_pInact_curTarget,"Car"] spawn life_fnc_storeVehicle;
	};