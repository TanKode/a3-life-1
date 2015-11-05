#include <macro.h>
/*
Author: Bryan "Tonic" Boardwine

Description:
31 hours of no sleep screw your description.
*/
private["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl"];
disableSerialization;
if(isNull (findDisplay 3620)) then {
	if(!(createDialog "Life_My_Perm_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_ownerID = grpPlayer GVAR ["gang_owner",""];
if(_ownerID == "") exitWith {closeDialog 0;}; //Bad juju
_gangName = grpPlayer GVAR "gang_name";
_gangBank = GANG_FUNDS;
_gangMax = grpPlayer GVAR "gang_maxMembers";

if(_ownerID != steamid) then {
	(CONTROL(3620,3622)) ctrlEnable false; //Upgrade
	(CONTROL(3620,3624)) ctrlEnable false; // Kick
	(CONTROL(3620,3625)) ctrlEnable false; //Set New Leader
	(CONTROL(3620,3630)) ctrlEnable false; //Invite Player
	(CONTROL(3620,3631)) ctrlEnable false; //Disband Gang
};

(CONTROL(3620,3629)) ctrlSetText _gangName;
(CONTROL(3620,701)) ctrlSetText format[(localize "STR_GNOTF_Funds")+ " $%1",[_gangBank] call life_fnc_numberText];

//Loop through the players.
_members = CONTROL(3620,3621);
lbClear _members;
{
	if((getPlayerUID _x) == _ownerID) then {
		_members lbAdd format["%1 " +(localize "STR_GNOTF_GangLeader"),(_x GVAR ["realname",name _x])];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	} else {
		_members lbAdd format["%1",(_x GVAR ["realname",name _x])];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	};
} foreach (units grpPlayer);

_grpMembers = units grpPlayer;
_allUnits = playableUnits;
//Clear out the list..
{
	if(_x in _grpMembers OR side _x != civilian && isNil {(group _x) GVAR "gang_id"}) then {
		_allUnits set[_forEachIndex,-1];
	};
} foreach _allUnits;
SUB(_allUnits,[-1]);

_ctrl = CONTROL(3620,3632);
lbClear _ctrl; //Purge the list
{
	_ctrl lbAdd format["%1",_x GVAR ["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} foreach _allUnits;