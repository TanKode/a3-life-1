/*
	File: fn_airDrop.sqf
	Original file Author: RYN_Ryan
	Author: Tertius @ GBB (Dave)
	
	Description:
	AirDrop event start!
     
*/
private["_pos","_this","_dest","_marker","_markerText","_handle","_bmb"];

_pos = [_this,0,[],[[]]] call BIS_fnc_param;

if (!airdrop_enable) exitWith {};
if (airdrop_goingon) exitWith {};
airdrop_goingon = true;

_dest = _pos;

sleep 10;

// AIRDROP STARTEN
[[3,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>Ein Helikopter wird eine Waffenlieferung des Militaers abwerfen in 45 min! Die Landezone wird in kuerze markiert!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

sleep (15*60);

_marker = createMarker ["Airdropmarker", _dest];
"Airdropmarker" setMarkerColor "ColorRed";
"Airdropmarker" setMarkerType "Empty";
"Airdropmarker" setMarkerShape "ELLIPSE";
"Airdropmarker" setMarkerSize [500,500];
_markerText = createMarker ["Airdropmarkertext", _dest];
"Airdropmarkertext" setMarkerColor "ColorBlack";
"Airdropmarkertext" setMarkerText "Airdrop-Mission";
"Airdropmarkertext" setMarkerType "mil_warning";

deleteMarker "event";

[[3,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>30 min bis zum Abwurf der Waffenlieferung! Die Landezone wurde auf der Karte markiert!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

sleep (15*60);

[[3,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>15 min bis zum Abwurf der Waffenlieferung!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

sleep (5*60);

eventAirDropWait = true;
[[eventAirDropWait],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;

_handle = [] spawn life_fnc_airDropWait;
waitUntil {scriptDone _handle};

eventAirDropWait = false;
[[eventAirDropWait],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;

sleep 1;

_posM = getMarkerPos "Airdropmarker";

_handle = [[_posM],"TON_fnc_generateAirdrop",false,false] spawn life_fnc_MP;
waitUntil {scriptDone _handle};

sleep (10*60);
deleteVehicle heli1;
deleteVehicle heli2;
deleteVehicle heli3;
sleep (5*60);
[[3,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>15 min bis zur Selbstzerstoerung!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
sleep (5*60);

eventAirDropEnd = true;
[[eventAirDropEnd],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;

_handle = [] spawn life_fnc_airDropEnd;
waitUntil {scriptDone _handle};

eventAirDropEnd = false;
[[eventAirDropEnd],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;

[[3,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission beendet!</t></t><br/><br/><t size='1'>Das Airdrop-Event ist beendet!!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

deleteVehicle airBoxM; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)-21,(getPos airBoxM select 1)+21,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)-1,(getPos airBoxM select 1)+56,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)+23,(getPos airBoxM select 1)-75,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)-50,(getPos airBoxM select 1)+1,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)+87,(getPos airBoxM select 1)-22,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)+0,(getPos airBoxM select 1)-0,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)+20,(getPos airBoxM select 1)-20,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)-100,(getPos airBoxM select 1)+56,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)+100,(getPos airBoxM select 1)-100,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)-55,(getPos airBoxM select 1)+123,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)+577,(getPos airBoxM select 1)-83,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)+35,(getPos airBoxM select 1)-99,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)+100,(getPos airBoxM select 1)-100,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos airBoxM select 0)-431,(getPos airBoxM select 1)-431,0];

"Airdropmarker" setMarkerAlpha 0;
"Airdropmarkertext" setMarkerAlpha 0;

deleteMarker "airbox_marker";
deleteMarker "Airdropmarker";
deleteMarker "Airdropmarkertext";

airdrop_goingon = false;
