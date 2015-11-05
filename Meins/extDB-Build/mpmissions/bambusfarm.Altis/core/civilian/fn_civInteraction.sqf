/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.
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
#define Btn11 37460
#define Btn12 37461
#define Btn13 37462
#define Btn14 37463
#define Btn15 37464
#define Btn16 37465
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12","_Btn13","_Btn14","_Btn15","_Btn16"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?
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
_Btn11 = _display displayCtrl Btn11;
_Btn12 = _display displayCtrl Btn12;
_Btn13 = _display displayCtrl Btn13;
_Btn14 = _display displayCtrl Btn14;
_Btn15 = _display displayCtrl Btn15;
_Btn16 = _display displayCtrl Btn16;
life_pInact_curTarget = _curTarget;

	//Set Unrestrain Button
	_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

	if(life_inv_Schere > 0) then
	{
	    _Btn1 ctrlEnable true;
	} else {
	    _Btn1 ctrlEnable false;
	};

	//Button 2 - Set Escort Button
	if((_curTarget getVariable["Escorting",false])) then {
	    _Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;";
	} else {
	    _Btn2 ctrlSetText localize "STR_pInAct_Escort";
	    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
	};

	if(!(_curTarget getVariable["restrained",FALSE])) then {
		_btn3 ctrlShow false;
	}else{
		_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
		_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";
	};

	_Btn4 ctrlSetText "Ausweis zeigen";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_ShowLicense; closeDialog 0;";
	_Btn5 ctrlSetText "Führerschein zeigen";
	_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_lappen; closeDialog 0;";

	if(!(_curTarget getVariable["restrained",FALSE])) then {
		_btn6 ctrlShow false;
	}else{
		_Btn6 ctrlSetText "Ausrauben";
		_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_robAction; closeDialog 0;";
	};

	if(!(_curTarget getVariable["restrained",FALSE])) then {
		_btn7 ctrlShow false;
	}else{
		_Btn7 ctrlSetText "Handy abnehmen";
		_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_robHandy; closeDialog 0;";
	};
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;
	_Btn11 ctrlShow false;
	_Btn12 ctrlShow false;
	_Btn13 ctrlShow false;
	_Btn14 ctrlShow false;
	_Btn15 ctrlShow false;
	_Btn16 ctrlShow false;