#include <macro.h>
/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
life_vInact_curTarget = _curTarget;

_inVehicle =["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","C_Heli_Light_01_civil_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","C_Heli_Light_01_civil_F"];


//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

if(playerSide == west) then {
	_Btn2 ctrlSetText localize "STR_vInAct_ADACRepair";
	_Btn2 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_adacRepairTruck;";
					
	if(life_inv_adac_toolkit > 0) then{ _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false;};
	
	_Btn3 ctrlSetText localize "STR_vInAct_Registration";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	
	_Btn4 ctrlSetText localize "STR_vInAct_SearchVehicle";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
	
	_Btn5 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn5 ctrlEnable false;};
	
	_Btn6 ctrlSetText localize "STR_vInAct_Impound";
	_Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
	
	_Btn7 ctrlSetText localize "STR_vInAct_putToGarage";
	_Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_putToGarage;";
	
	if(_curTarget isKindOf "Ship") then {
		_Btn8 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn8 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn8 ctrlEnable true;} else {_Btn8 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in _inVehicle) then {
			_Btn8 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn8 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn8 ctrlEnable true;} else {_Btn8 ctrlEnable false};
		} else {
			_Btn8 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn8 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn8 ctrlEnable false;} else {_Btn8 ctrlEnable true;};
		};
	};
	
	_Btn9 ctrlSetText localize "STR_vInAct_slingLoad";
	_Btn9 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadActivate;";
	
	_Btn10 ctrlSetText localize "STR_vInAct_Abschlepp";
	_Btn10 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundActionAbschlepp;";
	//_Btn8 ctrlShow false;
	//_Btn10 ctrlShow false;
	
} else {
	
	if(playerSide == east) then{
		_Btn2 ctrlSetText localize "STR_vInAct_ADACCheck";
		_Btn2 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_damageCheck;";
		
		_Btn3 ctrlSetText localize "STR_vInAct_ADACRepair";
		_Btn3 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_adacRepairTruck;";
		
		_Btn4 ctrlSetText localize "STR_vInAct_Registration";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
			
		//_Btn4 ctrlSetText localize "STR_vInAct_ADACRepaint";
		//_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_RepaintMenu;";
		
		_Btn5 ctrlSetText localize "STR_vInAct_Impound";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
		
		_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
		_Btn6 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
		
		if(_curTarget isKindOf "Ship") then {
			_Btn7 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn7 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn7 ctrlEnable true;} else {_Btn7 ctrlEnable false};
		} else {
			if(typeOf (_curTarget) in _inVehicle) then {
				_Btn7 ctrlSetText localize "STR_vInAct_GetInKart";
				_Btn7 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn7 ctrlEnable true;} else {_Btn7 ctrlEnable false};
			};
		};
		
		_Btn8 ctrlSetText localize "STR_vInAct_putToGarage";
		_Btn8 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_putToGarage;";
		
		_Btn9 ctrlSetText localize "STR_vInAct_slingLoad";
		_Btn9 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadActivate;";
		
		_Btn10 ctrlSetText localize "STR_vInAct_Abschlepp";
		_Btn10 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundActionAbschlepp;";	
		
		if(!((player distance (getMarkerPos "Remove_Container") < 30) OR  (player distance (getMarkerPos "adac_spawn_2") < 30) or (player distance (getMarkerPos "adac_spawn_3") < 30))) then 
		{
			_Btn5 ctrlEnable false;
			_Btn10 ctrlShow false;
			//_Btn6 ctrlEnable false;
		}else {
			_Btn5 ctrlEnable true;
			_Btn10 ctrlShow true;
			//_Btn6 ctrlEnable true;
		};
		
		//_Btn4 ctrlShow false;
		//_Btn5 ctrlShow false;
		//_Btn6 ctrlShow false;
		//_Btn7 ctrlShow false;
		//_Btn8 ctrlShow false;
		//_Btn9 ctrlShow false;	
		//_Btn10 ctrlShow false;
	} else{
	
		_Btn2 ctrlSetText localize "STR_vInAct_putToGarage";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_putToGarage;";	

		if(_curTarget isKindOf "Ship") then {
			_Btn3 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn3 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false};
		} else {
			if(typeOf (_curTarget) in _inVehicle) then {
				_Btn3 ctrlSetText localize "STR_vInAct_GetInKart";
				_Btn3 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false};
			};
		};
		
		if((typeOf _curTarget in ["C_Offroad_01_F"])) then
		{
			_Btn3 ctrlSetText "Fass aufladen";
			_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_oelFassVehicleAuf;closeDialog 0;";
			if(player GVAR "oelFassTransport") then {_Btn3 ctrlEnable true;}else{_Btn3 ctrlEnable false;};
			
			_Btn4 ctrlSetText "Fass abladen";
			_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_oelFassVehicleAb;closeDialog 0;";
			if((!(player GVAR "oelFassTransport")) && ((_curTarget GVAR "oelSlot") >= 1)) then {_Btn4 ctrlEnable true;}else{_Btn4 ctrlEnable false;};
		}else{
			_Btn3 ctrlEnable false;
			_Btn4 ctrlEnable false;
		};
		
		if(typeOf _curTarget == "O_Truck_03_device_F") then {
			_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
			_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
			if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
				_Btn3 ctrlEnable false;
			} else {
				_Btn3 ctrlEnable true;
			};
		} else {
			_tanker = ["C_Van_01_fuel_F","O_Truck_03_fuel_F","O_Truck_02_fuel_F","B_Truck_01_fuel_F","Land_Pod_Heli_Transport_04_fuel_F"];
			if(typeOf _curTarget in _tanker) then {
				_Btn4 ctrlSetText localize "STR_vInAct_oelMine";
				_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_oelPump";
				if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
					_Btn4 ctrlEnable false;
				} else {
					_Btn4 ctrlEnable true;
				};
			};

		};		
		//_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		_Btn10 ctrlShow false;
	};
};