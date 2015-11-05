/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright © 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!
*/

schiffsw_obj_arr = ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F"]; //muss ich doch ändern in die kiste oder?

//########################## CONFIGURATION ##########################

schiffsw_chance = 100;
schiffsw_positions = [[15196.6,14149.2,-64.5347],[15214.4,14154.8,-66.6054],[15227.8,14165.8,-68.039],[15260.7,14160.3,-70.126],[15283,14176.7,-70.6563],[15395.5,14284.7,-52.1983],[15408.4,14261.7,-51.8872],[15314.3,14281.8,-57.7609],
                     [15299.3,14303.2,-62.2207],[15197.5,14310,-61.202],[15179.2,14306.2,-58.6731],[15252.8,14205.6,-72.029],[15375.1,14258.6,-53.0088],[15463.3,14238.7,-53.0671],[15363.6,14137.8,-56.2508],[15319.7,14173.2,-61.5834],
                     [15323,14350.8,-67.4627],[15241.8,14305.1,-63.105],[15161.6,14235.6,-59.7777],[15299.8,14231.4,-56.8842],[15363.6,14277.1,-53.9762],[15432.6,14166.9,-53.0635],[15331.4,14169.9,-60.4905],[15269.5,14226.9,-68.6509],
                     [15285.9,14283.2,-60.8434],[15358.2,14311.4,-55.322],[15464.3,14253.9,-53.0641],[15268.3,14206.5,-72.2861],[15163,14258.8,-59.3984],[15260.3,14265.9,-62.1155],[15343.4,14336,-59.3125],[15392.9,14321.7,-53.1369],
                     [15377.4,14206.7,-53.2317],[15338,14137.1,-60.2013],[15277.9,14190.3,-72.5064],[15162.3,14276.4,-58.2975],[15318.1,14311.4,-60.9489],[15378.4,14238.9,-52.8816],[15410.5,14217.8,-52.2231],[15348.1,14161.9,-58.1617],
                     [15229.1,14200.4,-68.7171],[15261,14289.8,-61.5702],[15338.3,14314.5,-58.5866],[15428.4,14215.2,-52.2938],[15445,14183.1,-52.9236],[15281.2,14344.5,-67.8805],[15262,14249,-63.9435],[15227.7,14327.6,-65.5449],
                     [15426.4,14245.5,-51.9707],[15337.8,15288.8,-55.8169],[15250.7,14318.9-64.2182],[15186.5,14217.5,-61.1476],[15295.1,14138.2,-66.9227],[15342.3,14196.9,-56.7503],[15365.8,14336.8,-55.9961],[15225,14310,-63.6592],
                     [15176.1,14195.1,-61.2987],[15395.4,14147.1-54.0865],[15400.14188,-52.8947],[15268,14312.1,-64.1414],[15206.5,14190.1,-63.731],[15265,14137.6,-68.3604],[15310.3,14148.6,-64.7744],[15165.1,14209.2,-61.1135],
                     [15366.4,14173.1,-54.979],[15297.2,14255.4,-58.1453],[15322.6,14143.8,-62.0439],[15389.7,14170.7,-53.5345],[15185.4,14241.1,-62.2633],[15256.7,14342.2,-67.1104],[15308.9,14205.6,-58.5274],
                     [15416.5,14307,-52.3293]];
_schiffsw_time_interval = [0.3,2]; //Time given in hours, this is the interval in which the shipwreck should take spawn
schiffsw_loot_array = [["goldbarp",5],["goldbarp",10],["goldbarp",2],["goldbarp",20],["goldbarp",40],["goldbarp",8],["goldbarp",13],["goldbarp",24],["goldbarp",100],["goldbarp",62]];
schiffsw_loot_amount = 3;

//######################## CONFIGURATION END ########################

// Do not modify the following code

schiffsw_time_min = _schiffsw_time_interval select 0;
schiffsw_time_max = _schiffsw_time_interval select 1;
schiffsw_time_min = schiffsw_time_min*3600;
schiffsw_time_max = schiffsw_time_max*3600;

if (schiffsw_time_min>=schiffsw_time_max OR count schiffsw_loot_array < schiffsw_loot_amount) exitWith {schiffsw_enable=false;};
schiffsw_enable=true;

sleep 1;

if (!schiffsw_enable) exitWith {};

_chance = floor(random 100);
if (_chance>schiffsw_chance) exitWith {};
_toWait = (random (schiffsw_time_max - schiffsw_time_min)) + schiffsw_time_min;
sleep _toWait;

// schiffsw STARTEN
[[4,"In der versunkenen Stadt von Altis beim Golf von Pryrgos wurden Schaetze entdeckt!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP; 

_poses = count schiffsw_positions;
_inArr = floor(random _poses);
_dest = schiffsw_positions select _inArr;
desto = _dest;
sleep 5;

_marker = createMarker ["schiffswmarker", [15299.1,14255.3,0]];
"schiffswmarker" setMarkerColor "ColorGreen";
"schiffswmarker" setMarkerType "Empty";
"schiffswmarker" setMarkerShape "ELLIPSE";
"schiffswmarker" setMarkerSize [180,180];
_markerText = createMarker ["schiffswmarkertext", [15299.1,14255.3,0]];
"schiffswmarkertext" setMarkerColor "ColorBlack";
"schiffswmarkertext" setMarkerText "!Versunkene Stadt Altis!";
"schiffswmarkertext" setMarkerType "mil_warning";

"schiffswmarker" setMarkerAlpha 0.3;

// DAS WRACK SPAWNEN

_type = "";
//_chance = floor(random 2);
//if (_chance == 1) then {_type = "Land_CargoBox_V1_F"} else {_type = "Land_CargoBox_V1_F"};
_box = ["Land_CargoBox_V1_F"/*,"CargoNet_01_barrels_F","CargoNet_01_box_F"*/];
_countBox = count _box;
_inBox = floor(random _countBox);
_type = _box select _inBox;

_xPOS = floor(random 400);
_yPOS = floor(random 400);

//_pos = [(_dest select 0) - 500 + random(500*2),(_dest select 1) - 500 + random(500*2),0];
_pos =  [(_dest select 0) + 1,(_dest select 1) + 5,(_dest select 2) + 1];
//_wrackPos = "Land_runway_edgelight_blue_F" createVehicle _pos;

//_house = nearestBuilding (getPosATL _wrackPos);
//_positions = [_house] call life_fnc_getBuildingPositions;;
//{_pos = _x;} forEach _positions;
_dasWrack = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
_dasWrack setPos _pos;
//deleteVehicle _wrackPos;
_dasWrack allowDamage false;
_dasWrack enableSimulation false;
_dasWrack setVariable ["trunk_in_use",false,true];
_dasWrack setVariable ["opened",false,true];
schiffwoffen = false;
wak = _dasWrack;

waitUntil {schiffwoffen}; // Warten, bis es geöffnet wird

_dasWrack setVariable ["opened",true,true];

// RANDOM LOOT EINFÜHREN

_lootAmount = schiffsw_loot_amount;
_lootArray = schiffsw_loot_array;
_lootTempToAdd = [];
_lootArrayFinal = [];

while {_lootAmount>0} do {
	_lootAmount = _lootAmount - 1;
	_loot_inArr = count _lootArray;
	_inArr = floor(random _loot_inArr);
	_lootTempToAdd = _lootArray select _inArr;
	_lootArrayFinal = _lootArrayFinal + [_lootTempToAdd];
};

_dasWrack setVariable ["Trunk",[_lootArrayFinal,500],true];

sleep 1800;

"schiffswmarker" setMarkerAlpha 0;
"schiffswmarkertext" setMarkerAlpha 0;

deleteMarker "schiffswmarker";
deleteMarker "schiffswmarkertext";
deleteVehicle _dasWrack;

[[3,"<t size='1.4'><t color='#A5DF00'>VERSUNKENE STADT</t></t><br/><br/><t size='1'>Der versunkene Schatz wurde entdeckt und gepluendert!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;