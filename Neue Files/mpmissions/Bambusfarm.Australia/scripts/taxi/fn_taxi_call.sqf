// Exceptions

if (life_calledTaxi) exitWith { hint "Sie haben ein Taxi angefordert!"; };
if (life_isOnDutyTaxi) exitWith { hint "Sie koennen kein Taxi anfordern da Sie schon im Dienst sind!"; };

// Main

life_calledTaxi = true;
[[player],"TON_fnc_callTaxiDrivers",false,false] spawn life_fnc_mp;
hint "Sie haben ein Taxi angefordert. Bitte warten Sie bis ein verfuegbarer Taxifahrer ihre Anfrage akzpetiert. Ihre Anfrage wird automatsich nach 60 sec gelöscht!";