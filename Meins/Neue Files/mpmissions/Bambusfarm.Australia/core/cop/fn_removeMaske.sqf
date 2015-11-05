/*
	File: fn_removeMaske.sqf
	Author: PierreAmyf
	
	Description:
	remove Maske
     
*/
private["_goggles","_headgear","_uniform","_ret","_gearPlayer"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_unit getVariable["restrained",FALSE])) exitWith {
	hint "Der andere Spieler muss gefesselt sein.";
	sleep 3;
	hint "Benutze die Shift+R, um den Spieler zu fesseln.";
}; //Error check?

_gogglesPlayer = goggles _unit;
_headgearPlayer = headgear _unit;
_uniformPlayer = uniform _unit;

_goggles = ["G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_tan","G_Bandanna_sport","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_shades"];
_headgear = ["H_Shemag_olive","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive_hs","H_ShemagOpen_khk","H_ShemagOpen_tan"];
_uniform = ["U_O_GhillieSuit"];

_ret = [];

if(_gogglesPlayer in _goggles) then
{
	_ret pushBack _gogglesPlayer;
	sleep 1;
	removeGoggles _unit;
};

if(_headgearPlayer in _headgear) then
{
	_ret pushBack _headgearPlayer;
	sleep 1;
	removeHeadgear _unit;
};

if(_uniformPlayer in _uniform) then
{
	_ret pushBack _uniformPlayer;
	sleep 1;
	removeUniform _unit;
};

if(isNil _ret) exitWith {};
hint "Dir wurde deine Maskierung %1 entfernt, falls genung platz vorhanden findest du Sie in deinen Rucksack wieder!";

_unit addItemToBackpack _ret;
