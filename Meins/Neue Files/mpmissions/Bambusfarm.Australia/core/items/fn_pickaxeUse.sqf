#include <macro.h>
/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName"];
_mine = [];
_resourceZones = ["gold_1","gold_2","gold_3","uran_1","sand_1","baum_1","baum_2","baum_3","gluew_1","gluew_2","gluew_3"];
_noPickaxe = false;
_exp = [];
_level = [];

{
	if(player distance (getMarkerPos _x) < 80) then {
		hint "Sie koennen Gold mit dem Goldsieb, Uran mit den Handschuhen, Sand mit der Schaufel, Faulbaum mit der Motorsaege und Gluewuermchen mit dem Kaescher farmen!";
		;_ui = "osefStatusBar" call BIS_fnc_rscLayer;
		_ui cutRsc["osefStatusBar","PLAIN"];
		_noPickaxe = true;
	};
} foreach _resourceZones;

if(_noPickaxe) exitWith {};
if(life_action_gather) exitWith {};

switch (true) do {
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = ["copper_unrefined",2]; _exp = 60; _level = 2};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = ["iron_unrefined",2]; _exp = 60; _level = 2};
    case (player distance (getMarkerPos "schwefel_1") < 30): {_mine = ["schwefel",2]; _exp = 1000; _level = 6};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = ["salt_unrefined",4]; _exp = 120; _level = 5};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = ["diamond_uncut",1]; _exp = 180; _level = 5};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = ["oil_unprocessed",1]; _exp = 90; _level = 3};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = ["oil_unprocessed",1]; _exp = 90; _level = 3};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = ["rock",3]; _exp = 60; _level = 2};
	case (player distance (getMarkerPos "silber_1") < 50): {_mine = ["silber_unprocessed",1]; _exp = 90; _level = 4};
	default {["", 0]};
};
//Mine check
if(EQUAL(_level,[])) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(EQUAL(SEL(_mine, 0),"")) exitWith {hint localize "STR_ISTR_Pick_NotNear";_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

_itemName = M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName");
if(LEVEL < _level) exitWith {hintSilent format["Sie muessen Level %1 erreicht haben um %2 farmen zu koennen",_level,localize _itemName]};

_diff = [SEL(_mine,0),SEL(_mine,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_rndm = [1,2,3,4,5] call BIS_fnc_selectRandom; _sum = [SEL(_mine,0),_rndm,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull";_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

_delay = 3.5;
if(skill_civ_brawny) then {_delay = 1.5};
if(_sum > 0) then
{
	life_action_gather = true;
	for "_i" from 0 to 2 do {
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		sleep _delay;
	};

	if(([true,SEL(_mine,0),_sum] call life_fnc_handleInv)) then {
		cutText[format[localize "STR_ISTR_Pick_Success",(localize _itemName),_rndm],"PLAIN DOWN"];
	};
	};
life_action_gather = false;
_exp = round(random(_exp));
[true,_exp] spawn life_fnc_expConfig;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];