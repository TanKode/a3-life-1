#include <macro.h>
/*
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
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
_isVehicle = if(EQUAL((typeOf _curTarget),"Land_MetalBarrel_F")) then {true} else {false};
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
removeFass = _curTarget;

if(playerSide == civilian) then
{
	if(player GVAR "oelFassTransport") then
	{
		_Btn1 ctrlSetText "Fass abstellen";
		_Btn1 buttonSetAction "[life_vInact_curTarget,0] spawn life_fnc_oelFassDetach; closeDialog 0;";
		if(!(player GVAR "oelFassTransport")) then
		{
			_Btn1 ctrlEnable false;
		}else{
			_Btn1 ctrlEnable true;
		};
	}else{
		_Btn1 ctrlSetText "Fass mitnehmen";
		_Btn1 buttonSetAction "[life_vInact_curTarget,1] spawn life_fnc_oelFassDetach; closeDialog 0;";
		if((player GVAR "oelFassTransport")) then
		{
			_Btn1 ctrlEnable false;
		}else{
			_Btn1 ctrlEnable true;
		};
	};
	
	if(EQUAL((_curTarget GVAR "myOelFass"),(getPlayerUID player))) then
	{
		_Btn2 ctrlSetText "Oelfass befuellen";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_oelPump; closeDialog 0;";
	};
	if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {(EQUAL((_curTarget GVAR "myOelFass"),(getPlayerUID player)))}) then {
		_Btn2 ctrlEnable false;
	} else {
		_Btn2 ctrlEnable true;
	};
	
	_Btn3 ctrlShow false;
	_Btn4 ctrlShow false;
	_Btn5 ctrlShow false;
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;
};