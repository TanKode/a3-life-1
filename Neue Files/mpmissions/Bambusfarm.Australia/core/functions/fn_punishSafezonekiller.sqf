/*
	File: fn_punishSafezonekiller.sqf
	Author: MarioF
	
	Description:
	Punish the Safezonekiller
*/
private["_victim","_curWeapon"];

_victim = [_this,0,false] call bis_fnc_param;

if((time - life_safezone_penalty_time) > 2) then {
	life_safezone_penalty_time = time;
	life_safezone_penalty = life_safezone_penalty + 1;
	[] spawn { sleep 300; life_safezone_penalty = life_safezone_penalty - 1; };

	if(life_safezone_penalty > 2) then 
	{
		if(vehicle player != player) then 
		{
			moveOut player;
			license_civ_quad = false;
			license_civ_driver = false;
			license_civ_truck = false;
			titleText[format["Für den wiederholten versucht jemanden in einer Safezone zu überfahren verlieren sie jetzt alle ihre Führerscheine!", life_safezone_penalty],"PLAIN"];
		} else {
			_curWeapon = currentWeapon player;
			player removeWeapon _curWeapon;
			titleText[format["Für den wiederholten versucht jemanden in einer Safezone zu erschiessen haben Sie jetzt alle ihre Waffen verloren!", life_safezone_penalty],"PLAIN"];
		};
	} else {
		titleText[format["Für den versuch jemanden in einer Safezone zu töten bekommen Sie eine Strafe von %1, 3 versuche und Sie verlieren ihre Waffen oder Alle ihre Führerscheine!", life_safezone_penalty],"PLAIN"];
	};
};