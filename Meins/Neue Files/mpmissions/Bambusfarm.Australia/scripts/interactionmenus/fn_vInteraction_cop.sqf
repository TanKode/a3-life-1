/*


	Show vehicle interaction menu


*/


private["_display","_curTarget","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12","_Btn1"];
if(!dialog) then {
	createDialog "vInteraction_cop"; //Use pInteraction_Menu with more buttons
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
_Btn11 = _display displayCtrl 24010;
_Btn12 = _display displayCtrl 24011;
_Btn1 = _display displayCtrl 24012;

life_vInact_curTarget = _curTarget;

    _Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

	_Btn2 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_adacRepairTruck;";
					
	if(life_inv_adac_toolkit > 0) then{ _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false;};
	
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
	
	_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn5 ctrlEnable false;};
	
	_Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
	
	_Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_putToGarage;";

	_Btn8 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
	
	_Btn9 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";

	_Btn10 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
	
	_Btn11 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadActivate;";
	
	_Btn12 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundActionAbschlepp;";
