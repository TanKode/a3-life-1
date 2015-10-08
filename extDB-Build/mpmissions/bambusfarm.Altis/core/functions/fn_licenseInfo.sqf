/*
    Zeigt die Lizenzen an.
    Risk
*/
private["_display","_listbox","_shortname","_longname","_price","_hasLicense","_displayname"];

_buyables = ["air","swat","cg","driver","air","heroin","marijuana","gang","boat","oil","dive","truck","gun","rebel","coke","diamond","copper","iron","sand","salt","cement","air","home"];

if(!dialog) then
{
	if(!(createDialog "bambusfarm_lizenzen_menu")) exitWith {};
};
disableSerialization;

_display = findDisplay 2900;
if(isNull _display) exitWith {};

_listbox = _display displayCtrl 1500;

{
	_shortname = _x;

	_longname = ([_shortname, 0] call bambusfarm_fnc_licenseType) select 0;
	_displayname = ([_shortname, 0] call bambusfarm_fnc_licenseType) select 1;
	_price = [_shortname] call bambusfarm_fnc_licensePrice;
	_hasLicense = missionNamespace getVariable _longname;

	if(!_hasLicense) then
	{
		_listbox lbAdd format["%1 (%2)", _displayname, _price];
		_listbox lbSetData [(lbSize _listbox) - 1, _shortname];
	}
	else
	{
		_listbox lbAdd format["%1 (Hast du schon)", _displayname];
		_listbox lbSetData [(lbSize _listbox) - 1, ""];
	};
}
foreach _buyables;


{
	_price = [_x] call bambusfarm_fnc_licensePrice;
	_str = [_x select 0] call bambusfarm_fnc_varToStr;
	_val = missionNamespace getVariable (_x select 0);
	if(_val) then
	{
		_struct = _struct + format["%1 (hast du schon<br/>",_str];
	}else{
		_struct = _struct + format["%1 %2<br/>",_str, _price];
	};
} foreach bambusfarm_licenses;

_lic ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];