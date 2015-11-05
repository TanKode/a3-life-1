#include "\life_server\script_macros.hpp"
/*
	File: fn_showAuftraege.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_index","_data","_type","_MyIndex","_display","_amessageList","_amessageShow","_map","_marker","_pos","_name","_mrkstring","_adacMarker","_status"];
_index = [_this,0,0] call BIS_fnc_param;
_type = [_this,1,0] call BIS_fnc_param;
_MyIndex = [_this,2,0] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 103450};

_amessageList = CONTROL(103450,103451);
_amessageShow = CONTROL(103450,103455);
_myMessageList = CONTROL(103450,103454);
_map = CONTROL(103450,103453);
_marker = [];

switch(_type) do
{
	case 0:
	{
		//message
		_data = call compile (_amessageList lnbData[_index,0]);
		_amessageShow ctrlSetText format["%1",(SEL(_data,2))];

		ctrlEnable[103452,true];
		selectAuftrag = _data;
		_pos = call compile format["%1",(SEL(_data,3))];
		_name = SEL(_data,1);

		{
			if(EQUAL((getPlayerUID _x),(SEL(_data,0)))) then
			{
				life_aufTarget = _x;
			};
		}forEach playableUnits;
		
		//map cords
		if(isNull _map OR count _pos == 0) exitWith {};
		_map ctrlMapAnimAdd [1,0.1,(SEL(_pos,0))];
		ctrlMapAnimCommit _map;

		//Marker setzten
		_mrkstring = format ["ADAC_%1",_name];
		_adacMarker = createMarkerLocal [_mrkstring, (SEL(_pos,0))];
		_adacMarker setMarkerColorLocal "ColorYellow";
		_adacMarker setMarkerTypeLocal "loc_Hospital";
		_adacMarker setMarkerTextLocal _name;
		_marker pushBack _adacMarker;
	};
	
	case 1:
	{
		ctrlEnable[103452,false];
		//message
		_myData = call compile (_myMessageList lnbData[_MyIndex,0]);
		_amessageShow ctrlSetText format["%1",(SEL(_myData,2))];

		_pos = call compile format["%1",(SEL(_myData,3))];
		_name = SEL(_data,1);
		
		_status = "[OFFLINE]";
		{
			if(EQUAL((getPlayerUID _x),(SEL(_myData,0)))) then
			{
				life_aufTarget = _x;
			};
		}forEach playableUnits;
		
		selectMyAuftrag = _myData;
		ctrlEnable[103456,true];
		ctrlEnable[103457,true];

		//map cords
		if(isNull _map OR count _position == 0) exitWith {};
		_map ctrlMapAnimAdd [1,0.1,(SEL(_pos,0))];
		ctrlMapAnimCommit _map;

		//Marker setzten
		_mrkstring = format ["ADAC_%1",_name];
		_adacMarker = createMarkerLocal [_mrkstring,(SEL(_pos,0))];
		_adacMarker setMarkerColorLocal "ColorYellow";
		_adacMarker setMarkerTypeLocal "loc_Hospital";
		_adacMarker setMarkerTextLocal _name;
		_marker pushBack _adacMarker;
	};
};
_marker;
[0,_marker] call life_fnc_aufMarker;