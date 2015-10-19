#include <macro.h>
/*
	File: fn_escortAction.sqf
*/
private "_unit";
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
if(!(side _unit in [civilian,independent,east])) exitWith {};
if((player distance _unit > 3)) exitWith {};
if(!(_unit getVariable["restrained",FALSE])) exitWith {
	hint "Der andere Spieler muss gefesselt sein.";
	sleep 3;
	hint "Benutze die Shift+R, um den Spieler zu fesseln.";
}; //Error check?

_unit attachTo [player,[0.1,1.1,0]];
_unit SVAR ["transporting",false,true];
_unit SVAR ["Escorting",true,true];
player reveal _unit;