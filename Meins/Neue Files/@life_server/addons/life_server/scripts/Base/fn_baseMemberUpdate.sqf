/*
	File: fn_baseMemberUpdate.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_group","_members","_membersFinal","_maxMembers","_query","_groupID"];
_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;

_groupid =  _group getVariable "gang_id";
_members = _group getVariable "gang_Members";
_maxMembers = _group getVariable ["gang_maxMembers",8];
if(count _members > (_group getVariable ["gang_maxMembers",8])) then {
	_membersFinal = [];
	for "_i" from 0 to _maxMembers -1 do {
		_membersFinal pushBack (_members select _i);
	};	
};

_membersFinal = _group getVariable "gang_members";
_query = format["BaseMembersUpdate:%1:%2",_membersFinal,_groupID];
waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;