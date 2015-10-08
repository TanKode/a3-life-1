/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call bambusfarm_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > bambusfarm_BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && bambusfarm_BANK > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD + _val;
bambusfarm_BANK = bambusfarm_BANK - _val;
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call bambusfarm_fnc_numberText];
[] call bambusfarm_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;