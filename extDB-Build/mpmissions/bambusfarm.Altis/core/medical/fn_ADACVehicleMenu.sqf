/*
	File: fn_ADACVehicleMenu.sqf
	Author: Anton
	
	Description:
	Funktionen für das ADACVehicleMenu
*/

_mode = _this select 0;

if(_mode == 0) exitWith {
	disableSerialization;
	[0,((finddisplay 44000) displayCtrl 1) lbData lbCurSel ((finddisplay 44000 displayCtrl 1))] spawn bambusfarm_fnc_repairADAC;
};
if(_mode == 1) exitWith {
	[1] spawn bambusfarm_fnc_repairADAC;
};
if(_mode == 2) exitWith {
	disableSerialization;
	[parseNumber(ctrlText((finddisplay 44000) displayCtrl 2))] spawn bambusfarm_fnc_refuelADAC
};
if(_mode == 3) exitWith {
		if(((typeOf cursorTarget == "B_Truck_01_mover_F") || (typeOf cursorTarget == "C_Offroad_01_F")) && (count attachedObjects cursortarget >= 1)) then {
			if(typeOf(attachedObjects cursorTarget select 0) == "Land_Pillar_Pier_F") exitWith {[4] spawn bambusfarm_fnc_ADACVehicleMenu};
			[] spawn bambusfarm_fnc_unloadvehicle
		} else {
			if(typeOf(attachedObjects cursorTarget select 0) == "Land_Pillar_Pier_F") exitWith {[4] spawn bambusfarm_fnc_ADACVehicleMenu};
			[] spawn bambusfarm_fnc_loadvehicle
		};
};
if(_mode == 4) exitWith {
	if(count attachedObjects cursorTarget > 0) exitWith {{if(typeOf(_x) == "Land_Pillar_Pier_F") then {deleteVehicle _x}} forEach attachedObjects cursorTarget; cursorTarget lockDriver false; hint "Die Parksperre wurde erfolgreich entfernt, das Fahrzeug lässt sich nun wieder nutzen"};
	if(count crew cursorTarget > 0) exitWith {hint "Zum Anbringen einer Parksperre dürfen sich keine Personen im Fahrzeug befinden"};
	_sperre = "Land_Pillar_Pier_F" createVehicle position player;
	_sperre attachTo [cursorTarget,[0.768556,1.7567,-1.15283]]; _sperre setVectorDirAndUp [[0,5,-1],[5,-5,1]];
	cursorTarget lockDriver true;
	hint "Die Parksperre wurde erfolgreich angebracht, das Fahrzeug ist nun nicht mehr fahrbar";
};
if(_mode == 5) exitWith {
	createDialog "bambusfarm_ADACVehicleMenu";
	if(cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship" || cursorTarget isKindOf "Tank") then {
		disableSerialization;
		_list = ((finddisplay 44000) displayCtrl 1);
		((finddisplay 44000) displayCtrl 2400) ctrlEnable false;
		_partListraw = "true" configClasses (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "HitPoints"); 
		_partList = []; {_partList pushBack (configName _x)}forEach _partListraw;
		{
			private["_color"];
			_result = switch (_x) do {
				case "HitLFWheel": {"Linkes Vorderrad"};
				case "HitLF2Wheel": {"Linkes Hinterrad"};
				case "HitRFWheel": {"Rechtes Vorderrad"};
				case "HitRF2Wheel": {"Rechtes Hinterrad"};
				case "HitLMWheel": {"Linkes mittleres Rad"};
				case "HitRMWheel": {"Rechtes mittleres Rad"};
				case "HitRBWheel": {"Rechtes Hinterrad"};
				case "HitLBWheel": {"Linkes Hinterrad"};
				case "HitReserveWheel": {"Ersatzreifen"};
				case "HitFuel": {"Benzintank"};
				case "HitEngine": {"Motor"};
				case "HitEngine1": {"Motor1"};
				case "HitEngine2": {"Motor2"};
				case "HitEngine3": {"Motor3"};
				case "HitEngine4": {"Motor4"};
				case "HitBody": {"Karosserie"};
				case "HitHull": {"Karosserie"};
				case "HitAvionics": {"Bordelektronik"};
				case "HitTransmission": {"Übertragung"};				
				case "HitHRotor": {"Hauptrotor"};
				case "HitVRotor": {"Heckrotor"};
				case "HitRotorVirtual": {"Virtueller Rotor"};
				case "HitMissiles": {"Raketen"};				
				case "HitGlass1": {"Glasscheibe"};
				case "HitGlass2": {"Glasscheibe"};
				case "HitGlass3": {"Glasscheibe"};
				case "HitGlass4": {"Glasscheibe"};
				case "HitGlass5": {"Glasscheibe"};
				case "HitGlass6": {"Glasscheibe"};
				case "HitGlass7": {"Glasscheibe"};
				case "HitGlass8": {"Glasscheibe"};
				case "HitGlass9": {"Glasscheibe"};
				case "HitGlass10": {"Glasscheibe"};
				case "HitGlass11": {"Glasscheibe"};
				case "HitGlass12": {"Glasscheibe"};
				case "HitGlass13": {"Glasscheibe"};
				case "HitGlass14": {"Glasscheibe"};
				case "HitGlass15": {"Glasscheibe"};
				case "Glass_1_hitpoint": {"Glasscheibe"};
				case "Glass_2_hitpoint": {"Glasscheibe"};
				case "Glass_3_hitpoint": {"Glasscheibe"};
				case "Glass_4_hitpoint": {"Glasscheibe"};
				case "Glass_5_hitpoint": {"Glasscheibe"};
				case "Glass_6_hitpoint": {"Glasscheibe"};
				case "Glass_7_hitpoint": {"Glasscheibe"};
				case "Glass_8_hitpoint": {"Glasscheibe"};
				case "Glass_9_hitpoint": {"Glasscheibe"};
				case "Glass_10_hitpoint": {"Glasscheibe"};
				case "Glass_11_hitpoint": {"Glasscheibe"};
				case "Glass_12_hitpoint": {"Glasscheibe"};
				case "Glass_13_hitpoint": {"Glasscheibe"};
				case "Glass_14_hitpoint": {"Glasscheibe"};
				case "Glass_15_hitpoint": {"Glasscheibe"};
				case "Glass_16_hitpoint": {"Glasscheibe"};
				case "Glass_17_hitpoint": {"Glasscheibe"};
				case "Glass_18_hitpoint": {"Glasscheibe"};
				case "Glass_19_hitpoint": {"Glasscheibe"};
				case "Glass_20_hitpoint": {"Glasscheibe"};
			};	
			_price = switch(_result) do {
				case "Linkes Vorderrad": {500};
				case "Linkes Hinterrad": {500};
				case "Rechtes Vorderrad": {500};
				case "Rechtes Hinterrad": {500};
				case "Ersatzreifen": {500};
				case "Benzintank": {1000};
				case "Motor": {2000};
				case "Motor1": {2000};
				case "Motor2": {2000};
				case "Motor3": {2000};
				case "Motor4": {2000};
				case "Karosserie": {1000};
				case "Bordelektronik": {1000};
				case "Übertragung": {1000};
				case "Hauptrotor": {1000};
				case "Heckrotor": {1000};
				case "Virtueller Rotor": {1000};
				case "Raketen": {50000};
				case "Glasscheibe": {100};
				case default {0};
			};	
			_extra = switch(_result) do {
				case "Benzintank": {format[" (%1)",round(fuel cursorTarget * 100)]};
				case default {""};
			};	
			_dmg = (cursorTarget getHitPointDamage _x);
			if(_dmg > 0) then {_color = [0.839,(1 - _dmg),0,1];}else{_color = [0.239,0.839,0,1];};
			disableSerialization;
			_list lbAdd format["%1%2 | Preis: %3 €",_result,_extra,_price];
			_list lbSetData [(lbSize _list)-1,_x];
			_list lbsetColor[(lbSize _list)-1,_color];
		}
		forEach _partList;
		if(damage cursorTarget <= 0) then {
			((finddisplay 44000) displayCtrl 2401) ctrlEnable false;
		};
	};
};
if(_mode == 6) exitWith {
	_list = ((finddisplay 44000) displayCtrl 1); 
	_color = _list lbColor lbCurSel _list;

	if(format["%1",_color] == "[0.239216,0.839216,0,1]") then {
		((finddisplay 44000) displayCtrl 3) ctrlEnable false;
	}else{
		((finddisplay 44000) displayCtrl 3) ctrlEnable true;
	};
};
if(_mode == 7) exitWith {
	[cursorTarget] spawn bambusfarm_fnc_impoundAction;
};
if(_mode == 8) exitWith {
	cursorTarget setPos [getPos cursorTarget select 0, getPos cursorTarget select 1, (getPos cursorTarget select 2)+0.5]; 
	closeDialog 0;
};
if(_mode == 9) exitWith {
	[] spawn bambusfarm_fnc_searchVehAction;
};