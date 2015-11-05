/*
	File: fn_refuelESR.sqf
	Author: Anton
	
	Description:
	Funktion für das Auftanken eines Fahrzeuges
*/

_fuel = _this select 0;
_fuel = _fuel / 100;
_veh = cursorTarget;
_vfuel = fuel _veh;

if(_vfuel >= _fuel) exitWith {hint format["Das Fahrzeug hat bereits einen Benzinstand von %1 Prozent",round(_vfuel * 100)]};

RyP_interrupted = false;
if(isNull _veh) exitwith {};
if(RyP_action_inUse) exitWith {};

RyP_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
_upp = format[localize "STR_ISTR_Jerry_Process",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["RyP_progress","PLAIN"];
_ui = uiNameSpace getVariable "RyP_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExec ["RyP_fnc_animSync",0];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.27;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
	if(RyP_interrupted) exitWith {};
};

RyP_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(RyP_interrupted) exitWith {RyP_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; RyP_action_inUse = false;};
if(player != vehicle player) exitWith {titleText[localize "STR_ISTR_Jerry_Process","PLAIN"];};
if(playerSide == civilian) then {player removeItem "ToolKit"};
_veh setFuel _fuel;
titleText[format["Das Fahrzeug wurde erfolgreich zu %1 Prozent aufgetankt",(_fuel * 100)],"PLAIN"];
