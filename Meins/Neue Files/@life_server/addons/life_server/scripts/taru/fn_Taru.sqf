#include "\life_server\script_macros.hpp"
waitUntil {!isNull player};

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

Script_Taru =
{
	[] call
	{
		if (isClass(configFile >> "CfgPatches" >> "agm_core")) exitWith {};

		if (isClass(configFile >> "CfgPatches" >> "cba_main")) then
		{
			["XENO Taru Pod Mod", localize "STR_XENO_Arrimer", {["Arrimage"] call Script_Choix_Unite;}, [DIK_A,true,false,false]] call cba_fnc_registerKeybind;
			["XENO Taru Pod Mod", localize "STR_XENO_Desarrimer", {["Desarrimage"] call Script_Choix_Unite;}, [DIK_E,true,false,false]] call cba_fnc_registerKeybind;
			["XENO Taru Pod Mod", localize "STR_XENO_Larguer", {["Largage"] call Script_Choix_Unite;}, [DIK_C,true,false,false]] call cba_fnc_registerKeybind;
		};
		/*
		Action_Arrimer = player addAction [localize "STR_XENO_Arrimer", "[""Arrimage"",player] call Script_Choix_Unite;", nil, 2, false, true, "",
		"[player] call Script_Verification_Helico and {[player] call Script_Verification_Pod} and {!([player] call Script_Verification_Objet_Attacher)}"];

		Action_Desarrimer = player addAction [localize "STR_XENO_Desarrimer", "[""Desarrimage"",player] call Script_Choix_Unite;", nil, 2, false, true, "",
		"[player] call Script_Verification_Helico and {[player] call Script_Verification_Objet_Attacher}"];
		
		if((call life_adminlevel) < 3) then
		{
			Action_Larguer = player addAction [localize "STR_XENO_Larguer", "[""Largage"",player] call Script_Choix_Unite;", nil, 2, false, true, "",
			"[player] call Script_Verification_Helico and {[player] call Script_Verification_Objet_Attacher}"];
		}else{};*/
	};

	[player] spawn life_fnc_TaruHotfixVRotor;
	[] spawn Script_Boucle_Ajout_Action_Groupe;
};

Script_Boucle_Ajout_Action_Groupe =
{
	waituntil
	{
		sleep 2;
		
		{
			if (isnil {_x getVariable "Action_Arrimer"}) then
			{
				_x setVariable ["Action_Arrimer",true,false];
				
				Action_Arrimer = _x addAction [localize "STR_XENO_Arrimer", "[""Arrimage"", _this] call Script_Choix_Unite;", nil, 2, false, true, "",
				"[_this] call Script_Verification_Helico and {[_this] call Script_Verification_Pod} and {!([_this] call Script_Verification_Objet_Attacher)}"];
			};	
			
			if (isnil {_x getVariable "Action_Desarrimer"}) then
			{
				_x setVariable ["Action_Desarrimer",true,false];
				
				Action_Desarrimer = _x addAction [localize "STR_XENO_Desarrimer", "[""Desarrimage"", _this] call Script_Choix_Unite;", nil, 2, false, true, "",
				"[_this] call Script_Verification_Helico and {[_this] call Script_Verification_Objet_Attacher}"];
			};	
			
			/*if (isnil {_x getVariable "Action_Larguer"}) then
			{
				_x setVariable ["Action_Larguer",true,false];
				
				Action_Larguer = _x addAction [localize "STR_XENO_Larguer", "[""Largage"", _this] call Script_Choix_Unite;", nil, 2, false, true, "",
				"[_this] call Script_Verification_Helico and {[_this] call Script_Verification_Objet_Attacher}"];	
			};*/	
		} foreach units group player;
	};
};

Script_Verification_Objet_Attacher =
{
	_helico = vehicle (_this select 0);
	_objet_Verifier = false;
	
	{
		_objet_attache = _x;
		_liste_Class_Parent = [(configfile >> "CfgVehicles" >> typeof _objet_attache),true] call BIS_fnc_returnParents;
	
		{
			if (_x isEqualTo "Pod_Heli_Transport_04_base_F") exitwith {_objet_Verifier = true;};
		} foreach _liste_Class_Parent;
	} foreach attachedObjects _helico;	
	
	_objet_Verifier
};

Script_Verification_Pod =
{
	_pod = getSlingLoad vehicle (_this select 0);
	_pod_Verifier = false;

	_liste_Class_Parent = [(configfile >> "CfgVehicles" >> typeof _pod),true] call BIS_fnc_returnParents;

	{
		if (_x isEqualTo "Pod_Heli_Transport_04_base_F") exitwith {_pod_Verifier = true;};
	} foreach _liste_Class_Parent;
	
	_pod_Verifier
};

Script_Verification_Helico =
{
	_helicoptere = vehicle (_this select 0);
	_helico_Verifier = false;
	_liste_Class_Parent = [(configfile >> "CfgVehicles" >> typeof _helicoptere),true] call BIS_fnc_returnParents;

	{
		if (_x isEqualTo "Heli_Transport_04_base_F") exitwith {_helico_Verifier = true;};
	} foreach _liste_Class_Parent;
	
	_helico_Verifier
};



Script_Choix_Unite =
{
	_arrimer_Desarrimer = _this select 0;
	_helicoptere = "";

	if (typename (_this select 1) isEqualTo "OBJECT") then {_helicoptere = vehicle (_this select 1);};
	if (typename (_this select 1) isEqualTo "ARRAY") then {_helicoptere = vehicle ((_this select 1) select 0);};

	_cables = ropes _helicoptere;
	_unite_Lancant_Script = [];

	if (ropeUnwound (_cables select 0)) then
	{
		[] call
		{
			if (local _helicoptere) exitwith {_unite_Lancant_Script = [player];};

			if (!local _helicoptere) exitwith
			{
				{
					_proprietaire_Vehicule = owner _x;

					if (_proprietaire_Vehicule isEqualTo owner _x) exitwith
					{
						_unite_Lancant_Script = _x;
					};
				} foreach crew _helicoptere;
			};
		};

		[] call
		{
			if (_arrimer_Desarrimer isEqualTo "Desarrimage") then {[[_helicoptere],"life_fnc_TaruDesarrimePod",_unite_Lancant_Script,false] spawn life_fnc_MP;};
			if (_arrimer_Desarrimer isEqualTo "Arrimage") then {[[_helicoptere],"life_fnc_TaruArrimerPod",_unite_Lancant_Script,false] spawn life_fnc_MP;};
			if (_arrimer_Desarrimer isEqualTo "Largage") then {[[_helicoptere],"life_fnc_TaruLarguerPod",_unite_Lancant_Script,false] spawn life_fnc_MP;};
		};
	};
};

[] call Script_Taru;
XENO_Taru_EH_Respawn = player addEventHandler ["Respawn", "[] call Script_Taru;"];