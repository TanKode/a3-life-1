#include <macro.h>
/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _target) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //DAFUQ?@!%$!R?EFFD?TGSF?HBS?DHBFNFD?YHDGN?D?FJH
if(life_skill_heal1) exitWith {hintSilent "Die Zeit bis zum naechsten Wiederbelebungsversuch ist noch nicht abgelaufen!"};

_revivable = _target GVAR ["Revive",FALSE];
if(_revivable) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(_target GVAR ["Reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(player distance _target > 5) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Not close enough.

//Fetch their name so we can shout it.
_targetName = _target GVAR ["name","Unknown"];
_title = format[localize "STR_Medic_Progress",_targetName];
life_action_inUse = true; //Lockout the controls.

_target SVAR ["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

//Lets reuse the same thing!
while {true} do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	
	sleep .15;
	_cP = _cP + .01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(life_istazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Tazed
	if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if((player GVAR ["restrained",false])) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(player distance _target > 4) exitWith {_badDistance = true;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(_target GVAR ["Revive",FALSE]) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(_target GVAR ["Reviving",ObjNull] != player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(_target GVAR ["Reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving";_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
_target SVAR ["Reviving",NIL,TRUE];
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(_target GVAR ["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned";_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if((player GVAR ["restrained",false])) exitWith {life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

if(playerSide in [west,independent]) then
{
	ADD(BANK,(LIFE_SETTINGS(getNumber,"revive_fee")));

	life_action_inUse = false;
	_target SVAR ["Revive",TRUE,TRUE];
	_target SVAR ["life_isPlayer_alive",TRUE,TRUE];
	[[profileName],"life_fnc_revived",_target,FALSE] call life_fnc_MP;
	titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[LIFE_SETTINGS(getNumber,"revive_fee")] call life_fnc_numberText],"PLAIN"];

	sleep .6;
	player reveal _target;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
}else{
	if((EQUAL(playerSide,civilian)) && skill_civ_heal && skill_civ_heal1) then
	{
		_dice = random(100);
		if(_dice < 50) then {
			life_skill_heal1 = true;
			life_action_inUse = false;
			_target SVAR ["Revive",TRUE,TRUE];
			_target SVAR ["life_isPlayer_alive",TRUE,TRUE];
			[[profileName],"life_fnc_revived",_target,FALSE] call life_fnc_MP;
			//titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[LIFE_SETTINGS(getNumber,"revive_fee")] call life_fnc_numberText],"PLAIN"];
			hintSilent "Ihr Wiederbelebungsversuch war erfolgreich, Sie können in 5min einen neuen Wiederbelebungs versuchen starten!";
			
			sleep .6;
			player reveal _target;
			_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
			uiSleep (5*60);
			life_skill_heal1 = false;
		}else{
			life_skill_heal1 = true;
			hintSilent "Ihr Wiederbelebungsversuch is fehlgeschalgen, Sie können es in 5min nochmal versuchen!";
			_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
			uiSleep (5*60);
			life_skill_heal1 = false;
		};
	};
};