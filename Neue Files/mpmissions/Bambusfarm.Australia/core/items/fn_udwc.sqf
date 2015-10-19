_OBJ = nearestObject [player, "Land_CargoBox_V1_F"];
//if (_OBJ == objNull) then {_OBJ = nearestObject [player, "CargoNet_01_barrels_F"];};
//if (_OBJ == objNull) then {_OBJ = nearestObject [player, "Land_CargoBox_V1_F"];};
if(("Land_CargoBox_V1_F" == typeOf _OBJ) OR ("CargoNet_01_barrels_F" == typeOf _OBJ) OR ("CargoNet_01_box_F" == typeOf _OBJ) &&(player distance _OBJ < 30)) then {
	if(!([false,"underwatercharge",1] call life_fnc_handleInv)) exitWith {hint "Error: Kein Objekt gefunden";};
	_ship = _OBJ getVariable "opened";
	_ship_obj = _OBJ;
	if (_ship) then {hint "Die Schatzkiste wurde bereits geoeffnet!"};
	if (!_ship) then {
		hint "Die Sprengladung wurde gelegt, nehmen Sie abstand zu dem Detonationsort!";
		playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _ship_obj];
		_handle = [] spawn life_fnc_waterChargeTimer;
		[[],"life_fnc_waterChargeTimer",west,false] spawn life_fnc_MP;
		waitUntil {scriptDone _handle};
		sleep 0.9;
		"Bo_GBU12_LGB_MI10" createVehicle [getPos _ship_obj select 0, getPos _ship_obj select 1, getPos _ship_obj select 2];
		schiffwoffen = true;
		publicVariableServer "schiffwoffen";
		_exp = round(random(100));
		[true,_exp] spawn life_fnc_expConfig;
	};
};