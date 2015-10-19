#include <macro.h>
/*
	File: fn_removeBaseObj.sqf
	Autor: Unknown 
	Edit: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_obj","_id","_kind","_action","_position","_action","_name"];
_obj = getPosATL player nearestObject "Building";
closeDialog 0;
if(EQUAL(life_base,[])) exitWith {hintSilent "Sie besitzen noch keine Gang Base"};
_position = call compile format["%1",((life_base select 0) select 0)];

if((player distance _position) > 95 ) exitWith {hintSilent "Sie sind nicht in der naehe ihrer Base!"}; 
if(isNull _obj) exitWith {hintSilent "Kein Gebaeude zum Abreissen in deiner naehe!"};

_id = _obj GVAR "obj_id";
_kind = typeOf _obj;

_name = getText(configFile >> "CfgVehicles" >> _kind >> "displayName");

if(life_inv_abrissbirne > 0) then
{
	_action = [
				format["Sind Sie sich Sicher dass Sie %1 abreissen wollen?",_name],
				"Abreissen?",
				"Ja",
				"Nein"
			] call BIS_fnc_guiMessage;
	
	if(_action) then
	{
		switch(_kind) do
		{
			case "Land_BagBunker_Small_F": {
				[true,"bunkerbig",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_BagFence_Long_F": {
				[true,"sandsack",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_BagFence_Corner_F": {
				[true,"sandsackecke",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_BagFence_Round_F": {
				[true,"sandsackrund",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_BagBunker_Tower_F": {
				[true,"bunkersmall",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_HBarrier_Big_F": {
				[true,"hsmall",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_HBarrier_1_F": {
				[true,"hsmalleinzel",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_HBarrierTower_F": {
				[true,"hturm",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			 case "Land_HBarrierWall6_F": {
				[true,"Hbig",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_HBarrierWall_corner_F": {
				[true,"hbarrierEcke",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_HBarrierWall_corridor_F": {
				[true,"hBarriereCorridor",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Razorwire_F": {
				[true,"stachel",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_LampAirport_F": {
				[true,"lampsmall",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
            
            case "Land_LampAirport_F": {
				[true,"lampsmall",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_BarGate_F": {
				[true,"schranke",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Shoot_House_Wall_F": {
				[true,"schiesswand",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Shoot_House_Panels_Windows_F": {
				[true,"schiesswandfenster",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Shoot_House_Panels_Crouch_F": {
				[true,"schiesswandducken",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Shoot_House_Panels_Vault_F": {
				[true,"schiesswandspring",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Shoot_House_Wall_Stand_F": {
				[true,"schiessdeckungmitt",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Shoot_House_Wall_Crouch_F": {
				[true,"schiessdeckungducken",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Shoot_House_Wall_Long_Prone_F": {
				[true,"schiessdeckungliegen",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "TargetP_Inf3_Acc2_F": {
				[true,"schiessziel",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "TargetP_Inf_NoPop_F": {
				[true,"ziel",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "CamoNet_BLUFOR_F": {
				[true,"camo",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "MapBoard_altis_F": {
				[true,"map",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_PowerGenerator_F": {
				[true,"strom",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Sunshade_F": {
				[true,"sun",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "FirePlace_burning_F": {
				[true,"fire",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_ChairPlastic_F": {
				[true,"stuhl",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_ChairWood_F": {
				[true,"stuhl2",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
            
            case "Land_Loudspeakers_F": {
				[true,"lautsp",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
            
            case "MetalBarrel_burning_F": {
				[true,"firetonne",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_HelipadSquare_F": {
				[true,"helisquare",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_HelipadCircle_F": {
				[true,"helicircle",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Cargo_Tower_V1_F": {
				[true,"bigturm",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Cargo_Patrol_V1_F": {
				[true,"turm",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Medevac_house_V1_F": {
				[true,"aid",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_TentHangar_V1_F": {
				[true,"garage",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_dp_bigTank_F": {
				[true,"helig",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_i_Shed_Ind_F": {
				[true,"lagerhalle",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Box_NATO_AmmoVeh_F": {
				[true,"cargoschwarz",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "B_supplyCrate_F": {
				[true,"storagebigb",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Box_IND_AmmoVeh_F": {
				[true,"cargo",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Atm_01_F": {
				[true,"atm",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_Scaffolding_F": {
				[true,"leiter",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_LampDecor_F": {
				[true,"lamp1",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_LampHalogen_F": {
				[true,"halogen",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
			
			case "Land_WoodenTable_small_F": {
				[true,"laborb",1] call life_fnc_handleInv;
				deleteVehicle _obj;
				ADD(life_abrissbirne,1);
			};
		};
		
		if(EQUAL(life_abrissbirne,10)) then
		{
			hintSilent "Die Abrissbirne ist zu stark beschaedigt, sie kann nicht mehr eingesetzt werden!";
			[false,"abrissbirne",1] call life_fnc_handleInv;
			life_abrissbirne = 0;
		};
		//systemChat format["%1 %2 %3",_id,_kind,_obj];
		[[_id,_kind],"TON_fnc_removeObj",false,false] spawn life_fnc_MP;
	};
}else{
	hintSilent "Sie besitzen keine Abriessbirne!";
};