#include "\life_server\script_macros.hpp"
/*
	File: fn_craftAction.sqf
	Author: EdgeKiller

	Description:
	Master handling for crafting an item.
*/
private["_dialog","_item","_itemInfo","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_invSize","_handledItem"];

disableSerialization;
_filter = craft_filter;
_shop = craft_shop;
_dialog = findDisplay 766;
if((lbCurSel 769) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[769,(lbCurSel 769)];
if(life_action_inUse) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
_allMaterial = true;
_bigWeapons = ["srifle_EBR_SOS_F","launch_RPG32_F","srifle_LRR_F"];
_backpack = ["B_Carryall_cbr","B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_oli","B_Carryall_khk","B_Parachute"];
_bool = true;
_vAddItem = [];

_matsNeed = 0;

_config = [_filter] call life_fnc_craftCfg;

if(EQUAL(_shop,"weapons")) then 
{
	if(EQUAL(_filter,0)) then
	{
		if(_item in _bigWeapons) then
		{
			
		}else{
			if(!(player canAdd _item)) exitWith {hint localize "STR_NOTF_NoRoom";};
		};
		
		{
			if(EQUAL(_item,SEL(_x,0)))then
			{
				_matsNeed = SEL(_x,1);
				_invSize = count _matsNeed;

				for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {

					_str = M_CONFIG(getText,"VirtualItems",(SEL(_matsNeed,_i)),"displayName");
					_matsNum = SEL(_matsNeed,(_i+1));

					if(ITEM_VALUE(SEL(_matsNeed,_i)) < _matsNum) exitWith {_allMaterial = false;};

				};
			};
		} foreach _config;
	};
	
	if(EQUAL(_filter,1)) then
	{
		{
			if(EQUAL(_item,SEL(_x,0)))then
			{
				_matsNeed = SEL(_x,1);
				_invSize = count _matsNeed;

				for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {

					_str = M_CONFIG(getText,"VirtualItems",(SEL(_matsNeed,_i)),"displayName");
					_matsNum = SEL(_matsNeed,(_i+1));

					if(ITEM_VALUE(SEL(_matsNeed,_i)) < _matsNum) exitWith {_allMaterial = false;};

				};
			};
		} foreach _config;
		
	};
};
	
if(EQUAL(_shop,"vehicles")) then 
{
	if(EQUAL(_filter,0)) then 
	{
		{
			if(EQUAL(_item,SEL(_x,0)))then
			{
				_matsNeed = SEL(_x,1);
				_invSize = count _matsNeed;
				_vAddItem = SEL(_x,2);

				for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {

					_str = M_CONFIG(getText,"VirtualItems",(SEL(_matsNeed,_i)),"displayName");
					_matsNum = SEL(_matsNeed,(_i+1));

					if(ITEM_VALUE(SEL(_matsNeed,_i)) < _matsNum) exitWith {_allMaterial = false;};

				};
			};
		} foreach _config;
	};

	if(EQUAL(_filter,1)) then
	{
		{
			if(EQUAL(_item,SEL(_x,0)))then
			{
				_matsNeed = SEL(_x,1);
				_invSize = count _matsNeed;
				invSize = count _matsNeed;
				
				for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {

					_str = M_CONFIG(getText,"VirtualItems",(SEL(_matsNeed,_i)),"displayName");
					_matsNum = SEL(_matsNeed,(_i+1));
					matsNum = SEL(_matsNeed,(_i+1));

					if(ITEM_VALUE(SEL(_matsNeed,_i)) < _matsNum) exitWith {_allMaterial = false;};

				};
			};
		} foreach _config;
	};
};

if(EQUAL(_shop,"clothing")) then
{
    if(EQUAL(_filter,0)) then
	{
		{
			if(EQUAL(_item,SEL(_x,0)))then
			{
				_matsNeed = SEL(_x,1);
				_invSize = count _matsNeed;

				for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {

					_str = M_CONFIG(getText,"VirtualItems",(SEL(_matsNeed,_i)),"displayName");
					_matsNum = SEL(_matsNeed,(_i+1));

					if(ITEM_VALUE(SEL(_matsNeed,_i)) < _matsNum) exitWith {_allMaterial = false;};

				};
			};
		} foreach _config;
	};
	
	if(EQUAL(_filter,1)) then
	{
		{
			if(EQUAL(_item,SEL(_x,0)))then
			{
				_matsNeed = SEL(_x,1);
				_invSize = count _matsNeed;

				for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {

					_str = M_CONFIG(getText,"VirtualItems",(SEL(_matsNeed,_i)),"displayName");
					_matsNum = SEL(_matsNeed,(_i+1));

					if(ITEM_VALUE(SEL(_matsNeed,_i)) < _matsNum) exitWith {_allMaterial = false;};

				};
			};
		} foreach _config;
		
	};  
};
if(!_allMaterial) exitWith {hint localize "STR_PM_NoMaterial";};

//Error checking
if((count _matsNeed) == 0) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};


//Setup vars.
_oldItem = _matsNeed;
_newItem = _item;
newItem = _item;

if(EQUAL(_shop,"weapons")) then 
{
	if(_filter == 0) then
	{
		_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
		_itemName = SEL(_itemInfo,1);
		_upp = format["Baue %1",_itemName];
	};
	
	if(EQUAL(_filter,1)) then
	{
		_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
		_upp = format["Baue %1",(localize _itemName)];
	};
};

if(EQUAL(_shop,"vehicles")) then 
{
	if(EQUAL(_filter,0)) then
	{
		_itemName = M_CONFIG(getText,"VirtualItems",_vAddItem,"displayName");
		_upp = format["Baue %1",(localize _itemName)];
	};
	
	if(EQUAL(_filter,1)) then
	{
		_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
		_upp = format["Baue %1",(localize _itemName)];
	};
};

if(EQUAL(_shop,"clothing")) then 
{
	if(EQUAL(_filter,0)) then
	{
		_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
		_itemName = SEL(_itemInfo,1);
		_upp = format["Schneider %1",_itemName];
	};
	
	if(EQUAL(_filter,1)) then
	{
		_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
		_upp = format["Webe %1",(localize _itemName)];
	};
};

//Some more checks
if(EQUAL((count _oldItem),0)) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

life_is_processing = true;

closeDialog 0;

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
				player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1 OR !alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(life_istazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];}; //Tazed
	if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if((player getVariable["restrained",false])) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
};
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if((player getVariable["restrained",false])) exitWith {life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

_removeItemSuccess = true;
_invSize = count _oldItem;
for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
	
	_handledItem = M_CONFIG(getText,"VirtualItems",(SEL(_oldItem,_i)),"variable");
	if(!([false,_handledItem,(SEL(_oldItem,(_i+1)))] call life_fnc_handleInv)) exitWith {_removeItemSuccess = false;hint format["Sie haben nicht genug platz in ihrem Inventar, deswegen wurden ihnen ihre Materialien zurueckerstattet!"];_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

};
if(!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
[] call life_fnc_p_updateMenu;


if(EQUAL(_shop,"weapons")) then 
{
	if(_filter == 0 )then 
	{
		if(_item in _bigWeapons) then {
			if(!(player addWeapon _item)) exitWith {
				5 cutText ["","PLAIN"];

				for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
					_handledItem = M_CONFIG(getText,"VirtualItems",(SEL(_oldItem,_i)),"variable");
					[true,_handledItem,(SEL(_oldItem,(_i+1)))] call life_fnc_handleInv;
				};
				life_is_processing = false;
				_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
			};
		}else{
			if(!(player addItem _item)) exitWith {
				5 cutText ["","PLAIN"];

				for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
					_handledItem = M_CONFIG(getText,"VirtualItems",(SEL(_oldItem,_i)),"variable");
					[true,_handledItem,(SEL(_oldItem,(_i+1)))] call life_fnc_handleInv;
				};
				life_is_processing = false;
				_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
			};
		};	
	};
	
	if(EQUAL(_filter,1)) then
	{
		if(!([true,_newItem,1] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAN"];
		
			for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
				_handledItem = M_CONFIG(getText,"VirtualItems",(SEL(_oldItem,_i)),"variable");
				[true,_handledItem,(SEL(_oldItem,(_i+1)))] call life_fnc_handleInv;	
			};
			life_is_processing = false;
			_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
		};
	};
	
};

if(EQUAL(_shop,"vehicles")) then 
{	
	if(EQUAL(_filter,0)) then
	{
		if(!([true,_vAddItem,1] call life_fnc_handleInv)) exitWith {
			5 cutText ["","PLAN"];

			for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
				_handledItem = M_CONFIG(getText,"VirtualItems",(SEL(_oldItem,_i)),"variable");
				[true,_handledItem,(SEL(_oldItem,(_i+1)))] call life_fnc_handleInv;	
			};
			life_is_processing = false;	
			_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
		};
	};
	
	if(EQUAL(_filter,1)) then
	{
		hint "test3";
		if(!([true,_newItem,1] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAN"];
		
			for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
				_handledItem = M_CONFIG(getText,"VirtualItems",(SEL(_oldItem,_i)),"variable");
				[true,_handledItem,(SEL(_oldItem,(_i+1)))] call life_fnc_handleInv;	
			};
			life_is_processing = false;	
			_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
		};
	};
};

if(EQUAL(_shop,"clothing")) then 
{
	if(EQUAL(_filter,0))then 
	{
        if(_item in _backpack) then {
			if(!(player addBackpack _item)) exitWith {
				5 cutText ["","PLAIN"];

				for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
					_handledItem = M_CONFIG(getText,"VirtualItems",(SEL(_oldItem,_i)),"variable");
					[true,_handledItem,(SEL(_oldItem,(_i+1)))] call life_fnc_handleInv;
				};
				life_is_processing = false;
				_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
			};
		}else{
            if(!(player addItem _item)) exitWith {
            5 cutText ["","PLAIN"];

              for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {

                 	_handledItem = M_CONFIG(getText,"VirtualItems",(SEL(_oldItem,_i)),"variable");
                  [true,_handledItem,(SEL(_oldItem,(_i+1)))] call life_fnc_handleInv;
                };
                life_is_processing = false;
                _ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
            };
        };
	};	
	
	if(EQUAL(_filter,1)) then
	{
		if(!([true,_newItem,1] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAN"];
		
			for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
				_handledItem = M_CONFIG(getText,"VirtualItems",(SEL(_oldItem,_i)),"variable");
				[true,_handledItem,(SEL(_oldItem,(_i+1)))] call life_fnc_handleInv;	
			};
			life_is_processing = false;
			_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
		};
	};
};
    
5 cutText ["","PLAIN"];
hint format[localize "STR_CRAFT_Process",(localize _itemName)];
life_is_processing = false;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];