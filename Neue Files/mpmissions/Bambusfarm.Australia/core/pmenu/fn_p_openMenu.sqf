#include <macro.h>
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2011,false];
		ctrlShow[2040,false];
		ctrlShow[2025,false];
		ctrlShow[2013,false];
		ctrlShow[2026,false];
		ctrlShow[2027,false];
		ctrlShow[2029,false];
		ctrlShow[2030,false];
		ctrlShow[60001,false];
		ctrlShow[60002,false];
		ctrlShow[60004,false];
		ctrlShow[60005,false];
		ctrlShow[60008,false];
		ctrlShow[60009,false];
		ctrlShow[60011,false];

	};
	
	case civilian:
	{
		ctrlShow[2012,false];
		ctrlShow[2025,false];
		ctrlShow[2026,false];
		ctrlShow[2405,false];
		ctrlShow[9800,false];
		ctrlShow[9900,false];
		ctrlShow[2013,false];
		ctrlShow[2027,false];
		ctrlShow[60001,false];
		ctrlShow[60004,false];
		ctrlShow[60005,false];
		ctrlShow[60006,false];
		ctrlShow[60007,false];
		ctrlShow[60008,false];
		
		if((license_civ_craftWeapon) OR (license_civ_craftVehicle)) then {
                ctrlShow[2025,true];
				ctrlShow[60004,true];
        };
		if(license_civ_craftClothing) then {
			ctrlShow[2026,true];
			ctrlShow[60005,true];
		};
		if(license_civ_taxi) then {
			ctrlShow[2027,true];
			ctrlShow[60001,true];
		};
	};
	
	case independent:
	{
		ctrlShow[2012,false];
		ctrlShow[2011,false];
		ctrlShow[2040,false];
		ctrlShow[2025,false];
		ctrlShow[2405,false];
		ctrlShow[9800,false];
		ctrlShow[9900,false];
		ctrlShow[2013,false];
		ctrlShow[2026,false];
		ctrlShow[2027,false];
		ctrlShow[2029,false];
		ctrlShow[2030,false];
		ctrlShow[60001,false];
		ctrlShow[60002,false];
		ctrlShow[60004,false];
		ctrlShow[60005,false];
		ctrlShow[60006,false];
		ctrlShow[60007,false];
		ctrlShow[60008,false];
		ctrlShow[60009,false];
		ctrlShow[60011,false];
	};
	
	case east:
	{
		ctrlShow[2012,false];
		ctrlShow[2011,false];
		ctrlShow[2040,false];
		ctrlShow[2025,false];
		ctrlShow[2405,false];
		ctrlShow[9800,false];
		ctrlShow[9900,false];
		ctrlShow[2026,false];
		ctrlShow[2027,false];
		ctrlShow[2029,false];
		ctrlShow[2030,false];
		ctrlShow[60001,false];
		ctrlShow[60002,false];
		ctrlShow[60004,false];
		ctrlShow[60005,false];
		ctrlShow[60006,false];
		ctrlShow[60007,false];
		ctrlShow[60009,false];
		ctrlShow[60011,false];
	};
};

if(FETCH_CONST(life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
	ctrlShow[60003,false];
};

if(FETCH_CONST(life_coplevel) < 4) then
{
	ctrlShow[9800,false];
};

[] call life_fnc_p_updateMenu;