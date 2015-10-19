#include <macro.h>
/*
	ADAC repair
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName", "_damage","_bool"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
/*if(__GETC__(life_adaclevel) < 1) exitWith
{
	hint "Du bist kein ADAC-Mitglied!";
};*/
if(EQUAL(playerSide,east)) then {
	_nearObjekt = nearestObjects[getPos player,["Land_ToolTrolley_02_F"],5];

	if(((_veh isKindOf "Car") OR (_veh isKindOf "Air")) && (_veh GVAR "AdacCheck")) then
	{
		if(count _nearObjekt > 0) then
		{
			life_action_inUse = true;
			_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
			_upp = format["Repariere %1",_displayName];
			//Setup our progress bar.
			disableSerialization;
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNameSpace getVariable "life_progress";
			_progress = _ui displayCtrl 38201;
			_pgText = _ui displayCtrl 38202;
			_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
			_progress progressSetPosition 0.01;
			_cP = 0.01;
			[player,"adacrep"] call life_fnc_globalSound; //Just if you have global sounds!
			
			while{true} do
			{
				if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
					[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
					player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
				};
				sleep 0.27;
				_cP = _cP + 0.01;
				_progress progressSetPosition _cP;
				_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
				if(_cP >= 1) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
				if(!alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
				if(player != vehicle player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
				if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
			};

			life_action_inUse = false;
			5 cutText ["","PLAIN"];
			player playActionNow "stop";
			if(life_interrupted) exitWith {life_interrupted = false; titleText["Abgebrochen!","PLAIN"]; life_action_inUse = false;};
			if(player != vehicle player) exitWith {titleText["Du musst aus dem Fahrzeug aussteigen, um es reparieren zu können!","PLAIN"];};

			_veh setDamage 0;
			//[1,false] call life_fnc_sessionHandle;
			titleText["Fahrzeug repariert.","PLAIN"];
		}else {
			hintSilent parseText "Sie brauchen einen Werkzeugkasten!";
		};
	}else{
		if(!(_veh GVAR "AdacCheck")) then
		{
			hintSilent parseText "Sie muessen das Fahrzeug zuerst auf Schaeden ueberpruefen!";
		};
	};

	if((_veh isKindOf "Ship") OR (_veh isKindOf "LandVehicle")) then
	{
		if(count _nearObjekt > 0) then
		{
			life_action_inUse = true;
			_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
			_upp = format["Repariere %1",_displayName];
			//Setup our progress bar.
			disableSerialization;
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNameSpace getVariable "life_progress";
			_progress = _ui displayCtrl 38201;
			_pgText = _ui displayCtrl 38202;
			_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
			_progress progressSetPosition 0.01;
			_cP = 0.01;
			[player,"adacrep"] call life_fnc_globalSound; //Just if you have global sounds!
			
			while{true} do
			{
				if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
					[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
					player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
				};
				sleep 0.27;
				_cP = _cP + 0.01;
				_progress progressSetPosition _cP;
				_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
				if(_cP >= 1) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
				if(!alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
				if(player != vehicle player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
				if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
			};

			life_action_inUse = false;
			5 cutText ["","PLAIN"];
			player playActionNow "stop";
			if(life_interrupted) exitWith {life_interrupted = false; titleText["Abgebrochen!","PLAIN"]; life_action_inUse = false;};
			if(player != vehicle player) exitWith {titleText["Du musst aus dem Fahrzeug aussteigen, um es reparieren zu können!","PLAIN"];};

			_veh setDamage 0;
			//[1,false] call life_fnc_sessionHandle;
			titleText["Fahrzeug repariert.","PLAIN"];
		};
	};
}else{
	if((_veh isKindOf "Ship") OR (_veh isKindOf "LandVehicle") OR (_veh isKindOf "Air") OR (_veh isKindOf "Car")) then
	{
		if(EQUAL(playerSide,west)) then 
		{
			if(([true,"adac_toolkit",1] call life_fnc_handleInv)) then
			{
				life_action_inUse = true;
				_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
				_upp = format["Repariere %1",_displayName];
				//Setup our progress bar.
				disableSerialization;
				5 cutRsc ["life_progress","PLAIN"];
				_ui = uiNameSpace getVariable "life_progress";
				_progress = _ui displayCtrl 38201;
				_pgText = _ui displayCtrl 38202;
				_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
				_progress progressSetPosition 0.01;
				_cP = 0.01;
				[player,"adacrep"] call life_fnc_globalSound; //Just if you have global sounds!
				
				while{true} do
				{
					if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
						[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
						player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
						player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
					};
					sleep 0.27;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
					if(_cP >= 1) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
					if(!alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
					if(player != vehicle player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
					if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
				};

				life_action_inUse = false;
				5 cutText ["","PLAIN"];
				player playActionNow "stop";
				if(life_interrupted) exitWith {life_interrupted = false; titleText["Abgebrochen!","PLAIN"]; life_action_inUse = false;};
				if(player != vehicle player) exitWith {titleText["Du musst aus dem Fahrzeug aussteigen, um es reparieren zu können!","PLAIN"];};

				_veh setDamage 0;
				//[1,false] call life_fnc_sessionHandle;
				titleText["Fahrzeug repariert.","PLAIN"];
			};
		};
	};
};
_veh SVAR["adacCheck",false,true];
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];