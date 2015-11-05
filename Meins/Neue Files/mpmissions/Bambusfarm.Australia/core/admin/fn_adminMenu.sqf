#include <macro.h>
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
private "_list";

if((call life_adminlevel) < 3) exitWith {
	closeDialog 0; 
	hint localize "STR_ANOTF_ErrorLevel";
	["Sie haben keine Berechtigung das das AdminMenu zu benutzen!!"] spawn bis_fnc_dynamictext;
	_message = format["%1 versuchte die DebugConsole zu oeffnen!!", name player];
	[["",_message,player,9],"TON_fnc_handleMessages",false,false] spawn life_fnc_MP;
	0 cutText["","BLACK FADED"];
	0 cutFadeOut 9999999;
	disableUserInput true;
	life_frozen = true;
	player setPos [0,0,0];
};

private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_list = CONTROL(2900,2902);
//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;