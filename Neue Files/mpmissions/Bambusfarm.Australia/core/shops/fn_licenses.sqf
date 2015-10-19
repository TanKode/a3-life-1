#include <macro.h>
private["_display","_listbox","_shortname","_longname","_price","_hasLicense","_displayname"];
 
_buyables = SEL(_this,3); //called from action => select 3rd argument
 
if(!dialog) then
{
	if(!(createDialog "LicenseShop")) exitWith {};
};
disableSerialization;
 
if(isNull (findDisplay 5546)) exitWith {};
_listbox = CONTROL(5546,55126);
_mylic = CONTROL(5546,55131);

_preufung = ["driver"];

if(license_civ_craftVehicle) then
{
	_buyables = ["driver","trucking","pilot","boat","hunting","dive","home","pcola","sotb","mait","taxi","craftClothing","craftVehicle"];
}else {
	if(license_civ_craftWeapon) then
	{
		_buyables = ["driver","trucking","pilot","boat","hunting","dive","home","pcola","sotb","mait","taxi","craftClothing","craftWeapon"];
	};
};

{
	_shortname = _x;
	
	_varName = M_CONFIG(getText,"Licenses",_shortname,"variable");
	_sideFlag = M_CONFIG(getText,"Licenses",_shortname,"side");
	_displayName = M_CONFIG(getText,"Licenses",_shortname,"displayName");
	_price = M_CONFIG(getNumber,"Licenses",_shortname,"price");
	_licensesLevel = M_CONFIG(getNumber,"Licenses",_shortname,"level");
	
	_hasLicense = LICENSE_VALUE(_varName,_sideFlag);
	

	if(!_hasLicense) then
	{	
		if(_shortname in _preufung) then 
		{
			
		}else
		{
			if(!(EQUAL(_licensesLevel,-1))) then{
				if((LEVEL >= _licensesLevel)) then {
					_listbox lbAdd format["%1 ($%2)",(localize _displayName), [_price] call life_fnc_numberText];
					_listbox lbSetData [(lbSize _listbox) - 1, _shortname];
				};
			}else{
				_listbox lbAdd format["%1 ($%2)",(localize _displayName), [_price] call life_fnc_numberText];
				_listbox lbSetData [(lbSize _listbox) - 1, _shortname];
			};
		};
	}
	else
	{
		_mylic lbAdd format["%1",(localize _displayName)];
		_mylic lbSetData [(lbSize _mylic) - 1, _shortname];
	};
}
foreach _buyables;