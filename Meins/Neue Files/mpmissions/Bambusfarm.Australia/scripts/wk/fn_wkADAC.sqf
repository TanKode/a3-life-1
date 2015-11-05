/*
	File: welcomecredits.sqf
	
	Creates an intro on the bottom-right hand corner of the screen and add camera effect to spawn.
*/

private [ "_camera", "_welcomeMessage", "_camDistance","_randCamX","_randCamY","_camTime" ];

//playsound "ADACIntro";

/*_camDistance = 40;
_randCamX = 75 - floor(random 150);
_randCamY = 75 - floor(random 150);
_camTime = 18;// you can change the time for sure, I adjusted mine to the intro music

waitUntil { alive player };
//waituntil {!isnull (finddisplay 46)};
showCinemaBorder true;
camUseNVG false;
playsound "ADACIntro";

_camera = "camera" camCreate [(position player select 0)+_randCamX, (position player select 1)+_randCamY,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];
 
_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
 
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit _camTime;
 
cutText [_welcomeMessage, "PLAIN DOWN"];
 
waitUntil {camCommitted _camera};
 
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
sleep 1;*/

_onScreenTime = 15;

sleep 5; //Wait in seconds before the credits start after player is in-game
 
_role1 = "Herzlich willkommen auf dem";
_role1names = ["Bambusfarm","Australia Server"];
_role2 = "Teamspeak:";
_role2names = ["ts.bambusfarm.net"];
_role3 = "Webseite:";
_role3names = ["www.bambusfarm.net"];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.6' color='#C31319' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.85' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.9);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [

[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names]
];