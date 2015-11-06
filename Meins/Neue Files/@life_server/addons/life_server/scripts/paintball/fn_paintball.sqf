private["_uid","_mode","_name"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_name = [_this,2,"",[""]] call BIS_fnc_param;
_modus = [_this,3,0,[0]] call BIS_fnc_param;
_time = [_this,4,10,[0]] call BIS_fnc_param;

switch (_mode) do{
	case 0:{
		switch (pb_spielstatus) do{
			case 0:{
				if (count (pb_spieler select 0)==0) then {
					[[_time,_modus],"TON_fnc_game",false,false] spawn life_fnc_MP;
					pb_spieler select 0 pushback _uid;
					pb_spieler select 1 pushback _name;
					[[5,"Du wurdest erfolgreich für das kommende Spiel angemeldet!"],"life_fnc_pb_response",_uid,false] spawn life_fnc_MP;
					pb_spielstatus = 1;
				};
			};
			case 1:{
				if (count (pb_spieler select 0)>=pb_maxspieler) exitWith {
					[[1,"Leider hat das Spiel bereits begonnen, versuchen Sie es später noch einmal!!"],"life_fnc_pb_response",_uid,false] spawn life_fnc_MP;
				};
				pb_spieler select 0 pushback _uid;
				pb_spieler select 1 pushback _name;
				[[5,"Du wurdest erfolgreich für das kommende Spiel angemeldet!"],"life_fnc_pb_response",_uid,false] spawn life_fnc_MP;
			};
			case 2:{
				[[1,"Leider hat das Spiel bereits begonnen, versuchen Sie es später noch einmal!"],"life_fnc_pb_response",_uid,false] spawn life_fnc_MP;		
			};

		};
	};
	case 1:{
		//future
	};	
};