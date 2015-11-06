#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private "_container";
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = lineIntersectsWith [visiblePositionASL player, ATLtoASL screenToWorld[0.5,0.5]];
	
	switch(true) do {
		case (EQUAL(count _house,0)): {_exit = true;};
		case (EQUAL(count _house,1)): {_house = _house select 0;};
		default {
			{if(_x isKindOf "House_F") exitWith {_house = _x;};} foreach _house;
		};
	};
	if(!isNil "_exit" OR !(_house isKindOf "House_F")) exitWith {systemChat localize "STR_House_ContainerError"};
	[[_house],"TON_fnc_updateHouseContainers",false,false] call life_fnc_MP;
};

if(!(EQUAL(life_base,[]))) exitWith
{
	if((typeOf _container) in ["Box_NATO_AmmoVeh_F","B_supplyCrate_F","Box_IND_AmmoVeh_F"]) exitWith 
	{
		[[_container],"TON_fnc_updateBaseContainers",false,false] call life_fnc_MP;
	};
};
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];