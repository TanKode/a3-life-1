#include <macro.h>
/*
	File: fn_oelfassVehicleAuf.sqf
	Author:PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/

private["_generator","_nearObjekt"];
_generator = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_nearObjekt = nearestObjects[getPos (_this select 0),["C_Van_01_fuel_F","O_Truck_03_fuel_F","O_Truck_02_fuel_F","B_Truck_01_fuel_F","Land_MetalBarrel_F","Land_Pod_Heli_Transport_04_fuel_F"],50];
		
if(count _nearObjekt > 0) then
{
	life_oel_pumpe = true;
	[_generator,"life_fnc_soundOelPumpe",true,false] spawn life_fnc_MP; //Broadcast the 'mining' sound of the device for nearby units.
	hint "Die Oelpumpe ist nun in betrieb!";

	while {true} do
	{
		if(player distance _generator > 25) then
		{
			life_oel_pumpe = false;
		};
		if(!life_oel_pumpe) exitWith {hint ""};
	};	
}else{
	hint "Es befindet sich kein Tanklaster oder Oelfaesser in der naehe!";
};