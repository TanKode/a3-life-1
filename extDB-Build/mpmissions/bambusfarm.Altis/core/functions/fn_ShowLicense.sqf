/*
Fuegt einen 'Personalausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/

private["_target", "_message","_rang","_coplevel"];

_target = cursorTarget;

if(playerSide == civilian)then
{
    if( isNull _target) then {_target = player;};

    if( !(_target isKindOf "Man") ) then {_target = player;};

    if( !(alive _target) ) then {_target = player;};

    _rang = "Ausweis gültig!";

    _message = format["<t size='1.5'>Personalausweis</t><br/>Name:<br/><t size='1.2'>%1</t><br/>Herkunft:<br/>Altis<br/><t size='1.2'>%2</t><br/>", name player, _rang];

    [[player, _message],"life_fnc_LicenseShown",_target,false] spawn life_fnc_MP;

};

if(playerSide == west)then
{
    if( isNull _target) then {_target = player;};

    if( !(_target isKindOf "Man") ) then {_target = player;};

    if( !(alive _target) ) then {_target = player;};

    _coplevel = call life_coplevel;

    switch ( _coplevel ) do
    {
    	case 1: {_rang = "Praktikant"; };
		case 2: {_rang = "Anwärter";};
		case 3: {_rang = "Wachtmeister";};
		case 4: {_rang = "Hauptmeister";};
		case 5: {_rang = "Kommissar";};
		case 6: {_rang = "Oberkommissar";};
		case 7: {_rang = "Hauptkommissar";};
		case 8: {_rang = "Kriminaltechniker";};
		case 9: {_rang = "Kriminalpolizist";};
		case 10: {_rang = "Mediator";};
		case 11: {_rang = "Leistelle";};					// Platzhalter
		case 12: {_rang = "Geheim";};					// Zivifahnder
		case 13: {_rang = "Drogenfahnder";};
		case 14: {_rang = "Einsatzleiter";};
		case 15: {_rang = "Bundespolizist";};
		case 16: {_rang = "Hauptkommissar";};	// SEK T1
		case 17: {_rang = "Bundespolizist";};	// SEK T2
		case 18: {_rang = "Dienstaufsicht";};
		case 19: {_rang = "Ausbilder";};
		case 20: {_rang = "Polizeidirektor";};
    	default {_rank =  "Error";};
    };

    _message = format["<t size='1.5'>Polizeimarke</t><br/>Name:<br/><t size='1.2'>%1</t><br/>Rang:<br/><t size='1.2'>%2</t><br/>", name player, _rang];

    [[player, _message],"life_fnc_LicenseShown",_target,false] spawn life_fnc_MP;
};