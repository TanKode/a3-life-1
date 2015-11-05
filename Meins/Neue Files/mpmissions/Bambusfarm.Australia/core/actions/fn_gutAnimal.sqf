#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Guts the animal?
*/
private["_animalCorpse","_upp","_ui","_progress","_pgText","_cP","_displayName","_item","_item2","_exp"];
_animalCorpse = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _animalCorpse) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Object passed is null?

if(life_inv_messer > 0) then {
	
	if(life_action_gathering) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Action is in use, exit to prevent spamming.
	life_action_gathering = true;
	
	life_interrupted = false;
	if(!((typeOf _animalCorpse) in ["Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Rabbit_F"])) exitWith {};
	if(player distance _animalCorpse > 3.5) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	life_action_inUse = true;
	 switch(typeOf _animalCorpse) do {
		case "Hen_random_F": {_displayName = "Huhn"; _item = "h_eier"; _item2 = "craft_federn";};
		case "Cock_random_F": {_displayName = "Hahn"; _item = "rooster_raw"; _item2 = "craft_federn";};
		case "Goat_random_F": {_displayName = "Ziege"; _item = "goat_raw"; _item2 = "craft_zfell";};
		case "Sheep_random_F": {_displayName = "Schaf"; _item = "sheep_raw"; _item2 = "craft_wolle";};
		case "Rabbit_F": {_displayName = "Kaninchen"; _item = "rabbit_raw"; _item2 = "craft_rfell";};
		default {_displayName = ""; _item = ""; _item2 = "";};
	};

	_rndm1 = [1,2,3] call BIS_fnc_selectRandom; _sum1 = [_item,_rndm1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	_rndm2 = [1,2,3] call BIS_fnc_selectRandom; _sum2 = [_item2,_rndm2,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	
	if(EQUAL(_displayName,"")) exitWith {life_action_inUse = false;life_action_gathering = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

	_upp = format["%1 verarbeiten",_displayName];
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = GVAR_UINS "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	life_action_gathering = true;
	
	while{true} do {
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
			player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};
		uiSleep 0.15;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {life_action_gathering = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(!alive player) exitWith {life_action_gathering = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(isNull _animalCorpse) exitWith {life_action_gathering = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(player != vehicle player) exitWith {life_action_gathering = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(life_interrupted) exitWith {life_action_gathering = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};

	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(isNull _animalCorpse) exitWith {life_action_gathering = false;life_action_gathering = false;life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(life_interrupted) exitWith {life_action_gathering = false;life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(player != vehicle player) exitWith {life_action_gathering = false;titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

	if(([true,_item,_rndm1] call life_fnc_handleInv) && ([true,_item2,_rndm2] call life_fnc_handleInv)) then {
		_itemName1 = M_CONFIG(getText,"VirtualItems",_item,"displayName");
		_itemName2 = M_CONFIG(getText,"VirtualItems",_item2,"displayName");
		deleteVehicle _animalCorpse;
		cutText[format[localize "STR_Process_Animal",_displayName,_rndm1,(localize _itemName1),_rndm2,(localize _itemName2)],"PLAIN DOWN"];
	} else {
		cutText ["Ihr Inventar ist voll!","PLAIN DOWN"];
	};
	_exp = round(random(120));
	[true,_exp] spawn life_fnc_expConfig;
}else{
	hint "Sie besitzen kein Jagtmesser!";
};
life_action_gathering = false;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];