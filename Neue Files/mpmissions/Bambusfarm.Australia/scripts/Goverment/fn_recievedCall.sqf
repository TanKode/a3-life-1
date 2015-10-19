_mode = [_this, 0, -1] call BIS_fnc_param;
_info = [_this, 1, -1] call BIS_fnc_param;

switch (_mode) do {
	case 0:
	{
		sleep 5;
		hint "Herzlichen Glückwunsch! Sie sind der neue Praesident! Bitte Relogen um alle Funktionen nutzen zu koennen.";
		profileNamespace setVariable ["isGov",true];
		life_isGov = true;
	};
	case 1:
	{
		hint "Erfolgreich angemeldet als Praesident!";
		life_isGov = true;
	};
	case 2:
	{
		hint "Sie sind nicht laenger der Praesident!";
		life_isGov = false;
	};
	case 3:
	{
		if (count _info == 0) then {_info pushBack "Es wurden noch keine Gesetze vom Praesidenten verarbschiedet!";};
		life_laws = _info;
	};
	case 4:
	{
		life_govCash = _info;
	};
};