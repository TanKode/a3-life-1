#include <macro.h>
/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test"];
_veh = cursorTarget;
life_interrupted = false;
_damage = damage _veh;
_vehDamage = false;

if(isNull _veh) exitwith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air") OR (_veh isKindOf "LandVehicle")) then
{
	_motor = _veh getHitPointDamage "HitEngine";
	_fuel = _veh getHitPointDamage "HitFuel";
	_HMotor = _veh getHitPointDamage "HitHRotor";
	_VMotor = _veh getHitPointDamage "HitVRotor";
	_WheelLF = _veh getHitPointDamage "HitLFWheel";
	_WheelLF2 = _veh getHitPointDamage "HitLF2Wheel";
	_WheelRF = _veh getHitPointDamage "HitRFWheel";
	_WheelRF2 = _veh getHitPointDamage "HitRF2Wheel";

	if(skill_civ_mechanic && skill_civ_mechanic1 && skill_civ_mechanic2) then
	{
		
	}else{
		if(_veh isKindOf "Car") exitWith {
			if((_motor > 0.5) OR (_fuel > 0.5)) exitWith {_vehDamage = true};
		};
	   
		if(_veh isKindOf "Air") exitWith {
			if((_HMotor > 0.5) OR (_VMotor > 0.5) OR (_fuel > 0.5)) exitWith {_vehDamage = true};
		 };

		/*if(_damage > 0.6) exitWith
		{
			hint "Das Fahrzeug ist zu sehr beschadigt! Sie koennen es nicht weiter reparieren! Sie koennen aber den ADAC rufen.";
			_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
		};*/
	};

if(_vehDamage) exitWith {hintSilent "Das Fahrzeug hat einen Motor/Tankschaden. Sie koennen es nicht reparieren! Sie koennen aber den ADAC rufen.";_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]};	
	
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		_cpRate = 0.01;
		if(skill_civ_mechanic) then {_cpRate = 0.02};
		[player,"adacrep"] call life_fnc_globalSound; //Just if you have global sounds!
		
		while{true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
				player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			sleep 0.27;
			_cP = _cP + _cpRate;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
			if(!alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
			if(player != vehicle player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
			if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(EQUAL(playerSide,civilian)) then
		{
			if(skill_civ_mechanic && skill_civ_mechanic1) then {
				ADD(life_skill_mechanic,1);
				if(EQUAL(life_skill_mechanic,2)) then
				{
					player removeItem "ToolKit";
					life_skill_mechanic = 0;
				};
			}else{
				player removeItem "ToolKit";
			};
		};
		_veh setDamage 0;
		titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
	};
};
_exp = round(random(80));
[true,_exp] spawn life_fnc_expConfig;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];