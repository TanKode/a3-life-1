/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_uip","_progress","_pgText","_cP","_upp","_skillNeeded","_skillNeededa","_count","_lcap","_lvl","_skill","_karma","_karmaA"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1"];
_zone = "";
_skillNeeded = life_skillCannabis;
_skillNeededa = life_skillHeroinu;

if(life_action_gathering) exitWith { hint "Du sammelst schon";}; //Action is in use, exit to prevent spamming.
life_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	life_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _skill = life_skillApple; _karmaA = life_Karma;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _skill = life_skillPeach; _karmaA = life_Karma;};
	case (_zone in ["heroin_1"]): {_gather = "heroinu";  _skill = life_skillHeroinu; _karmaA = life_Karma;};
	case (_zone in ["cocaine_1"]): {_gather = "cocaine";  _skill = life_skillCocaine; _karmaA = life_Karma;};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _skill = life_skillCannabis; _karmaA = life_Karma;};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};
if(_gather == "heroinu" && _skillNeeded < 249) exitWith {hint format ["Um Schlafmohn sammeln zu können, benötigst du 250 Punkte in Cannabis. (derzeit: %1/250)", _skillNeeded];};
if(_gather == "cocaine" && _skillNeededa < 249) exitWith {hint format ["Um Kokain sammeln zu können, benötigst du 250 Punkte in Heroin. (derzeit: %1/250)", _skillNeededa];};
if(_gather == "apple") then
{
	life_SkillApple = life_SkillApple + 1;
	if(life_SkillApple < 49)then
	{
		_val = [3,4,5] call BIS_fnc_selectRandom;
		_count = "3-5";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.06;
	};
	if(life_SkillApple >= 49 && life_SkillApple <= 249)then
	{
    	_val = [3,4,5] call BIS_fnc_selectRandom;
    	_count = "3-5";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.06;
    };
    if(life_SkillApple >= 249 && life_SkillApple <= 499) then
    {
       	_val = [4,5,6] call BIS_fnc_selectRandom;
       	_count = "4-6";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.05;
    };
    if(life_SkillApple >= 499 && life_SkillApple <= 849) then
    {
       	_val = [4,5,6] call BIS_fnc_selectRandom;
       	_count = "4-6";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.04;
    };
    if(life_SkillApple > 1249) then
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
	life_skillPeach = life_skillPeach + 1;
	if(life_skillPeach < 49)then
	{
		_val = [3,4,5] call BIS_fnc_selectRandom;
		_count = "3-5";
		_lvl = 1;
		_lcap = 50;
		_karma = 1;
		_timeB = 0.06;
	};
	if(life_skillPeach >= 49 && life_skillPeach <= 249)then
	{
    	_val = [3,4,5] call BIS_fnc_selectRandom;
    	_count = "3-5";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = 2;
    	_timeB = 0.06;
    };
    if(life_skillPeach >= 249 && life_skillPeach <= 499) then
    {
       	_val = [4,5,6] call BIS_fnc_selectRandom;
       	_count = "4-6";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = 3;
       	_timeB = 0.05;
    };
    if(life_skillPeach >= 499 && life_skillPeach <= 849) then
    {
       	_val = [4,5,6] call BIS_fnc_selectRandom;
       	_count = "4-6";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = 3;
       	_timeB = 0.04;
    };
    if(life_skillPeach > 1249) then
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
	life_skillHeroinu = life_skillHeroinu + 1;
	if(life_skillHeroinu < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = -1;
		_timeB = 0.075;
	};
	if(life_skillHeroinu >= 49 && life_skillHeroinu <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = -2;
    	_timeB = 0.075;
    };
    if(life_skillHeroinu >= 249 && life_skillHeroinu <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = -3;
       	_timeB = 0.075;
    };
    if(life_skillHeroinu >= 499 && life_skillHeroinu <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = -3;
       	_timeB = 0.075;
    };
    if(life_skillHeroinu > 1249) then
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
	life_skillCocaine = life_skillCocaine + 1;
	if(life_skillCocaine < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = -1;
		_timeB = 0.125;
	};
	if(life_skillCocaine >= 49 && life_skillCocaine <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = -2;
    	_timeB = 0.125;
    };
    if(life_skillCocaine >= 249 && life_skillCocaine <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = -3;
       	_timeB = 0.125;
    };
    if(life_skillCocaine >= 499 && life_skillCocaine <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = -3;
       	_timeB = 0.125;

    };
    if(life_skillCocaine > 1249) then
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
	life_skillCannabis = life_skillCannabis + 1;
	if(life_skillCannabis < 49)then
	{
		_val = [1,2] call BIS_fnc_selectRandom;
		_count = "1-2";
		_lvl = 1;
		_lcap = 50;
		_karma = -1;
		_timeB = 0.075;
	};
	if(life_skillCannabis >= 49 && life_skillCannabis <= 249)then
	{
    	_val = [2,3] call BIS_fnc_selectRandom;
    	_count = "2-3";
    	_lvl = 2;
    	_lcap = 250;
    	_karma = -2;
    	_timeB = 0.075;
    };
    if(life_skillCannabis >= 249 && life_skillCannabis <= 499) then
    {
       	_val = [2,3] call BIS_fnc_selectRandom;
       	_count = "2-3";
       	_lvl = 3;
       	_lcap = 500;
       	_karma = -3;
       	_timeB = 0.075;
    };
    if(life_skillCannabis >= 499 && life_skillCannabis <= 849) then
    {
       	_val = [3,4,5] call BIS_fnc_selectRandom;
       	_count = "3-5";
       	_lvl = 4;
       	_lcap = 850;
       	_karma = -3;
       	_timeB = 0.075;
    };
    if(life_skillCannabis > 1249) then
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

_time = 2.5;

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep _time;
};

[] call gather_fnc_progress;

waitUntil {gather_fnc_progress};
5 cutText ["","PLAIN"];

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Du hast %2 %1 gesammelt.",_itemName,_diff],"PLAIN"];
	[_karma,0] call life_fnc_KarmaNeg;
	[ format ["<t color='#EC891D'><t size='1'>Skillstufe %1</t></t><br/> (%2): %3/%4", _lvl, _count,_skill+1, _lCap, _KarmaA], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;
};

life_action_inUse = false;
life_action_gathering = false;

[] call SOCK_fnc_updateRequest;
[9] call SOCK_fnc_updatePartial;
[10] call SOCK_fnc_updatePartial;


