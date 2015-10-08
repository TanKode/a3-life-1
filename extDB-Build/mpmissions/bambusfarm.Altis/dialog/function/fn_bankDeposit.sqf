/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call bambusfarm_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > bambusfarm_TASCHENGELD) exitWith {hint localize "STR_ATM_NotEnoughCash"};

bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD - _value;
bambusfarm_BANK = bambusfarm_BANK + _value;

hint format[localize "STR_ATM_DepositMSG",[_value] call bambusfarm_fnc_numberText];
[] call bambusfarm_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;