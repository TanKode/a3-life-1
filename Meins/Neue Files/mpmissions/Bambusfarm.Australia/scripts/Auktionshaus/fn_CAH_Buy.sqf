#include <macro.h>

disableSerialization;
_dialog = findDisplay 15100;
_myListbox = _dialog displayCtrl 15101;
_selectedOffer = call compileFinal (_myListbox lbData (lbCurSel _myListbox));
_value = SEL(_selectedOffer,2);
_itemName = SEL(_selectedOffer,1);
if(life_atmbank < _value) exitWith {hint "Sie haben nicht genung Geld auf Ihrem Bankkonto!";};

_buyItemAh = "";
{
	_varName = M_CONFIG(getText,"VirtualItems",configName _x,"variable");
	if(EQUAL(_varName,_itemName)) exitWith {_buyItemAh = configName _x};
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

if(EQUAL(_buyItemAH,"")) then
{
	_seller = [SEL(_selectedOffer,0)] call life_fnc_CAH_getPlayerObj;
	[[player,_seller,_selectedOffer],"TON_fnc_SAH_Transaction",false,false] spawn life_fnc_mp;
}else{
	_itemWeight = M_CONFIG(getNumber,"VirtualItems",_buyItemAh,"weight");
	if((life_carryWeight + _itemWeight) > life_maxWeight) exitWith {hintSilent "Sie haben nicht genung Platz ihn ihrem Rucksack!"};
	_seller = [SEL(_selectedOffer,0)] call life_fnc_CAH_getPlayerObj;
	[[player,_seller,_selectedOffer],"TON_fnc_SAH_Transaction",false,false] spawn life_fnc_mp;
};