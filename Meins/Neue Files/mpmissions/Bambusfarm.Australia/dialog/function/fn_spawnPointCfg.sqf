#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Melbourne HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Sydney","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_3","Brisbane","\a3\ui_f\data\map\Markers\NATO\watertower_ca.paa"],
			["cop_spawn_4","Cairns","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_5","Alice Springs","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_6","Perth","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
            ["cop_spawn_7","Broken Hill","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
            ["cop_spawn_8","Toowoomba Hill","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
            ["cop_spawn_9","Staatsgefängnis","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
            ["cop_spawn_10","Sondereinsatzkommando","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
            ["cop_spawn_11","Küstenwache","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
            ["cop_spawn_12","Militaer","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	};
	
	case civilian:
	{
		if(LEVEL == 0) then {
			_return = [
				["ankunft","Ankunft","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		if(life_isPlayer_alive) then
		{
			_return = [
				["last_pos","Letze Position","\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"]
			];
		};
		if(LEVEL >= 1) then {[
			_return pushBack ["civ_spawn_1","Melbourne","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		};
		if(LEVEL >= 2) then {
			_return pushBack ["civ_spawn_3","Sydney","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		};
		if(LEVEL >= 5) then {
			_return pushBack ["civ_spawn_5","Brisbane","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			_return pushBack ["civ_spawn_8","Cairns","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
		};
		if(LEVEL >= 7) then {
			_return pushBack ["civ_spawn_2","Perth","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			_return pushBack ["civ_spawn_4","Alice Springs","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		};
		if((license_civ_rebel) && (LEVEL >= 8)) then
		{
			_return pushBack ["civ_spawn_6","Darwin Rebelen Stadt","icons\rebel.paa"]
		};
		/*//if whitelist rebel, they also get these options
		if(FETCH_CONST(life_rebellevel) == 1) then 
		{ 
			_return pushBack ["gbb_spawn","GBB","icons\rebel.paa"]
		};
				
		if(FETCH_CONST(life_rebellevel) == 2) then 
		{ 
			_return pushBack ["sod_spawn","SoD","icons\rebel.paa"]
		};
				
		if(FETCH_CONST(life_rebellevel) == 3) then 
		{ 
			_return pushBack ["jakuza_spawn","JakuZa","icons\rebel.paa"]
      	};*/
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				//diag_log format["poshouse: %1",_pos];
				_house = _pos nearestObject "house";
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};
		
		if(count life_base > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_base = _pos nearestObject "house";
				_baseName = life_gangData select 2;

				_return pushBack [format["base_%1",(_base getVariable "uid")],_baseName,"icons\rebel.paa"];
			} forEach life_base;
		};	
	};
	
	case independent: {
		
				_return = [
					["medic_spawn_1","Melbourne HQ","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
					["medic_spawn_2","Sydney","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
					["medic_spawn_3","Adelaide","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
                    ["medic_spawn_4","Brisbane","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
                    ["medic_spawn_5","Alice Springs","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
                    ["medic_spawn_6","Perth","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
				];
		};
		
	case east: {
		
				_return = [
					["adac_spawn_1","ADAC Melbourne","icons\wrench.paa"],
					["adac_spawn_2","ADAC Pyrgos","icons\wrench.paa"],
					["adac_spawn_3","ADAC Airport","icons\wrench.paa"]
				];
		};
};

_return;