/*
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
_type = [_this,0,0,[0]] call BIS_fnc_param;
_civ = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_marker = "";
_rndmrk = getPlayerUID _civ;

switch(_type) do {
	
	case 0: {
		
		_mrkstring = format ["wrgMarker%1", _rndmrk];
		_Pos = position _civ;
		_marker = createMarkerLocal [_mrkstring, _Pos]; 
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTextLocal "!Achtung! Wird ausgeraubt !Achtung!";
		_marker setMarkerTypeLocal "mil_warning";
	};
	
	case 1: {
		_marker = format ["wrgMarker%1", _rndmrk];
		deleteMarker _marker;
	};
};