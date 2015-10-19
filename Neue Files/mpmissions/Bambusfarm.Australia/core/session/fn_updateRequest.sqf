#include <macro.h>
/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,CASH,BANK];
_array = [];
_arraySkill = [];
_vehInfo = [];
_veh = (nearestObjects[player,["Car","Air","Ship","LandVehicle"],15]);
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"adac"};};

{
	_varName = LICENSE_VARNAME(configName _x,_flag);
	_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;
switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
		_posPlayer = getPos player;
		_packet pushBack _posPlayer;
		_packet pushBack life_isPlayer_alive;
	
		if(count _veh > 0) then 
		{
			{
				_vehicle = _x;
				if(!(_vehicle in life_vehicles)) exitWith {};
				_vehData = _x GVAR["dbinfo",[]];
				_vehPlate = _x GVAR["dbinfo",[]];
				_vehData = SEL(_vehData,0);
				_vehPlate = SEL(_vehPlate,1);
				if(count _vehData > 0) then
				{
					if(EQUAL(_vehData,(getPlayerUID player))) then {
						_vehInfo pushBack _vehPlate;
					};
				};
			}forEach _veh;
		};
	};
};
_packet pushBack _vehInfo;
_packet pushBack LEVEL;
_packet pushBack EXP;
							   
{
	_varName = SKILL_VARNAME(configName _x,_flag);
	_arraySkill pushBack [_varName,SKILL_VALUE(configName _x,_flag)];
}forEach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Skills"));

_packet pushBack _arraySkill;
_packet pushBack SKILLPOINT;
							   
packet = _packet;
[_packet,"DB_fnc_updateRequest",false,false] call life_fnc_MP;
