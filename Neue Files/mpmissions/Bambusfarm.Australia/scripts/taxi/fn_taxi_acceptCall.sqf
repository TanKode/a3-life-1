disableSerialization;
_display        = findDisplay 6600;
_taxiListbox    = _display displayCtrl 6601;
if !(lbCurSel _taxiListbox >=0) exitWith {hint "Error";};
_player         = _taxiListbox lbData (lbCurSel _taxiListbox);
_player = call compile _player;

hint format ["Sie haben die Taxianfragen von %1 akzeptiert. Ihr Fahrgast ist %2 Meter von ihnen entfernt. Seine Position wurde auf der Karte makiert!",name _player,player distance _player];

life_taxiCustomer = _player;

[[player,_player],"TON_fnc_acceptedTaxiCall",false,false] spawn life_fnc_mp;
[[2,player],"life_fnc_taxi_respond",_player,false] spawn life_fnc_mp;

_markerText = createMarkerLocal ["Taxilocation", getPos _player];
"Taxilocation" setMarkerColorLocal "ColorRed";
"Taxilocation" setMarkerTextLocal format ["Letzte Position von %1",name _player];
"Taxilocation" setMarkerTypeLocal "mil_warning";

life_isOnDutyTaxi = false;
closeDialog 0;

taxi_ActionToLeave = player addAction ["Stopp Taxiservice", {
	if (alive life_taxiCustomer) then {
		[[6],"life_fnc_taxi_respond",life_taxiCustomer,false] spawn life_fnc_mp;
		player removeAction taxi_ActionToLeave;
	} else {
		player removeAction taxi_ActionToLeave;
		_message = parseText format ["Sie haben die fahrt gestoppt, da ihr Fahrgast gestorben ist oder die Verbindugn verloren hat! Sie bekommen den zuletzt auf ihrem Taxometer berechnetete Fahrtpreis von ($&1) gutgeschrieben.",life_taxiTotalPriceBACKUP];
		titleText[format["%1",_message],"PLAIN"];
		life_cash = life_cash + life_taxiTotalPriceBACKUP;
		life_isOnDutyTaxi = true;
		[[player],"TON_fnc_goOnDuty",false,false] spawn life_fnc_mp;
	};
}];

life_taxiTotalPriceBACKUP = 0;

while {player distance _player > 10} do { "Taxilocation" setMarkerPosLocal getPos _player; };

deleteMarkerLocal "Taxilocation";