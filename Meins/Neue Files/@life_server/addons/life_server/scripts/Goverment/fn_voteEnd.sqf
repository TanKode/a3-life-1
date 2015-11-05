_winner = objNull;
_players = [];
_votes = [];
if (count votes == 0) exitWith {};
{
	_players pushBack (_x select 0);
	_votes pushBack (_x select 1);
} forEach votes;
_lowestIndex = 0;
_index = -1;
_highestVotes = 0;
{
	_index = _index + 1;
	if (_x > _highestVotes) then {_lowestIndex = _index;_highestVotes = _x;};
} forEach _votes;
_winner = _players select _lowestIndex;
_message = format ["Glueckwuensch! % 1 hat die Wahl gewonnen und ist nun der neue Praesident!",name _winner];
[[1,_message],"life_fnc_broadcast",true,false] spawn life_fnc_mp;
[[0],"life_fnc_recievedCall",_winner,false] spawn life_fnc_mp;

_query = format["gov_setGov:%1",getPlayerUID _winner];
[_query,1] call DB_fnc_asyncCall;