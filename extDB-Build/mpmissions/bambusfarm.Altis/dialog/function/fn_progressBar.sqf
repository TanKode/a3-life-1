/*
	File: fn_progressBar.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the progress bar.
*/
disableSerialization;
private["_ui","_progress"];
5 cutRsc ["bambusfarm_progress","PLAIN"];
_ui = uiNameSpace getVariable "bambusfarm_progress";
_progress = _ui displayCtrl 38201;

_progress progressSetPosition 0.5;
