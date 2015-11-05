#include <macro.h>
/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = SEL(_this,0);
_part = SEL(_this,1);
_damage = SEL(_this,2);
_source = SEL(_this,3);
_projectile = SEL(_this,4);

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_45ACP_Ball"] && _curWep in ["hgun_P07_snds_F","SMG_01_ACO_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_impact = 0;
				_distance = 0;
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				switch(true) do {
					case ((EQUAL(_curWep,"hgun_P07_snds_F")) && (EQUAL(_projectile,"B_9x21_Ball"))):
					{
						_istazer = true;
						_distance = 100;
						_impact = 30;
					};
					
					case ((EQUAL(_curWep,"SMG_01_ACO_F")) && (EQUAL(_projectile,"B_45ACP_Ball"))):
					{
						_istazer = true;
						_distance = 2000;
						_impact = 40;
					};
				};
				
				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit GVAR ["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
};

// Safezone dmgHandle
if(_unit getVariable["inSafezone",false] && isPlayer _unit) then
{
	if(!isNull _source && side _source == west) then {} else {
		_damage = (damage player);
		if(!isNull _source && _part == "") then {
			if(_part == "" && !isNull _source) then { [[player],"life_fnc_punishSafezonekiller",_source] spawn life_fnc_MP; };
		};
	};
};

/*//Airsoft
if(!isNull _source) then {
    if(_source != _unit) then {
        _curMag = currentMagazine _source;
        if (_curMag in ["30Rnd_556x45_Stanag_Tracer_Red"] && _projectile in ["B_556x45_Ball_Tracer_Red"]) then {
            if((side _source == west && playerSide != west)) then {
                private["_isVehicle","_isQuad"];
                _isVehicle = if(vehicle player != player) then {true} else {false};
                _isQuad = if(_isVehicle) then {if(typeOf(vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
                _damage = false;    
                
                if(_isVehicle || _isQuad) then {
                    player action ["Eject",vehicle player];
                    [_unit,_source] spawn life_fnc_airSoft;
                } else {
                    [_unit,_source] spawn life_fnc_airSoft;
                };
            };
            
            if((side _source == civilian && playerSide != civilian)) then {
                private["_isVehicle","_isQuad"];
                _isVehicle = if(vehicle player != player) then {true} else {false};
                _isQuad = if(_isVehicle) then {if(typeOf(vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
                _damage = false;    
                
                if(_isVehicle || _isQuad) then {
                    player action ["Eject",vehicle player];
                    [_unit,_source] spawn life_fnc_airSoft;
                } else {
                    [_unit,_source] spawn life_fnc_airSoft;
                };
            };
            
            if((side _source == civilian && playerSide != west)) then {
                private["_isVehicle","_isQuad"];
                _isVehicle = if(vehicle player != player) then {true} else {false};
                _isQuad = if(_isVehicle) then {if(typeOf(vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
                _damage = false;    
                
                if(_isVehicle || _isQuad) then {
                    player action ["Eject",vehicle player];
                    [_unit,_source] spawn life_fnc_airSoft;
                } else {
                    [_unit,_source] spawn life_fnc_airSoft;
                };
            };
            
            if((side _source == west && playerSide != civilian)) then {
                private["_isVehicle","_isQuad"];
                _isVehicle = if(vehicle player != player) then {true} else {false};
                _isQuad = if(_isVehicle) then {if(typeOf(vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
                _damage = false;    
                
                if(_isVehicle || _isQuad) then {
                    player action ["Eject",vehicle player];
                    [_unit,_source] spawn life_fnc_airSoft;
                } else {
                    [_unit,_source] spawn life_fnc_airSoft;
                };
            };
            
            if(side _source == west && playerSide == west) then {
                _damage = false;
            };
        };
    };
};*/

[] call life_fnc_hudUpdate;
_damage;