#include "\life_server\script_macros.hpp"
/*
	File: fn_craftVehicleSpawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
closeDialog 0;
_mode = _this select 0;
_className = cVehicleClass;
_colorIndex = lbValue[45904,(lbCurSel 45904)];
_bool = true;
_item = craftItem;
if(life_action_inUse) exitWith {};

if(_className isKindOf "Car") then {
	_spawnPoints = ["craft_kavala","craft_athira","craft_pyrgos","craft_sofia"];	
};

if(_className isKindOf "Air") then {
	_spawnPoints = ["craft_altis_airport","craft_rebel_airport","craft_molo_airport","craft_mojo_airport"];
};

_spawnPoint = "";
_marker = "";

{
	if(player distance (getMarkerPos _x) < 20) exitWith {_marker = _x;};
}forEach _spawnPoints;

if(_marker == "") exitWith {
	hint localize "STR_ISTR_Craft_Marker";
	life_action_inUse = false;
};

//Check if there is multiple spawn points and find a suitable spawnpoint.
if(typeName _spawnPoints == typeName []) then {
	//Find an available spawn point.
	{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
} else {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
};

if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};

_itemName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
life_action_inUse = true;

if("ToolKit" in (items player)) then
{
	//Setup the progress bar
	disableSerialization;
	_title = format["Baue %1",_itemName];
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNamespace getVariable "life_progress";
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_titleText ctrlSetText format["%2 (1%1)...","%",_title];
	_progressBar progressSetPosition 0.01;
	_cP = 0.01;

	while {true} do
	{
		[] spawn {
						_bool = false;
						player playMoveNow "AinvPknlMstpSnonWnonDnon_medic0";
						sleep 7;
						_bool = true;
				};
		sleep 0.26;
		if(isNull _ui) then {
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNamespace getVariable "life_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		_cP = _cP + 0.01;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(_cP >= 1 OR !alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(life_istazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Tazed
		if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if((player getVariable["restrained",false])) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};

	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
	if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([false,_item,1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
	life_action_inUse = false;


	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle],"TON_fnc_disableRobes",false,false] spawn life_fnc_MP;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	_vehicle setVariable["Trunk",[[],0],true];
	_vehicle setVariable["gpsTrackerActivate",false,true];
	_vehicle setVariable["fuelkill_no_warning",true,true];
	_vehicle setVariable["fuelkill_warning",false,true];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.


	//Side Specific actions.
	switch(playerSide) do {
		case west: {
			[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
		};

		case civilian: {
			if(_className == "B_Heli_Light_01_F") then {
				[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
			};
		};

		case independent: {
			[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
		};

		case east: {
			[_vehicle,"adac_offroad",true] spawn life_fnc_vehicleAnimate;
		};
	};

	_vehicle allowDamage true;

	//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
	life_vehicles pushBack _vehicle;
	[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;

	//diag_log format["Fahrzeudaten: SpielerUID: %1, playerSide: %2, Fahrzeug: %3, Farbe: %4",(getPlayerUID player),playerSide,_vehicle,_colorIndex];

	if(_mode) then {
		if(!(_className in ["C_Kart_01_Vrana_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Blu_F"])) then {
			[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
		};
	};

	hint format[localize "STR_Shop_Veh_BoughtCraft",_itemName];
	[0] call SOCK_fnc_updatePartial; //Sync silently because it's obviously silently..
	player removeItem "ToolKit";
	closeDialog 0; //Exit the menu.
	true;
}else{
	hint localize "STR_Item_ToolKit";
	life_action_inUse = false;
};