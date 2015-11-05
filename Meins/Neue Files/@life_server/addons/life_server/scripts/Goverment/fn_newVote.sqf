[[1,"Eine Wahl zum neuen Praesidenten beginnt, jetzt abstimmen! Die Wahl wird in 10 Minuten beendet"],"life_fnc_broadcast",true,false] spawn life_fnc_mp;
life_canVote = true;
votes = [];
publicVariable "life_canVote";
sleep (10 * 60);
life_canVote = false;
publicVariable "life_canVote";
[] spawn TON_fnc_voteEnd;