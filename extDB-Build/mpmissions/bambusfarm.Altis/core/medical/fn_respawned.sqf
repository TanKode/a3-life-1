/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
bambusfarm_use_atm = TRUE;
bambusfarm_hunger = 100;
bambusfarm_thirst = 100;
bambusfarm_carryWeight = 0;
bambusfarm_TASCHENGELD = 0; //Make sure we don't get our cash back.
bambusfarm_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

bambusfarm_corpse setVariable["Revive",nil,TRUE];
bambusfarm_corpse setVariable["name",nil,TRUE];
bambusfarm_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new bambusfarm'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn bambusfarm_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn bambusfarm_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn bambusfarm_fnc_medicLoadout;
	};
	waitUntil {scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull bambusfarm_corpse) then {
	private["_containers"];
	bambusfarm_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[bambusfarm_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody bambusfarm_corpse;
};

//Destroy our camera...
bambusfarm_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy bambusfarm_deathCamera;

//Bad boy
if(bambusfarm_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	bambusfarm_is_arrested = false;
	[player,TRUE] spawn bambusfarm_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "bambusfarm_copRecieve") then {
	[[player,bambusfarm_copRecieve,true],"bambusfarm_fnc_wantedBounty",false,false] spawn bambusfarm_fnc_MP;
	bambusfarm_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(bambusfarm_removeWanted) then {
	[[getPlayerUID player],"bambusfarm_fnc_wantedRemove",false,false] spawn bambusfarm_fnc_MP;
};

[] call SOCK_fnc_updateRequest;
[] call bambusfarm_fnc_hudUpdate; //Request update of hud.
[player, uniform player] call bambusfarm_fnc_equipGear;