/*

*/
private["_markers","_helis"];
_markers = [];
_helis = [];

sleep 0.5;
if(visibleMap) then {
	_helis = [Helitaxi1, Helitaxi2, Helitaxi3, Helitaxi4];

	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
	
		_markers set[count _markers,[_marker,_x]];
		//_markers pushBack [_marker,_x];
	} foreach _helis;
		
	while {visibleMap} do
	{
		{
			private["_marker","_heliunit"];
			_marker = _x select 0;
			_heliunit = _x select 1;
			if(!isNil "_heliunit") then
			{
				if(!isNull _heliunit) then
				{
					_marker setMarkerPosLocal (visiblePosition _heliunit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_helis = [];
};