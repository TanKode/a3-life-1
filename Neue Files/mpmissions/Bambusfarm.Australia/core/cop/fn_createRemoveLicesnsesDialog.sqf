#include <macro.h>
/*
	File: fn_removeLicensesCop.sqf
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
if(!(EQUAL((side cursorTarget),civilian))) exitWith {hint "Die zu ueberpruefende Person ist kein Zivilist!"};
createDialog "life_removeLicenses";
[[player],"life_fnc_licenseCheck",life_pInact_curTarget,FALSE] spawn life_fnc_MP