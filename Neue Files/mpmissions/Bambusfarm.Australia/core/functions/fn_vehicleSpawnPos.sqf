#include <macro.h>
/*
	File: fn_vehicleSpawnPos.sqf
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_objs","_type"];
_type = [_this,3,"",[""]] call BIS_fnc_param;
_objs = nearestObjects [player, ["Land_PoliceStation","Land_HeliPad"], 25];

if(EQUAL((typeOf SEL(_objs,0)),"Land_PoliceStation")) then
{
	life_garage_sp = [(SEL(_objs,0) modelToWorld [13,15,0]),(getDir SEL(_objs,0))-180];
	life_garage_type = _type;
}else{
	if(EQUAL((typeOf SEL(_objs,0)),"Land_HeliPad")) then {
		life_garage_sp = [(SEL(_objs,0) modelToWorld [3.5,-9.5,5.5]),(getDir SEL(_objs,0))-180];
		life_garage_type = _type;
	};
};
[[getPlayerUID player,playerSide,_type,player],"TON_fnc_getVehicles",false,false] call life_fnc_MP;
createDialog "Life_impound_menu";   
disableSerialization;   
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];  
