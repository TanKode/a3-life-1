_query = format["gov_removeGov:%1",1];
[_query,1] call DB_fnc_asyncCall;

[[1,"Der Gouverneur wurde getötet! Eine Neuwahl wird in Kürze beginnen!"],"life_fnc_broadcast",true,false] spawn life_fnc_mp;

sleep 300;

[] spawn TON_fnc_newVote;