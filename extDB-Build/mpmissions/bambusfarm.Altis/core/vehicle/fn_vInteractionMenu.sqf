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
bambusfarm_vInact_curTarget = _curTarget;

//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[bambusfarm_vInact_curTarget] spawn bambusfarm_fnc_repairTruck;";

if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

if(playerSide == west) then {
	_Btn2 ctrlSetText localize "STR_vInAct_Registration";
	_Btn2 buttonSetAction "[bambusfarm_vInact_curTarget] spawn bambusfarm_fnc_searchVehAction;";
	
	_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
	_Btn3 buttonSetAction "[bambusfarm_vInact_curTarget] spawn bambusfarm_fnc_vehInvSearch;";
	
	_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn4 buttonSetAction "[bambusfarm_vInact_curTarget] spawn bambusfarm_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};

	_Btn5 ctrlSetText localize "STR_vInAct_Impound";
	_Btn5 buttonSetAction "[bambusfarm_vInact_curTarget] spawn bambusfarm_fnc_impoundAction;";
	
	if(_curTarget isKindOf "Ship") then {
		_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn6 buttonSetAction "[] spawn bambusfarm_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
			_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn6 buttonSetAction "player moveInDriver bambusfarm_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn6 buttonSetAction "bambusfarm_vInact_curTarget setPos [getPos bambusfarm_vInact_curTarget select 0, getPos bambusfarm_vInact_curTarget select 1, (getPos bambusfarm_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
		};
	};
    if(playerSide in [west]) then {
    	_Btn7 ctrlShow true;
    	_Btn7 ctrlEnable true;
    	_Btn7 ctrlSetText "Zerstören";
    	_Btn7 buttonSetAction "[bambusfarm_vInact_curTarget] spawn bambusfarm_fnc_crush;";
    } else {
    	_Btn7 ctrlShow false;
    };
    		_Btn8 ctrlShow false;
    		_Btn9 ctrlShow false;
    		_Btn10 ctrlShow false;
};
if(playerSide == civilian)then
{
	if(_curTarget isKindOf "Ship") then {
		_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn2 buttonSetAction "[] spawn RiskYourbambusfarm_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
			_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn2 buttonSetAction "player moveInDriver RiskYourbambusfarm_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn2 buttonSetAction "RiskYourbambusfarm_vInact_curTarget setPos [getPos RiskYourbambusfarm_vInact_curTarget select 0, getPos RiskYourbambusfarm_vInact_curTarget select 1, (getPos RiskYourbambusfarm_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
		};
	};

	if(typeOf _curTarget == "O_Truck_03_device_F") then {
		_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
		_Btn3 buttonSetAction "[RiskYourbambusfarm_vInact_curTarget] spawn RiskYourbambusfarm_fnc_deviceMine";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in RiskYourbambusfarm_vehicles}) then {
			_Btn3 ctrlEnable false;
		} else {
			_Btn3 ctrlEnable true;
		};
	} else {
		_Btn3 ctrlShow false;
	};

	//Button 4 - Set lockpick action
    _Btn4 ctrlSetText localize "STR_vInAct_Lockpick";
    _Btn4 buttonSetAction "[bambusfarm_vInact_curTarget] spawn bambusfarm_fnc_lockpick; closeDialog 0;";
    if(bambusfarm_inv_lockpick > 0) then {
    	_Btn4 ctrlEnable true;
    }else {
    	_Btn4 ctrlEnable false;
    };

	//Button 2 - Set pullout action
    _Btn5 ctrlSetText localize "STR_vInAct_PullOut";
    _Btn5 buttonSetAction "[bambusfarm_vInact_curTarget] spawn bambusfarm_fnc_pulloutAction;";
	//Button 2 - Set pullout action
 		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		_Btn10 ctrlShow false;
  };
if(playerSide == independent)then
{
    //Button 1 - Set vehicle repair action
    _Btn1 ctrlSetText localize "STR_vInAct_Repair";
    if((!isNull _curTarget) && (_curTarget isKindOf "air")) then
    {
    	_Btn1 buttonSetAction "[bambusfarm_vInact_curTarget] spawn bambusfarm_fnc_repairTruck;";
    }else{
    	_Btn1 buttonSetAction "[bambusfarm_vInact_curTarget] spawn bambusfarm_fnc_repCar;";
    };

    if("ToolKit" in (items player) && (damage _curTarget < 1)) then
    {
        _Btn1 ctrlEnable true;
    } else {
        _Btn1 ctrlEnable false;
    };

    //Button 2 - Set pushboat action if curTarget is a boat else if curTarget is a kart displays some kart actions
    if(_curTarget isKindOf "Ship") then
    {
    	_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
    	_Btn2 buttonSetAction "[] spawn bambusfarm_fnc_pushObject; closeDialog 0;";
    	if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then
    	{
    	    _Btn2 ctrlEnable true;
    	} else {
    	    _Btn2 ctrlEnable false
    	};
    } else {
    	if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","C_Heli_Light_01_civil_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F"]) then
    	{
    		_Btn2 ctrlSetText "Jump In";
    		_Btn2 buttonSetAction "player moveInDriver bambusfarm_vInact_curTarget; closeDialog 0;";
    		if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then
    		{
    		    _Btn2 ctrlEnable true;
    		} else {
    			_Btn2 ctrlEnable false
    		};
    	} else {
    		_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
    		_Btn2 buttonSetAction "bambusfarm_vInact_curTarget setPos [getPos bambusfarm_vInact_curTarget select 0, getPos bambusfarm_vInact_curTarget select 1, (getPos bambusfarm_vInact_curTarget select 2)+0.5]; closeDialog 0;";
    		if(count crew _curTarget == 0 && {canMove _curTarget}) then
    		{
    			_Btn2 ctrlEnable false;
    		} else {
    			_Btn2 ctrlEnable true;
    		};
    	};
    };

    //Button 3 - undefined
    _Btn3 ctrlShow false;
    //Button 4 - undefined
    _Btn4 ctrlShow false;
    //Button 5 - undefined
    _Btn5 ctrlShow false;
    //Button 6 - undefined
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;
};