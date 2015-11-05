/*
----------------------------------------------|
Author: Backer
Description: New Housing Dialog FTW
----------------------------------------------|
*/
#define Btn1 7200
#define Btn2 7208
#define Btn3 7209
#define Btn4 7206
#define Btn5 7207

private["_display","_houseCfg","_house","_text1","_text2","_text3","_text4","_text5","_text6","_text7","_text8","_text9","_veh_data","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
//if(isNull _veh OR !alive _veh) exitWith {closeDialog 0;}; //If null / dead exit menu
if(!isNull (findDisplay 6990)) exitwith {hint "hm?";};



_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//if(isNull _house) exitWith {hint "hm1?";};
if(!(_house isKindOf "House_F")) exitWith {hint "hm2?";};

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {hint "hm3?";};

if (dialog) then
{
closeDialog 0;
};

createDialog "housingSettings";
disableSerialization;
waitUntil {!isnull (findDisplay 6990)};
_display = findDisplay 6990;
_text1 = _display displayCtrl 7100;
_text2 = _display displayCtrl 7101;
_text3 = _display displayCtrl 7102;
_text4 = _display displayCtrl 7103;
_text5 = _display displayCtrl 7104;
_text6 = _display displayCtrl 7105;
_text7 = _display displayCtrl 7108;
_text8 = _display displayCtrl 7110;
_text9 = _display displayCtrl 7111;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn2 ctrlEnable false;
_Btn3 ctrlEnable false;

_text1 ctrlSetStructuredText parseText format["Kistenplätze: <t color='#8cff9b'>%1</t>", [[(_houseCfg select 1)] call life_fnc_numberText]];
_text2 ctrlSetStructuredText parseText format["Haus: <t color='#8cff9b'>%1</t>", getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName")];
_text3 ctrlSetStructuredText parseText format["Besitzer: <t color='#8cff9b'>%1</t>", (_house getVariable "house_owner") select 1];
if (_house isKindOf "Land_i_Garage_V1_F" || _house isKindOf "Land_i_Garage_V2_F") then
{
	_text4 ctrlSetStructuredText parseText "Eingebaute Garage: <t color='#8cff9b'>Verfügbar</t>";
} else {
	_text4 ctrlSetStructuredText parseText "Eingebaute Garage: <t color='#8cff9b'>Nicht Verfügbar</t>";
};
_text5 ctrlSetStructuredText parseText format["Verkaufpreis: <t color='#8cff9b'>%1</t>", [[(_houseCfg select 0)/2] call life_fnc_numberText]];

if(_house isKindOf "House_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_house getVariable["containers",[]]);
	_veh_data = [_mWeight,(_house getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_house] call life_fnc_vehicleWeight;
};

//if(_veh_data select 0 == -1) exitWith {closeDialog 0};
_text6 ctrlSetStructuredText parseText format["Lagerplatz: <t color='#8cff9b'>%1/%2</t>",_veh_data select 1,_veh_data select 0];

//Mietpreis
_text7 ctrlSetStructuredText parseText format["Mietpreis: <t color='#8cff9b'>%1</t>", [[(_houseCfg select 2)] call life_fnc_numberText]];

//Alarm ja oder nein

if (_curTarget getVariable["Secured",false]) then
{
	_text8 ctrlSetStructuredText parseText "Alarmanlage eingebaut: <t color='#8cff9b'>Ja</t>";
} else {
	_text8 ctrlSetStructuredText parseText "Alarmanlage eingebaut: <t color='#8cff9b'>Nein</t>";
};

//Küche ja oder nein
if (_curTarget getVariable["Kitchen",false]) then
{
	_text9 ctrlSetStructuredText parseText "Drogenküche eingebaut: <t color='#8cff9b'>Ja</t>";
} else {
	_text9 ctrlSetStructuredText parseText "Drogenküche eingebaut: <t color='#8cff9b'>Nein</t>";
};

if(!isNil {_curTarget getVariable "Rent"})  then {
			_Btn1 ctrlEnable false;
		};
if(_curTarget getVariable["HouseRob",false]) then {
		_Btn2 ctrlEnable true;
		};

if(_curTarget getVariable["Kitchen",false]) then {
		_Btn3 ctrlEnable true;
	};

if (isNil {_curTarget getVariable "Rent"}) then {
		_Btn4 ctrlEnable false;
		_Btn5 ctrlEnable false;
};

////////////////////////////////////////////////////////