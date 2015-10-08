/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a spike strip and preps it.
*/
private["_position","_spikeStrip"];
_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable["item","spikeDeployed",true];

bambusfarm_action_spikeStripDeploy = player addAction[localize "STR_ISTR_Spike_Place",{if(!isNull bambusfarm_spikestrip) then {detach bambusfarm_spikeStrip; bambusfarm_spikeStrip = ObjNull;}; player removeAction bambusfarm_action_spikeStripDeploy; bambusfarm_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull bambusfarm_spikestrip'];
bambusfarm_spikestrip = _spikeStrip;
waitUntil {isNull bambusfarm_spikeStrip};
if(!isNil "bambusfarm_action_spikeStripDeploy") then {player removeAction bambusfarm_action_spikeStripDeploy;};
if(isNull _spikeStrip) exitWith {bambusfarm_spikestrip = ObjNull;};
_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;
bambusfarm_action_spikeStripPickup = player addAction[localize "STR_ISTR_Spike_Pack",bambusfarm_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
[[_spikeStrip],"TON_fnc_spikeStrip",false,false] spawn bambusfarm_fnc_MP; //Send it to the server for monitoring.