#include <macro.h>
/*
    File: fn_sellCargo.sqf
    Author: Matthias Bun

    Description:
    
*/

private["_position","_obj","_boxType","_dir","_pos","_worldspace","_house","_poshouse","_dirhouse","_handel","_base","_mem","_uid","_markerPos","_hou","_init","_isBase"];
_boxType = _this select 0;
closeDialog 0;
_isBase = false;

_base = (call compile format["%1",((life_base select 0) select 0)]) nearestObject "house";
_position = call compile format["%1",((life_base select 0) select 0)];
if((player distance _position) > 145 ) exitWith {hintSilent "Du bist nicht in der nähe deiner Base";[true,_boxType,1] call life_fnc_handleInv;};

if(_base in life_vehicles) then {_isBase = true;} else {hint "Dies ist nicht deine Base"; [true,_boxType,1] call life_fnc_handleInv;};


if (_isBase) then
{
	_uid = getPlayerUID player;
	
	switch (_boxType) do {

		//Sandsacke
		case "bunkerbig": {
			_obj = "Land_BagBunker_Small_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_BagBunker_Small_F";
		};
        
        case "sandsack": {
			_obj = "Land_BagFence_Long_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_BagFence_Long_F";
		};
        
        case "sandsackecke": {
			_obj = "Land_BagFence_Corner_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_BagFence_Corner_F";
		};
        
        case "sandsackrund": {
			_obj = "Land_BagFence_Round_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_BagFence_Round_F";
		};
        
        //H Mauer small
		case "bunkersmall": {
			_obj = "Land_BagBunker_Tower_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_BagBunker_Tower_F";
		};
        
        case "hsmall": {
			_obj = "Land_HBarrier_Big_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,2,1.7]];
			_handel = "Land_HBarrier_Big_F";
		};
        
        case "hsmalleinzel": {
			_obj = "Land_HBarrier_1_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,2,1.7]];
			_handel = "Land_HBarrier_1_F";
		};
        
        //H Mauer Big
		case "hturm": {
			_obj = "Land_HBarrierTower_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,6.5,1.8]];
			_handel = "Land_HBarrierTower_F";
			_obj setDir 180;
		};
        
        case "Hbig": {
			_obj = "Land_HBarrierWall6_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,2,1.7]];
			_handel = "Land_HBarrierWall6_F";
		};
        
        case "hbarrierEcke": {
			_obj = "Land_HBarrierWall_corner_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_HBarrierWall_corner_F";
		};
        
        case "hBarriereCorridor": {
			_obj = "Land_HBarrierWall_corridor_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_HBarrierWall_corridor_F";
		};
        
		//Mauer Sonstiges				
		case "stachel": {
			_obj = "Land_Razorwire_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5,1.7]];
			_handel = "Land_Razorwire_F";
		};
        
        case "lampsmall": {
			_obj = "Land_LampAirport_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_LampAirport_F";
		};
        
        case "schranke": {
			_obj = "Land_BarGate_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,8,1.7]];
			_handel = "Land_BarGate_F";
		};
        
        //Schissstand
        case "schiesswand": {
			_obj = "Land_Shoot_House_Wall_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_Shoot_House_Wall_F";
		};
        
        case "schiesswandfenster": {
			_obj = "Land_Shoot_House_Panels_Windows_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_Shoot_House_Panels_Windows_F";
		};
        
        case "schiesswandducken": {
			_obj = "Land_Shoot_House_Panels_Crouch_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_Shoot_House_Panels_Crouch_F";
		};
        
        case "schiesswandspring": {
			_obj = "Land_Shoot_House_Panels_Vault_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_Shoot_House_Panels_Vault_F";
		};
        
        case "schiessdeckungmitt": {
			_obj = "Land_Shoot_House_Wall_Stand_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_Shoot_House_Wall_Stand_F";
		};
        
        case "schiessdeckungducken": {
			_obj = "Land_Shoot_House_Wall_Crouch_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_Shoot_House_Wall_Crouch_F";
		};
        
        case "schiessdeckungliegen": {
			_obj = "Land_Shoot_House_Wall_Long_Prone_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_Shoot_House_Wall_Long_Prone_F";
		};
        
        case "schiessziel": {
			_obj = "TargetP_Inf3_Acc2_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "TargetP_Inf3_Acc2_F";
		};
        
        case "ziel": {
			_obj = "TargetP_Inf_NoPop_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "TargetP_Inf_NoPop_F";
		};
        //Deko
        case "camo": {
			_obj = "CamoNet_BLUFOR_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,0,1.7]];
			_handel = "CamoNet_BLUFOR_F";
		};
        
        case "map": {
			_obj = "MapBoard_altis_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "MapBoard_altis_F";
		};
		
		case "strom": {
			_obj = "Land_PowerGenerator_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_PowerGenerator_F";
		};
        
        case "sun": {
			_obj = "Land_Sunshade_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_Sunshade_F";
		};
        
        case "fire": {
			_obj = "FirePlace_burning_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "FirePlace_burning_F";
		};
        
        case "stuhl": {
			_obj = "Land_ChairPlastic_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_ChairPlastic_F";
		};
        
        case "stuhl2": {
			_obj = "Land_ChairWood_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_ChairWood_F";
		};
        
        case "lautsp": {
			_obj = "Land_Loudspeakers_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_Loudspeakers_F";
		};
        
        case "firetonne": {
			_obj = "MetalBarrel_burning_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "MetalBarrel_burning_F";
		};

		case "helisquare": {
			_obj = "Land_HelipadSquare_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_HelipadSquare_F";
		};
        
        case "helicircle": {
			_obj = "Land_HelipadCircle_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,0,1.7]];
			_handel = "Land_HelipadCircle_F";
		};
        
        //Groß Gebaeude
		case "bigturm": {
			_obj = "Land_Cargo_Tower_V1_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,13.1]];
			_obj setDir 90;
			_handel = "Land_Cargo_Tower_V1_F";
		};
                
		case "turm": {
			_obj = "Land_Cargo_Patrol_V1_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,5]];
			_obj setDir 90;
			_handel = "Land_Cargo_Patrol_V2_F";
		};
        
        case "cargohq": {
			_obj = "Land_Cargo_HQ_V1_F" createVehicle [0,0,0];
			_obj attachTo[player,[-3,10.5,8.7]];
			_handel = "Land_Cargo_HQ_V1_F";
			hintSilent "Die Shops sind nach Server restart benutzbar";
		};
        
        case "aid": {
			_obj = "Land_Medevac_house_V1_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,8,1.7]];
			_handel = "Land_Medevac_house_V1_F";
		};
        
        //Garage Lager
        case "garage": {
			_obj = "Land_TentHangar_V1_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			_handel = "Land_TentHangar_V1_F";
			hintSilent "Die Garage ist nach Server restart benutzbar";
		};
        
        case "helig": {
			_obj = "Land_dp_bigTank_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,10,1.7]];
			_handel = "Land_dp_bigTank_F";
			hintSilent "Die Garage ist nach Server restart benutzbar";
		};
        
		case "lagerhalle": {
			_obj = "Land_i_Shed_Ind_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,8,1.7]];
			_handel = "Land_i_Shed_Ind_F";
		};		
		
		case "cargoschwarz": {
			_obj = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,1.7]];
			clearWeaponCargoGlobal _obj;
			clearMagazineCargoGlobal _obj;
			clearItemCargoGlobal _obj;
			clearBackpackCargoGlobal _obj;
			_handel = "Box_NATO_AmmoVeh_F";
			hintSilent "Der Container ist nach Server restart benutzbar";
		};
				
		case "storagebigb": {
			_obj = "B_supplyCrate_F" createVehicle [0,0,0];
			//Empty out the crate
			clearWeaponCargoGlobal _obj;
			clearMagazineCargoGlobal _obj;
			clearItemCargoGlobal _obj;
			clearBackpackCargoGlobal _obj;
			_obj attachTo[player,[0,5.5,0.9]];
			_obj setDir 90;
			_handel = "B_supplyCrate_F";
			hintSilent "Der Container ist nach Server restart benutzbar";
		};
		case "cargo": {
			_obj = "Box_IND_AmmoVeh_F" createVehicle [0,0,0];
			//Empty out the crate
			clearWeaponCargoGlobal _obj;
			clearMagazineCargoGlobal _obj;
			clearItemCargoGlobal _obj;
			clearBackpackCargoGlobal _obj;
			_obj attachTo[player,[0,5.5,0.9]];
			_obj setDir 90;
			_handel = "Box_IND_AmmoVeh_F";
			hintSilent "Der Container ist nach Server restart benutzbar";
		};
		
		//Sonstiges
        case "atm": {
			_obj = "Land_Atm_01_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,7,1.7]];
			_handel = "Land_Atm_01_F";
			_obj setDir 90;
		};
		
		case "leiter": {
			_obj = "Land_Scaffolding_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,7,1.7]];
			_handel = "Land_Scaffolding_F";
			_obj setDir 90;
		};
		
		case "lamp1": {
			_obj = "Land_LampDecor_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,1,1.7]];
			_handel = "Land_LampDecor_F";
		};
		
		case "halogen": {
			_obj = "Land_LampHalogen_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,1,1.7]];
			_handel = "Land_LampHalogen_F";
		};
        
        case "laborb": {
			_obj = "Land_WoodenTable_small_F" createVehicle [0,0,0];
			_obj attachTo[player,[0,5.5,0.6]];
			_obj setDir 90;
			_handel = "Land_WoodenTable_small_F";
		};				
	};
	_obj setVariable["house","objDeployed",true];
	
	life_action_objDeploy = player addAction["<t color='#00FF00'>Gebäude aufstellen</t>",{if(!isNull life_obj) then 																						  
	{	
		_position = call compile format["%1",((life_base select 0) select 0)];
		if((player distance _position) > 95 )then 
		{
			detach life_obj; 
			deleteVehicle life_obj;
			[true,life_boxType,1] call life_fnc_handleInv;
			hint"Du bist mehr als 100 Meter von deiner Base entfernt";
			
		}else
		{
			detach life_obj; 

			_poshouse = [(getPosATL life_obj select 0),(getPosATL life_obj select 1),0];
			_dirhouse = getDir life_obj;
			deleteVehicle life_obj;
			
			_house = createVehicle [life_handle , _poshouse, [], 0, "CAN_COLLIDE"];
			_house setPosAtl _poshouse;
			_house setDir _dirhouse;
			_house enableRopeAttach false;
			clearWeaponCargoGlobal _house;
			clearMagazineCargoGlobal _house;
			clearItemCargoGlobal _house;
			clearBackpackCargoGlobal _house;
			_house enableSimulation false;
			
			life_obj = ObjNull;
			
			[[_house],"TON_fnc_spikeStrip",false,false] spawn life_fnc_MP; 
			[[_house,life_base],"TON_fnc_updateObj",false,false] spawn life_fnc_MP;
		};
		
	}; 
	player removeAction life_action_objDeploy; life_action_objDeploy = nil;},"",999,false,false,"",'!isNull life_obj'];		
	life_handle = _handel ;
	life_obj = _obj;
	life_boxType =_boxType;
	[[_obj],"TON_fnc_spikeStrip",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.
};



