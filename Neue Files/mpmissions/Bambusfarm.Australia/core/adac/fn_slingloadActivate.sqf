/*
	File: fn_slingloadActivate.sqf
	Author: PierreAmyf
	
	Description:
	slingLoad activate for cops or adac
     
*/
private["_vehicle"];

_vehicle = cursorTarget;

if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle") OR (_vehicle isKindOf "LandVehicle"))) exitWith {};

_vehicle enableRopeAttach true;
hint "Fahrzeug Abschleppvorrichtung aktiviert!";
sleep (5*60);
_vehicle enableRopeAttach false;
hint "Fahrzeug Abschleppvorrichtung deaktiviert!";