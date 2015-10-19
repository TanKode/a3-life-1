#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(EQUAL(count _this,1)) exitWith {false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
_unit = SEL(_this,0);
_container = SEL(_this,1);

if(playerSide in [civilian,independent,east]) then
{
	_isPack = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,typeOf _container,"isBackpack");
	if(EQUAL(_isPack,1)) exitWith {
		hint localize "STR_MISC_Backpack";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
		_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
	};

	if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
		_house = nearestBuilding (getPosATL player);
		if(!(_house in life_vehicles) && {(_house GVAR ["locked",false])}) exitWith {
			hint localize "STR_House_ContainerDeny";
			[] spawn {
				waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
			};
			_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
		};
	};

	private "_list";
	_list = ["LandVehicle","Ship","Air"];
	if(KINDOF_ARRAY(_container,_list)) exitWith {
		if(!(_container in life_vehicles) && {EQUAL((locked _container),2)}) exitWith {
			hint localize "STR_MISC_VehInventory";
			[] spawn {
				waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
			};
			_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
		};
	};

	//Allow alive players who've been knocked out to be looted, just not the dead ones
	if(_container isKindOf "Man" && !alive _container) exitWith {
		hint localize "STR_NOTF_NoLootingPerson";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			closeDialog 0;
			closeDialog 0;
		};
		_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
	};
};

[] call life_fnc_updateClothing;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];