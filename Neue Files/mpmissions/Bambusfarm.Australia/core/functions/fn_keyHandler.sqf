#include <macro.h>
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = SEL(_this,0);
_code = SEL(_this,1);
_shift = SEL(_this,2);
_ctrlKey = SEL(_this,3);
_alt = SEL(_this,4);
_speed = speed cursorTarget;
_handled = false;

_container = ["Land_Pod_Heli_Transport_04_bench_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_fuel_F"];

_blinkerLinks = if(count (actionKeys "User2") == 0) then {16} else {(actionKeys "User2") select 0};	
_blinkerRechts = if(count (actionKeys "User1") == 0) then {18} else {(actionKeys "User1") select 0};
_blinkerWarn = if(count (actionKeys "User3") == 0) then {44} else {(actionKeys "User3") select 0};


_interactionKey = if((EQUAL(count (actionKeys "User10"),0))) then {219} else {(actionKeys "User10") select 0};
_mapKey = SEL(actionKeys "ShowMap",0);
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player GVAR ["restrained",false])}) exitWith {
	true;
};

//##89
if(playerSide in [civilian,east,independent] && player getVariable ["restrained", false] && (call life_adminlevel) < 1) exitWith
{
	hintSilent "Du bist gefesselt!";
	_handled = false;
	_handled;
};

if(life_hands_up) exitWith
{
	hintSilent "Du hast deine Hände oben!";

	_handled = false;
	_handled;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(!(EQUAL(count (actionKeys "User10"),0)) && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn {
			private "_handle";
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do {
	
	//esc
	case 1:
	{
		if(playerSide == east) then
		{
			[1] spawn life_fnc_aufMarker;
		};
	};
	
	//Space key for Jumping
	case 57: {
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {!(EQUAL(animationState player,"AovrPercMrunSrasWrflDf"))} && {isTouchingGround player} && {EQUAL(stance player,"STAND")} && {speed player > 2} && {!life_is_arrested} && {SEL((velocity player),2) < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
	};
	
	//Map Key
	case _mapKey: {
		switch (playerSide) do {
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_gangMarkers;}};
			case east: {if(!visibleMap) then {[] spawn life_fnc_adacMarkers;}};
			case independent: 
			{
				if(!visibleMap) then 
				{
					[] spawn life_fnc_medicMarkers;
					[] spawn life_fnc_medicsMarkers;
				};
			};
		};
	};
	
	case _blinkerLinks:{ // Q  Left
		if(alive vehicle player && vehicle player != player && ((driver vehicle player) == player) ) then {
			[vehicle player,"left"] call life_fnc_BlinkerInit;							
		};			
	};			
	case _blinkerRechts:{ // E Right
		if(alive vehicle player && vehicle player != player && ((driver vehicle player) == player) ) then{		
			[vehicle player,"right"] call life_fnc_BlinkerInit;			
		};
	};		
	case _blinkerWarn:{ // Tab Warning
		if(alive vehicle player && vehicle player != player && ((driver vehicle player) == player) ) then{
			[vehicle player,"warning"] call life_fnc_BlinkerInit;		
		};
	};	
	
	//Holster / recall weapon.
	case 35: {
		if(!_shift && !_ctrlKey && !_alt) then {
			[] call life_fnc_tasta;
		};
		
		if(_shift && !_ctrlKey && !(EQUAL(currentWeapon player,""))) then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(EQUAL(life_curWep_h,""))}) then {
			if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey: {
		if(!life_action_inUse) then {
			[] spawn  {
				private "_handle";
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Restraining or robbing (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && (EQUAL(playerSide,west)) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent,east]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget GVAR "Escorting") && /*!(cursorTarget GVAR "restrained") &&*/ speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
			hint "Benutze die Action10-Taste, um weitere Aktionen anzuzeigen";
		}else{
				if(side cursorTarget in [civilian,independent,east]) then
			{
				if(_shift && (EQUAL(playerSide,civilian)) && license_civ_rebel && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget GVAR "Escorting") && !(cursorTarget GVAR "restrained") && speed cursorTarget < 1 ) then
				{
					if([false,"handcuffs",1] call life_fnc_handleInv) then
					{
						[] call life_fnc_restrainActionCiv;
						hint "Benutze die Action10-Taste, um weitere Aktionen anzuzeigen";
					}
					else
					{
						hint "Du hast keine Kabelbinder dabei!";
					};
				};
			}else{
				if(_shift && playerSide == civilian && (license_civ_rebel) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget GVAR "Escorting") && animationState cursorTarget in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"] && !(cursorTarget GVAR "restrained") && speed cursorTarget < 1 ) then
				{
					if([false,"handcuffs",1] call life_fnc_handleInv) then
					{
						[] call life_fnc_restrainActionCiv;
						hint "Benutze die Action10-Taste, um weitere Aktionen anzuzeigen";
					}
					else
					{
						hint "Du hast keine Kabelbinder dabei!";
					};
					
				};				
			};
		};
	};
		
	//Robbing
	case 34:
	{
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == RIFLE OR currentWeapon player == PISTOL) && currentWeapon player != "" && !life_knockout && !(player GVAR["restrained",false]) && !life_istazed && !(player GVAR["surrender",false])) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
			_handled = true;
		};
	};
	
	// O, police gate opener
        case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide isEqualTo west) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
		
		if (!_shift && !_alt && !_ctrlKey && (playerSide isEqualTo east) && (vehicle player != player)) then {
			[] call life_fnc_adacOpener;
		};
		
		if (!_shift && !_alt && !_ctrlKey && (playerSide isEqualTo independent) && (vehicle player != player)) then {
			[] call life_fnc_medicOpener;
		};
		
		// Pickaxe
        if(EQUAL(playerSide,civilian)) then
		{
			_gold1 = (player distance (getMarkerPos "gold_1") < 10);
			_gold2 = (player distance (getMarkerPos "gold_2") < 10);
			_gold3 = (player distance (getMarkerPos "gold_3") < 10);
            _baum1 = (player distance (getMarkerPos "baum_1") < 30);
            _baum2 = (player distance (getMarkerPos "baum_2") < 30);
            _baum3 = (player distance (getMarkerPos "baum_3") < 30);
            _kesch1 = (player distance (getMarkerPos "gluew_1") < 30);
            _kesch2 = (player distance (getMarkerPos "gluew_2") < 30);
            _kesch3 = (player distance (getMarkerPos "gluew_3") < 30);
        
			if((!life_action_gather) && (vehicle player == player)) then
			{
				{
					_item = configName _x;
					_str = M_CONFIG(getText,"VirtualItems",_item,"variable");
					_val = ITEM_VALUE(_item);
					if(_val > 0 ) then
					{ 
						if(_str == "goldsieb" && (_gold1 || _gold2 || _gold3)) then
						{
							[] spawn life_fnc_goldsiebUse;
						}else{
							if(_str == "schaufel" && (player distance (getMarkerPos "sand_1") < 75)) then
							{
								[] spawn life_fnc_schaufelUse;
							}else{
								if(_str == "handschuhe" && (player distance (getMarkerPos "uran_1") < 80)) then
								{
									[] spawn life_fnc_handschuheUse;
								}else{
                                    if(_str == "motorsaege" && (_baum1 || _baum2 || _baum3)) then
                                    {
                                        [] spawn life_fnc_motorsaegeUse; 
                                    }else{
                                        if(_str == "kescher" && (_kesch1 || _kesch2 || _kesch3)) then
                                        {
                                            [] spawn life_fnc_kescherUse;
                                        }else{
                                            if(_str == "pickaxe") then
                                            {
                                                [] spawn life_fnc_pickAxeUse;
                                            };
                                        };
                                    };
                                };
							};
						};
					};
				} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));
			}
		};
    };
	
	//Shift+P = Faded Sound
	case 25:
	{
		if(_shift) then
		{
			[] call life_fnc_fadeSound;
			_handled = true;
		};
	};
	
	//Shift + v (surrender)
	case 47:
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player GVAR ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player GVAR ["surrender", false]) then
				{
					player SVAR ["surrender", false, true];
					hint "Sie nehmen die Haende wieder runter!";
					[[0,format["%1 Hoert auf zu Kapitulieren und nimmt seine Haende wieder runter!",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

				} else
				{
					[] spawn life_fnc_surrender;
					hint "Sie kapitulieren und nehmen ihre Haende hoch!";
					[[0,format["%1 Kapituliert und nimmt die Haende hoch!",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

				};
			};
		};
	};
	
	case 15:
		 {
			if(_alt && !_shift) then {
				diag_log format ["COMBATLOG: %1 Benutzt ALT + TAB (Admins verständigen)",profileName];
				//[[1,format["COMBATLOG: %1 Benutzt ALT + TAB (Admins verständigen)",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				[] call SOCK_fnc_updateRequest;
			};
		 };
	
	case 62:
		 {
			if(_alt && !_shift) then {
				diag_log format ["COMBATLOG: %1 Benutzt ALT + F4 (Admins verständigen)",profileName];
				[[1,format["COMBATLOG: %1 Benutzt ALT + F4 (Admins verständigen)",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				[] call SOCK_fnc_updateRequest;
			};
	};
	
	case 211:
		 {
			if(_ctrlKey && _alt) then {
				diag_log format ["COMBATLOG: %1 Benutzt STRG + ALT + DEL (Admins verständigen)",profileName];
				[[1,format["COMBATLOG: %1 Benutzt STRG + ALT + DEL (Admins verständigen)",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
				[] call SOCK_fnc_updateRequest;
			};
	};
	
	//Takwondo(Traditional Martial arts in korea)(Shift + Num 1)
	case 79:
	{
		if(_shift) then {_handled = true;};
			if (_shift) then
			{
				cutText [format["Kung Fu Fighting!!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
			};
	};

	//Kneebend Slow(Shift + Num 2)
	case 80:
	{
		if(_shift) then {_handled = true;};
			if (_shift) then
			{
				cutText [format["Ok ganz ruhig"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
			};
	};

	//Kneebend Fast(Shift + Num 3)
	case 81:
	{
		if(_shift) then {_handled = true;};
			if (_shift) then
			{
				cutText [format["Los schneller!!!los!!los!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
			};
	};

	//Pushup(Shift + Num 4)
	case 75:
	{
		if(_shift) then {_handled = true;};
			if (_shift) then
			{
				cutText [format["Los tiefer!!!!!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
			};
	};
	
	//nicken (Shift + Num 5)
	case 76:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				player playActionNow "gestureHi";
			};
	};
	
	//winken (Shift + Num 6)
	case 77:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
			player playActionNow "gesturenod";
			};
	};
	
	//T Key (Trunk)
	case 20: {
		if(!_alt && !_ctrlKey && !life_is_processing) then {
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in life_vehicles) then {
					[vehicle player] call life_fnc_openInventory;
				};
			} else {
				if(((typeOf cursorTarget) == "Land_Cargo_House_V3_F") && (cursorTarget in life_vehicles)) then
				{
					[cursorTarget] call life_fnc_openInventory;
				}else{
				private "_list";
				_list = ["landVehicle","Air","Ship","House_F","House","Land_CargoBox_V1_F"];
					if(KINDOF_ARRAY(cursorTarget,_list) && {player distance cursorTarget < 7} && {vehicle player == player} && {alive cursorTarget}) then {
						if(cursorTarget in life_vehicles && (!(cursorTarget GVAR ["locked",false]))) then {
							[cursorTarget] call life_fnc_openInventory;
						};
						if (cursorTarget isKindOf "Land_CargoBox_V1_F") then {
							[cursorTarget] spawn life_fnc_openInventory;
						};
					}else{
						_fass = nearestObjects [player, ["Land_MetalBarrel_F"], 3] select 0;
						if(EQUAL(((_fass) GVAR "myOelFass"),(getPlayerUID player))) then
						{
							[_fass] spawn life_fnc_openInventory;
						};
					};
				};
			};
		};
	};
	
	//L Key?
	case 38: {
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west]) then {
			if(vehicle player != player && (typeOf vehicle player) in [
				"C_Offroad_01_F",
				"B_MRAP_01_F",
				"C_SUV_01_F",
				"C_Hatchback_01_sport_F",
				"B_Heli_Light_01_F",
				"I_MRAP_03_F"
				]) then {
				if(!isNil {vehicle player GVAR "lights"}) then {
					[vehicle player] call life_fnc_sirenLights;
					_handled = true;
				};
			};
		};
		
		if(_shift && playerSide in [independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in [
				"C_Offroad_01_F",
				"C_Van_01_box_F",
				"B_MRAP_01_F",
				"C_SUV_01_F",
				"B_Heli_Light_01_F",
				"O_Heli_Light_02_unarmed_F"
				]) then {
				if(!isNil {vehicle player GVAR "lights"}) then {
					[vehicle player] call life_fnc_medicSirenLights;
					_handled = true;
				};
			};
		};
		
		if(_shift && playerSide in [east]) then {
			if(vehicle player != player && (typeOf vehicle player) in [
				"C_Offroad_01_F",
				"B_MRAP_01_F",
				"C_SUV_01_F",
				"B_Heli_Light_01_F",
				"I_Heli_Transport_02_F",
				"B_Truck_01_transport_F"
				]) then {
				if(!isNil {vehicle player GVAR "lights"}) then {
						[vehicle player] call life_fnc_adacSirenLights;
						_handled = true;
				};
			};
		};
		
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	
	//Ö Key Fahrzeugradar
	case 39:
	{
		if (!_alt && !_ctrlKey && playerSide == west) then
		{
			[] call life_fnc_radars;
		};
	};
	
	if(playerSide == civilian && (call life_adminlevel) < 1) then
	{
		case 59: // F1
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};

		case 60: // F2
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};

		case 61: // F3
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};

		case 62: // F4
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};

		case 63: // F5
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};

		case 64: //F6 key
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};

		case 65: // F7 Key
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};

		case 66: //F8 key
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};

		case 67: //F9 key
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};

		case 68: //10 key
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};
		
		case 87: //11 key
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};
		
		case 88: //12 key
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};
		
		case 211: //DELETE key
		{
			closeDialog 0;
			hintc "Diese Taste wurde vom System blockiert";
			_handled = false;
			_handled;
		};
	};
	
	//Y Player Menu
	case 21: {
		if(!_alt && !_ctrlKey && !dialog && !life_is_processing) then {
			[] call life_fnc_p_openMenu;
		};
	};
	
	//F Key
	case 33: {
		if(playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
			[] spawn {
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			
			_veh = vehicle player;
			if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
			if((_veh GVAR "siren")) then {
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh SVAR ["siren",false,true];
			} else {
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh SVAR ["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] call life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] call life_fnc_MP;
				};
			};
		};
		
		if(_shift) then
        {
            if(playerSide == west && vehicle player != player && !life_siren2_active && ((driver vehicle player) == player)) then
            {
                [] spawn
                {
                    life_siren2_active = true;
                    sleep 1.2;
                    life_siren2_active = false;
                };
                _veh = vehicle player;
                if(isNil {_veh getVariable "siren2"}) then {_veh SVAR ["siren2",false,true];};
                if((_veh getVariable "siren2")) then
				{
                    titleText [localize "STR_MISC_SirensOFF2","PLAIN"];
                    _veh SVAR ["siren2",false,true];
                }
                    else
                {
                    titleText [localize "STR_MISC_SirensON2","PLAIN"];
                    _veh SVAR ["siren2",true,true];
                    [[_veh],"life_fnc_copsiren2",nil,true] spawn life_fnc_MP;
                };
            };
        };
	};
	
	//U Key
	case 22: {
		if(!_alt && !_ctrlKey && _shift) then
		{
			if(playerSide in [west,east]) then
			{
				[] spawn life_fnc_openVehicle;
			};
		};
		
		if(_ctrlKey) then {_handled = true;};
		if(_alt) then {_handled = true;};
			if(_ctrlKey && _alt && playerSide == west) then
			{
					[] call life_fnc_unrestrainCop;
					hint "Du hast dich entfesselt und bist nun nicht mehr im RP!";
			};
		
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(((_veh isKindOf "House_F") OR (_veh isKindOf "House")) && playerSide == civilian) then {
				//_playerPos = getPos player;
				//_base = [_playerPos select 0, _playerPos select 1, 0] nearestObject "Land_Cargo_House_V3_F";  
				if((_veh in life_vehicles && player distance _veh < 8)) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(EQUAL(_door,0)) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh GVAR [format["bis_disabled_Door_%1",_door],0];
					
					if(EQUAL(_locked,0)) then {
						_veh SVAR [format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						//systemChat localize "STR_House_Door_Lock";
						hint composeText [ image "icons\lock.paa", "  Tür abgeschlossen" ];
					} else {
						_veh SVAR [format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						//systemChat localize "STR_House_Door_Unlock";
						hint composeText [ image "icons\unlock.paa", "  Tür aufgeschlossen" ];
					};
				}else{
					_base = call compile format["%1",((life_base select 0) select 0)];
					_base1 = _base nearestObject "Land_Cargo_House_V3_F";
					if(_base1 in life_vehicles && player distance _veh < 20 && (player distance _base) < 110 && _base1 != player) then
					{
						_door = [_veh] call life_fnc_nearestDoor;
						if(EQUAL(_door,0)) exitWith {hint localize "STR_House_Door_NotNear"};
						_locked = _veh GVAR [format["bis_disabled_Door_%1",_door],0];

						if(EQUAL(_locked,0)) then {
							_veh SVAR [format["bis_disabled_Door_%1",_door],1,true];
							_veh animate [format["door_%1_rot",_door],0];
							//systemChat localize "STR_House_Door_Lock";
							hint composeText [ image "icons\lock.paa", "  Tür abgeschlossen" ];
						} else {
							_veh SVAR [format["bis_disabled_Door_%1",_door],0,true];
							_veh animate [format["door_%1_rot",_door],1];
							//systemChat localize "STR_House_Door_Unlock";
							hint composeText [ image "icons\unlock.paa", "  Tür aufgeschlossen" ];
						};
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(EQUAL(_locked,2)) then {
						if(local _veh) then {
							_veh lock 0;
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
							if(_vehicle in _container) then
								{
									_veh enableRopeAttach true;
								};
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
							if(_vehicle in _container) then
							{
								_veh enableRopeAttach true;
							};
						};
						//systemChat localize "STR_MISC_VehUnlock";
						hint composeText [ image "icons\unlock.paa", "  Fahrzeug aufgeschlossen"];
						//play sound
						player say3D "Car_Unlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
							if(_vehicle in _container) then
							{
								_veh enableRopeAttach false;
							};
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
							if(_vehicle in _container) then
							{
								_veh enableRopeAttach false;
							};
						};	
						//systemChat localize "STR_MISC_VehLock";
						hint composeText [ image "icons\lock.paa", "  Fahrzeug abgeschlossen"];
						//play sound
						player say3D "Car_Lock";
					};
				};
			};
		};
	};
	
	//mauer
	/*case 2:
	{
		if(_shift) then {_handle = true;};
		if(vehicle player != player) exitWith {hint "Du kannst nicht in einem Fahrzeug Nagelbänder auslegen.."};
		if((_shift) && (playerSide == west)) then {
		
			if(!isNull life_mauer) exitWith {hint "Du hast bereits ein Nagelband gelegt"};
			if(([false,"mauer",1] call life_fnc_handleInv)) then
			{
				[] spawn life_fnc_mauer;
			};

		};
	};	*/
	
	//nagelbänder
	case 3:
	{
		if(_shift) then {_handle = true;};
		if(vehicle player != player) exitWith {hint "Sie koennen nicht aus einen Fahrzeug herraus was plazieren.."};
		if((_shift) && ((playerSide == west) OR (playerSide == independent) OR (playerSide == east))) then {
		
			[] spawn life_fnc_placeablesMenu;
		};
	};
	
	//Wantedlist
	case 4:
	{
		if(_shift) then {_handle = true;};
		if((_shift) && (playerSide == west)) then 
		{
			if(!_alt && !_ctrlKey && !dialog) then
			{
				[] spawn life_fnc_wantedMenu;
			};
		};
	};
	
	//Einstellungen
	case 5:
	{
		if(_shift) then {_handled = true;};
		if (_shift) then
		{
			if(!_alt && !_ctrlKey && !dialog) then
			{
				[] call life_fnc_settingsMenu;
			};
		};
	};
	
	//Market
	case 6:
	{
		if(_shift) then {_handled = true;};
		if (_shift) then
		{
			if(!_alt && !_ctrlKey && !dialog) then
			{
				createDialog "life_dynmarket_prices";
			};
		};
	};
	
	//Handy
	case 7:
	{
		if(_shift) then {_handled = true;};
		if (_shift) then
		{
			if(!_alt && !_ctrlKey && !dialog) then
			{
				[] call life_fnc_callCellPhone;
			};
		};
	};	
};

if (life_barrier_active) then {
	switch (_code) do
	{
		case 57: //space key
		{
			[] spawn life_fnc_placeablesPlaceComplete;
		};
	};
	true;
};

_handled;
