waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information
*/
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
//systemChat format["Herzlich Willkommen !", _rscLayer];

[] spawn {
	sleep 5;
	_statusText = "Willkommen";
	_counter = 180;
	_timeSinceLastUpdate = 0;
	_time = time + (6*(60*60));
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		_statusText = "bambusfarm.net";
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | Cops: %2 | Civs: %3 | Medics: %4 | ADAC: %5 | GPS: %6 | ServerRestart in: %7 all 6 hours!", round diag_fps, west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits, east countSide playableUnits, mapGridPosition player,life_serverTime, _counter];
	}; 
};