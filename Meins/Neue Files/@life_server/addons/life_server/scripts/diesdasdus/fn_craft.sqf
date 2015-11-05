#include "\life_server\script_macros.hpp"
/*
	File: fn_craft.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
private["_dialog","_inv","_config","_itemInfo"]; //Declare all private variables
if(license_civ_craftWeapon) then
{
	craft_shop = "weapons";
}else{
    if(license_civ_craftVehicle) then
    {
        craft_shop = "vehicles";
    };
};

createDialog "Life_craft";
disableSerialization; //Disable Serialization

if(life_is_processing) exitWith{
	closeDialog 2001;
	closeDialog 0;
};

if(isNull (findDisplay 666)) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
_dialog = findDisplay 666; //find the craft dialog/window
_inv = _dialog displayCtrl 669; //find the listbox of items can be created
_filter = _dialog displayCtrl 673;
lbClear _inv; //clear the listbox
lbClear _filter;

if(license_civ_craftWeapon) then
{
	_filter lbAdd localize "STR_Shop_UI_Weapon";
}else{
    if(license_civ_craftVehicle) then
    {
        _filter lbAdd localize "STR_Shop_UI_Vehicle";
    };
};
_filter lbAdd localize "STR_Shop_UI_Materials";

_filter lbSetCurSel 0;
