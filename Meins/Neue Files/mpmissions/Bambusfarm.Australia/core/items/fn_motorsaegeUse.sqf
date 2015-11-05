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
_exp = [];
_level = [];

if(life_action_gather) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

switch (true) do {
	case (player distance (getMarkerPos "baum_1") < 30): {_mine = ["faulbaum",2]; _exp = 50; _level = 2};
    case (player distance (getMarkerPos "baum_2") < 30): {_mine = ["faulbaum",2]; _exp = 50; _level = 2};
    case (player distance (getMarkerPos "baum_3") < 30): {_mine = ["faulbaum",2]; _exp = 50; _level = 2};
    //case (player distance (getMarkerPos "baum_4") < 30): {_mine = ["faulbaum",2];};
    //case (player distance (getMarkerPos "baum_5") < 30): {_mine = ["faulbaum",2];};
    //case (player distance (getMarkerPos "baum_6") < 30): {_mine = ["faulbaum",2];};
 	default {["", 0]};
};
//Mine check
if(EQUAL(SEL(_mine, 0),"")) exitWith {hint localize "STR_ISTR_Pick_NotNear";_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

_itemName = M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName");
if(LEVEL < _level) exitWith {hintSilent format["Sie muessen Level %1 erreicht haben um %2 farmen zu koennen",_level,localize _itemName]};

_diff = [SEL(_mine,0),SEL(_mine,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_rndm = [1,2,3,4,5] call BIS_fnc_selectRandom; _sum = [SEL(_mine,0),_rndm,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull";_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

if(_sum > 0) then
{
	 player say3D "motorsaege";
	life_action_gather = true;
	for "_i" from 0 to 2 do {
        
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		sleep 2.5;
	};

	if(([true,SEL(_mine,0),_sum] call life_fnc_handleInv)) then {
		cutText[format[localize "STR_ISTR_Motor_Success",(localize _itemName),_rndm],"PLAIN DOWN"];
	};
	};
life_action_gather = false;
_exp = round(random(_exp));
[true,_exp] spawn life_fnc_expConfig;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];