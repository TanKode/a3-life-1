/*
	File: fn_craftAction.sqf
	Author: EdgeKiller
	Edit: DerOnkel | e-monkeys.com / avanix-gaming.de

	Description:
	Master handling for crafting an item.
*/
private["_dialog","_item","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight","_craftingzones","_spawnPoint","_craftPoints"];

disableSerialization;

_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint "Du musst erst etwas auswählen!";};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
_weight = ([_item] call life_fnc_itemWeight);
_craftingzones = ["crafting_spawn_1","crafting_spawn_2"];
_spawnPoint = "";
_craftPoints = getPos player nearestObject "Land_HelipadSquare_F";

_matsNeed = 0;

_config = [_itemFilter] call life_fnc_craftCfg;
{

	if(_item == _x select 0)then
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

			_str = [_matsNeed select _i] call life_fnc_varToStr;
			_matsNum = _matsNeed select _i+1;

			if((missionNamespace getVariable (_matsNeed select _i)) < _matsNum) exitWith {_allMaterial = false;};

		};
	};
} foreach (_config select 1);

if(!_allMaterial) exitWith {hint "Du hast noch nicht genug davon!";};

if(typeName _craftingzones == typeName []) then 
{
	{
		if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};
	} foreach _craftingzones;
} else {
	if(count(nearestObjects[(getMarkerPos _craftingzones),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _craftingzones};
};

//Some checks
if((count _matsNeed) == 0) exitWith {};

if(_itemFilter == "backpack" && backpack player != "") exitWith{
		hint "Du hast bereit einen Rucksack! Pack den alten erstmal weg.";
};

if(_itemFilter == "veste" && vest player != "") exitWith{
		hint "Du hast bereits was an! Mach dich nackt und versuche es nochmal.";
};

if(_itemFilter == "uniform" && uniform player != "") exitWith{
		hint "Du hast bereits was an! Mach dich nackt und versuche es nochmal.";
};

if(_itemFilter == "item" && (life_carryWeight + _weight) > life_maxWeight) exitWith {
	hint "Du kannst das so nicht bauen! Vielleicht bist du schon voll, oder hast eine Waffe in der Hand.";
};

if(_itemFilter == "weapon" && ((currentWeapon player != "" && (_item != "launch_RPG32_F")) || (_item == "launch_RPG32_F" && secondaryWeapon player != ""))) exitWith {
	hint "Du kannst das so nicht bauen! Vielleicht bist du schon voll, oder hast eine Waffe in der Hand.";
};

if(_itemFilter == "magazine" && !(player canAdd _item) || currentMagazine player != "") exitWith {
	hint "Du kannst das so nicht bauen! Vielleicht bist du schon voll, oder hast eine Waffe in der Hand.";
};

if(_itemFilter == "attachments" && !(player canAdd _item) || currentMagazine player != "") exitWith {
	hint "Du kannst das so nicht bauen! Vielleicht bist du schon voll, oder hast eine Waffe in der Hand. ";
};

if(_itemFilter == "zubehoer" && !(player canAdd _item) || currentMagazine player != "") exitWith {
	hint "Du kannst das so nicht bauen! Vielleicht bist du schon voll, oder hast eine Waffe in der Hand. ";
};

if (_itemFilter == "vehicle" && ( { player distance (getMarkerPos _x) < 30 } count _craftingzones ) < 1) exitWith {
	hint "Du bist nicht in der Nähe einer Craftingzone!";
};

if (_itemFilter == "vehicle" && (_spawnPoint == "")) exitWith {
	hint "Da steht schon ein Fahrzeug auf der Craftingzone!";
};

_oldItem = _matsNeed;
_newItem = _item;

if(_itemFilter == "item") then{
	_itemName = [_newItem] call life_fnc_varToStr;
} else {
	_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
};

_upp = format["Stelle %1 her...",_itemName];
closeDialog 0;

//Setup our progress bar.
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.08;

while{true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep 0.195;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
};

_removeItemSuccess = true;
_invSize = count _oldItem;
for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

	_handledItem = [_oldItem select _i,1] call life_fnc_varHandle;
	if(!([false,_handledItem,_oldItem select _i+1] call life_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};
if(!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
[] call life_fnc_p_updateMenu;

life_is_processing = true;

while{true} do
{
	sleep  0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
};

if(_itemFilter == "backpack") then{
	if(backpack player == "") then{
		player addBackpack _newItem;
	}else{
		hint "Du hast bereit einen Rucksack! Pack den alten erstmal weg.";
		life_is_processing = false;
	};
};

if(_itemFilter == "item") then{
	_handledItem = [_newItem,1] call life_fnc_varHandle;
	[true,_handledItem,1] call life_fnc_handleInv;
};

if(_itemFilter == "uniform") then{
	if(uniform player == "") then{
		player addUniform _newItem;
	}else{
		hint "Du hast bereits was an! Mach dich nackt und versuch es nochmal.";
		life_is_processing = false;
	};
};

if(_itemFilter == "veste") then{
	if(vest player == "") then{
		player addVest _newItem;
	}else{
		hint "Du hast bereits was an! Mach dich nackt und versuch es nochmal.";
		life_is_processing = false;
	};
};

if(_itemFilter == "weapon") then{

	if(player canAdd _newItem) then{
		player addItem _newItem;
	} else {
		if(((currentWeapon player == "" && (_newItem != "launch_RPG32_F")) || (_newItem == "launch_RPG32_F" && secondaryWeapon player == ""))) then{
			player addWeapon _newItem;
		}else{
			5 cutText ["","PLAIN"];
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = [_oldItem select _i,1] call life_fnc_varHandle;
				[true,_handledItem,_oldItem select _i+1] call life_fnc_handleInv;
			};
			life_is_processing = false;
		};
	};
};

if(_itemFilter == "magazine") then{
	if(player canAdd _newItem) then{
		player addItem _newItem;
	} else {
		if(currentWeapon player == "") then{
			player addWeapon _newItem;
		}else{
			5 cutText ["","PLAIN"];
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = [_oldItem select _i,1] call life_fnc_varHandle;
				[true,_handledItem,_oldItem select _i+1] call life_fnc_handleInv;
			};
			life_is_processing = false;
		};
	};
};

if(_itemFilter == "attachments") then{
	if(player canAdd _newItem) then{
		player addItem _newItem;
	} else {
		if(currentWeapon player == "") then{
			player addWeapon _newItem;
		}else{
			5 cutText ["","PLAIN"];
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = [_oldItem select _i,1] call life_fnc_varHandle;
				[true,_handledItem,_oldItem select _i+1] call life_fnc_handleInv;
			};
			life_is_processing = false;
		};
	};
};

if(_itemFilter == "zubehoer") then{
	if(player canAdd _newItem) then{
		player addItem _newItem;
	} else {
		if(currentWeapon player == "") then{
			player addWeapon _newItem;
		}else{
			5 cutText ["","PLAIN"];
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = [_oldItem select _i,1] call life_fnc_varHandle;
				[true,_handledItem,_oldItem select _i+1] call life_fnc_handleInv;
			};
			life_is_processing = false;
		};
	};
};

if(_itemFilter == "vehicle") then 
{
    _vehicle = createVehicle [_newItem, (_craftPoints), [], 0, "NONE"];
	_vehicle setFuel 0;
	_vehicle lock 2;
	//_colorIndex = [_newItem] call life_fnc_vehicleColorCraftCfg;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[[(getPlayerUID player),playerSide,_vehicle],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_mp;
	[[_vehicle],"life_fnc_colorVehicle",true,false] call life_fnc_mp;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	life_vehicles pushBack _vehicle;
	[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;

	_vehicle setHitPointDamage ["HitLFWheel", 1];   _vehicle setHitPointDamage ["HitRFWheel", 1];
	_vehicle setHitPointDamage ["HitLF2Wheel", 1];	_vehicle setHitPointDamage ["HitRF2Wheel", 1];
	_vehicle setHitPointDamage ["HitEngine", 1];	_vehicle setHitPointDamage ["HitBody", 1];
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
};

5 cutText ["","PLAIN"];
//titleText[format["Du hast folgendes hergestellt: %1",_itemName],"PLAIN"];
[ format ["<t color='#EC891D'><t size='1'>Skillstufe %1</t></t><br/> (%2)<br/>Hergestellt: %2", life_SkillBauen+1, _itemName], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;
life_is_processing = false;
life_SkillBauen = life_SkillBauen +1;
[] call SOCK_fnc_updateRequest;
[9] call SOCK_fnc_updatePartial;
[10] call SOCK_fnc_updatePartial;
