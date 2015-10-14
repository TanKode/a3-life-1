enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "life\init.sqf";
//[] execVM "scripts\fn_robShopInit.sqf";
[] execVM "life\fuelstations\init_fuelstations.sqf";


StartProgress = true;

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
};

//ALRIGHT SO LETS SAVE SOME FPS
//Scheiﬂ Nebel hau ab
[] spawn {
    while{true} do {
        sleep 10;
        200 setFog 0;
        sleep 590;
    };
};

//Scheiﬂ Regen hau ab
[] spawn {
    while{true} do {
        sleep 10;
        200 setRain 0;
        sleep 590;
    };
};

//Performance
setTerrainGrid 45;
setViewDistance 1500;
setObjectViewDistance [800,50];

if(isDedicated && isNil("life_ATMhacked")) then
{
	life_ATMhacked = 0;
	publicVariable "life_ATMhacked";
	diag_log format["life_ATMhacked: %1",life_ATMhacked];
};