/*
	File: fn_progressBaren.sqf
	Author: Herman "Mordin" Othelius
	Template: Tonics crap :P
	Description: Should pop up a progressbar :)
*/
private["_cpRate","_title","_progressBar","_titleText","_cp","_ui","_object","_bool","_dice"];
_object = _this Select 0;  
_bool = true;

[_object,"bankalarm"] call life_fnc_globalSound;
[[3,format["<t color='#CB2525'><t size='2.5'>ALARM!</t><br/> <t color='#FFFFFF'>Jemand versucht aus dem Gefängins auszubrechen!</t>"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

//Setup the progress bar
_cpRate = 0.0045;
disableSerialization;
_title = format[localize"STR_Breaking_Out_Prisoner"];

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = format[localize"STR_Breaking_Out_Prisoner"];
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

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
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;

_dice = random(100);

if(_dice >= 50) then {
	_object setPos (getMarkerPos "jail_breakout");
	[[getPlayerUID player,profileName,"902"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	titleText[localize "STR_Breakout_Help","PLAIN"];
}else{
	
	[[getPlayerUID player,profileName,"903"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	titleText[localize "STR_Breakout_Help_Failed","PLAIN"];
};