/*
    File: fn_wkasten.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_wkasten"];
_wkasten = "Land_ToolTrolley_02_F" createVehicle [0,0,0];
_wkasten attachTo[player,[0,2.5,0.2]];
_wkasten setDir 90;
_wkasten setVariable["item","mauerDeployed",true];

life_action_wkastenDeploy = player addAction["<t color='#00FF00'>Werkzeugkasten aufstellen</t>",{if(!isNull life_wkasten) then {detach life_wkasten; life_wkasten = ObjNull;}; player removeAction life_action_wkastenDeploy; life_action_wkastenDeploy = nil;},"",999,false,false,"",'!isNull life_wkasten'];
life_wkasten = _wkasten;
waitUntil {isNull life_wkasten};
if(!isNil "life_action_wkastenDeploy") then {player removeAction life_action_wkastenDeploy;};
if(isNull _wkasten) exitWith {life_wkasten = ObjNull;};
_wkasten setPos [(getPos _wkasten select 0),(getPos _wkasten select 1),0];
_wkasten allowDamage false;