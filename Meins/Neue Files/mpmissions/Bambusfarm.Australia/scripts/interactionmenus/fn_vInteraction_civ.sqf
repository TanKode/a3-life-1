/*


	Show vehicle interaction menu


*/


private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn5","_Btn6","_Btn4","_Btn7"];
if(!dialog) then {
	createDialog "vInteraction_civ"; //Use pInteraction_Menu with more buttons
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;

_Btn1 = _display displayCtrl 2401;
_Btn2 = _display displayCtrl 2402;
_Btn3 = _display displayCtrl 2404;
_Btn5 = _display displayCtrl 2407;
_Btn6 = _display displayCtrl 2403;
_Btn4 = _display displayCtrl 2405;
_Btn7 = _display displayCtrl 2406;

life_vInact_curTarget = _curTarget;


_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_putToGarage;";	

_Btn5 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";

_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";

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
	_Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
	if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
		_Btn7 ctrlEnable false;
	} else {
		_Btn7 ctrlEnable true;
	};
} else {
	_tanker = ["C_Van_01_fuel_F","O_Truck_03_fuel_F","O_Truck_02_fuel_F","B_Truck_01_fuel_F","Land_Pod_Heli_Transport_04_fuel_F"];
	if(typeOf _curTarget in _tanker) then {
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_oelPump";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
			_Btn4 ctrlEnable false;
		} else {
			_Btn4 ctrlEnable true;
		};
	};

};	