private["_unit","_dText","_weed","_cocaine","_heroin"];

_unit = cursorTarget;
if(isNull _unit) exitWith {};

hint "Teste nach Drogen...";

if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Test fehlgeschlagen."};

if(_unit getVariable["drug_weed",false]) then { _weed = "Positiv"; } else { _weed = "Negativ"; };
if(_unit getVariable["drug_cocaine",false]) then { _cocaine = "Positiv"; } else { _cocaine = "Negativ"; };
if(_unit getVariable["drug_heroin",false]) then { _heroin = "Positiv"; } else { _heroin = "Negativ"; };

hint parseText format["<t color='#FF0000'><t size='1'>%1</t></t><br/><t color='#FFD700'>Marihuana: </t>%2<br/><t color='#FFD700'>Kokain: </t>%3<br/><t color='#FFD700'>Heroin: </t>%4<br/>"
,name _unit,_weed,_cocaine,_heroin];