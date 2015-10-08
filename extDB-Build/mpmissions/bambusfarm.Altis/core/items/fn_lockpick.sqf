/*
    File: fn_lockpick.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for lock-picking.
*/
if(vehicle player != player) exitwith {};
if(bambusfarm_is_processing) exitWith {};
if(bambusfarm_action_inUse) exitWith {};
if(bambusfarm_action_gathering) exitWith {};

private["_vehicle","_displayName","_distance","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_vehicle = cursorTarget;
if(isPlayer _vehicle) exitWith {};
if(isNull _vehicle) exitWith {};
_distance = ((boundingBox _vehicle select 1) select 0) + 2;
if(player distance _vehicle > _distance) exitWith {};
if(_vehicle in bambusfarm_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_title = format[localize "STR_ISTR_Lock_Process",_displayName];

bambusfarm_interrupted = false;
bambusfarm_action_inUse = true;

disableSerialization;
5 cutRsc ["bambusfarm_progress","PLAIN"];
_ui = uiNamespace getVariable "bambusfarm_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_displayName];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
    if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then 
	{
        player action ["SwitchWeapon", player, player, 100];
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
        player playActionNow "stop";
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
        player playActionNow "stop";
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
        player playActionNow "stop";
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
    };
    sleep 0.26;
	
    if(isNull _ui) then 
	{
        5 cutRsc ["bambusfarm_progress","PLAIN"];
        _ui = uiNamespace getVariable "bambusfarm_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
	
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if(_cP >= 1 OR !alive player) exitWith {};
    if(bambusfarm_istazed) exitWith {};
    if(bambusfarm_interrupted) exitWith {};
    if((player getVariable["restrained",false])) exitWith {};
    if(player distance _vehicle > _distance) exitWith {_badDistance = true;};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player OR bambusfarm_istazed) exitWith {bambusfarm_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {bambusfarm_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; bambusfarm_action_inUse = false;};
if(bambusfarm_interrupted) exitWith {bambusfarm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; bambusfarm_action_inUse = false;};
if(!([false,"lockpick",1] call bambusfarm_fnc_handleInv)) exitWith {bambusfarm_action_inUse = false;};

bambusfarm_action_inUse = false;

_dice = random(100);
if(_dice < 30) then
{
    titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
    bambusfarm_vehicles pushBack _vehicle;
    [[getPlayerUID player,profileName,"487"],"bambusfarm_fnc_wantedAdd",false,false] spawn bambusfarm_fnc_MP;
} else {
    [[getPlayerUID player,profileName,"215"],"bambusfarm_fnc_wantedAdd",false,false] spawn bambusfarm_fnc_MP;
    [[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]],"bambusfarm_fnc_broadcast",west,false] spawn bambusfarm_fnc_MP;
    titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
};