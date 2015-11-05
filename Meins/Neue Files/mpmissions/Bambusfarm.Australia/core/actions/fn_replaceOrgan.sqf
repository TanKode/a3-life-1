/*
	File: fn_replaceOrgan.sqf
	author: [midgetgrimm]
	Description:
	Replaces stolen organ
*/
life_interrupted = false;
if(life_action_inUse) exitWith {};
if((player getVariable ["Escorting",FALSE])) exitWith {};
if((player getVariable ["Transporting",FALSE])) exitWith {};
if((player getVariable ["restrained",FALSE])) exitWith {};
if(!(player getVariable["missingOrgan",false])) exitWith {hint "Dir fehlt kein Organ!";};
if(life_inv_kidney < 1 ) exitWith {hint "Du brauchst eine Niere zum transplantieren!"};
if(life_inv_organttk < 1) exitWith {hint "Du brauchst ein Transplantationskit!"};
life_action_inUse = true;

if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
sleep 6;

if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Aktion abgerbochen","PLAIN"]; life_action_inUse = false;};
player setVariable["missingOrgan",false,true];
player setFatigue 0.5;
hint "Transplantation erfolgreich!";
life_thirst = 90;
life_hunger = 90;
life_action_inUse = false;
life_inv_kidney = life_inv_kidney - 1;
life_inv_organttk  = life_inv_organttk  - 1;
