/*
----------------------------------------------|
Author: Backer
Description: Effekt on Cocaine use!
----------------------------------------------|
*/

closeDialog 0;
DrugedMarkers = ["druged1","druged2","druged3","druged4","druged5"] call BIS_fnc_selectRandom;
player setVariable["dazed",true,true];
[player,"Cocaine_sound", 54] call life_fnc_globalSound;

if(life_drug > 0) then {
	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
	"dynamicBlur" ppEffectCommit 20; // time it takes to normal
	20 fadeSound 1; //fades the sound back to normal

	player setDamage (0.2 + (damage player));

	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [9]; // intensity of blur
	"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
	enableCamShake true; // enables camera shake
	addCamShake [20, 100, 10]; // sets shakevalues
	player setFatigue 1; // sets the fatigue to 100%
	5 fadeSound 0.1; // fades the sound to 10% in 5 seconds

	sleep 50;

	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
	"dynamicBlur" ppEffectCommit 20; // time it takes to normal
	20 fadeSound 1; //fades the sound back to normal
};

//3 mal nehmen
if (life_drug > 0.22) then {
	titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
	player playMoveNow "Incapacitated";
	//titleText[localize "STR_MISC_DrunkBlackOut","BLACK IN"];
	sleep 15;
	vehicle player setDir 225;vehicle player setVelocity [0, 0, 0]; vehicle player setpos (getmarkerpos DrugedMarkers);
	publicVariable "DrugedMarkers";
	removeUniform player;removeVest player;
	player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
	sleep 10;
	titleText[localize "STR_MISC_DrunkBlackOut1","PLAIN"];
	player playMoveNow "amovppnemstpsraswrfldnon";
};

player setVariable["dazed",false,true];