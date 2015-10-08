/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(bambusfarm_bail_paid) exitWith {};
if(isNil {bambusfarm_bail_amount}) then {bambusfarm_bail_amount = 3500;};
if(!isNil "bambusfarm_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(bambusfarm_BANK < bambusfarm_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",bambusfarm_bail_amount];};

bambusfarm_BANK = bambusfarm_BANK - bambusfarm_bail_amount;
bambusfarm_bail_paid = true;
[[0,"STR_NOTF_Bail_Bailed",true,[profileName]],"bambusfarm_fnc_broadcast",true,false] spawn bambusfarm_fnc_MP;