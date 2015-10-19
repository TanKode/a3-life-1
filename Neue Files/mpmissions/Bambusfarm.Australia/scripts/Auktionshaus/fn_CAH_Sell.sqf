#include <macro.h>

disableSerialization;
_dialog = findDisplay 15000;
_myListbox = _dialog displayCtrl 15001;
_myAmount = _dialog displayCtrl 15002;

_tochangePriceText = ctrlText _myAmount;
_tochangePriceNumber = parseNumber _tochangePriceText;

if (_tochangePriceText=="") exitWith {hint parseText "<t color='#FF0000'>--ERROR--</t><br/><t color='#FF0000'>INVALID INPUT</t>";};
if (lbCurSel _myListbox < 0) exitWith {hint "Bitte waehlen Sie ein Item";};
_classname = _myListbox lbData (lbCurSel _myListbox);
_price = floor(_tochangePriceNumber);

if (isNil {profileNamespace getVariable "listings"}) then {profileNamespace setVariable ["listings",[]];};
_currentListings = profileNamespace getVariable "listings";
_currentListings pushBack [getPlayerUID player,_classname,_price];
profileNamespace setVariable ["listings",_currentListings];

//systemChat format ["%1",[getPlayerUID player,_classname,_price]];

[[[getPlayerUID player,_classname,_price]],"TON_fnc_SAH_addOffer",false,false] call life_fnc_mp;

_vItem = [];
{_vItem pushBack (configName _x);} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
_name = M_CONFIG(getText,"VirtualItems",_classname,"displayName");

if(_classname in _vItem) then
{
	hint parseText format
	[	"Erstelltes Angebot:<br/><br/>
		<t color='#FF0000'>%1</t> fuer<br/>
		<t color='#228B22'>%3%2</t>",
		(localize _name),([_price] call life_fnc_numberText),"$"
	];
	[false,_classname,1] call life_fnc_handleInv;
}else{
	hint parseText format
	[	"Erstelltes Angebot:<br/><br/>
		<t color='#FF0000'>%1</t> fuer<br/>
		<t color='#228B22'>%3%2</t>",
		([_classname] call VAS_fnc_fetchCfgDetails select 1),([_price] call life_fnc_numberText),"$"
	];
	[_classname,false] spawn life_fnc_handleItem;
};

closeDialog 0;