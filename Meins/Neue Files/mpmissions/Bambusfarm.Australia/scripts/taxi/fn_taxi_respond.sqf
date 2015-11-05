_mode = [_this, 0, -1] call BIS_fnc_param;
_info = [_this, 1, -1] call BIS_fnc_param;
pricePerM = 2;

switch (_mode) do
{
	case 1:
	{
		TaxiCallsClient = _info;
		systemChat "Ihre aktiven Auftraege wurden aktualisiert!";
	};
	case 2:
	{
		hint format ["Taxifahrer %1 hat ihre Anfrage akzeptiert, Das Taxi ist noch %2 Meter von ihrer aktuellen Position entfernt!",name _info,floor (player distance _info)];
		life_taxiDriver = _info;
		life_calledTaxi = true;
		taxi_eventHandlerID1 = player addEventHandler ["GetIn", {
			sleep 0.1;
			if (life_taxiDriver == (driver vehicle player)) then {life_inTaxi = true;};
		}];
		taxi_ActionToLeave = player addAction ["Stopp Taxiservice", {
			hint format ["Sie haben den Taxiservice beendet, Sie haben $%1 fuer die Fahrt bezahlt!",life_taxiTotalPrice];
			life_calledTaxi = false;
			life_inTaxi = false;
			if (life_atmbank<life_taxiTotalPrice) then {life_atmbank = 0;} else { life_atmbank = life_atmbank - life_taxiTotalPrice;};
			[[life_taxiTotalPrice,pricePerM],"life_fnc_finishRide",life_taxiDriver,false] spawn life_fnc_mp;
			player removeAction taxi_ActionToLeave;
		}];
		_oldTaxiPos = getPos player;
		life_taxiTotalPrice = 0;
		_updateCount = 0;
		sleep 5;
		while {life_calledTaxi && !(player getVariable "restrained")} do {
			uiSleep 0.1;
			_updateCount = _updateCount + 1;
			hintSilent parseText format ["TAXI-METER<br/><br/><t align='left'>Gefahrene Meter</t><t align='right'>%1</t><br/><t align='left'>Preis</t><t align='right'>%2</t>",floor (life_taxiTotalPrice/pricePerM),life_taxiTotalPrice];
			if ((_oldTaxiPos distance player >= 1)&&(life_taxiDriver == (driver vehicle player))) then { life_taxiTotalPrice = life_taxiTotalPrice + pricePerM; _oldTaxiPos = getPos player; };
			if (_updateCount>=200) then {
				[[5,life_taxiTotalPrice],"life_fnc_respond",life_taxiDriver,false] spawn life_fnc_mp;
			};
		};
		if (life_inTaxi) then {
			hint format ["Sie haben den Taxiservice beendet, Sie haben $%1 fuer die Fahrt bezahlt!",life_taxiTotalPrice];
			life_calledTaxi = false;
			life_inTaxi = false;
			if (life_atmbank<life_taxiTotalPrice) then {life_atmbank = 0;} else { life_atmbank = life_atmbank - life_taxiTotalPrice;};
			[[life_taxiTotalPrice,pricePerM],"life_fnc_finishRide",life_taxiDriver,false] spawn life_fnc_mp;
			player removeAction taxi_ActionToLeave;
		};
	};
	case 3:
	{
		hint "Ihre Anfrage wurde noch 30 sec nicht bearbeitet, Ihr Anruf wurde von der aktiven Anrufliste gelöscht. Sie koennen eine neue Anfrage aufgeben!";
		life_calledTaxi = false;
    };
    case 4:
    {
    	hint "Es sind momentan keine Taxifahrer im Dienst!";
    	life_calledTaxi = false;
	};
	case 5:
	{
		life_taxiTotalPriceBACKUP = _info;
	};
	case 6:
	{
			life_calledTaxi = false;
			sleep 0.2;
			hint format ["Der Taxifahrer hat die Taxifahrt beendet, Sie haben $%1 bezahlt!",life_taxiTotalPrice];
			life_inTaxi = false;
			if (life_atmbank<life_taxiTotalPrice) then {life_atmbank = 0;} else { life_atmbank = life_atmbank - life_taxiTotalPrice;};
			[[life_taxiTotalPrice,pricePerM],"life_fnc_finishRide",life_taxiDriver,false] spawn life_fnc_mp;
			player removeAction taxi_ActionToLeave;
	};
};