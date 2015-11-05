#include <macro.h>
/*
	File: fn_organTransplantKit.sqf
	Author: Bryan "Tonic" Boardwine
	edited by:[midgetgrimm]
	Description:
	gives organ to other players
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_badDistance","_bool"];
_curTarget = cursorTarget;
life_interrupted = false;
_bool = true;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far

//More error checks
if(isNull _curTarget) exitWith {}; //if unit is null, than NO
if(!(_curTarget GVAR ["missingOrgan",FALSE])) exitWith {hint"Der Person fehlt kein Organ!";};
if((_curTarget GVAR ["inSurgery",FALSE])) exitWith {hint"Nur eine Transplantation aufeinmal bitte!";};
//if((player GVAR ["hasOrgan",FALSE])) exitWith {hint"Das geht nicht...";};
if(player == _curTarget) exitWith {};//if the thief is the cursor target(dafuq) than NO
if(!isPlayer _curTarget) exitWith {};//if the cursor target is not a player than NO
if(life_inv_organttk < 1) exitWith {hint "Du brauchst ein Transplantationskit"};
if(life_inv_kidney < 1) exitWith {hint "Du benötigst eine Niere!"};

_title = format["Transplantation an %1 erfolgt...",name _curTarget];
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace GVAR "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.008;

while {true} do
{
	[] spawn {
					_bool = false;
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic0";
					sleep 7;
					_bool = true;
			};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace GVAR "life_progress";
		_progressBar = _ui displayCtrl 38201;
 	_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.009;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_curTarget SVAR["inSurgery",true,true];
	player SVAR["hasOrgan",true,true];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {_curTarget SVAR["inSurgery",false,true];player SVAR["hasOrgan",false,true];}; //Tazed
	if(life_interrupted) exitWith {_curTarget SVAR["inSurgery",false,true];player SVAR["hasOrgan",false,true];};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;player SVAR["hasOrgan",false,true];player SVAR["inSurgery",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_curTarget SVAR["inSurgery",false,true];player SVAR["hasOrgan",false,true];};
if(!isNil "_badDistance") exitWith {titleText["You got to far away from the target.","PLAIN"]; life_action_inUse = false;_curTarget SVAR["inSurgery",false,true];player SVAR["hasOrgan",false,true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; life_action_inUse = false;_curTarget SVAR["inSurgery",false,true];player SVAR["hasOrgan",false,true];};
hint "Transplantation erfolgreich!";
_curTarget SVAR["inSurgery",false,true];
_curTarget SVAR["missingOrgan",false,true];
life_inv_organttk = life_inv_organttk - 1;
life_inv_kidney = life_inv_kidney - 1;
life_action_inUse = false;
life_thirst =  100;
life_hunger =  100;
life_max_health = 100;
if(playerSide in [west,independent]) then {life_cash = life_cash + 8000;hint"Du erhaeltst $8000 fuer deine Hilfe!";};
player SVAR["hasOrgan",false,true];