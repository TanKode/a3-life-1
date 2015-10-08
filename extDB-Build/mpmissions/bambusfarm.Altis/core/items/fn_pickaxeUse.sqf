/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
private["_mine","_itemWeight","_diff","_itemName","_val","_karmaA","_skillCopper","_skill","_count","_lcap","_uip","_progress","_pgText","_cP","_upp","_lvl","_skill","_karma","_skilLRock","_skillSand","_skillSalt","_skillIron"];

_skillCopper = bambusfarm_skillCopperore;
_skilLRock = bambusfarm_skillEhemalsRock;
_skillSand = bambusfarm_skillSand;
_skillSalt = bambusfarm_skillSalt;
_skillIron = bambusfarm_skillIronore;

switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _skill = bambusfarm_skillCopperore;_karmaA = bambusfarm_Karma;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _skill = bambusfarm_skillIronore;_karmaA = bambusfarm_Karma;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _skill = bambusfarm_skillSalt;_karmaA = bambusfarm_Karma;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _skill = bambusfarm_skillSand;_karmaA = bambusfarm_Karma;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _skill = bambusfarm_skillDiamond; _karmaA = bambusfarm_Karma;};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _skill = bambusfarm_skillOilu;_karmaA = bambusfarm_Karma;};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _skill = bambusfarm_skillOilu;_karmaA = bambusfarm_Karma;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _skill = bambusfarm_skillEhemalsRock;_karmaA = bambusfarm_Karma;};
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
	bambusfarm_skillCopperore = bambusfarm_skillCopperore + 1;
	if(bambusfarm_skillCopperore < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.15;
	};
	if(bambusfarm_skillCopperore >= 49 && bambusfarm_skillCopperore <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.12;
    };
    if(bambusfarm_skillCopperore >= 249 && bambusfarm_skillCopperore <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.12;
    };
    if(bambusfarm_skillCopperore >= 499 && bambusfarm_skillCopperore <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.10;
    };
    if(bambusfarm_skillCopperore > 1249) then
    {
       	_val = [5,6] call BIS_fnc_selectRandom;
       	_count = "5-6";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = 5;
       	_timeB = 0.10;
    };
};

if(_mine == "ironore") then
{
	bambusfarm_skillIronore = bambusfarm_skillIronore + 1;
	if(bambusfarm_skillIronore < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.20;
	};
	if(bambusfarm_skillIronore >= 49 && bambusfarm_skillIronore <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.17;
    };
    if(bambusfarm_skillIronore >= 249 && bambusfarm_skillIronore <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.15;
    };
    if(bambusfarm_skillIronore >= 499 && bambusfarm_skillIronore <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.15;
    };
    if(bambusfarm_skillIronore > 1249) then
    {
       	_val = [5,6] call BIS_fnc_selectRandom;
       	_count = "5-6";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = 5;
       	_timeB = 0.13;
    };
};

if(_mine == "salt") then
{
	bambusfarm_skillSalt = bambusfarm_skillSalt + 1;
	if(bambusfarm_skillSalt < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.15;
	};
	if(bambusfarm_skillSalt >= 49 && bambusfarm_skillSalt <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.15;
    };
    if(bambusfarm_skillSalt >= 249 && bambusfarm_skillSalt <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.12;
    };
    if(bambusfarm_skillSalt >= 499 && bambusfarm_skillSalt <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.11;
    };
    if(bambusfarm_skillSalt > 1249) then
    {
       	_val = [5,6] call BIS_fnc_selectRandom;
       	_count = "5-6";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = 5;
       	_timeB = 0.10;
    };
};

if(_mine == "sand") then
{
	bambusfarm_skillSand = bambusfarm_skillSand + 1;
	if(bambusfarm_skillSand < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.13;
	};
	if(bambusfarm_skillSand >= 49 && bambusfarm_skillSand <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.11;
    };
    if(bambusfarm_skillSand >= 249 && bambusfarm_skillSand <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.10;
    };
    if(bambusfarm_skillSand >= 499 && bambusfarm_skillSand <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.09;
    };
    if(bambusfarm_skillSand > 1249) then
    {
       	_val = [5,6] call BIS_fnc_selectRandom;
       	_count = "5-6";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = 5;
       	_timeB = 0.08;
    };
};

if(_mine == "diamond") then
{
	bambusfarm_skillDiamond = bambusfarm_skillDiamond + 1;
	if(bambusfarm_skillDiamond < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.25;
	};
	if(bambusfarm_skillDiamond >= 49 && bambusfarm_skillDiamond <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.25;
    };
    if(bambusfarm_skillDiamond >= 249 && bambusfarm_skillDiamond <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.20;
    };
    if(bambusfarm_skillDiamond >= 499 && bambusfarm_skillDiamond <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.18;
    };
    if(bambusfarm_skillDiamond > 1249) then
    {
       	_val = [5,6] call BIS_fnc_selectRandom;
       	_count = "5-6";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = 5;
       	_timeB = 0.18;
    };
};

if(_mine == "oilu") then
{
	bambusfarm_skillOilu = bambusfarm_skillOilu + 1;
	if(bambusfarm_skillOilu < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.25;
	};
	if(bambusfarm_skillOilu >= 49 && bambusfarm_skillOilu <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.25;
    };
    if(bambusfarm_skillOilu >= 249 && bambusfarm_skillOilu <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.20;
    };
    if(bambusfarm_skillOilu >= 499 && bambusfarm_skillOilu <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.17;
    };
    if(bambusfarm_skillOilu > 1249) then
    {
       	_val = [5,6] call BIS_fnc_selectRandom;
       	_count = "5-6";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = 5;
       	_timeB = 0.17;
    };
};

if(_mine == "rock") then
{
	bambusfarm_skillEhemalsRock = bambusfarm_skillEhemalsRock + 1;
	if(bambusfarm_skillEhemalsRock < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.15;
	};
	if(bambusfarm_skillEhemalsRock >= 49 && bambusfarm_skillEhemalsRock <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.13;
    };
    if(bambusfarm_skillEhemalsRock >= 249 && bambusfarm_skillEhemalsRock <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.11;
    };
    if(bambusfarm_skillEhemalsRock >= 499 && bambusfarm_skillEhemalsRock <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.09;
    };
    if(bambusfarm_skillEhemalsRock > 1249) then
    {
       	_val = [5,6] call BIS_fnc_selectRandom;
       	_count = "5-6";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = 5;
       	_timeB = 0.08;
    };
};

//// PROZESSBAR START /////////////////
Gather_fnc_progress = {
	disableSerialization;
	_title = "Verpacke gesammeltes...";
	5 cutRsc ["bambusfarm_progress","PLAIN"];
	_ui = uiNamespace getVariable "bambusfarm_progress";
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_titleText ctrlSetText format["%2 (1%1)...","%",_title];
	_progressBar progressSetPosition 0.01;
	_cP = 0.01;

	while {true} do
	{
		sleep _timeB;
		if(isNull _ui) then {
			5 cutRsc ["bambusfarm_progress","PLAIN"];
			_ui = uiNamespace getVariable "bambusfarm_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		_cP = _cP + 0.01;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(_cP >= 1 OR !alive player) exitWith {};
		if(bambusfarm_istazed) exitWith {}; //Tazed
	};
};
//// PROZESSBAR ENDE /////////////////

_diff = [_mine,_val,bambusfarm_carryWeight,bambusfarm_maxWeight] call bambusfarm_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
bambusfarm_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};


[] call gather_fnc_progress;
waitUntil {gather_fnc_progress};
5 cutText ["","PLAIN"];

if(([true,_mine,_diff] call bambusfarm_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call bambusfarm_fnc_varHandle)] call bambusfarm_fnc_varToStr;
	titleText[format["Du hast %2 %1 gesammelt.",_itemName,_diff],"PLAIN"];
	[_karma,0] call bambusfarm_fnc_KarmaNeg;
    [ format ["<t color='#EC891D'><t size='1'>Skillstufe %1</t></t><br/> (%2): %3/%4<br/>Karma: %5/12500", _lvl, _count,_skill+1, _lCap, _KarmaA], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;
};

bambusfarm_action_inUse = false;
[] call SOCK_fnc_updateRequest;
[9] call SOCK_fnc_updatePartial;
[10] call SOCK_fnc_updatePartial;