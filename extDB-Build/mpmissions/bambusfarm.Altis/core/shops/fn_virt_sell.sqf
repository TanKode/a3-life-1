/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,sell_array] call TON_fnc_index;
if(_index == -1) exitWith {};
_index2 = [_type,DYNMARKET_prices] call TON_fnc_index;
_price = 0.0;
if(_index2==-1) then {_price = (sell_array select _index) select 1;} else {_price = (DYNMARKET_prices select _index2) select 1;};
_var = [_type,0] call bambusfarm_fnc_varHandle;

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = [_var] call bambusfarm_fnc_vartostr;
if(([false,_type,_amount] call bambusfarm_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call bambusfarm_fnc_numberText];
	bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD + _price;
	DYNAMICMARKET_boughtItems pushBack [_type,_amount];
	[] call bambusfarm_fnc_virt_update;
};

if(bambusfarm_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = bambusfarm_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		bambusfarm_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		bambusfarm_shop_npc setVariable["sellers",_array,true];
	};
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;