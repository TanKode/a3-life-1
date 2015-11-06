disableSerialization;
_dialog = findDisplay 15100;
_myListbox = _dialog displayCtrl 15101;
_selectedOffer = call compileFinal (_myListbox lbData (lbCurSel _myListbox));
if (life_atmcash < parseNumber (_selectedOffer select 2)) exitWith {hint "Du hast nicht genug Geld dabei!";};
_seller = [_selectedOffer select 0] call life_fnc_CAH_getPlayerObj;
_selectedOffer = [_selectedOffer select 0,_selectedOffer select 1,parseNumber (_selectedOffer select 2)];
[[player,_seller,_selectedOffer],"TON_fnc_SAH_Transaction",false,false] spawn life_fnc_mp;
//systemChat format ["%1",_selectedOffer];