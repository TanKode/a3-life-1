//::::::::::::  ::::::::::::\\
//	Filename: core/life/fn_life_KSys.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Karma is a bi...
//::::::::::::  ::::::::::::\\

private["_Mod","_Mode","_Karma"];
//Gather: Mode = 0
//Killed: Mode = 1

	_Mod = _this select 0;
	_Mode = _this select 1;
	if(playerSide != civilian) exitWith {};

	if(_Mode == 0) exitWith {if(((life_Karma+_Mod) <= 12500) && ((life_Karma+_Mod) >= -12500))then{life_Karma = life_Karma + _Mod;}else{systemchat "Maximales Karma erreicht!"; hint "Maximales Karma erreicht!"};};
	_Karma = _this select 2;

	call life_fnc__hitSkill;

	if(_Karma >= -999) then 						{if(life_Karma < -12400)exitWith{life_Karma = -12500;	systemchat format ["F�r das t�ten eines Zivilisten hast Du %1 Karma verloren! Maximales Negativ Karma erreicht! Karma: %2",_Mod, life_Karma];};					life_Karma = life_Karma + _Mod;	systemchat format ["F�r das t�ten eines Zivilisten hast Du %1 Karma verloren! Karma: %2", _Mod, life_Karma];			[9] call SOCK_fnc_updatePartial;};
	if((_Karma <= -1000) && (_Karma >= -2499)) then {if(life_Karma > 12400)exitWith{life_Karma = 12500;		systemchat format ["F�r das t�ten eines Kriminellen hast Du 100 Karma bekommen! Maximales Positives Karma erreicht! Karma: %2",_Mod, life_Karma];};				life_Karma = life_Karma + 100; 	systemchat format ["F�r das t�ten eines Kriminellen hast Du 100 Karma bekommen! Karma: %2", _Mod, life_Karma];			[9] call SOCK_fnc_updatePartial;};
	if((_Karma <= -2500) && (_Karma >= -4999)) then {if(life_Karma > 12300)exitWith{life_Karma = 12500;		systemchat format ["F�r das t�ten eines Rebellen hast Du 200 Karma bekommen! Maximales Positives Karma erreicht! Karma: %2",_Mod, life_Karma];};				life_Karma = life_Karma + 200; 	systemchat format ["F�r das t�ten eines Rebellen hast Du 200 Karma bekommen! Karma: %2", _Mod, life_Karma];				[9] call SOCK_fnc_updatePartial;};
	if((_Karma <= -5000) && (_Karma >= -9999)) then {if(life_Karma > 12100)exitWith{life_Karma = 12500;		systemchat format ["F�r das t�ten eines bekannten Rebellen hast Du 400 Karma bekommen! Maximales Positives Karma erreicht! Karma: %2",_Mod, life_Karma];};		life_Karma = life_Karma + 400; 	systemchat format ["F�r das t�ten eines bekannten Rebellen hast Du 400 Karma bekommen! Karma: %2", _Mod, life_Karma];	[9] call SOCK_fnc_updatePartial;};
	if(_Karma <= -10000) then 						{if(life_Karma > 11700)exitWith{life_Karma = 12500;		systemchat format ["F�r das t�ten eines hochrangigen Rebellen hast Du 800 Karma bekommen! Maximales Positives Karma erreicht! Karma: %2",_Mod, life_Karma];};	life_Karma = life_Karma + 800; 	systemchat format ["F�r das t�ten eines hochrangigen Rebellen hast Du 800 Karma bekommen! Karma: %2", _Mod, life_Karma];[9] call SOCK_fnc_updatePartial;};