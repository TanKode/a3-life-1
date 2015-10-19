/*
	Author: PierreAmyf
*/
private["_spawnPos","_dir","_type"];
_type = [_this,1,"",[""]] call BIS_fnc_param;
_spawnPos = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;


if (_type == "Car")then{
life_garage_sp = [(_spawnPos modelToWorld [0,0,-3.5]),(getDir _spawnPos)];}
else{
life_garage_sp = [(_spawnPos modelToWorld [0,0,4.5]),(getDir _spawnPos)];
};
life_garage_type = _type;
[[getPlayerUID player,playerSide,_type,player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];