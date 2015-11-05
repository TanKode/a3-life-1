/*
	File: fn_aufMarker.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_type","_marker","_deleteMarker"];
_type = [_this,0,0] call BIS_fnc_param;
_marker = [_this,1,0,["",[],0]] call BIS_fnc_param;

_deleteMarker = deleteAufMarker;

switch(_type) do
{
	case 0:
	{
		{
			deleteAufMarker pushBack _x;
		}forEach _marker;
	};
	
	case 1:
	{
		{deleteMarkerLocal _x} forEach _deleteMarker;
		deleteAufMarker = [];
		closeDialog 0;
	};
};