/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach bambusfarm_clothing_purchase;

if(_price > bambusfarm_TASCHENGELD) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD - _price;

bambusfarm_clothesPurchased = true;
closeDialog 0;
[player, uniform player] call bambusfarm_fnc_equipGear;