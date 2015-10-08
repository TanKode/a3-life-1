/*
	File: fn_huntingZone.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for the hunting zone.
*/
private["_bool","_total","_animals"];
_bool = [_this,0,false,[false]] call BIS_fnc_param;
if(!_bool && count bambusfarm_animals_array == 0) exitWith {};

_animals = ["Goat_random_F","Hen_random_F","Sheep_random_F"]; //Array of animals to spawn
_total = 20; //Total amount to be spawned.

if(_bool) then
{
	for "_i" from 0 to (_total)-1 do
	{
		_pos = ["hunting_area"] call SHK_pos;
		_type = _animals call BIS_fnc_selectRandom;
		_animal = _type createUnit [(position player),(createGroup civilian)];
		//_animal = createAgent[_type,_pos, [], 0, "FORM"];
		hint format["%1\n%2",_type,_animal];
		bambusfarm_animals_array pushBack _animal;
	};
	bambusfarm_animals_spawned = true;
	systemChat str(bambusfarm_animals_array);
}
	else
{
	{
		if(!isNull _x) then
		{
			deleteVehicle _x;
		};
	} foreach bambusfarm_animals_array;
	
	bambusfarm_animals_array = [];
	bambusfarm_animals_spawned = false;
};