_markerArray = [];


_markerArraySt1 = [["sv_con1","sv_con2","sv_con3","sv_con4","sv_con5","sv_con6"],["sv_pos1","sv_pos2","sv_pos3","sv_pos4","sv_pos5","sv_pos6","sv_pos7","sv_pos8","sv_pos9","sv_pos10"]];
_markerArraySt2 = [["sv_con7","sv_con8","sv_con9","sv_con10","sv_con11","sv_con12"],["sv_pos11","sv_pos12","sv_pos13","sv_pos14","sv_pos15","sv_pos16","sv_pos17","sv_pos18","sv_pos19","sv_pos20"]];
_markerArraySt3 = [["sv_con13","sv_con14","sv_con15","sv_con16","sv_con17","sv_con18"],["sv_pos21","sv_pos22","sv_pos23","sv_pos24","sv_pos25","sv_pos26","sv_pos27","sv_pos28","sv_pos29","sv_pos30"]];
_markerArraySt4 = [["sv_con19","sv_con20","sv_con21","sv_con22","sv_con23","sv_con24"],["sv_pos31","sv_pos32","sv_pos33","sv_pos34","sv_pos35","sv_pos36","sv_pos37","sv_pos38","sv_pos39","sv_pos40"]];


_possibleMarkerArray =[_markerArraySt1,_markerArraySt2,_markerArraySt3,_markerArraySt4];
_markerInArr1 = count _possibleMarkerArray;
_markerInArr = floor(random _markerInArr1);
_markerTempToAdd = _possibleMarkerArray select _markerInArr;
_markerArray = _markerTempToAdd select 1;
_spawnMarker = _markerTempToAdd select 0;

c1 = ([getMarkerPos (_spawnMarker select 0), 0, "B_APC_Tracked_01_rcws_F", WEST] call bis_fnc_spawnvehicle) select 0;
c2 = ([getMarkerPos (_spawnMarker select 1), 0, "B_APC_Wheeled_01_cannon_F", WEST] call bis_fnc_spawnvehicle) select 0;
c3 = ([getMarkerPos (_spawnMarker select 2), 0, "B_Truck_01_covered_F", WEST] call bis_fnc_spawnvehicle) select 0;
c4 = ([getMarkerPos (_spawnMarker select 3), 0, "B_APC_Wheeled_01_cannon_F", WEST] call bis_fnc_spawnvehicle) select 0;
c5 = ([getMarkerPos (_spawnMarker select 4), 0, "O_MRAP_02_gmg_F", WEST] call bis_fnc_spawnvehicle) select 0;
c6 = ([getMarkerPos (_spawnMarker select 5), 0, "B_Heli_Attack_01_F", WEST] call bis_fnc_spawnvehicle) select 0;

_vehicleArray = [c1,c2,c3,c4,c5,c6];
mainMissionVehicles = _vehicleArray;
mainMissionVehicle = c3;

_possibleLootArrayVItems   = [["goldbar",10],["goldbar",30],["goldbarp",10],["goldbarp",30],["banane",100],["apple",100],["craft_stoff",40]];
_lootAmount = 3;
_lootArray = _possibleLootArrayVItems;
_lootTempToAdd = [];
_lootArrayFinal = [];

[[3,"<t size='1.2'><t color='#FF0000'>Convoy-Mission</t></t><br/><br/><t size='1'>Ein Transport mit wervoller Fracht ist auf Altis unterwegs!!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

while {_lootAmount>0} do {
	_lootAmount = _lootAmount - 1;
	_loot_inArr = count _lootArray;
	_inArr = floor(random _loot_inArr);
	_lootTempToAdd = _lootArray select _inArr;
	_lootArrayFinal = _lootArrayFinal + [_lootTempToAdd];
};

		{
			clearWeaponCargoGlobal _x;
			clearMagazineCargoGlobal _x;
			clearItemCargoGlobal _x;
			clearBackpackCargoGlobal _x;
			_x enableRopeAttach false;
		} forEach mainMissionVehicles;

		// Add items to the weaponholder
		_amountToBeSpawned         = 30;
		_possibleLootArrayWeapons  = [];
		_possibleLootArrayMags     = [];
		_possibleLootArrayItems    = [];
	
		//[[3,"<t size='1.2'><t color='#FF0000'>Military-Convoy-Mission</t></t><br/><br/><t size='1'>Das Hauptfahrzeug des Konvoys wurde ausreichend beschaedigt!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

		// Do not modify
		for "_x" from 1 to _amountToBeSpawned step 1 do {
			_whichArray = floor(random 3);
			switch (_whichArray) do {
				case 0:
				{
					_random2 = floor(random (count _possibleLootArrayWeapons));
					_itemToAdd = ["",0];
					if (count _possibleLootArrayWeapons > 0) then {_itemToAdd = _possibleLootArrayWeapons select _random2;};
					mainMissionVehicle addWeaponCargoGlobal _itemToAdd;
				};
				case 1:
				{
					_random2 = floor(random (count _possibleLootArrayMags));
					_itemToAdd = ["",0];
					if (count _possibleLootArrayMags > 0) then {_itemToAdd = _possibleLootArrayMags select _random2;};
					mainMissionVehicle addMagazineCargoGlobal _itemToAdd;
				};
				case 2:
				{
					_random2 = floor(random (count _possibleLootArrayItems));
					_itemToAdd = ["",0];
					if (count _possibleLootArrayItems > 0) then {_itemToAdd = _possibleLootArrayItems select _random2;};
					mainMissionVehicle addItemCargoGlobal _itemToAdd;
				};
			};
		};

mainMissionVehicle setVariable ["Trunk",[_lootArrayFinal,1000],true];
mainMissionVehicle setVariable ["locked",false];

// DO NOT MODIFY

_dhjjiews = _markerArray select ((count _markerArray) - 1);
ConvoySM_destination = getMarkerPos _dhjjiews;
ConvoySM_hitArray = [];
{
	_x addEventHandler ["FiredNear",{
		_shooter = _this select 1;
		[_shooter] spawn {
				sleep 60;
				_gunner = _this select 0;
				ConvoySM_hitArray = ConvoySM_hitArray - [_gunner];
		};
		if (!(_shooter in ConvoySM_hitArray)) then {
			ConvoySM_hitArray = ConvoySM_hitArray + [_shooter];
			[[],"life_fnc_setRating",_shooter,false] spawn life_fnc_MP;
		};
	}];

	{
		_x addEventHandler ["Hit",{
			_shooter = _this select 1;
			[_shooter] spawn {
				sleep 60;
				_gunner = _this select 0;
				ConvoySM_hitArray = ConvoySM_hitArray - [_gunner];
			};
			if (!(_shooter in ConvoySM_hitArray)) then {
				ConvoySM_hitArray = ConvoySM_hitArray + [_shooter];
				[[],"life_fnc_setRating",_shooter,false] spawn life_fnc_MP;
			};
		}];
	} forEach crew _x;
	_x setVehicleLock "LOCKEDPLAYER";
} forEach _vehicleArray;

ConvoySM_restartAllow = true;
ConvoySM_finished = false;

[] spawn {
	waitUntil { (mainMissionVehicle distance ConvoySM_destination < 100) || getDammage mainMissionVehicle >= 0.4 };
	if ((mainMissionVehicle distance ConvoySM_destination < 150)) then
	{
		mainMissionVehicle setDamage 0;
		{
			{
				deleteVehicle _x;
			} forEach (crew _x);
			deleteVehicle _x;
		} forEach mainMissionVehicles;
		[[3,"<t size='1.2'><t color='#FF0000'>Convoy-Mission</t></t><br/><br/><t size='1'>Der Transport hat sein Ziel erreicht die Mission ist beendet!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};

	if (getDammage mainMissionVehicle >= 0.9 AND mainMissionVehicle distance ConvoySM_destination > 100) then {
		ConvoySM_restartAllow = false;
		ConvoySM_finished = true;
	};
};

[_markerArray,_vehicleArray,true] execVM "\life_server\scripts\ConvoySM\init.sqf";