#include <macro.h>
/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka
    
    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_saveGear = [_this,0,false,[false]] call BIS_fnc_param;

if((EQUAL(playerSide,west)) && !(_saveGear)) then {
	_return = life_persistent_gear;
	life_persistent_gear resize 18;
} else{
	_return = [];

	_return pushBack uniform player;
	_return pushBack vest player;
	_return pushBack backpack player;
	_return pushBack goggles player;
	_return pushBack headgear player;
	_return pushBack assignedITems player;
	if(playerSide == west || playerSide == civilian && {EQUAL(LIFE_SETTINGS(getNumber,"save_civ_weapons"),1)}) then {
    	_return pushBack RIFLE;
    	_return pushBack PISTOL;
		_return pushBack LAUNCHER;
	} else {
    	_return pushBack [];
    	_return pushBack [];
		_return pushBack [];
	};

	_uItems = [];
	_uMags  = [];
	_bItems = [];
	_bMags  = [];
	_vItems = [];
	_vMags  = [];
	_pItems = [];
	_sItems = [];
	_hItems = [];
	_uni = [];
	_ves = [];
	_bag = [];

	if(!(EQUAL(uniform player,""))) then {
		{
			if (_x in (magazines player)) then {
				ADD(_uMags,[_x]);
			} else {
				ADD(_uItems,[_x]);
			};
		} forEach (uniformItems player);
	};

	if(!(EQUAL(backpack player,""))) then {
		{
			if (_x in (magazines player)) then {
				ADD(_bMags,[_x]);
			} else {
				ADD(_bItems,[_x]);
			};
		} forEach (backpackItems player);
	};

	if(!(EQUAL(vest player,""))) then {
		{
			if (_x in (magazines player)) then {
				ADD(_vMags,[_x]);
			} else {
				ADD(_vItems,[_x]);
			};
		} forEach (vestItems player);
	};

	if(count (primaryWeaponMagazine player) > 0 && alive player) then {
		_pMag = SEL((primaryWeaponMagazine player),0);

		if(!(EQUAL(_pMag,""))) then {
			_uni = player canAddItemToUniform _pMag;
			_ves = player canAddItemToVest _pMag;
			_bag = player canAddItemToBackpack _pMag;
			_handled = false;

			if(_ves) then {
				ADD(_vMags,[_pMag]);
				_handled = true;
			};

			if(_uni && !_handled) then {
				ADD(_uMags,[_pMag]);
				_handled = true;
			};

			if(_bag && !_handled) then {
				ADD(_bMags,[_pMag]);
				_handled = true;
			};
		};
	};

	if(count (secondaryWeaponMagazine player) > 0 && alive player) then {
		_sMag = SEL((secondaryWeaponMagazine player),0);

		if(!(EQUAL(_sMag,""))) then {
			_uni = player canAddItemToUniform _sMag;
			_ves = player canAddItemToVest _sMag;
			_bag = player canAddItemToBackpack _sMag;
			_handled = false;

			if(_ves) then {
				ADD(_vMags,[_sMag]);
				_handled = true;
			};

			if(_uni && !_handled) then {
				ADD(_uMags,[_sMag]);
				_handled = true;
			};

			if(_bag && !_handled) then {
				ADD(_bMags,[_sMag]);
				_handled = true;
			};
		};
	};

	if(count (handgunMagazine player) > 0 && alive player) then {
		_hMag = ((handgunMagazine player) select 0);

		if(!(EQUAL(_hMag,""))) then {
			_uni = player canAddItemToUniform _hMag;
			_ves = player canAddItemToVest _hMag;
			_bag = player canAddItemToBackpack _hMag;
			_handled = false;

			if(_ves) then {
				ADD(_vMags,[_hMag]);
				_handled = true;
			};

			if(_uni && !_handled) then {
				ADD(_uMags,[_hMag]);
				_handled = true;
			};

			if(_bag && !_handled) then {
				ADD(_uMags,[_hMag]);
				_handled = true;
			};
		};
	};

	if(count (RIFLE_ITEMS) > 0) then {
		{
			ADD(_pItems,[_x]);
		} forEach (primaryWeaponItems player);
	};

	if(count (LAUNCHER_ITEMS) > 0) then {
		{
			ADD(_sItems,[_x]);
		} forEach (secondaryWeaponItems player);
	};

	if(count (PISTOL_ITEMS) > 0) then {
		{
			ADD(_hItems,[_x]);
		} forEach (handGunItems player);
	};
	
	_return pushBack _uItems;
	_return pushBack _uMags;
	_return pushBack _bItems;
	_return pushBack _bMags;
	_return pushBack _vItems;
	_return pushBack _vMags;
	_return pushBack _pItems;
	_return pushBack _sItems;
	_return pushBack _hItems;
};

_yItems = [];

{
    _val = ITEM_VALUE(_x);
    if (_val > 0) then {
		_yItems pushBack [_x,_val];
    };
} forEach LIFE_SETTINGS(getArray,"allowedSavedVirtualItems");

if(EQUAL(LIFE_SETTINGS(getNumber,"save_virtualItems"),1)) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

if(EQUAL((damage player),1)) then
{
	player setDamage 0;
	life_hunger = 100;
	life_thirst = 100;
	life_battery = 100;
};

life_damage = damage player;
_return pushBack life_hunger;
_return pushBack life_thirst;
_return pushBack life_battery;
_return pushBack life_damage;

life_gear = _return;

if(_saveGear) then {life_persistent_gear = _return;};