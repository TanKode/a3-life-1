#include <macro.h>
/*
----------------------------------------------|
Author: Backer
Description: Set the drug level to 0 !
----------------------------------------------|
*/

private["_medic","_player"];
_medic = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _medic) exitWith {};
if(!alive player) exitWith {};
if(!alive _medic) exitWith {};
_price = 10000;

if (life_drug > 0) then
{
	SUB(BANK,_price);
	life_drug = 0;
	hint "Sie wurden erfolgreich vom Arzt behandelt, die Therapie war erfolgreich! Ihnen wurden $10000 fuer die Therapie berechnet!";
}else{
	hint "Sie sollten den Notarzt nicht anlügen, dass Sie abhängig sind, ansonsten wird er Ihnen beim nächsten mal nicht mehr helfen!";
}; 