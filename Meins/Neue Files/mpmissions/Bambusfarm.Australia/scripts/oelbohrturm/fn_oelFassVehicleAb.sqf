#include <macro.h>
/*
	File: fn_oelfassVehicleAuf.sqf
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_vehicle","_unit","_uid","_nearVehicle","_fass"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_unit = player;
_uid = getPlayerUID player;

_nearVehicle = nearestObjects [_unit, ["C_Offroad_01_F"], 7];
_fass = nearestObjects [_unit, ["Land_MetalBarrel_F"], 3];

if((count _nearVehicle) > 0) then
{
	if((EQUAL(((_fass select 0) GVAR "myOelFass"),_uid)) &&(_unit distance (_nearVehicle select 0)) < 5 ) then
	{
		switch (true) do
		{
			case (EQUAL((typeOf cursorTarget),"C_Offroad_01_F")):
			{
				if((cursorTarget GVAR "oelSlot") <= 4) then
				{
					switch (true) do
					{
						case ((cursorTarget GVAR "oelSlot") == 1):
						{
							(_fass select 0) attachTo [_unit,[0.1,1.1,0.5]];
							cursorTarget SVAR ["oelSlot",0,true];
							player SVAR ["oelFasstransport",true,true];
						};
						
						case ((cursorTarget GVAR "oelSlot") == 2):
						{
							(_fass select 0) attachTo [_unit,[0.1,1.1,0.5]];
							cursorTarget SVAR ["oelSlot",1,true];
							player SVAR ["oelFasstransport",true,true];
						};
						
						case ((cursorTarget GVAR "oelSlot") == 3):
						{
							(_fass select 0) attachTo [_unit,[0.1,1.1,0.5]];
							cursorTarget SVAR ["oelSlot",2,true];
							player SVAR ["oelFasstransport",true,true];
						};
						
						case ((cursorTarget GVAR "oelSlot") == 4):
						{
							(_fass select 0) attachTo [_unit,[0.1,1.1,0.5]];
							cursorTarget SVAR ["oelSlot",3,true];
							player SVAR ["oelFasstransport",true,true];
						};
					};
				}else{
					hintSilent "Hier Fahrzeug ist voll beladen";
				};
			};
		};
	};
};