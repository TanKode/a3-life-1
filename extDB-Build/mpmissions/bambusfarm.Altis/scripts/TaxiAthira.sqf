/*
Description : Taxi Script to Athira
Author : Mahony
*/
_price = 100000;
_taxigerufen  = "<t color='#FFFF00' size='2' shadow='1' shadowColor='#000000' align='center'>Ein Taxi wurde gerufen !</t>";
_taxiangekommen  = "<t color='#FFFF00' size='2' shadow='1' shadowColor='#000000' align='center'>Ihr Taxi sollte nun vorort sein (Sie müssen auch einsteigen) </t>";
if ((bambusfarm_BANK) < _price + 25000) exitWith {
hint "Du hast nicht genug geld !";
closeDialog 0;
};
if ((bambusfarm_TASCHENGELD) == _price) exitWith {
hint "Wir nehmen nur Karte !";
closeDialog 0;
};
if (player distance (getMarkerPos "civ_spawn_3") <= 1000) exitWith {
hint "Du bist schon in Athira !";
closeDialog 0;
};
if(player getVariable ["restrained",false]) exitWith {
hint "Du bist gefesselt!";
closeDialog 0;
};
closeDialog 0;
sleep 2;
hint parseText (_taxigerufen);
sleep 30;
_taxiA = "C_Hatchback_01_yellow_F" createVehicle position player;
_taxiA allowDamage false;
hint parseText (_taxiangekommen);
sleep 5;
waitUntil {vehicle player != player};
sleep 1;
player allowDamage false;
titleText ["Ihr seit auf dem Weg nach Athira !", "BLACK FADED", 20];
playSound "wiggle";
deleteVehicle _taxiA;
sleep 28;
titleText ["Ihr seit angekommen nun noch bezahlen und dann können sie gehen", "BLACK FADED", 1];
bambusfarm_BANK = bambusfarm_BANK - _price;
sleep 1;
player setPos (getMarkerPos "civ_spawn_3");
sleep 1;
player allowDamage true;