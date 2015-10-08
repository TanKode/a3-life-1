/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn bambusfarm_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "U_Rangemaster";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

[[player,0,"textures\medic_uniform.jpg"],"bambusfarm_fnc_setTexture",true,false] spawn bambusfarm_fnc_MP;

[] call bambusfarm_fnc_saveGear;
[player, uniform player] call bambusfarm_fnc_equipGear;