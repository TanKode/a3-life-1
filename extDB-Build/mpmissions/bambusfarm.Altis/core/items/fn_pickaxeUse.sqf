/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
private["_mine","_itemWeight","_diff","_itemName","_val","_karmaA","_skillCopper","_skill","_count","_lcap","_uip","_progress","_pgText","_cP","_upp","_lvl","_skill","_karma","_skilLRock","_skillSand","_skillSalt","_skillIron"];

_skillCopper = life_skillCopperore;
_skilLRock = life_skillEhemalsRock;
_skillSand = life_skillSand;
_skillSalt = life_skillSalt;
_skillIron = life_skillIronore;

if(life_action_gatheringPick) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_gatheringPick = true;
switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _skill = life_skillCopperore;_karmaA = life_Karma;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _skill = life_skillIronore;_karmaA = life_Karma;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _skill = life_skillSalt;_karmaA = life_Karma;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _skill = life_skillSand;_karmaA = life_Karma;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _skill = life_skillDiamond; _karmaA = life_Karma;};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _skill = life_skillOilu;_karmaA = life_Karma;};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _skill = life_skillOilu;_karmaA = life_Karma;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _skill = life_skillEhemalsRock;_karmaA = life_Karma;};
	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

if(_mine == "ironore" && _skillCopper < 149 && _skillRock < 149) exitWith {hint format ["Um Eisen sammeln zu koennen, benoetigst du 150 Punkte in Kupfer und Stein. (derzeit: %1/250 %2/250)", _skillCopper, _skillRock];};
if(_mine == "oilu" &&  _skillSand < 149 && _skillSalt < 149) exitWith {hint format ["Um Oel sammeln zu koennen, benoetigst du 150 Punkte in Sand und Salz. (derzeit: %1/250 %2/250)", _skillSalt, _skillSand];};
if(_mine == "diamond" &&  _skillCopper < 249 && _skillIron < 149 && _skilLRock < 149) exitWith {hint format ["Um Diamanten sammeln zu koennen, benoetigst du 250 Punkte in Kupfer und 150 Punkte in Eisen und Stein. (derzeit: %1/500 %2/250 %3/250)", _skillCopper, _skillRock, _skillIron];};
_timeB = 0.50;
_val = 1;
if(_mine == "copperore") then
{
	_timeB = 0.15;
	life_skillCopperore = life_skillCopperore + 1;
	if(life_skillCopperore < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.15;
	}else{
		if(life_skillCopperore >= 49 && life_skillCopperore <= 249)then
		{
    		_val = [2,3] call BIS_fnc_selectRandom;
    		_count = "2-3";
    		_lvl = 2;
    		_lcap = 250;
    		_karma = 2;
    		_timeB = 0.12;
    	}else{
    		if(life_skillCopperore >= 249 && life_skillCopperore <= 499) then
    		{
    		   	_val = [2,3] call BIS_fnc_selectRandom;
    		   	_count = "2-3";
    		   	_lvl = 3;
    		   	_lcap = 500;
    		   	_karma = 3;
    		   	_timeB = 0.12;
    		}else{
    			if(life_skillCopperore >= 499 && life_skillCopperore <= 849) then
    			{
    			   	_val = [3,4,5] call BIS_fnc_selectRandom;
    			   	_count = "3-5";
    			   	_lvl = 4;
    			   	_lcap = 850;
    			   	_karma = 3;
    			   	_timeB = 0.10;
    			}else{
    				if(life_skillCopperore > 1249) then
    				{
    				   	_val = [5,6] call BIS_fnc_selectRandom;
    				   	_count = "5-6";
    				   	_lvl = 5;
    				   	_lcap = 1250;
    				   	_karma = 5;
    				   	_timeB = 0.10;
    				};
    			};
    		};
    	};
   	};
};

if(_mine == "ironore") then
{
	_timeB = 0.20;
	life_skillIronore = life_skillIronore + 1;
	if(life_skillIronore < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.20;
	}else{
		if(life_skillIronore >= 49 && life_skillIronore <= 249)then
		{
    		_val = [2,3] call BIS_fnc_selectRandom;
    		_count = "2-3";
    		_lvl = 2;
    		_lcap = 250;
    		_karma = 2;
    		_timeB = 0.17;
    	}else{
    		if(life_skillIronore >= 249 && life_skillIronore <= 499) then
    		{
    		   	_val = [2,3] call BIS_fnc_selectRandom;
    		   	_count = "2-3";
    		   	_lvl = 3;
    		   	_lcap = 500;
    		   	_karma = 3;
    		   	_timeB = 0.15;
    		}else{
   				if(life_skillIronore >= 499 && life_skillIronore <= 849) then
   				{
   				   	_val = [3,4,5] call BIS_fnc_selectRandom;
   				   	_count = "3-5";
   				   	_lvl = 4;
   				   	_lcap = 850;
   				   	_karma = 3;
   				   	_timeB = 0.15;
   				}else{
    			if(life_skillIronore > 1249) then
    			{
    			   	_val = [5,6] call BIS_fnc_selectRandom;
    			   	_count = "5-6";
    			   	_lvl = 5;
    			   	_lcap = 1250;
    			   	_karma = 5;
    			   	_timeB = 0.13;
    				};
    			};
    		};
    	};
   	};
};

if(_mine == "salt") then
{
	_timeB = 0.15;
	life_skillSalt = life_skillSalt + 1;
	if(life_skillSalt < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.15;
	}else{
		if(life_skillSalt >= 49 && life_skillSalt <= 249)then
		{
    		_val = [2,3] call BIS_fnc_selectRandom;
    		_count = "2-3";
    		_lvl = 2;
    		_lcap = 250;
    		_karma = 2;
    		_timeB = 0.15;
    	}else{
    		if(life_skillSalt >= 249 && life_skillSalt <= 499) then
    		{
    		   	_val = [2,3] call BIS_fnc_selectRandom;
    		   	_count = "2-3";
    		   	_lvl = 3;
    		   	_lcap = 500;
    		   	_karma = 3;
    		   	_timeB = 0.12;
    		}else{
   				if(life_skillSalt >= 499 && life_skillSalt <= 849) then
   				{
   				   	_val = [3,4,5] call BIS_fnc_selectRandom;
   				   	_count = "3-5";
   				   	_lvl = 4;
   				   	_lcap = 850;
   				   	_karma = 3;
   				   	_timeB = 0.11;
   				}else{
    				if(life_skillSalt > 1249) then
    				{
    				   	_val = [5,6] call BIS_fnc_selectRandom;
    				   	_count = "5-6";
    				   	_lvl = 5;
    				   	_lcap = 1250;
    				   	_karma = 5;
    				   	_timeB = 0.10;
    				};
    			};
    		};
    	};
   	};
};

if(_mine == "sand") then
{
	_timeB = 0.13;
	life_skillSand = life_skillSand + 1;
	if(life_skillSand < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.13;
	}else{
		if(life_skillSand >= 49 && life_skillSand <= 249)then
		{
    		_val = [2,3] call BIS_fnc_selectRandom;
    		_count = "2-3";
    		_lvl = 2;
    		_lcap = 250;
    		_karma = 2;
    		_timeB = 0.11;
    	}else{
    		if(life_skillSand >= 249 && life_skillSand <= 499) then
    		{
    		   	_val = [2,3] call BIS_fnc_selectRandom;
    		   	_count = "2-3";
    		   	_lvl = 3;
    		   	_lcap = 500;
    		   	_karma = 3;
    		   	_timeB = 0.10;
    		}else{
    		if(life_skillSand >= 499 && life_skillSand <= 849) then
    		{
    		   	_val = [3,4,5] call BIS_fnc_selectRandom;
    		   	_count = "3-5";
    		   	_lvl = 4;
    		   	_lcap = 850;
    		   	_karma = 3;
    		   	_timeB = 0.09;
    		}else{
    			if(life_skillSand > 1249) then
    			{
    			   	_val = [5,6] call BIS_fnc_selectRandom;
    			   	_count = "5-6";
    			   	_lvl = 5;
    			   	_lcap = 1250;
    			   	_karma = 5;
    			   	_timeB = 0.08;
    				};
    			};
    		};
    	};
   	};
};

if(_mine == "diamond") then
{
	_timeB = 0.25;
	life_skillDiamond = life_skillDiamond + 1;
	if(life_skillDiamond < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.25;
	}else{
		if(life_skillDiamond >= 49 && life_skillDiamond <= 249)then
		{
    		_val = [2,3] call BIS_fnc_selectRandom;
    		_count = "2-3";
    		_lvl = 2;
    		_lcap = 250;
    		_karma = 2;
    		_timeB = 0.25;
    	}else{
    		if(life_skillDiamond >= 249 && life_skillDiamond <= 499) then
    		{
    		   	_val = [2,3] call BIS_fnc_selectRandom;
    		   	_count = "2-3";
    		   	_lvl = 3;
    		   	_lcap = 500;
    		   	_karma = 3;
    		   	_timeB = 0.20;
    		}else{
    			if(life_skillDiamond >= 499 && life_skillDiamond <= 849) then
    			{
    			   	_val = [3,4,5] call BIS_fnc_selectRandom;
    			   	_count = "3-5";
    			   	_lvl = 4;
    			   	_lcap = 850;
    			   	_karma = 3;
    			   	_timeB = 0.18;
    			}else{
    				if(life_skillDiamond > 1249) then
    				{
    				   	_val = [5,6] call BIS_fnc_selectRandom;
    				   	_count = "5-6";
    				   	_lvl = 5;
    				   	_lcap = 1250;
    				   	_karma = 5;
    				   	_timeB = 0.18;
    				};
    			};
    		};
    	};
   	};
};

if(_mine == "oilu") then
{
	_timeB = 0.25;
	life_skillOilu = life_skillOilu + 1;
	if(life_skillOilu < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.25;
	}else{
		if(life_skillOilu >= 49 && life_skillOilu <= 249)then
		{
    		_val = [2,3] call BIS_fnc_selectRandom;
    		_count = "2-3";
    		_lvl = 2;
    		_lcap = 250;
    		_karma = 2;
    		_timeB = 0.25;
    	}else{
    		if(life_skillOilu >= 249 && life_skillOilu <= 499) then
    		{
    		   	_val = [2,3] call BIS_fnc_selectRandom;
    		   	_count = "2-3";
    		   	_lvl = 3;
    		   	_lcap = 500;
    		   	_karma = 3;
    		   	_timeB = 0.20;
    		}else{
    			if(life_skillOilu >= 499 && life_skillOilu <= 849) then
    			{
    			   	_val = [3,4,5] call BIS_fnc_selectRandom;
    			   	_count = "3-5";
    			   	_lvl = 4;
    			   	_lcap = 850;
    			   	_karma = 3;
    			   	_timeB = 0.17;
    			}else{
    				if(life_skillOilu > 1249) then
    				{
    				   	_val = [5,6] call BIS_fnc_selectRandom;
    				   	_count = "5-6";
    				   	_lvl = 5;
    				   	_lcap = 1250;
    				   	_karma = 5;
    				   	_timeB = 0.17;
    				};
    			};
    		};
    	};
   	};
};

if(_mine == "rock") then
{
	_timeB = 0.15;
	life_skillEhemalsRock = life_skillEhemalsRock + 1;
	if(life_skillEhemalsRock < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.15;
	}else{
		if(life_skillEhemalsRock >= 49 && life_skillEhemalsRock <= 249)then
		{
    		_val = [2,3] call BIS_fnc_selectRandom;
    		_count = "2-3";
    		_lvl = 2;
    		_lcap = 250;
    		_karma = 2;
    		_timeB = 0.13;
    	}else{
    		if(life_skillEhemalsRock >= 249 && life_skillEhemalsRock <= 499) then
    		{
    		   	_val = [2,3] call BIS_fnc_selectRandom;
    		   	_count = "2-3";
    		   	_lvl = 3;
    		   	_lcap = 500;
    		   	_karma = 3;
    		   	_timeB = 0.11;
    		}else{
				if(life_skillEhemalsRock >= 499 && life_skillEhemalsRock <= 849) then
				{
					_val = [3,4,5] call BIS_fnc_selectRandom;
					_count = "3-5";
					_lvl = 4;
					_lcap = 850;
					_karma = 3;
					_timeB = 0.09;
				}else{
					if(life_skillEhemalsRock > 1249) then
					{
						_val = [5,6] call BIS_fnc_selectRandom;
						_count = "5-6";
						_lvl = 5;
						_lcap = 1250;
						_karma = 5;
						_timeB = 0.08;
    				};
    			};
    		};
    	};
   	};
};
//// PROZESSBAR START /////////////////
Gather_fnc_progress = {
	disableSerialization;
	_title = "Verpacke gesammeltes...";
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNamespace getVariable "life_progress";
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_titleText ctrlSetText format["%2 (1%1)...","%",_title];
	_progressBar progressSetPosition 0.01;
	_cP = 0.01;

	while {true} do
	{
		sleep _timeB;
		if(isNull _ui) then {
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNamespace getVariable "life_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		_cP = _cP + 0.01;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(_cP >= 1 OR !alive player) exitWith {};
		if(life_istazed) exitWith {}; //Tazed
	};
};
//// PROZESSBAR ENDE /////////////////

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};


[] call gather_fnc_progress;
waitUntil {gather_fnc_progress};
//5 cutText ["","PLAIN"];

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Du hast %2 %1 gesammelt.",_itemName,_diff],"PLAIN"];
	[_karma,0] call life_fnc_KarmaNeg;
    [ format ["<t color='#EC891D'><t size='1'>Skillstufe %1</t></t><br/> (%2): %3/%4<br/>", _lvl, _count,_skill+1, _lCap], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;
};

life_action_inUse = false;
life_action_gatheringPick = false;
[] call SOCK_fnc_updateRequest;
[9] call SOCK_fnc_updatePartial;
[10] call SOCK_fnc_updatePartial;