/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [bambusfarm_corpse] call bambusfarm_fnc_fetchDeadGear;
[_oldGear] spawn bambusfarm_fnc_loadDeadGear;
bambusfarm_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[bambusfarm_corpse],"bambusfarm_fnc_corpse",nil,FALSE] spawn bambusfarm_fnc_MP;
_dir = getDir bambusfarm_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call bambusfarm_revive_fee)] call bambusfarm_fnc_numberText];

closeDialog 0;
bambusfarm_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy bambusfarm_deathCamera;

//Take fee for services.
if(bambusfarm_BANK > (call bambusfarm_revive_fee)) then {
	bambusfarm_BANK = bambusfarm_BANK - (call bambusfarm_revive_fee);
} else {
	bambusfarm_BANK = 0;
};

//Retexturing of units clothing, vanilla files only retexture the EMS unit.
switch(playerSide) do {
	case independent: {[[player,0,"textures\medic_uniform.jpg"],"bambusfarm_fnc_setTexture",true,false] spawn bambusfarm_fnc_MP;};
};

//Bring me back to bambusfarm.
player setDir _dir;
player setPosASL (visiblePositionASL bambusfarm_corpse);
bambusfarm_corpse setVariable["Revive",nil,TRUE];
bambusfarm_corpse setVariable["name",nil,TRUE];
[[bambusfarm_corpse],"bambusfarm_fnc_corpse",true,false] spawn bambusfarm_fnc_MP;
hideBody bambusfarm_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
[] call bambusfarm_fnc_hudUpdate; //Request update of hud.
[player, uniform player] call bambusfarm_fnc_equipGear;