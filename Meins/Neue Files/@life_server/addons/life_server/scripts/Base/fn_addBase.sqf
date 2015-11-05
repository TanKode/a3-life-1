/*
	Author: Bryan "Tonic" Boardwine
	Edit: MAtthias Bun
	Description:
	Blah
*/
private["_house","_uid","_housePos","_query","_gangMembers","_group","_groupid","_slot"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR _uid == "") exitWith {};

_group = [_this,2,grpNull,[grpNull]] call BIS_fnc_param;
_slot = 3000;
_groupid =  _group getVariable "gang_id";
//_gangMembers = [(_group getVariable "gang_members")] call DB_fnc_mresArray;
_gangMembers = _group getVariable "gang_members";

_housePos = getPosATL _house;

//_query = format["INSERT INTO base (pid, pos, inventory, owned, gangid) VALUES('%1', '%2', '""[[],0]""', '1', '%3')",_uid,_housePos ,_groupid];
_query = format["BaseAdd2:%1:%2:%3:%4:%5:%6:%7",_uid,_housePos,[[],0],[],_gangMembers,1,_groupid];
diag_log format["Query: %1",_query];
waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
sleep 0.3;


//_query = format["INSERT INTO realbase (pos, inventory, gangid, slots) VALUES('%1','""[[],0]""', '%2', '%3')",_housePos, _groupid, _slot ];
_query = format["RealBaseAdd:%1:%2:%3:%4",_housePos,[[],0],_groupid,_slot];
diag_log format["Query: %1",_query];
waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;


sleep 0.3;
waitUntil{!DB_Async_Active};
//_query = format["SELECT id FROM base WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid];
_query = format["SelectBase:%1:%2",_housePos,_uid];
_queryResult = [_query,2] call DB_fnc_asyncCall;
//systemChat format["House ID assigned: %1",_queryResult select 0];
_house setVariable["base_id",(_queryResult select 0),true];