#include <macro.h>
/*
File: fn_Repaintcolor.sqf
Author: MooN-Gaming

Description: Opens the display to recolor the vehicle

*/
private["_index","_veh","_c_arr","_id","_colorcost","_i","_text"];
if(!isNull (findDisplay 2300)) then {

	_index = lbCurSel 2302;
	_className = lbData[2302,_index];

	_ctrl = CONTROL(2300,2303);
	lbClear _ctrl;
	_colorArray = M_CONFIG(getArray,CONFIG_VEHICLES,_className,"textures");
	_id = switch(playerSide) do {case civilian: {"civ"}; case west:{"cop"}; case independent:{"med"}; case east:{"adac"}; default {"?"};};
	
	{
		_flag = SEL(_x,1);
		_textureName = SEL(_x,0);
		diag_log format["%1",_textureName];
		if(EQUAL(_flag,_id)) then {
			_ctrl lbAdd _textureName;
			_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
		};
	} foreach _colorArray;	


	lbSetCurSel [2303,0];
	if((lbSize _ctrl)-1 != -1) then
	{
		ctrlShow[2303,true];
	}
		else
	{
		ctrlShow[2303,false];
	};

};
