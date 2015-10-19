/*
	File: fn_adacLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Default adac configuration.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player forceAddUniform "U_OG_Guerilla2_3";
player addBackpack "B_Bergen_blk";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";

player addItemToBackpack "ToolKit";
player addItemToBackpack "ToolKit";
player addItemToBackpack "ToolKit";

[] call life_fnc_saveGear;