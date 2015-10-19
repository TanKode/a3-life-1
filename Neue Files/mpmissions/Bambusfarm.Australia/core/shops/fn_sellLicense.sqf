#include <macro.h>
/*
	File: fn_buyLicense.sqf
        Author: Bryan "Tonic" Boardwine

	Description:
	Called when selling a license. May need to be revised.
*/
private["_type"];

_type = SEL(_this,3);

if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {life_spyglassamount = life_spyglassamount +1;[[profileName,format["Geldglitch beim Markt einkauf, Anzahl: %1",life_spyglassamount]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;};
life_nottoofast = time;

_varName = M_CONFIG(getText,"Licenses",_type,"variable");
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_price = M_CONFIG(getNumber,"Licenses",_type,"price");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
_license = LICENSE_VARNAME(_varName,_sideFlag);
_price = _price / 2;
//if(life_cash < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};

/*if (_type == "bountyh") then
{
	player SVAR ["bounty_hunter",false,true];
};*/

ADD(CASH,_price);
titleText[format[localize "STR_NOTF_ChopSoldCar",(localize _displayName),[_price] call life_fnc_numberText],"PLAIN"];
SVAR_MNS [_license,false];