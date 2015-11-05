#include <macro.h>
/*
	File: fn_oelfassRemove.sqf
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_unit","_vendor"];
_unit = _this select 0;
_vendor = removeFass;

if(!(_vendor GVAR "oelFass")) exitWith {}; //He's not being Escorted.
if(isNil "_vendor") exitWith {}; //Not valid

detach _vendor;
_unit SVAR ["oelFasstransport",false,true];
deleteVehicle _vendor;