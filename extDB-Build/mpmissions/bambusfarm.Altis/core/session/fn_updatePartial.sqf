#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through bambusfarm_fnc_MP
*/
private["_mode","_packet","_array","_flag"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

if(playerside in [west,independent] && (_mode == 9)) exitWith {};
if(playerside in [west,independent] && (_mode == 10)) exitWith {};

if(_mode == 10)exitWith
	{
		_bambusfarm_Skills = [getPlayerUID player, bambusfarm_skillApple, bambusfarm_skillPeach, bambusfarm_skillSalt, bambusfarm_skillSand, bambusfarm_skillIronore, bambusfarm_skillCopperore, bambusfarm_skillDiamond, bambusfarm_skillCannabis, bambusfarm_skillCocaine, bambusfarm_skillHeroinu, bambusfarm_skillOilu, bambusfarm_skillBauen, bambusfarm_skillcoalu, bambusfarm_skillBruchstein, bambusfarm_skillTon, bambusfarm_skillKrabben, bambusfarm_skillFischen];
		[_bambusfarm_Skills,"TON_fnc_insertSkillSys",false,false] spawn bambusfarm_fnc_MP;
	};

switch(_mode) do
{
	case 0:
	{
		_packet set[2,bambusfarm_TASCHENGELD];
	};
	
	case 1:
	{
		_packet set[2,bambusfarm_BANK];
	};
	
	case 2:
	{
		{
			if(_x select 1 == _flag) then
			{
				_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
			};
		} foreach bambusfarm_licenses;
		
		_packet set[2,_array];
	};
	
	case 3:
	{
		[] call bambusfarm_fnc_saveGear;
		_packet set[2,bambusfarm_gear];
	};
	
	case 4:
	{
		//Not yet implemented
	};
	
	case 5:
	{
		_packet set[2,bambusfarm_is_arrested];
	};
	
	case 6:
	{
		_packet set[2,bambusfarm_TASCHENGELD];
		_packet set[4,bambusfarm_BANK];
	};
	case 8:
	{
		//Not yet implemented
	};
	case 9:
	{
		_packet set[2,bambusfarm_Karma];
	};
};

[_packet,"DB_fnc_updatePartial",false,false] call bambusfarm_fnc_MP;