#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_amount","_name"];
if(EQUAL(lbCurSel 2402,-1)) exitWith {};
if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {life_spyglassamount = life_spyglassamount +1;[[profileName,format["Geldglitch beim Markt einkauf, Anzahl: %1",life_spyglassamount]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;};
life_nottoofast = time;
_type = lbData[2402,(lbCurSel 2402)];
//_skillType = ["heroin_processed","marijuana","cocaine_processed","uran_processed","froglsd","meth_processed"];

_price = 0.0;
_itemNameToSearchFor = _type;
{
	_curItemName = _x select 0;
	_curItemPrice = _x select 1;
	if (_curItemName == _itemNameToSearchFor) then {_price = _curItemPrice};
} forEach DYNMARKET_prices;

if(EQUAL(_type,"marijuana") && skill_civ_weed) then {_priceAdd = round(_price * 0.20);ADD(_price,_priceAdd);};
if(EQUAL(_type,"heroin_processed") && skill_civ_weed && skill_civ_heroin) then {_priceAdd = round(_price * 0.20);ADD(_price,_priceAdd);};
if(EQUAL(_type,"froglsd") && skill_civ_weed && skill_civ_heroin && skill_civ_lsdS) then {_priceAdd = round(_price * 0.20);ADD(_price,_priceAdd);};
if(EQUAL(_type,"meth_processed") && skill_civ_weed && skill_civ_heroin && skill_civ_lsdS && skill_civ_methS) then {_priceAdd = round(_price * 0.20);ADD(_price,_priceAdd);};
if(EQUAL(_type,"uran_processed") && skill_civ_weed && skill_civ_heroin && skill_civ_lsdS && skill_civ_methS && skill_civ_uranS) then {_priceAdd = round(_price * 0.20);ADD(_price,_priceAdd);};
if(EQUAL(_type,"cocaine_processed") && skill_civ_weed && skill_civ_heroin && skill_civ_lsdS && skill_civ_methS && skill_civ_uranS && skill_civ_kokaon) then {_priceAdd = round(_price * 0.20);ADD(_price,_priceAdd);};

//_price = [_type] call life_fnc_DYNMARKET_getPrice;
//_price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");
if(EQUAL(_price,-1)) exitWith {};

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (ITEM_VALUE(_type))) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
if(([false,_type,_amount] call life_fnc_handleInv)) then {
	hint format[localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call life_fnc_numberText];
	ADD(CASH,_price);
	[] call life_fnc_virt_update;	
	DYNAMICMARKET_boughtItems pushBack [_type,_amount];
};

if(EQUAL(life_shop_type,"drugdealer")) then {
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(!(EQUAL(_ind,-1))) then {
		_val = SEL(SEL(_array,_ind),2);
		ADD(_val,_price);
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	} else {
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;