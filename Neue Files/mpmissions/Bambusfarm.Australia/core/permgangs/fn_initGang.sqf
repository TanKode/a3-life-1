#include <macro.h>
/*
		Author: Bryan "Tonic" Boardwine

		Description:
		Main initialization for gangs?
*/
private["_exitLoop","_group","_wait"];
if(playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if(EQUAL(count life_gangData,0)) exitWith {}; //Dafuq?

_wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x GVAR "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x GVAR["gang_owner",""];
		_groupID = _x GVAR "gang_id";
		if(EQUAL(_groupOwner,"") OR isNil "_groupID") exitWith {}; //Seriously?
		if(EQUAL(SEL(life_gangData,0),_groupID) && {EQUAL(SEL(life_gangData,1),_groupOwner)}) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if(EQUAL(SEL(life_gangData,1),steamid)) then {
		_group selectLeader player;
		[[player,_group],"TON_fnc_clientGangLeader",(units _group),false] spawn life_fnc_MP;
	};
} else {
	_group = group player;
	_group SVAR ["gang_id",(life_gangData select 0),true];
	_group SVAR ["gang_owner",(life_gangData select 1),true];
	_group SVAR ["gang_name",(life_gangData select 2),true];
	_group SVAR ["gang_maxMembers",(life_gangData select 3),true];
	_group SVAR ["gang_bank",(life_gangData select 4),true];
	_group SVAR ["gang_members",(life_gangData select 5),true];
};