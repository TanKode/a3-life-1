#include <macro.h>
/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_random"];
_veh = cursorTarget;
_random = round(random 2);
bambusfarm_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		bambusfarm_action_inUse = true;
		[player,"reparatur"] call bambusfarm_fnc_globalSound;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		disableSerialization;
		5 cutRsc ["bambusfarm_progress","PLAIN"];
		_ui = uiNameSpace getVariable "bambusfarm_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		while{true} do
		{
			if(animationState player != "Acts_carFixingWheel" ) then 
			{
				player action ["SwitchWeapon", player, player, 100];
				player playMove "Acts_carFixingWheel";
				player playActionNow "stop";
				player playMove "Acts_carFixingWheel";
				player playActionNow "stop";
				player playMove "Acts_carFixingWheel";
			};
			sleep 0.195;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {player playActionNow "stop";};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(bambusfarm_interrupted) exitWith {};
		};
		
		bambusfarm_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(bambusfarm_interrupted) exitWith {bambusfarm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; bambusfarm_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
		if (playerside != independent && independent countside playableUnits > 0) then {
			player removeItem "ToolKit";
			_damage = damage _veh; 
			_veh setdamage (_damage - 0.2);
			hint "Das Fahrzeug wurde nicht vollständig repariert.";
		} else {
			if(playerside != east) then {player removeItem "ToolKit"};
			_veh setdamage 0;
			hint "Das Fahrzeug wurde repariert.";
		};
	};
};