/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Building interaction menu
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];

createDialog "pInteraction_Menu";

disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
//_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;

life_pInact_curTarget = _curTarget;

	_Btn1 ctrlSetText "Cannabis verarbeiten";
	_Btn1 buttonSetAction "[life_pInact_curTarget,0] spawn life_fnc_kitchenprocess;";
	_Btn1 ctrlShow true;
	
	_Btn2 ctrlSetText "Heroin verarbeiten";
	_Btn2 buttonSetAction "[life_pInact_curTarget,1] spawn life_fnc_kitchenprocess;";
	_Btn2 ctrlShow true;
	
	_Btn3 ctrlSetText "Coca verarbeiten";
	_Btn3 buttonSetAction "[life_pInact_curTarget,2] spawn life_fnc_kitchenprocess;";
	_Btn3 ctrlShow true;
	