#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_vault","_building","_door","_doors","_cpRate","_title","_bool","_progressBar","_titleText","_cp","_ui","_rip","_Pos","_rndmrk","_mrkstring","_exp"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_rip = false;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "Sie befinden sich an keiner Tür."};
if(((_building isKindOf "Land_Dome_Big_F") OR (_building isKindOf "Land_Research_house_V1_F"))) exitWith {hint "Um in der Bundeszentralbank einzubrechen brauchen Sie einen Bolzenschneider!"};
if(isNil "life_burglarTool_uses") then {life_burglarTool_uses = 0;};

if(_building isKindOf "House_F") then {		
	[[3,format["<t color='#CB2525'><t size='2'>112 - EINBRUCH!</t><br/><t color='#FFFFFF'> %1 versucht in ein Haus einzubrechen!<br/> Der Standort wurde makiert!",profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	[_building,"Hausalarm"] call life_fnc_globalSound;
};
if (_rip) exitWith { hint "Es wird gerade schon eingebrochen!" };
_doors = 1;
while {true} do {
	if(!isClass(configFile >> "CfgVehicles" >> (typeOf _building) >> "AnimationSources" >> format["Door_%1_source",_doors])) exitWith {};
	_doors = _doors + 1;
};
_rip = true;
_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building GVAR[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace GVAR "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.003;

if(_building isKindOf "Land_i_Shed_Ind_F") then {_cpRate = 0.0015};

if(_rip) then
{
   _rndmrk = random(1000);
   _mrkstring = format ["wrgMarker%1", _rndmrk];
   _Pos = position player; // by ehno: get player pos
   _marker = createMarker [_mrkstring, _Pos]; //by ehno: Place a Marker on the map
   _marker setMarkerColor "ColorRed";
   _marker setMarkerText "!ACHTUNG! Hier wird eingebrochen !ACHTUNG!";
   _marker setMarkerType "mil_warning";

	while {true} do
	{
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};
		
		sleep 0.26;
		if(isNull _ui) then {
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNamespace GVAR "life_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		_cP = _cP + _cpRate;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(_cP >= 1 OR !alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(life_istazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Tazed
		if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};

	//Kill the UI display and check for various states
	5 cutText ["","PLAIN"];
	deleteMarker _marker;
	player playActionNow "stop";
	if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if((player GVAR ["restrained",false])) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
	_rip = false;
	
	
	if(_building isKindOf "Land_i_Shed_Ind_F") then
	{
		life_burglarTool_uses = life_burglarTool_uses + 1;
		life_action_inUse = false;
		if(life_burglarTool_uses >= 2) then {
			[false,"boltcutter",1] call life_fnc_handleInv;
			life_burglarTool_uses = 0;
			_dice = random(100);
			if(_dice < 5) then {
				_building SVAR [format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
				if((_building GVAR ["locked",false])) then {
					_building SVAR ["locked",false,true]
				};
				[[getPlayerUID player,profileName,"460"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			}else{
				hintSilent "Sie konnten das Schloss nicht knacken!";
			};
		};
	}else{
		life_burglarTool_uses = life_burglarTool_uses + 1;
		life_action_inUse = false;
		if(life_burglarTool_uses >= 5) then {
			[false,"boltcutter",1] call life_fnc_handleInv;
			life_burglarTool_uses = 0;

			_building SVAR [format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
			if((_building GVAR ["locked",false])) then {
					_building SVAR ["locked",false,true];
			};
			[[getPlayerUID player,profileName,"460"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		};
	};
	_exp = round(random(100));
	[true,_exp] spawn life_fnc_expConfig;
};