#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_player = SEL(_this,0);
_weap = currentWeapon _player;
_ammo = _player ammo _weap;
_ammoType = SEL(_this,4); 
_projectile = SEL(_this,6);

if(_ammoType == "GrenadeHand_stone") then {
	_projectile spawn {
		private "_position";
		while {!isNull _this} do {
			_position = ASLtoATL (visiblePositionASL _this);
			sleep 0.1;
		};
		[[_position],"life_fnc_flashbang",true,false] call life_fnc_MP;
	};
};

if (_weap == "hgun_P07_snds_F" && playerSide == west && ((_ammo == 12) OR (_ammo == 8) OR (_ammo == 4) OR (_ammo == 0))) then {
  
	reload _player;
};