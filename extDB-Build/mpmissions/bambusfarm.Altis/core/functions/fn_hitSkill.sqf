//::::::::::::  ::::::::::::\\
//	Filename: bambusfarm/fn_bambusfarm_KillMalus.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Zieht Skillpunkte bei Spielern ab, die jemanden erschossen haben.
//::::::::::::  ::::::::::::\\
private["_rndm","_amount","_type","_remove","_Msg","_Display"];

	if(playerSide != civilian) exitWith {};
	
	//if(bambusfarm_Karma >= -3000) exitWith {systemchat format ["NOCH hast Du genügend Karma übrig, bis zusätzlich Skillpunkte abgezogen werden: %1 Punkte übrig",(bambusfarm_Karma + 2999)];};
	
	_Msg = {systemchat format ["Für das töten eines Spielers hast Du %1 Punkte beim Skill %2 verloren!", _amount, _Display]};
	_remove = {[[getPlayerUID player, _type, _amount],"TON_fnc_removeSkillSys",false,false] call bambusfarm_fnc_MP; call _Msg};
	_rndm = round(random 8);
	if (_rndm == 0) then	{if(bambusfarm_skillCocaine < 199) exitWith {call bambusfarm_fnc_hitSkill};		_type = "bambusfarm_CannabisRoh";		_Display = "Cannabis";	_amount = "100";	bambusfarm_skillCocaine = bambusfarm_skillCocaine - 100;				call _remove;};
	if (_rndm == 1) then	{if(bambusfarm_skillcoalu < 199) exitWith {call bambusfarm_fnc_hitSkill};		_type = "bambusfarm_KohleRoh";		_Display = "Kohle";		_amount = "100";	bambusfarm_skillcoalu = bambusfarm_skillcoalu - 100;			call _remove;};
	if (_rndm == 2) then	{if(bambusfarm_skillDiamond < 199) exitWith {call bambusfarm_fnc_hitSkill};	_type = "bambusfarm_DiamantenRoh";	_Display = "Diamanten";	_amount = "50";		bambusfarm_skillDiamond = bambusfarm_skillDiamond - 50;			call _remove;};
	if (_rndm == 3) then	{if(bambusfarm_skillCopperore < 199) exitWith {call bambusfarm_fnc_hitSkill};	_type = "bambusfarm_KupferRoh";	_Display = "Kupfer";	_amount = "100";	bambusfarm_skillCopperore = bambusfarm_skillCopperore - 100;	call _remove;};
	if (_rndm == 4) then	{if(bambusfarm_skillIronore < 199) exitWith {call bambusfarm_fnc_hitSkill};	_type = "bambusfarm_EisenRoh";		_Display = "Eisen";		_amount = "100";	bambusfarm_skillIronore = bambusfarm_skillIronore - 100;		call _remove;};
	if (_rndm == 5) then	{if(bambusfarm_skillSalt < 199) exitWith {call bambusfarm_fnc_hitSkill};		_type = "bambusfarm_Salz";			_Display = "Salz";		_amount = "100";	bambusfarm_skillSalt = bambusfarm_skillSalt - 100;				call _remove;};
	if (_rndm == 6) then	{if(bambusfarm_skillSand < 199) exitWith {call bambusfarm_fnc_hitSkill};		_type = "bambusfarm_Sand";			_Display = "Sand";		_amount = "100";	bambusfarm_skillSand = bambusfarm_skillSand - 100;				call _remove;};
	if (_rndm == 7) then	{if(bambusfarm_skillOilu < 199) exitWith {call bambusfarm_fnc_hitSkill};		_type = "bambusfarm_OelRoh";		_Display = "Öl";		_amount = "100";	bambusfarm_skillOilu = bambusfarm_skillOilu - 100;				call _remove;};
	if (_rndm == 8) then	{if(bambusfarm_skillFischen < 199) exitWith {call bambusfarm_fnc_hitSkill};	_type = "bambusfarm_Fischen";		_Display = "Fischen";	_amount = "100";	bambusfarm_skillFischen = bambusfarm_skillFischen - 100;		call _remove;};