#include "\life_server\script_macros.hpp"
/*
	File: fn_craftVehicleSpawn.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Open Vehiclecolor dialog for Craft Vehiclespawn!
     
*/
private["_className","_ctrl","_colorArray","_temp"];

createDialog "Life_ColorList";
disableSerialization;

cVehicleClass = [_this,0,"",[""]] call BIS_fnc_param;
_flag = [_this,1,"",[""]] call BIS_fnc_param;
craftItem = [_this,2,"",[""]] call BIS_fnc_param;

_ctrl = CONTROL(45900,45904);
lbClear _ctrl;
_colorArray = M_CONFIG(getArray,CONFIG_VEHICLES,cVehicleClass,"textures");
_id = switch(playerSide) do {case civilian: {"civ"}; case west:{"cop"}; case independent:{"med"}; case east:{"adac"}; default {"?"};};
	

{
	_flag = SEL(_x,1);
	_textureName = SEL(_x,0);
	if(EQUAL(_id,_flag)) then {
		_ctrl lbAdd _textureName;
		_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
	};
} foreach _colorArray;

lbSetCurSel[45904,0];
if((lbSize _ctrl)-1 != -1) then {
	ctrlShow[45904,true];
} else {
	ctrlShow[45904,false];
};
true;