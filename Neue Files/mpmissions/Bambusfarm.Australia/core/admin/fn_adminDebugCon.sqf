#include <macro.h>
/*
	File: fn_adminDebugCon.sqf
	Author: ColinM9991
	
	Description:
	Opens the Debug Console.
*/
if((call life_adminlevel) < 1) exitWith {
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

createDialog "RscDisplayDebugPublic";
[[0,format["Admin %1 hat die Debug Console geöffnet.",profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;