#include <macro.h>
/*

	Shows cop arrest dlg

*/

if(!(EQUAL(playerSide,west))) exitWith {};
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(!(_unit getVariable["restrained",FALSE])) exitWith {
		hint "Der andere Spieler muss gefesselt sein.";
		sleep 3;
		hint "Benutze die Shift+R, um den Spieler zu fesseln.";
	}; //Error check?
createDialog "jail_time";