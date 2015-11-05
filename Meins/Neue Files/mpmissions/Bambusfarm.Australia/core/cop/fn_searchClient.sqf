#include <macro.h>
/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
*/
private["_cop","_inv","_val","_var","_robber"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_inv = [];
_weapons = [];
_robber = false;

//Illegal items
{
	_var = configName(_x);
	_val = ITEM_VALUE(_var);
	if(_val > 0) then {
		_inv pushBack [_var,_val];
		[false,_var,_val] call life_fnc_handleInv;
	};
} foreach ("getNumber(_x >> 'illegal') isEqualTo 1" configClasses (missionConfigFile >> "VirtualItems"));

//Illegal weapons block
_illegalWeapons = LIFE_SETTINGS(getArray,"illegalweapons");
{
	if(_x in _illegalWeapons) then
	{
		_weapons pushBack _x;
	};
}
foreach weapons player;
	
{
	systemChat format["Waffe entfernt: %1", _x];
	player removeWeapon _x; 
}
foreach _weapons;
//End illegal weapons block

if(!life_use_atm) then  {
	CASH = 0;
	_robber = true;
};

[[player,_inv,_robber,_weapons],"life_fnc_copSearch",_cop,false] call life_fnc_MP;