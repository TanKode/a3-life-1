#include <macro.h>
/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type","_varName","_displayName","_sideFlag","_price"];
_type = SEL(_this,3);
_success = false;

if(!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
_varName = M_CONFIG(getText,"Licenses",_type,"variable");
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_price = M_CONFIG(getNumber,"Licenses",_type,"price");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
_license = LICENSE_VARNAME(_varName,_sideFlag);

/*if(CASH < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,localize _displayName];};
SUB(CASH,_price);

titleText[format[localize "STR_NOTF_B_1", localize _displayName,[_price] call life_fnc_numberText],"PLAIN"];
SVAR_MNS [_varName,true];*/

if(CASH >= _price) then {
	SUB(CASH,_price);
	hint format[localize "STR_NOTF_Bargeld",[_price] call life_fnc_numberText,localize _displayName];
	_success = true;
	closeDialog 0;
	SVAR_MNS [_license,true];
}
else
{
	if(life_inv_debitcard > 0) then
	{
		if(BANK < _price) then {hint format [localize "STR_NOTF_NoBank",[_price] call life_fnc_numberText,localize _displayName]}
		else
		{
			SUB(BANK,_price);
			hint format[localize "STR_NOTF_Kreditkart",[_price] call life_fnc_numberText,localize _displayName];
			_success = true;
			closeDialog 0;
			SVAR_MNS [_license,true];
		};
	}
	else{
		hint format[localize "STR_NOTF_NoKreditkart",[_price] call life_fnc_numberText,localize _displayName];
		closeDialog 0;
	};
};
_success;