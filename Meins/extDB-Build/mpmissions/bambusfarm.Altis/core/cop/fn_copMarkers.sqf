/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_cops","_level"];
_markers = [];
_cops = [];
_coplevel = call life_coplevel;

switch ( _coplevel ) do
{
	case (1):{_level  = "Praktikant";};
	case 2: {_level = "Anwärter";};
	case 3: {_level = "Wachtmeister";};
	case 4: {_level = "Hauptmeister";};
	case 5: {_level = "Kommissar";};
	case 6: {_level = "Oberkommissar";};
	case 7: {_level = "Hauptkommissar";};
	case 8: {_level = "Kriminaltechniker";};
	case 9: {_level = "Kriminalpolizist";};
	case 10: {_level = "Mediator";};
	case 11: {_level = "Leitstelle";};
	case 12: {_level = "Zivilpolizei";};
	case 13: {_level = "Drogenfahnder";};
	case 14: {_level = "Einsatzleiter";};
	case 15: {_level = "Bundespolizist";};
	case 16: {_level = "Hauptkommissar";};
	case 17: {_level = "Bundespolizist";};
	case 18: {_level = "Dienstaufsicht";};
	case 19: {_level = "Ausbilder";};
	case 20: {_level = "Polizeidirektor";};
};

sleep 0.5;
if(visibleMap) then {
	{if(side _x == west) then {_cops pushBack _x;}} foreach playableUnits; //Fetch list of cops / blufor
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%2", _level,_x getVariable["realname",name _x]];

		_markers pushBack [_marker,_x];
	} foreach _cops;

	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_cops = [];
};