private["_nearestVehicle","_AufsHaus","_extra","_kosten","_gesamt"];

_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
if(isNil "_nearestVehicle") exitWith {hint "Es ist kein Auto in der Nähe"};

_AufsHaus = random(100);

if(_AufsHaus < 10) then {
_nearestVehicle setDamage 0;
hint "Das Reparieren bezahlt die Stadt";
};

if(_AufsHaus < 20) then {
_nearestVehicle setDamage 0;
hint "Dieses mal ist das Reparieren gratis!";
};

if(_AufsHaus > 20) then {
	[bambusfarm_BANK] call bambusfarm_fnc_numberText;
	_extra = random(1250);
	_kosten = 1250 + _extra;
	if(_kosten > bambusfarm_BANK) exitWith {hint "Du hast nicht genug Geld auf deinen Konto!"};
	_gesamt = bambusfarm_BANK - _kosten;
	hint format["Das hat dich %1 € gekostet!",_kosten call bambusfarm_fnc_numberText];
	_nearestVehicle setDamage 0;
};