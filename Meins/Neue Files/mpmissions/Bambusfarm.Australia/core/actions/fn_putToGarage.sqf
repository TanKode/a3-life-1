#include <macro.h>
/*
	Garage
*/
//CONST
private["_vehicle","_islocked","_time"];

if( CASH < 10000 && BANK < 10000) exitWith 
{	
	hint parseText "<t color='#ff0000'>Du hast nicht das nötige Geld ($10000)</t>";
};


//Action

_vehicle = cursorTarget;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "LandVehicle") || (_vehicle isKindOf "Ship"))) exitWith { hint "Ungültiges Fahrzeug."; };
if(player distance cursorTarget > 10) exitWith { };


//Check if vehicle is opened
_islocked = locked _vehicle;

if((alive _vehicle) && _islocked == 2) exitWith { hint parseText "<t color='#ff0000'>Du musst das Fahrzeug aufschließen, um es abschleppen zu lassen.</t>"; };



if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{	
	
	
	life_action_inUse = true;
	
	
	
	//wait time
	hint "Bleibe in der Nähe des Fahrzeugs,\nder Abschleppwagen braucht ca.\n 15 min!\n\nAlternatrive kannst du auch den ADAC rufen,\nder wird wahrscheinlich schneller vor Ort sein!";
	
	_time = time + (60 * 15);
	
	sleep 10;
	
	while{true} do
	{
		if((round(_time - time)) > 0) then {
			_countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;
		
		//if( _i % 5 == 0) then
		//{
			hintSilent parseText format[" <t size='1.5'><t color='#FF0000'>Noch ca. %1 Minuten<br/></t><br/><t size='1'>Bis der Abschleppwagen kommt....<br/><br/>Bleibe in der Nähe des Fahrzeugs!<t/>", _countDown];
		};
		
		if(player distance _vehicle > 10) exitWith 
		{
			hint parseText "<t color='#ff0000'>Fahrzeug wird abgeschleppt ... abgebrochen!</t>"; 
			life_action_inUse = false;
		};
		
		if(!alive player) exitWith 
		{
			life_action_inUse = false;
		};
		
		if((round(_time - time)) == 0) exitWith {hint ""};
		sleep 0.1;
	};
	
	//if(!life_action_inUse) exitWith { hint parseText "<t color='#ff0000'>Fahrzeug wird abgeschleppt ... abgebrochen!</t>"; }; //canceled
	
	//Last check
	if(player distance _vehicle > 10) exitWith {hint parseText "<t color='#ff0000'>Fahrzeug wird abgeschleppt ... abgebrochen!</t>"; life_action_inUse = false;};
	if(!alive player) exitWith {life_action_inUse = false;};
	
	hint "Der Abschleppwagen ist gleich da ...\n\nBleibe in der Nähe des Fahrzeugs";
	
	sleep 5;	
	
	//Money
	//Remove money
	if( CASH >= 10000 ) then
	{
			//Use main
			CASH = CASH - 10000;
	}
	else
	{
			//Use ATM
		if(BANK >= 10000) then
		{
			BANK = BANK - 10000;
		};
	};
	
	//Store vehicle
	//[[_vehicle,true,player],"STS_fnc_vehicleStore",false,false] spawn life_fnc_MP;
	life_impound_inuse = true;
	[[_vehicle,true,player],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
	//delete ropes on impound
	_ropes = (_vehicle getvariable ["zlt_ropes", []]);
	{deletevehicle _x} foreach _ropes;
	_vehicle setvariable ["zlt_ropes", [], true];
	waitUntil {!life_impound_inuse};
	
	hint parseText "<t color='#00ff00'>Der Wagen wurde angeschleppt und befindet sich nun wieder in der Garage.</t>";
};


life_action_inUse = false;