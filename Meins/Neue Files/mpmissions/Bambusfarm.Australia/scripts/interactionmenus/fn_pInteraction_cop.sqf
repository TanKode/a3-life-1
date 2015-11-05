/*

	Shows pInteraction Menu

*/

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(!dialog) then {
	createDialog "pInteraction_Cop";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget) exitWith {hint "Ziel ist kein Spieler"; closeDialog 0; };
if(side player == civilian) exitWith {hint "Du bist kein Cop"; closeDialog 0;}; //Bad side check?


_display = findDisplay 37400;

_Btn1 = _display displayCtrl 2401;
_Btn2 = _display displayCtrl 2402;
_Btn3 = _display displayCtrl 2403;
_Btn4 = _display displayCtrl 2404;
_Btn5 = _display displayCtrl 2405;
_Btn6 = _display displayCtrl 2406;
_Btn7 = _display displayCtrl 2407;
_Btn8 = _display displayCtrl 2408;
_Btn9 = _display displayCtrl 2409;
_Btn10 = _display displayCtrl 2410;

life_pInact_curTarget = _curTarget;

///////////////////////////////////////////////////////
/////////////Set actions

//Set Unrestrain Button
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

//Set Check Licenses Button
_Btn2 buttonSetAction "[] call life_fnc_createRemoveLicesnsesDialog";

//Set Search Button
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_copInteractionMenu;";
} else {
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Set Ticket Button
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

_Btn6 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_showArrestDialog;";

_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

//Drog test
_Btn8 buttonSetAction "[life_pInact_curTarget] call life_fnc_drugCheck;";

//Drung test
_Btn9 buttonSetAction "[[player],""life_fnc_breathalyzer"",life_pInact_curTarget,FALSE] spawn life_fnc_MP;closeDialog 0";

_Btn10 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_removeMask; closeDialog 0;";

//Check that you are near a place to jail them.
if(!((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_4") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30) OR (player distance (getMarkerPos "cop_spawn_6") < 30))) then 
{
	_Btn6 ctrlEnable false;
};