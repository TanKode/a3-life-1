/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then
{
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;

ctrlSetText[2902, format["%1", tawvd_foot]];
ctrlSetText[2912, format["%1", tawvd_car]];
ctrlSetText[2922, format["%1", tawvd_air]];

//Setup Sliders range
{ slidersetRange [_x,100,12000];} foreach [2901,2911,2921];
//Setup Sliders speed
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [100,100,100]; } foreach [2901,2911,2921];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,tawvd_foot],[2911,tawvd_car],[2921,tawvd_air]];

private["_display","_side","_tags","_objs"];
_display = findDisplay 2900;
_side = _display displayCtrl 2971;
_tags = _display displayCtrl 2970;
_objs = _display displayCtrl 2972;

if(isNil "bambusfarm_tagson") then {
	bambusfarm_sidechat = true;
	bambusfarm_tagson = true;
	bambusfarm_revealObjects = true;
};

if(bambusfarm_revealObjects) then {
	_objs ctrlSetTextColor [0,1,0,1];
	_objs ctrlSetText "ON";
	_objs buttonSetAction "[bambusfarm_ID_RevealObjects,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; bambusfarm_revealObjects = false; [] call bambusfarm_fnc_settingsMenu;";
} else {
	_objs ctrlSetTextColor [1,0,0,1];
	_objs ctrlSetText "OFF";
	_objs buttonSetAction "bambusfarm_ID_RevealObjects = [""bambusfarm_RevealObjects"",""onEachFrame"",""bambusfarm_fnc_revealObjects""] call BIS_fnc_addStackedEventHandler; bambusfarm_revealObjects = true; [] call bambusfarm_fnc_settingsMenu;";
};

if(bambusfarm_tagson) then {
	_tags ctrlSetTextColor [0,1,0,1];
	_tags ctrlSetText "ON";
	_tags buttonSetAction "[bambusfarm_ID_PlayerTags,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; bambusfarm_tagson = false; [] call bambusfarm_fnc_settingsMenu;";
} else {
	_tags ctrlSetTextColor [1,0,0,1];
	_tags ctrlSetText "OFF";
	_tags buttonSetAction "bambusfarm_ID_PlayerTags = [""bambusfarm_PlayerTags"",""onEachFrame"",""bambusfarm_fnc_playerTags""] call BIS_fnc_addStackedEventHandler; bambusfarm_tagson = true; [] call bambusfarm_fnc_settingsMenu;";
};

if(bambusfarm_sidechat) then {
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText "ON";
} else {
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText "OFF";
};