/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
if(isNil "bambusfarm_boltcutter_uses") then {bambusfarm_boltcutter_uses = 0;};
if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {
	[[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"bambusfarm_fnc_broadcast",true,false] spawn bambusfarm_fnc_MP;
} else {
	[[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]],"bambusfarm_fnc_broadcast",true,false] spawn bambusfarm_fnc_MP;
};

_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
bambusfarm_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["bambusfarm_progress","PLAIN"];
_ui = uiNamespace getVariable "bambusfarm_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
	default {_cpRate = 0.08;}
};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"bambusfarm_fnc_animSync",true,false] spawn bambusfarm_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["bambusfarm_progress","PLAIN"];
		_ui = uiNamespace getVariable "bambusfarm_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(bambusfarm_istazed) exitWith {}; //Tazed
	if(bambusfarm_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR bambusfarm_istazed) exitWith {bambusfarm_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {bambusfarm_action_inUse = false;};
if(bambusfarm_interrupted) exitWith {bambusfarm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; bambusfarm_action_inUse = false;};
bambusfarm_boltcutter_uses = bambusfarm_boltcutter_uses + 1;
bambusfarm_action_inUse = false;
if(bambusfarm_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call bambusfarm_fnc_handleInv;
	bambusfarm_boltcutter_uses = 0;
};

_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
if((_building getVariable["locked",false])) then {
	_building setVariable["locked",false,true];
};
[[getPlayerUID player,profileName,"459"],"bambusfarm_fnc_wantedAdd",false,false] spawn bambusfarm_fnc_MP;