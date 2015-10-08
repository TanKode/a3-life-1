/*
	File: fn_repairESR.sqf
	Author: Anton
	
	Description:
	Reparatur für das ESR-Menü
*/
_mode = _this select 0;
_veh = cursorTarget;
bambusfarm_interrupted = false;
if(isNull _veh) exitwith {};
if(bambusfarm_action_inUse) exitWith {};

if(_mode == 0) exitWith {
	_part = _this select 1;
	bambusfarm_action_inUse = true;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
	_upp = format[localize "STR_NOTF_Repairing",_displayName];
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["bambusfarm_progress","PLAIN"];
	_ui = uiNameSpace getVariable "bambusfarm_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	[player,"reparatur"] call bambusfarm_fnc_globalSound;

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
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(bambusfarm_interrupted) exitWith {};
	};
	
	bambusfarm_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(bambusfarm_interrupted) exitWith {bambusfarm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; bambusfarm_action_inUse = false;};
	if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
	if(playerSide == civilian) then {player removeItem "ToolKit"};
	[_veh,_part,0] remoteExec ["bambusfarm_fnc_setHitPointDamage",0];
	titleText["Das Fahrzeugteil wurde erfolgreich repariert","PLAIN"];
};
if(_mode == 1) exitWith {
	bambusfarm_action_inUse = true;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
	_upp = format[localize "STR_NOTF_Repairing",_displayName];
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["bambusfarm_progress","PLAIN"];
	_ui = uiNameSpace getVariable "bambusfarm_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	[player,"reparatur"] call bambusfarm_fnc_globalSound;

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
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(bambusfarm_interrupted) exitWith {};
	};
	
	bambusfarm_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(bambusfarm_interrupted) exitWith {bambusfarm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; bambusfarm_action_inUse = false;};
	if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
	if(playerSide == civilian) then {player removeItem "ToolKit"};
	_veh setDamage 0;
	titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
};