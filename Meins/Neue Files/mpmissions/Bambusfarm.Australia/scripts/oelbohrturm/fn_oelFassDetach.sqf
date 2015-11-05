#include <macro.h>
/*
	File: fn_oelfassDetach.sqf
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_vendor","_mode"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_mode = [_this,1,0,[0]] call BIS_fnc_param;
if(isNull _vendor) exitWith {}; //Not valid
if(!(_vendor GVAR "oelFass")) exitWith {}; //He's not being Escorted.
if(isNull _vendor) exitWith {}; //Not valid

switch(_mode) do
{	
	case 0:
	{
		detach _vendor;
		player SVAR ["oelFasstransport",false,true];
	};
	
	case 1:
	{
		_vendor attachTo [player,[0.1,1.1,0.5]];
		player SVAR ["oelFasstransport",true,true];
	};
};