#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
private["_spawnPos","_dir","_type"];
_spawnPos = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

if((typeOf _spawnPos) in LIFE_SETTINGS(getArray,"big_house")) then {
	life_garage_sp = [(_spawnPos modelToWorld [-6,-20,0]),(getDir _spawnPos)-180];
}else{
	life_garage_sp = [(_spawnPos modelToWorld [5,-13,0]),(getDir _spawnPos)-180];
};

life_garage_type = _type;
[[getPlayerUID player,playerSide,_type,player,true],"TON_fnc_getVehicles",false,false] call life_fnc_MP;
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];