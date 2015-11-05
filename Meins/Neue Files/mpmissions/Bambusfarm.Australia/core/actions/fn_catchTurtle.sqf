/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/
private "_obj","_exp";
_obj = cursorTarget;
if(isNull _obj) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Not valid
if(alive _obj) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //It's alive, don't take it charlie!
if(skill_civ_turtle) then {
	if(([true,"turtle_raw",2] call life_fnc_handleInv)) then {
		deleteVehicle _obj;
		cutText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
	};
}else{
	if(([true,"turtle_raw",1] call life_fnc_handleInv)) then {
		deleteVehicle _obj;
		cutText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
	};
};
_exp = round(random(150));
[true,_exp] spawn life_fnc_expConfig;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];