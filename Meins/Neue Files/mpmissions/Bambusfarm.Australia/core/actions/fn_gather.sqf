#include <macro.h>
/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_resourceZones","_zone","_rndm","_sum","_exp","_level"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","banane_1","banane_2","banane_3","banane_4","birne_1","birne_2","birne_3","birne_4","cerises_1","cerises_2","cerises_3","cerises_4","grape_1","grape_2","meth_1","frogs_1","heroin_1","cocaine_1","weed_1","hops_1","rye_1","yeast_1","muell_1","muell_2","muell_3"];
_legal = ["apple","peach","banane","birne","cerises","hops","rye","yeast","zink","nickel","blei","messing"];
_zone = "";
_exp = "";
_level = "";

if(life_action_gathering) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Action is in use, exit to prevent spamming.
life_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
} foreach _resourceZones;

if(EQUAL(_zone,"")) exitWith {life_action_gathering = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = ["apple",3]; _exp = 30; _level = 0};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = ["peach",3]; _exp = 30; _level = 0};
	case (_zone in ["banane_1","banane_2","banane_3","banane_4"]): {_gather = ["banane",3]; _exp = 40; _level = 1};
	case (_zone in ["birne_1","birne_2","birne_3","birne_4"]): {_gather = ["birne",3]; _exp = 40; _level = 1};
	case (_zone in ["cerises_1","cerises_2","cerises_3","cerises_4"]): {_gather = ["cerises",3]; _exp = 40; _level = 1};
	//case (_zone in ["grape_1","grape_2"]): {_gather = ["grapes",3];};
	case (_zone in ["heroin_1"]): {_gather = ["heroin_unprocessed",1]; _exp = 150; _level = 7};
	case (_zone in ["cocaine_1"]): {_gather = ["cocaine_unprocessed",1]; _exp = 200; _level = 9};
	case (_zone in ["weed_1"]): {_gather = ["cannabis",1]; _exp = 100; _level = 6};
	case (_zone in ["meth_1"]): {_gather = ["meth_unprocessed",1]; _exp = 200; _level = 8};
	case (_zone in ["frogs_1"]): {_gather = ["frogs",1]; _exp = 150; _level = 7};
	case (_zone in ["hops_1"]): {_gather = ["hops",3]; _exp = 80; _level = 4};
	case (_zone in ["rye_1"]): {_gather = ["rye",3]; _exp = 80; _level = 4};
	case (_zone in ["yeast_1"]): {_gather = ["yeast",3]; _exp = 80; _level = 4};
	case (_zone in ["muell_1","muell_2","muell_3"]): {_gather = [(["zink","nickel","blei","messing"] call BIS_fnc_selectRandom),3]; _exp = 80; _level = 5};
	default {""};
};

//gather check??
if(vehicle player != player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];life_action_gathering = false;};

_itemName = M_CONFIG(getText,"VirtualItems",SEL(_gather,0),"displayName");
if(LEVEL < _level) exitWith {hintSilent format["Sie muessen Level %1 erreicht haben um %2 farmen zu koennen",_level,localize _itemName]};

_diff = [SEL(_gather,0),SEL(_gather,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_rndm = [1,2,3,4,5] call BIS_fnc_selectRandom; _sum = [SEL(_gather,0),_rndm,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull",_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];life_action_gathering = false;};

_delay = 3.5;
if(skill_civ_brawny && ((SEL(_gather,0)) in _legal)) then {_delay = 1.5};
if(_sum > 0) then
{
	life_action_gathering = true;

	for "_i" from 0 to 2 do {
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		sleep _delay;
	};

	if(([true,SEL(_gather,0),_sum] call life_fnc_handleInv)) then {
		cutText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_rndm],"PLAIN DOWN"];
	};
};
life_action_gathering = false;
_exp = round(random(_exp));
[true,_exp] spawn life_fnc_expConfig;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];

