/*
Author: Aideen
File: lizenz_vorhanden.sqf
Description: Hab ich die Lizenz bereits bzw. hab ich das Geld dazu? Wenn ja, los gehts!
*/
position_player = getPos player;
_uid = getPlayerUid player;
if (playerSide != civilian) exitWith {hint "Nur Zivilisten brauchen einen Fuehrerschein"; closeDialog 0; };
if(life_cash < 500) exitWith { hint "Du benoetigst 500$ um an der Pruefung teilzunehmen";};
if (license_civ_driver) exitWith {hint "Du besitzt bereits den Fuehrerschein";};
if (car_use) exitWith {hint "Gerade absolviert jemand den Fuehrerschein Bitte Gedulde dich ein paar Minuten!";};
car_use = true;
["life_fnc_Fahrschule",false,false] spawn life_fnc_MP;
player setPos (getMarkerPos "Pruefung_Auto");
closeDialog 0;
life_cash = life_cash - 500;
hint "Fahrschule: Mach dich bereit! Du wirst gleich ins Fahrzeug gesetzt und darfst die Pruefung beginnen";
sleep 5;
execVM "scripts\Fahrschule\Pruefung\Auto_Pruefung.sqf";