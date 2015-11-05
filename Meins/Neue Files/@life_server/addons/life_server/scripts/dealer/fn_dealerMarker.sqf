/*
	File: fn_dealerMarker.sqf
	Author: Tertius @ GBB (Dave Stellwagen)
	
	Description:
	Dealer Marker for RND Spawn!
     
*/
private["_Kavala_DealerMarker","_Galati_DealerMarker","_Therisa_DealerMarker","_zahl","_kavalaMarker","_GalatiMarker","_DoridaMarker","_mrkstring","_posMarker"];

_zahl = 0;

_Kavala_DealerMarker =	[							 
			[[3522.08,14117.2,18.2992],1050255],
			[[3500.48,14096.8,17.5539],1050259],
			[[3487.27,14100.6,18.2025],1050258],
			[[3542.98,14156.7,24.4783],1050121],
			[[3549.82,14172.1,25.1473],1050122],
			[[3547.26,14117.5,19.5785],1050123],
			[[3517.31,14068.7,13.2788],1050257],
			[[3502.51,14062.7,12.6613],1050256],
			[[3599.36,13981.7,10.0354],1109964],
			[[3617.59,13958.1,9.82858],1109965],
			[[3675.56,13991.9,16.0133],1110099],
			[[3619.85,14156.4,27.2226],1050250],
			[[3588.62,14101.9,19.8169],1050411],
			[[3598.71,14099.5,19.9058],1050412],
			[[3685.91,14109.4,25.8739],1050547]
			];

_Galati_DealerMarker =	[							 
			[[10235.8,19011.2,116.607],1347316],
			[[10284.2,18984.9,116.233],1347562],
			[[10245.9,19057.3,122.074],1347129],
			[[10255.8,19058.8,123.095],1347127],
			[[10254.9,19110.6,129.485],1346961],
			[[10307.7,19147.4,133.215],1346967],
			[[10310.7,19129.4,131.586],1347054],
			[[10326.2,19130.7,130.007],1347055],
			[[10298.8,19092.8,128.776],1347214],
			[[10309.4,19077.4,127.777],1347205],
			[[10332.1,19037.2,123.694],1347447],
			[[10334.8,19087.5,128.059],1347185],
			[[10385.8,19132.1,124.925],1347647],
			[[10387.9,19090.1,125.242],1347783],
			[[10421.7,19050.8,121.432],1347774]
			];

_Therisa_DealerMarker =	[							 
			[[10561.8,12225.4,14.9954],868661],
			[[10628.2,12183.5,15.7392],868701],
			[[10665.1,12175.1,17.0621],868874],
			[[10679.6,12217.5,17.3966],868753],
			[[10719.5,12194.9,18.5171],875371],
			[[10744.7,12200.4,18.0946],875373],
			[[10727.8,12251.9,17.6043],875164],
			[[10713.6,12291.3,16.4287],875023],
			[[10732.3,12310.1,16.1736],875036],
			[[10690.3,12324.2,15.8073],875038],
			[[10542.9,12325.4,14.9311],868116],
			[[10631.4,12273.2,15.7811],868348]
			];

for "_i"  from 0 to 0.5 do
{
	{
		_zahl = _zahl + 1;
		_mrkstring = format ["KavalaDealer_%1", _zahl];
		_posMarker = (_x select 0) nearestObject (_x select 1);
		_kavalaMarker = createMarker [_mrkstring, _posMarker];
		_kavalaMarker setMarkerColor "ColorRed";
		_kavalaMarker setMarkerText format["Kavala_%1",_zahl];
		_kavalaMarker setMarkerType "empty";
		
		//diag_log format ["KavalaDealer_%1",_zahl];
		//diag_log format ["Marker %1",_kavalaMarker];
		//diag_log format ["Pos %1", _posMarker];
	} forEach _Kavala_DealerMarker;
};

for "_i"  from 0 to 0.5 do
{
	{
		_zahl = _zahl + 1;
		_mrkstring = format ["GalatiDealer_%1", _zahl];
		_posMarker = (_x select 0) nearestObject (_x select 1);
		_GalatiMarker = createMarker [_mrkstring, _posMarker];
		_GalatiMarker setMarkerColor "ColorRed";
		_GalatiMarker setMarkerText format["Galati_%1",_zahl];
		_GalatiMarker setMarkerType "empty";
		
		//diag_log format ["GalatiDealer_%1",_zahl];
		//diag_log format ["Marker %1",_GalatiMarker];
		//diag_log format ["Pos %1", _posMarker];
	} forEach _Galati_DealerMarker;
};

for "_i"  from 0 to 0.5 do
{
	{
		_zahl = _zahl + 1;
		_mrkstring = format ["TherisaDealer_%1", _zahl];
		_posMarker = (_x select 0) nearestObject (_x select 1);
		_TherisaMarker = createMarker [_mrkstring, _posMarker];
		_TherisaMarker setMarkerColor "ColorRed";
		_TherisaMarker setMarkerText format["Therisa_%1",_zahl];
		_TherisaMarker setMarkerType "empty";
		
		//diag_log format ["GalatiDealer_%1",_zahl];
		//diag_log format ["Marker %1",_DoridaMarker];
		//diag_log format ["Pos %1", _posMarker];
	} forEach _Therisa_DealerMarker;
};