
disableSerialization;
createDialog "life_taxiMenu";
_display        = findDisplay 6600;
_taxiListbox    = _display displayCtrl 6601;

if (!life_isOnDutyTaxi) exitWith {hint "Sie sind nicht im Dienst oder haben bereits eine Anfrage akzeptiert!";closeDialog 0;};

[[player],"TON_fnc_goOnDuty",false,false] spawn life_fnc_mp;
sleep 1;
if (count TaxiCallsClient > 0) then
{
	{
		_taxiListbox lbAdd format ["%1 (%2 Meter)",name _x,(_x distance player)];
		_taxiListbox lbSetData [(lbSize _taxiListbox)-1,format ["%1",_x]];
	} forEach TaxiCallsClient;
};

hint "Erfolgreich aktuell geladene Taxi-Anfragen, waehlen Sie bitte eine Anfrage um fortzufahren.";