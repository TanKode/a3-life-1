#include <macro.h>
/*
	File: fn_vehicleShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	[30879,10252.9,0]
	Description:
	Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy"];
_shop = [(_this select 3),0,"",[""]] call BIS_fnc_param;
_sideCheck = [(_this select 3),1,sideUnknown,[civilian]] call BIS_fnc_param;
_spawnPoints = [(_this select 3),2,"",["",[]]] call BIS_fnc_param;
_shopFlag = [(_this select 3),3,"",[""]] call BIS_fnc_param;
_disableBuy = [(_this select 3),4,false,[true]] call BIS_fnc_param;
_shopType = [(_this select 3),5,"",[""]] call BIS_fnc_param;
_vehicleBoxPos = [];
_camPos = [];


disableSerialization;
//Long boring series of checks
if(dialog) exitWith {};
if(_shop == "") exitWith {};
if(_sideCheck != sideUnknown && {playerSide != _sideCheck}) exitWith {hint localize "STR_Shop_Veh_NotAllowed"};
if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};

if(EQUAL(_shopType,"Car")) then {_vehicleBoxPos = [30789.6,11514.1,0]};
if(EQUAL(_shopType,"Air")) then {_vehicleBoxPos = [6895.98,18165,0]};
if(EQUAL(_shopType,"Ship")) then {_vehicleBoxPos = [30879,10252.9,0]};


vehicleBoxBackgroundLogic = "LOGIC" createVehicleLocal _vehicleBoxPos;
vehicleBoxBackgroundLogic setPosATL _vehicleBoxPos;
_light = "#lightpoint" createVehicleLocal _vehicleBoxPos;   
_light setLightBrightness 1;  
_light setLightAmbient [1.0, 1.0, 1.0];
_light lightAttachObject [vehicleBoxBackgroundLogic, [0,0,10]];

_allVeh = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";
{_x hideObject true;}forEach playableUnits;
{_x hideObject true;}forEach _allVeh;

if(EQUAL(_shopType,"Car")) then {_camPos = [SEL(_vehicleBoxPos,0) - 10,SEL(_vehicleBoxPos,1) + 10,SEL(_vehicleBoxPos,2) + 10]};
if(EQUAL(_shopType,"Air")) then {_camPos = [SEL(_vehicleBoxPos,0) - 20,SEL(_vehicleBoxPos,1) + 20,SEL(_vehicleBoxPos,2) + 20]};
if(EQUAL(_shopType,"Ship")) then {_camPos = [SEL(_vehicleBoxPos,0) - 15,SEL(_vehicleBoxPos,1) + 15,SEL(_vehicleBoxPos,2) + 15]};

//initialize camera view
vehicleBoxCamera = "camera" camCreate _camPos;
showCinemaBorder false;
vehicleBoxCamera cameraEffect ["internal", "back"];
vehicleBoxCamera camSetTarget _vehicleBoxPos;
vehicleBoxCamera camSetPos _camPos;
vehicleBoxCamera camSetFov 0.7;
vehicleBoxCamera camSetFocus [50, 0];
vehicleBoxCamera camCommit 0;

if(_shop in ["cop_car","cop_air"]) then
{
	_objs = nearestObjects [player, ["Land_PoliceStation","Land_HeliPad"], 25];
	_spawnPoints = SEL(_objs,0);
};

life_veh_shop = [_shop,_spawnPoints,_shopFlag,_disableBuy,_vehicleBoxPos]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,((_this select 3) select 4)];

if(_disableBuy) then {
	//Disable the buy button.
	ctrlEnable [2309,false];
};

//Fetch the shop config.
_vehicleList = M_CONFIG(getArray,"CarShops",_shop,"vehicles");
hallo123 = _vehicleList;
_control = CONTROL(2300,2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

//Loop through
{
	_className = SEL(_x,0);
	_basePrice = SEL(_x,1);
	_levelData = SEL(_x,3);
	_passOver = false;
	
	if(_sideCheck != sideUnknown && {civilian != _sideCheck}) then
	{
		if(!isNil "_levelData" && {_var = GVAR_MNS (SEL(_levelData,0)); !(FETCH_CONST(_var) >= (SEL(_levelData,1)))}) then {_passOver = true;};
	}else{
		if(isNil "_levelData") then {
			
		}else{ 
			if(EQUAL(_className,"O_Truck_03_medical_F")) then
			{
				if(!((LEVEL >= (SEL(_levelData,1))) && skill_civ_truck)) then {_passOver = true;};
			}else{
				if(!(LEVEL >= (SEL(_levelData,1)))) then {_passOver = true;};
			};
		};
	};
	
	if(!_passOver) then {
		_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
		_control lbAdd (_vehicleInfo select 3);
		_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
		_control lbSetData [(lbSize _control)-1,_className];
		_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
	};
} foreach _vehicleList;

waitUntil {isNull (findDisplay 2300)};
{_x hideObject false;}forEach playableUnits;
{_x hideObject false;}forEach _allVeh;
{deleteVehicle _x;} foreach [vehicleBoxBackgroundLogic,_light,vehicleBoxVehicle];
vehicleBoxVehicle = objNull;
vehicleBoxCamera cameraEffect ["TERMINATE","BACK"];
camDestroy vehicleBoxCamera;