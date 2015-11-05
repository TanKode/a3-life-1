private["_heli","_wreck"];

//Create gold vehicle wreck 
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkGreen",2,["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;

_wreck = "Land_Wreck_Traw_F" createVehicle (getPos _heli);
_wreck SetPosATL [(getPos _heli select 0)-300*sin(round(random 359)),(getPos _heli select 1)-300*cos(round(random 359)), 0];
_wreck enableSimulation false;

gold_safe attachTo [_wreck,[3,4,-0.4]];
gold_safe setVectorDirAndUp [[90,0,80],[-90,0,0]];
gold_safe enableSimulation false;
gold_safe allowDamage false;

if(life_cops_online < 3) then
{
	_minTime = (10*60);
	_maxTime = (20*80);
	_finalTime = (random (_maxTime - _minTime)) + _minTime;
	sleep _finalTime;
	_Pos = position _heli;
	 _marker = createMarker ["Marker200", _Pos];
	"Marker200" setMarkerColor "ColorOrange";
	"Marker200" setMarkerType "Empty";
	"Marker200" setMarkerShape "ELLIPSE";
	"Marker200" setMarkerSize [2500,2500];
	 _markerText = createMarker ["MarkerText200", _Pos];
	"MarkerText200" setMarkerColor "ColorBlack";
	"MarkerText200" setMarkerText "Schiffswrack";
	"MarkerText200" setMarkerType "mil_warning";
	[[4,"Ein Schiffswrack mit einer wertvollen Ladung ist vor den Küsten Altis gesunken! Der bereich ist von Schatzsuchern auf der Karte markiert worden!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};