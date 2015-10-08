/*
	File: fn_insertSkillSys.sqf
	Author: Dscha

	Description:
	Inserts Stuff to DB
*/
	private["_uid","_query"];

	_uid = [_this,0,"",[""]] call BIS_fnc_param;
	//_type = [_this,1,"",[""]] call BIS_fnc_param;
		
		//Obsolete/Altes Vorgehen... Hatte bei jedem Sammelvorgang etwas in die DB geschrieben! Bei 20 Leuten vllt. noch okay, bei 60 Leuten sinnbefreit und Ressourcenverschwendend!
		//_query = format["UPDATE skillsys SET %1 = %1 + 1 WHERE playerid=%2",_type,_uid];
		//diag_log format ["InsertSkillSys query : %1", _query];
		
		//waitUntil {!DB_Async_Active};
		//_thread = [_query,false] spawn DB_fnc_asyncCall;
		//waitUntil {scriptDone _thread};

		_query = format["UPDATE skillsys SET bambusfarm_Apfel = %2, bambusfarm_Pfirsich = %3, bambusfarm_Salz = %4, bambusfarm_Sand = %5, bambusfarm_EisenRoh = %6, bambusfarm_KupferRoh = %7, bambusfarm_DiamantenRoh = %8, bambusfarm_CannabisRoh = %9, bambusfarm_KokainRoh = %10, bambusfarm_HeroinRoh = %11, bambusfarm_OelRoh = %12, bambusfarm_Bauen = %13, bambusfarm_KohleRoh = %14, bambusfarm_Bruchstein = %15, bambusfarm_TonRoh = %16, bambusfarm_Krabben = %17, bambusfarm_Fischen  = %18 WHERE playerid='%1'",
		_uid,
		_this select 1,
		_this select 2,
		_this select 3,
		_this select 4,
		_this select 5,
		_this select 6,
		_this select 7,
		_this select 8,
		_this select 9,
		_this select 10,
		_this select 11,
		_this select 12,
		_this select 13,
		_this select 14,
		_this select 15,
		_this select 16,
		_this select 17];
		
		diag_log format ["InsertSkillSys Update ID: %1 : %2", _uid, _query];
		waitUntil {!DB_Async_Active};
		_thread = [_query,false] spawn DB_fnc_asyncCall;
		waitUntil {scriptDone _thread};