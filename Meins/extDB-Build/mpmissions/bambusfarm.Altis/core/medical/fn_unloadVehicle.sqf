/*
	Author: Anton

	Description:
	Performancefreundliche IgiLoad-Alternative
*/
private["_Base","_BaseType","_CargoType","_Compatible","_AnimationType"];

if(call (life_mediclevel) <= 0) exitWith {};
if(side player != INDEPENDENT) exitWith {};

{
	if(typeOf(_x) != "Land_Pillar_Pier_F") then {_x attachTo [cursorTarget,[-0.109796,-10,1]];sleep 1;detach _x;_x setPos [getPos _x select 0, getPos _x select 1, 0];hint "Das Fahrzeug wurde erfolgreich abgeladen"}
}
foreach attachedObjects cursorTarget;