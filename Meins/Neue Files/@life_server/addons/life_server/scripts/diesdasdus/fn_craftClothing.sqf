#include "\life_server\script_macros.hpp"
/*
	File: fn_craft.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
private["_dialog","_inv","_config","_itemInfo"]; //Declare all private variables

craft_shop = "clothing";

createDialog "life_craft_clothing";
disableSerialization; //Disable Serialization

if(life_is_processing) exitWith{
	closeDialog 2001;
	closeDialog 0;
};

if(isNull (findDisplay 766)) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
_dialog = findDisplay 766; //find the craft dialog/window
_inv = _dialog displayCtrl 769; //find the listbox of items can be created
_filter = _dialog displayCtrl 773;
lbClear _inv; //clear the listbox
lbClear _filter;

_filter lbAdd localize "STR_Shop_UI_Clothing";

_filter lbAdd localize "STR_Shop_UI_Materials";

_filter lbSetCurSel 0;