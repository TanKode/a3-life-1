_mode = life_paintballMode;
_number = life_paintballTime;

if(joinmode == 0) then {
	if(life_is_arrested) exitWith {hintSilent "Sie koennen nicht an einem Paintballgame teilnehmen, da Sie momentan im Gefaengnis sitzen!"};
	if(side player != civilian) exitWith {hintSilent "Sie sind kein Zivilist!"};
	if(player getVariable "restrained") exitWith {hintSilent "Sie sind gefesselt und koennen nicht am Paintball teilnehmen!"};
	_PUID = getPlayerUID player;
	_NAME = name player;
	if(life_cash >= 5000) then {
		hint "Es wurde eine Anfage an den Server gesendet, bitte warten Sie einen Moment!";
		[[0,_PUID,_NAME,_mode,_number],"TON_fnc_paintball",false,false] spawn life_fnc_MP;
		joinmode = 1;
		if(_mode == 0) then
		{
			if(paintballGroup1) then
			{
				paintballGroup1 = false;
				publicVariable "paintballGroup1";
						
				_index = 0;
				_group1 = createGroup civilian;
				life_paintball_group pushBack [_index,_group1,false,str(player),getPlayerUID player];
				publicVariable "life_paintball_group";
				[player] joinSilent _group1;
				player setRank "COLONEL";
			}else{
		
				if(paintballGroup2) then
				{
					paintballGroup2 = false;
					publicVariable "paintballGroup2";

					_index = 0;
					_index = _index + 1;
					_group2 = createGroup civilian;
					life_paintball_group pushBack [_index,_group2,false,str(player),getPlayerUID player];
					publicVariable "life_paintball_group";
					[player] joinSilent _group2;
					player setRank "COLONEL";
				};
			};
		};
	}else{
		hint "Sie haben keine $5000 Als Bargeld dabei!";
	};
} else {
	hint "Du bist der Lobby bereits beigetreten, versuche es später noch einmal!";
};