StartProgress = false;
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v4.0";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

enableEnvironment true;
setTerrainGrid 50;
StartProgress = true;

[] execVM "scripts\fastrope.sqf";
[] execVM "scripts\teargasm.sqf";
[] execVM "scripts\teargasp.sqf";
[] execVM "scripts\teargasGLm.sqf";
[] execVM "scripts\teargasGLp.sqf";
[] execVM "scripts\D41_Wetter.sqf";
[] execVM "scripts\statusBar.sqf";
[] execVM "scripts\fpsfix.sqf"; 
//[] execVM "scripts\Anticheat.sqf";
//[] execVM "Scripts\GunStore\Gun_Store.sqf";

// Add Weapons to Gun Store
/*
nul = [] execVM "Scripts\GunStore\Rifles.sqf";

Sleep 4;

nul = [] execVM "Scripts\GunStore\Rifles.sqf";
*/
//Scheiß Nebel hau ab
[] spawn {
	while{true} do {
		sleep 10;
		200 setFog 0;
		sleep 590;
	};
};

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
    
};
//{_x setMarkerAlphaLocal 0} forEach ["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3","mrkGreen"];
/*[
    8*60, // seconds to delete dead bodies (0 means don't delete) 
    2*60, // seconds to delete dead vehicles (0 means don't delete)
    30*60, // seconds to delete immobile vehicles (0 means don't delete)
    5*60, // seconds to delete dropped weapons (0 means don't delete)
    20*60, // seconds to deleted planted explosives (0 means don't delete)
    5*60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM "scripts\repetitive_cleanup.sqf";
*/
life_colorEffects = 0;
[] spawn life_fnc_colorEffects;

//govenment
life_isGov = false;
[[player],"TON_fnc_govLogged",false,false] spawn life_fnc_mp;

if (!IsServer) then {
	if (isNil "car_use") then { 
		car_use = false;
		publicVariable "car_use"; 
	};
};