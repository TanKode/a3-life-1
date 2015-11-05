#include <macro.h>
/*
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_licenses","_cop","_licensesName"];
_licenses = [_this,0,"",[""]] call BIS_fnc_param;
_cop = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

SVAR_MNS [LICENSE_VARNAME(_licenses,"civ"),false];
_licensesName = M_CONFIG(getText,"Licenses",_licenses,"displayName");
hint format["Dir wurde dein/e %1 entzogen!",localize _licensesName];
[[_cop],"life_fnc_licenseCheck",player,FALSE] spawn life_fnc_MP;
