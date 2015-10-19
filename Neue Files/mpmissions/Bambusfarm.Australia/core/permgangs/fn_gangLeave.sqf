#include <macro.h>
/*
Author: Bryan "Tonic" Boardwine

Description:
32 hours later...
*/
private["_grp","_grpMembers"];
if(EQUAL(steamid,(grpPlayer GVAR "gang_owner"))) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grp = grpPlayer;
_grpMembers = grpPlayer GVAR "gang_members";
SUB(_grpMembers,[steamid]);
[player] joinSilent (createGroup civilian);
_grp SVAR ["gang_members",_grpMembers,true];

[[4,_grp],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
[[_grp],"TON_fnc_baseMemberUpdate",false,false] spawn life_fnc_MP;
closeDialog 0;