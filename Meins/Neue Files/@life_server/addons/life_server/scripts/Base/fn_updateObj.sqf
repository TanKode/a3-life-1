/*
	Author: Matthias Bun
	
	Description:
	saves objects to DB
*/
private["_house","_houseID","_containers","_query","_pos","_dir","_kind","_weapons","_magazines","_items","_backpacks","_arr","_id","_obj","_base"];


_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_baseData = [_this,1,0,["",[],0]] call BIS_fnc_param;

if(isNull _obj) exitWith {systemChat "House null";};

_pos = getPosAtl _obj;
_dir = getDir _obj;
_kind = typeof _obj; 
_cargo = ["Box_NATO_AmmoVeh_F","B_supplyCrate_F","Box_IND_AmmoVeh_F"];

if (_kind in _cargo) then
{
	//_base = _pos nearestObject "Land_Cargo_House_V3_F";
	_posBase = call compile format["%1",((_baseData select 0) select 0)];
	_base = _posBase nearestObject "house";
	_houseID = _base getVariable["base_id",-1];
	_slots = _base getVariable "slot";
	if((_pos distance _posBase) < 145) then
	{
		if (_slots < 999999) then 
		{
			_slots = _slots + 1000;
		};
		_base setVariable [ "slot" , _slots , true];
		//_query = format["UPDATE realbase SET slots='%1' WHERE gangid='%2'",_slots,_houseID];
		_query = format["UpdateRealbaseSlots:%1:%2",_slots,_houseID];
		waitUntil{!DB_Async_Active};
		[_query,1] call DB_fnc_asyncCall;
	};
};

_id =round(random 99999);

//_query = format["INSERT INTO object(id, pos, inventory, kind, dir )VALUES('%1', '%2', '""[]""', '%3', '%4')",_id,_pos,_kind,_dir];
_query = format["ObjectAdd:%1:%2:%3:%4:%5",_id,_pos,[],_kind,_dir];

//diag_log format["Query: %1",_query];
waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

_obj setVariable["obj_id",(_id),true];
