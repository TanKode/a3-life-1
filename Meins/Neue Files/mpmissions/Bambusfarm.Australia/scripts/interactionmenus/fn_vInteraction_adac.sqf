/*


	Show vehicle interaction menu


*/


private["_display","_curTarget","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12","_Btn1"];
if(!dialog) then {
	createDialog "vInteraction_adac"; //Use pInteraction_Menu with more buttons
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;

_Btn2 = _display displayCtrl 2401;
_Btn3 = _display displayCtrl 2402;
_Btn4 = _display displayCtrl 2403;
_Btn5 = _display displayCtrl 2404;
_Btn6 = _display displayCtrl 2405;
_Btn7 = _display displayCtrl 2406;
_Btn8 = _display displayCtrl 2407;
_Btn9 = _display displayCtrl 2408;
_Btn10 = _display displayCtrl 2409;
_Btn11 = _display displayCtrl 2410;
_Btn12 = _display displayCtrl 2411;
_Btn1 = _display displayCtrl 2412;

life_vInact_curTarget = _curTarget;

_Btn2 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_damageCheck;";
		
_Btn3 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_adacRepairTruck;";
		
_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";

_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";

_Btn6 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};

_Btn7 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";

_Btn12 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";

_Btn11 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_putToGarage;";

_Btn9 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadActivate;";

_Btn10 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundActionAbschlepp;";	

_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

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
