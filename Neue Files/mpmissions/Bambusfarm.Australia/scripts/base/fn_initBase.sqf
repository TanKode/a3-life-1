/*
	Author: Bryan "Tonic" Boardwine
	Edit Matthias Bun
	Description:
	Initializes the players houses, mainly throwing down markers.
*/
if(count life_base == 0) exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",_x select 0];
	_house = _position nearestObject "house";
	_houseData = _house getVariable "uid";
	if(isNil "_houseData")then
	{
		_house setVariable["uid",round(random 99999),true];
	};
	
	_marker = createMarker [format["base_%1",(_house getVariable "uid")],_position];
	_marker setMarkerColor "ColorRed";
	_marker setMarkerType "Empty";
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [100,100];
	
	_gangName = formatText["Gang-Base von: %1",(life_gangData select 2)];
	_markerText = createMarker [format["baseText_%1",(_house getVariable "uid")],_position];
	_markerText setMarkerShape "ICON";
	_markerText setMarkerText str(_gangName);
	_markerText setMarkerColor "ColorBlack";
	_markerText setMarkerType "mil_Warning";
	
} foreach life_base;
