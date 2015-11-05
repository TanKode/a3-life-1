private ["_players"];
	_players = [];
	
	
	{
		if (isplayer _x) then
		{
			if (_x isKindOf "man") then {_players pushback _x;};
		};
	} foreach (allunits + alldead);

	_players