/*
	File: fn_newAuftrage.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_type","_playerData","_msg","_pos"];
_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;
_pos = [_this,3,[],[[]]] call BIS_fnc_param;

if(!(newAuftraege)) exitWith {hint "Sie haben erst einen Auftrag aufgegeben, Sie können erst nach ablauf der 15min wieder einen Auftrag aufgeben!"};

if(newAuftraege) then
{
	[_type,_playerData,_msg,_pos] call life_fnc_NewMsg;
	newAuftraege = false;
};

sleep (15 * 60);
newAuftraege = true;