#include <macro.h>
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if(EQUAL(lbCurSel 2005,-1)) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(2005);

switch (true) do {
	case (_item in ["waterBottle","coffee","redgull"]): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			player say3D "drink";
            _sum = life_thirst + 50;
			if(_sum > 100) then {_sum = 100; hint "Du hast schon genung getrunken!";};
            life_thirst = _sum;
			if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
			if(EQUAL(_item,"redgull") && {EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)}) then {
				[] spawn {
					life_redgull_effect = time;
					titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
					player enableFatigue false;
					waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
					player enableFatigue true;
				};
			};
		};
	};
	
	/* case (_item in ["hueners","turtle_soup"]): {
        [_item] call life_fnc_eatFood;
        life_thirst = 100;
        player setFatigue 0;
    };*/
	
	case (EQUAL(_item,"boltcutter")): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (EQUAL(_item,"abrissbirne")): {
		[cursorTarget] spawn life_fnc_removeBaseObj;
		closeDialog 0;
	};
	
	case (EQUAL(_item,"burglar_tool")): {
		[cursorTarget] spawn life_fnc_burglarTool;
		closeDialog 0;
	};
	
	case (EQUAL(_item,"blastingcharge")): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	
	case (EQUAL(_item,"defusekit")): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	
	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (EQUAL(_item,"mauer")):
	{
		if(!isNull life_mauer) exitWith {hint "Du stellst schon eine Strassensperre!"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_mauer;
		};
	};
	
	case (EQUAL(_item,"wkasten")):
	{
		if(!isNull life_wkasten) exitWith {hint "SIe haben schon einen Werkzeugkasten aufgestellt!"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_wkasten;
		};
	};
	
	case (EQUAL(_item,"vehhut")): {
		if(!isNull life_vehhut) exitWith {hint "Du stellst schon eine Vehrkehrshuetchen!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_vehhut;
		};
	};
	
	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (EQUAL(_item,"lockpick")): {
		[] spawn life_fnc_lockpick;
	};
	
	case (EQUAL(_item,"marijuana")): {
		if(playerSide in [west,independent,east]) exitWith {hint "Hallo Sie sind im Dienst!!";};
		if((player getVariable ["dazed",FALSE])) exitWith {hint "Du nimmst bereits geiles Zeug";}; 
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drug") then {life_drug = 0;};
			//Wenn er Drogen nimmt
			life_drug = life_drug + 0.08;
			if (life_drug < 0.00) exitWith {}; 
			[] spawn life_fnc_useMarijuana;
		};
	};
	
	case (EQUAL(_item,"cocaine_processed")): {
		if(playerSide in [west,independent,east]) exitWith {hint "Hallo Sie sind im Dienst!!";};
		if((player getVariable ["dazed",FALSE])) exitWith {hint "Du nimmst bereits geiles Zeug";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{			
			if(isNil "life_drug") then {life_drug = 0;};
			//Wenn er Drogen nimmt
			life_drug = life_drug + 0.08;
			if (life_drug < 0.00) exitWith {}; 
			[] Spawn life_fnc_useCocaine;
		};
	};
	
	case (EQUAL(_item,"frogslsd")): {
		if(playerSide in [west,independent,east]) exitWith {hint "Hallo Sie sind im Dienst!!";};
		if((player getVariable ["dazed",FALSE])) exitWith {hint "Du nimmst bereits geiles Zeug";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{			
			if(isNil "life_drug") then {life_drug = 0;};
			//Wenn er Drogen nimmt
			life_drug = life_drug + 0.08;
			if (life_drug < 0.00) exitWith {}; 
			[] spawn life_fnc_useLSD;
		};
	};
	
	case (EQUAL(_item,"heroin_processed")): {
		if(playerSide in [west,independent,east]) exitWith {hint "Hallo Sie sind im Dienst!!";};
		if((player getVariable ["dazed",FALSE])) exitWith {hint "Du nimmst bereits geiles Zeug";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{			
			if(isNil "life_drug") then {life_drug = 0;};
			//Wenn er Drogen nimmt
			life_drug = life_drug + 0.08;
			if (life_drug < 0.00) exitWith {}; 
			[] spawn life_fnc_useHeroin;
		};
	};
	
	case (EQUAL(_item,"bottledwhiskey")): {
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player GVAR ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
		};
	};
	
	case (EQUAL(_item,"bottledshine")): {
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player GVAR ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
		};
	};
	
	case (EQUAL(_item,"bottledbeer")): {
		
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};
	
	case (EQUAL(_item,"organttk")):
	{
		[] spawn life_fnc_organTransplantKit;
		closeDialog 0;
	};
	
	case (EQUAL(_item,"battery")):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_battery = 100;
			hint "Dein Akku ist jetzt voll.";
		};
	};
	
	case (_item in ["apple","rabbit_grilled","sheep_grilled","rooster_grilled","goat_grilled","eieromelett","salema_grilled","ornate_grilled","mackerel_grilled","tuna_grilled","mullet_grilled","catshark_grilled","donut","tbacon","peach","banana","birne","cerises"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 100;};
					default {life_hunger = _sum;};
				};
				player say3D "eat";
			};
		};
	};

	case (_item in ["huehners","turtle_soup"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				_sum1 = life_thirst + _val;
				sum1 = _sum1;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_val < 0 && _sum1 < 1): {life_thirst = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 100;};
					case (_sum1 > 100): {life_thirst = 100;};
					default {life_hunger = _sum; life_thirst = _sum1};
				};
				player say3D "eat";
			};
		};
	};
	
	case (EQUAL(_item,"pickaxe")): {
		[] spawn life_fnc_pickAxeUse;
	};
	
	case (EQUAL(_item,"goldsieb")): {
		[] spawn life_fnc_goldsiebUse;
	};
	
	case (EQUAL(_item,"schaufel")): {
		[] spawn life_fnc_schaufelUse;
	};
    
    case (EQUAL(_item,"motorsaege")): {
		[] spawn life_fnc_motorsaegeUse;
	};
    
    case (EQUAL(_item,"kescher")): {
		[] spawn life_fnc_kescherlUse;
	};
	
	case (EQUAL(_item,"handschuhe")): {
		[] spawn life_fnc_handschuheUse;
	};
	
	case (EQUAL(_item,"repairkit")): { //##49
		if(([false,_item,1] call life_fnc_handleInv)) then
		{			
			[] spawn life_fnc_useVRepairkit;
		};
	};
	
	case (EQUAL(_item,"firstaidkit")): {//##53
		if(([false,_item,1] call life_fnc_handleInv)) then
		{			
			[] spawn life_fnc_useVFirstaidkit;
		};
	};
	
	case (EQUAL(_item,"bomb")): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{		
			closeDialog 0;
			[] spawn life_fnc_playerUseBomb;
		};
	};
	
	//Troll items 
	case (EQUAL(_item,"troll_taschentuch")): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{		
			[player,"man_cry"] call life_fnc_globalSound;
		};
	};
	case (EQUAL(_item,"troll_nuckel")): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{		
			[player,"baby_cry"] call life_fnc_globalSound;
		};
	};
	case (EQUAL(_item,"troll_bitering")): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{		
			[player,"baby_happy"] call life_fnc_globalSound;
		};
	};
	
	case (EQUAL(_item,"gpstracker")): {
		[cursorTarget] spawn life_fnc_gpsTracker;
	};
	
	case (EQUAL(_item,"gpssuchgeraet")): {
		[cursorTarget] spawn life_fnc_gpsTrackerRemove;
	};
	
	case (EQUAL(_item,"speedtrap")): {
        [] spawn king_fnc_speedtrapAdd;
        closeDialog 0;
	};    
       
	case (EQUAL(_item,"speedtrapdetector")): {
		hint "...es blinkt...";
	};
	
	case (EQUAL(_item,"laptop")): {
        [] spawn
        {   
            private["_status"];
            _status = 0;
            while {_status < 100} do
            {
                hintsilent format ["Bitte warten - Ladet das System %1%", _status];
                _status = _status + 1;
                sleep 0.1;
            };
            hintsilent format ["[Error 42] Kernel-panik..."];
        };
	};
	
	case (EQUAL(_item,"fuelManipulator")): {
        closeDialog 0;
		[] spawn king_fnc_fuelchangerManipulate;
	};    
       
 	case (EQUAL(_item,"pille")): {
        closeDialog 0;
		[] spawn life_fnc_suicidePille;
	};
	
	case (EQUAL(_item,"fuelPipe")): {
        closeDialog 0;
		[] spawn king_fnc_fuelPipe;
	};
	
	case (EQUAL(_item,"underwatercharge")): {
		closeDialog 0;
		[] spawn life_fnc_udwc;
	};
	
	case (EQUAL(_item,"fuelE")): {
        closeDialog 0;
		[] spawn life_fnc_fuelTank;
	};
	
	default {
		hint localize "STR_ISTR_NotUsable";
	};
	
	//Baukästen für Vehicle Crafting
	case (EQUAL(_item,"c_van_box")): {
		_vehicle = "C_Van_01_box_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"c_van_fuel")): {
		_vehicle = "C_Van_01_fuel_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"i_truck_transport")): {
		_vehicle = "I_Truck_02_transport_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"i_truck_covered")): {
		_vehicle = "I_Truck_02_covered_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"o_truck_transport")): {
		_vehicle = "O_Truck_03_transport_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"o_truck_covered")): {
		_vehicle = "O_Truck_03_covered_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"0_truck_03_fuel")): {
		_vehicle = "O_Truck_03_fuel_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"0_truck_02_fuel")): {
		_vehicle = "O_Truck_02_fuel_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"b_truck_transport")):
	{
		_vehicle = "B_Truck_01_transport_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"b_truck_box")): {
		_vehicle = "B_Truck_01_box_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"b_truck_fuel")): {
		_vehicle = "B_Truck_01_fuel_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"o_truck_device")): {
		_vehicle = "O_Truck_03_device_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"b_heli_light")): {
		_vehicle = "B_Heli_Light_01_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"i_heli_transport")): {
		_vehicle = "I_Heli_Transport_02_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"o_oeli_oight_02_unarmed")): {
		_vehicle = "O_Heli_Light_02_unarmed_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"i_plane_fighter_03")): {
		_vehicle = "I_Plane_Fighter_03_AA_F";
		_flage = "civ";
		closeDialog 0;
		[_vehicle,_flage,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"o_plane_cas_02")): {
		_vehicle = "O_Plane_CAS_02_F";
		_flage = "civ";
		closeDialog 0;
		[_vehicle,_flage,_item] spawn life_fnc_vehicleSpawnMenu;
	};
    
    case ( _item in ["rabbit_raw","salema_raw","ornate_raw","mackerel_raw","tuna_raw","mullet_raw","catshark_raw","turtle_raw","hen_raw","rooster_raw","sheep_raw","goat_raw","h_eier"]):
    {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[player,_item] spawn life_fnc_rawFood; 
		};
    };

	case (_item in ["firetonne","lautsp","stuhl2","stuhl","bunkerbig","sandsack","sandsackecke","sandsackrund","bunkersmall","hsmall","hsmalleinzel","hturm","Hbig","hbarrierEcke","hBarriereCorridor","stachel","lampsmall","schranke","schiesswand","schiesswandfenster","schiesswandducken","schiesswandspring","schiessdeckungmitt","schiessdeckungducken","schiessdeckungliegen","schiessziel","ziel","camo","map","strom","sun","fire","helisquare","helicircle","bigturm","turm","cargohq","aid","garage","helig","lagerhalle","cargoschwarz","storagebigb","cargo","atm","leiter","lampl","halogen","laborb"]): 
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[_item] spawn life_fnc_placeObject;
			closeDialog 0;
		};
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;
