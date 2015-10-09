/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "bambusfarm_action_gathering") then {bambusfarm_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_uip","_progress","_pgText","_cP","_upp","_skillNeeded","_skillNeededa","_count","_lcap","_lvl","_skill","_karma","_karmaA"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1"];
_zone = "";
_skillNeeded = bambusfarm_skillCannabis;
_skillNeededa = bambusfarm_skillHeroinu;

if(bambusfarm_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
bambusfarm_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	bambusfarm_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _skill = bambusfarm_skillApple; _karmaA = bambusfarm_Karma;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _skill = bambusfarm_skillPeach; _karmaA = bambusfarm_Karma;};
	case (_zone in ["heroin_1"]): {_gather = "heroinu";  _skill = bambusfarm_skillHeroinu; _karmaA = bambusfarm_Karma;};
	case (_zone in ["cocaine_1"]): {_gather = "cocaine";  _skill = bambusfarm_skillCocaine; _karmaA = bambusfarm_Karma;};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _skill = bambusfarm_skillCannabis; _karmaA = bambusfarm_Karma;};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};
if(_gather == "heroinu" && _skillNeeded < 249) exitWith {hint format ["Um Schlafmohn sammeln zu können, benötigst du 250 Punkte in Cannabis. (derzeit: %1/250)", _skillNeeded];};
if(_gather == "cocaine" && _skillNeededa < 249) exitWith {hint format ["Um Kokain sammeln zu können, benötigst du 250 Punkte in Heroin. (derzeit: %1/250)", _skillNeededa];};
_timeB = 0.50;
_val = 1;
if(_gather == "apple") then
{
	bambusfarm_SkillApple = bambusfarm_SkillApple + 1;
	if(bambusfarm_SkillApple < 49)then
	{
		_val = [3,4,5] call BIS_fnc_selectRandom;
		_count = "3-5";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.06;
	};
	if(bambusfarm_SkillApple >= 49 && bambusfarm_SkillApple <= 249)then
	{
    	_val = [3,4,5] call BIS_fnc_selectRandom;
    	_count = "3-5";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.06;
    };
    if(bambusfarm_SkillApple >= 249 && bambusfarm_SkillApple <= 499) then
    {
       	_val = [4,5,6] call BIS_fnc_selectRandom;
       	_count = "4-6";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.05;
    };
    if(bambusfarm_SkillApple >= 499 && bambusfarm_SkillApple <= 849) then
    {
       	_val = [4,5,6] call BIS_fnc_selectRandom;
       	_count = "4-6";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.04;
    };
    if(bambusfarm_SkillApple > 1249) then
    {
       	_val = [6,7] call BIS_fnc_selectRandom;
       	_count = "6-7";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = 5;
       	_timeB = 0.04;
    };
};
if(_gather == "peach") then
{
	bambusfarm_skillPeach = bambusfarm_skillPeach + 1;
	if(bambusfarm_skillPeach < 49)then
	{
		_val = [3,4,5] call BIS_fnc_selectRandom;
		_count = "3-5";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.06;
	};
	if(bambusfarm_skillPeach >= 49 && bambusfarm_skillPeach <= 249)then
	{
    	_val = [3,4,5] call BIS_fnc_selectRandom;
    	_count = "3-5";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.06;
    };
    if(bambusfarm_skillPeach >= 249 && bambusfarm_skillPeach <= 499) then
    {
       	_val = [4,5,6] call BIS_fnc_selectRandom;
       	_count = "4-6";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.05;
    };
    if(bambusfarm_skillPeach >= 499 && bambusfarm_skillPeach <= 849) then
    {
       	_val = [4,5,6] call BIS_fnc_selectRandom;
       	_count = "4-6";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.04;
    };
    if(bambusfarm_skillPeach > 1249) then
    {
       	_val = [5,6,7,8] call BIS_fnc_selectRandom;
       	_count = "5-8";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = 5;
       	_timeB = 0.04;
    };
};
if(_gather == "heroinu") then
{
	bambusfarm_skillHeroinu = bambusfarm_skillHeroinu + 1;
	if(bambusfarm_skillHeroinu < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = -1;
		_timeB = 0.075;
	};
	if(bambusfarm_skillHeroinu >= 49 && bambusfarm_skillHeroinu <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = -2;
    	_timeB = 0.075;
    };
    if(bambusfarm_skillHeroinu >= 249 && bambusfarm_skillHeroinu <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = -3;
       	_timeB = 0.075;
    };
    if(bambusfarm_skillHeroinu >= 499 && bambusfarm_skillHeroinu <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = -3;
       	_timeB = 0.075;
    };
    if(bambusfarm_skillHeroinu > 1249) then
    {
       	_val = [5,6] call BIS_fnc_selectRandom;
       	_count = "5-6";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = -5;
       	_timeB = 0.075;
    };
};
if(_gather == "cocaine") then
{
	bambusfarm_skillCocaine = bambusfarm_skillCocaine + 1;
	if(bambusfarm_skillCocaine < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = -1;
		_timeB = 0.125;
	};
	if(bambusfarm_skillCocaine >= 49 && bambusfarm_skillCocaine <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = -2;
    	_timeB = 0.125;
    };
    if(bambusfarm_skillCocaine >= 249 && bambusfarm_skillCocaine <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = -3;
       	_timeB = 0.125;
    };
    if(bambusfarm_skillCocaine >= 499 && bambusfarm_skillCocaine <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = -3;
       	_timeB = 0.125;

    };
    if(bambusfarm_skillCocaine > 1249) then
    {
       	_val = [5,6] call BIS_fnc_selectRandom;
       	_count = "5-6";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = -5;
       	_timeB = 0.125;
    };
};
if(_gather == "cannabis") then
{
	bambusfarm_skillCannabis = bambusfarm_skillCannabis + 1;
	if(bambusfarm_skillCannabis < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = -1;
		_timeB = 0.075;
	};
	if(bambusfarm_skillCannabis >= 49 && bambusfarm_skillCannabis <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = -2;
    	_timeB = 0.075;
    };
    if(bambusfarm_skillCannabis >= 249 && bambusfarm_skillCannabis <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = -3;
       	_timeB = 0.075;
    };
    if(bambusfarm_skillCannabis >= 499 && bambusfarm_skillCannabis <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = -3;
       	_timeB = 0.075;
    };
    if(bambusfarm_skillCannabis > 1249) then
    {
       	_val = [5,6] call BIS_fnc_selectRandom;
       	_count = "5-6";
       	_lvl = 5;
       	_lcap = 1250;
       	_karma = -5;
       	_timeB = 0.075;
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

_time = 2.5;

_diff = [_gather,_val,bambusfarm_carryWeight,bambusfarm_maxWeight] call bambusfarm_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
bambusfarm_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep _time;
};

[] call gather_fnc_progress;

waitUntil {gather_fnc_progress};
5 cutText ["","PLAIN"];

if(([true,_gather,_diff] call bambusfarm_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call bambusfarm_fnc_varHandle)] call bambusfarm_fnc_varToStr;
	titleText[format["Du hast %2 %1 gesammelt.",_itemName,_diff],"PLAIN"];
	[_karma,0] call bambusfarm_fnc_KarmaNeg;
	[ format ["<t color='#EC891D'><t size='1'>Skillstufe %1</t></t><br/> (%2): %3/%4", _lvl, _count,_skill+1, _lCap, _KarmaA], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;
};

bambusfarm_action_inUse = false;

[] call SOCK_fnc_updateRequest;
[9] call SOCK_fnc_updatePartial;
[10] call SOCK_fnc_updatePartial;


