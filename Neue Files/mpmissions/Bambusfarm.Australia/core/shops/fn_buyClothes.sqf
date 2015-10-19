#include <macro.h>
/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if(EQUAL((lbCurSel 3101),-1)) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};
if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {life_spyglassamount = life_spyglassamount +1;[[profileName,format["Geldglitch beim Markt einkauf, Anzahl: %1",life_spyglassamount]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;};
life_nottoofast = time;
_success = false;

_price = 0;
{
	if(!(EQUAL(_x,-1))) then {
		ADD(_price,_x);
	};
} foreach life_clothing_purchase;

if (CASH >= _price) then {
	SUB(CASH,_price);
	hint format ["Sie bezahlen $%1 mit Bargeld.", [_price] call life_fnc_numberText];
	life_clothesPurchased = true;
	_success = true;
	closeDialog 0;	
}
else
{
	if(life_inv_debitcard > 0) then
	{
		if(BANK < _price) then {hint format["Sie haben keine $%1 auf ihrem Bankkonto um es mit der Kriditkarte bezahlen zu koennen!", [_price] call life_fnc_numberText]}
		else
		{
			SUB(BANK,_price);
			hint format ["Sie bezahlen $%1 mit ihrer Kreditkarte, der Betrag wird von ihrem Bankkonto abgebucht!", [_price] call life_fnc_numberText];
			life_clothesPurchased = true;
			_success = true;
			closeDialog 0; //Exit the menu.
		};
	}
	else
	{
		hint format ["Sie haben keine $%1 als Bargeld und besitzen keine Kreditkarte!", [_price] call life_fnc_numberText];
		closeDialog 0;
	};
};
_success;

[] call life_fnc_updateClothing;
/*
if(_price > CASH) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
CASH = CASH - _price;

life_clothesPurchased = true;
closeDialog 0;