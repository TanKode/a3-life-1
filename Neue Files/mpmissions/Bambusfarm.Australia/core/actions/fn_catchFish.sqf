#include <macro.h>
/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a fish that is near by.
*/
private["_fish","_type","_exp"];
_range = 3;
if(skill_civ_fishy) then {_range = 5};
_fish = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_fish isKindOf "Fish_Base_F")) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Not a fishy!
if(player distance _fish > _range) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
switch(true) do {
	case ((typeOf _fish) == "Salema_F"): {_type = "salema_raw"};
	case ((typeOf _fish) == "Ornate_random_F") : {_type = "ornate_raw"};
	case ((typeOf _fish) == "Mackerel_F") : {_type = "mackerel_raw"};
	case ((typeOf _fish) == "Tuna_F") : {_type = "tuna_raw"};
	case ((typeOf _fish) == "Mullet_F") : {_type = "mullet_raw"};
	case ((typeOf _fish) == "CatShark_F") : {_type = "catshark_raw"};
	default {_type = ""};
};

if(EQUAL(_type,"")) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Couldn't get a type

if(([true,_type,1] call life_fnc_handleInv)) then {
	deleteVehicle _fish;
	titleText[format[(localize "STR_NOTF_Fishing"),_type],"PLAIN"];
};

_exp = round(random(80));
[true,_exp] spawn life_fnc_expConfig;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];