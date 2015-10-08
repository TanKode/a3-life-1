/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _target) exitWith {}; //DAFUQ?@!%€!R?EFFD?TGSF?HBS?DHBFNFD?YHDGN?D?FJH

_revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if(player distance _target > 5) exitWith {}; //Not close enough.

//Fetch their name so we can shout it.
_targetName = _target getVariable["name","Unknown"];
_title = format[localize "STR_Medic_Progress",_targetName];
bambusfarm_action_inUse = true; //Lockout the controls.
[player, "revive", 25] call bambusfarm_fnc_globalSound;

_target setVariable["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["bambusfarm_progress","PLAIN"];
_ui = uiNamespace getVariable ["bambusfarm_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

//Lets reuse the same thing!
while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1") then
	{
		player action ["SwitchWeapon", player, player, 100];   //EDIT
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep 0.195;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(bambusfarm_istazed) exitWith {}; //Tazed
	if(bambusfarm_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 4) exitWith {_badDistance = true;};
	if(_target getVariable["Revive",FALSE]) exitWith {};
	if(_target getVariable["Reviving",ObjNull] != player) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"};
_target setVariable["Reviving",NIL,TRUE];
if(!alive player OR bambusfarm_istazed) exitWith {bambusfarm_action_inUse = false;};
if(_target getVariable["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned"};
if((player getVariable["restrained",false])) exitWith {bambusfarm_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; bambusfarm_action_inUse = false;};
if(bambusfarm_interrupted) exitWith {bambusfarm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; bambusfarm_action_inUse = false;};

bambusfarm_BANK = bambusfarm_BANK + (call bambusfarm_revive_fee);
bambusfarm_action_inUse = false;
_target setVariable["Revive",TRUE,TRUE];
[[profileName],"bambusfarm_fnc_revived",_target,FALSE] spawn bambusfarm_fnc_MP;
titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[(call bambusfarm_revive_fee)] call bambusfarm_fnc_numberText],"PLAIN"];

sleep 0.6;
player reveal _target;