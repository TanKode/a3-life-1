#include <macro.h>

[] call SOCK_fnc_updateRequest;
[] call life_fnc_saveGear;
disableSerialization;
life_tagson = !true;
player allowDamage false;
disableUserInput true;
showChat false;
hintSilent "";
[LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
1 fadeRadio 0;
1 fadeSpeech 0;
[] spawn life_fnc_hudUpdate;
playSound "endscreen";

_introCam = "camera" camCreate (player modelToWorldVisual [-5,0,1.85]);
_introCam cameraEffect ["internal","back"];
_introCam camSetFov 2.000;
_introCam camSetTarget vehicle player;
_introCam camSetRelPos [0,-1,1.85];

_introCam camCommit 0;
waitUntil {camCommitted _introCam};

_introCam camSetFov 2;
_introCam camSetRelPos [0,-5,1.85];
_introCam camCommit 1;
waitUntil {camCommitted _introCam};

_introCam camSetFov 9;
_introCam camSetRelPos [0,-5,1050.85];
_introCam camCommit 1.5;
waitUntil {camCommitted _introCam};

cutText ["","BLACK",1]; 
sleep 1;
_effectID = 1 + floor random 3;
_videoFile = "A3\Missions_F_Bootcamp\video\VR_GenericTransition_" + str _effectID + ".ogv";
_video = [ _videoFile ] spawn BIS_fnc_playVideo;
sleep 1;

_veh = (nearestObjects[player,["Car","Air","Ship","LandVehicle"],15]);
if(EQUAL(playerSide,civilian)) then
{
	if(count _veh > 0) then {
		{
			_vehicle = _x;
			if(!(_vehicle in life_vehicles)) exitWith {};
			_vehData = _vehicle GVAR["dbinfo",[]];
			_vehData = SEL(_vehData,0);
			if(count _vehData > 0) then
			{
				if(EQUAL(_vehData,(getPlayerUID player))) then {
					[[_vehicle,false,player],"TON_fnc_vehicleSavePos",false,false] spawn life_fnc_MP;
				};
			};
		}forEach _veh;
	};
};

_name = name player;
[format["<t size='1.3' color='#ff9900'>Auf Wiedersehen!</t><br/>Wir hoffen du besuchst uns erneut<br/> %1 <br/><br/><t size='1.1'>Bambusfarm</t>",_name],
	0,
	0.2,
	10,
	0,
	0,
	8
] spawn BIS_fnc_dynamicText;

if(!life_is_arrested) then {
	player setPos (getMarkerPos "abort");
};
sleep 6;
0 fadeRadio 1;
0 fadeSpeech 1;
[[player],"TON_fnc_cleanupRequest",false,false] spawn life_fnc_MP;
showChat true;
disableUserInput false;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
["Abort",true,false] spawn BIS_fnc_endMission;
_introCam cameraEffect ["terminate","back"];
camDestroy _introCam;