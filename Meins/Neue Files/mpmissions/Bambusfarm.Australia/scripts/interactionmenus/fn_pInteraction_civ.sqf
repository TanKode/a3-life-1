/*

	Shows pInteraction Menu
	for all civ players

*/

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5"];
if(!dialog) then 
{
    createDialog "pInteraction_civ";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget) exitWith {hint "Ziel ist kein Spieler"; closeDialog 0; };
if(!license_civ_rebel) exitWith {hint "Du bist kein Rebelle"; closeDialog 0;}; //Bad side check?
/*
 * Converted rebInteraction to civInteraction
 * */


_display = findDisplay 37400;

_Btn1 = _display displayCtrl 2401;
_Btn2 = _display displayCtrl 2402;
_Btn3 = _display displayCtrl 2403;
_Btn4 = _display displayCtrl 2404;
_Btn5 = _display displayCtrl 2405;

life_pInact_curTarget = _curTarget;

///////////////////////////////////////////////////////
/////////////Set actions

	//Set Unrestrain Button
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

	//Set Escort Button
	if((_curTarget getVariable["Escorting",false])) then 
	{
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_rebelInteractionMenu;";
	} 
	else 
	{
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
	};

	_Btn3 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

	_Btn4 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_TorturePlayer;";

	_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_takeOrgans; closeDialog 0;";

