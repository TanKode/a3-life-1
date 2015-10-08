/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call bambusfarm_fnc_handleInv)) then
		{
			bambusfarm_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn bambusfarm_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item == "lappi"):
	{
		_wlanZone = "";
		_wlanZones = ["wlan_1","wlan_2","wlan_3"];
		{
			if(player distance (getMarkerPos _x) < 30) exitWith {_WlanZone = _x;};
		} foreach _wlanZones;
		if(_wlanZone == "") exitWith {hint "Du kannst hier keinen Laptop aufbauen, da du hier kein Wlan hast!";};


		_table = nearestObject[player, "Land_TablePlastic_01_F"];
		_tablePos = getPos _table;
		if(player distance _tablePos > 5) exitWith {hint "Du musst den Laptop an einem Tisch aufbauen!";};


		if(!isNull bambusfarm_theLappi) exitWith {hint "Du kannst nur einen Laptop aufbauen!";};
		if(([false,_item,1] call bambusfarm_fnc_handleInv)) then
		{
			[] spawn bambusfarm_fnc_lappi;
		};
	};

	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn bambusfarm_fnc_blastingCharge;
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn bambusfarm_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call bambusfarm_fnc_storageBox;
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call bambusfarm_fnc_handleInv)) then
		{
			bambusfarm_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				bambusfarm_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - bambusfarm_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull bambusfarm_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call bambusfarm_fnc_handleInv)) then
		{
			[] spawn bambusfarm_fnc_spikeStrip;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn bambusfarm_fnc_jerryRefuel;
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call bambusfarm_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn bambusfarm_fnc_pickAxeUse;
	};

	case (_item == "heroinp"):
    {
     	if(([false,_item,1] call bambusfarm_fnc_handleInv)) then
    	{
         	[] spawn bambusfarm_fnc_useHeroin;
       	};
    };
    case (_item == "cocainep"):
    {
     	if(([false,_item,1] call bambusfarm_fnc_handleInv)) then
     	{
         	[] spawn bambusfarm_fnc_useKokain;
       	};
    };
    case (_item == "marijuana"):
    {
    	if(bambusfarm_drugged_weed == 1) then {
    		hint "Du rauchst bereits ein Joint!";
    	} else {
    		if(([false,_item,1] call bambusfarm_fnc_handleInv)) then
    		{
    			[] spawn bambusfarm_fnc_useWeed;
    		};
    	};
    };
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call bambusfarm_fnc_p_updateMenu;
[] call bambusfarm_fnc_hudUpdate;