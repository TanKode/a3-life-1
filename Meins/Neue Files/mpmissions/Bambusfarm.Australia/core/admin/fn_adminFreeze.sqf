#include <macro.h>
/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];

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

//_unit = cursorTarget;
_unit = lbData[1500,lbCurSel (1500)];
_unit = call compile format["%1", _unit];


if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hintSilent "sie koennen das nicht bei sich selbst anwenden!";};
//Broadcast!

[[player], "life_fnc_freezePlayer", _unit, false] spawn life_fnc_MP;

