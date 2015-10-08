/*
	HACK THE BANK!
	Autor: stolzerrabe
	
	You are allowed to:
	Use, Share and modify
	You are not allowed to:
	Remove Author or say this script is yours in anyway!
	
	-- This Code based on Tonic´s "fn_packupSpikes.sqf"
	
*/
private["_laptop"];
_laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0;
if(isNil "_laptop") exitWith {};

if(([true,"lappi",1] call bambusfarm_fnc_handleInv)) then
{
	player removeAction bambusfarm_action_pickupLappi; bambusfarm_action_pickupLappi = nil;
	player removeAction bambusfarm_action_HTBNow;	bambusfarm_action_HTBNow = nil;
	
	if(!isNil "bambusfarm_action_BankCamHacked1") then {player removeAction bambusfarm_action_BankCamHacked1; bambusfarm_action_BankCamHacked1 = nil;};
	if(!isNil "bambusfarm_action_BankCamHacked2") then {player removeAction bambusfarm_action_BankCamHacked2; bambusfarm_action_BankCamHacked2 = nil;};
	if(!isNil "bambusfarm_action_BankCamHacked3") then {player removeAction bambusfarm_action_BankCamHacked3; bambusfarm_action_BankCamHacked3 = nil;};
	if(!isNil "bambusfarm_action_BankCamHacked4") then {player removeAction bambusfarm_action_BankCamHacked4; bambusfarm_action_BankCamHacked4 = nil;};
	if(!isNil "bambusfarm_action_BankCamHacked5") then {player removeAction bambusfarm_action_BankCamHacked5; bambusfarm_action_BankCamHacked5 = nil;};
	
	deleteVehicle _laptop;
};