/*
    File: fn_vehhut.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_vehhut"];
_vehhut = "RoadCone_L_F" createVehicle [0,0,0];
_vehhut attachTo[player,[0,5.5,0.2]];
_vehhut setDir 90;
_vehhut setVariable["item","vehhutDeployed",true];
closeDialog 0;

life_action_vehhutDeploy = player addAction[localize "STR_ISTR_Vehhut_Place",{if(!isNull life_vehhut) then {detach life_vehhut; life_vehhut = ObjNull;}; player removeAction life_action_vehhutDeploy; life_action_vehhutDeploy = nil;},"",999,false,false,"",'!isNull life_vehhut'];
life_vehhut = _vehhut;
waitUntil {isNull life_vehhut};
if(!isNil "life_action_vehhutDeploy") then {player removeAction life_action_vehhutDeploy;};
if(isNull _vehhut) exitWith {life_vehhut = ObjNull;};
_vehhut setPos [(getPos _vehhut select 0),(getPos _vehhut select 1),0];
_vehhut allowDamage false;
_vehhut setVariable["lightsOn",true,true];
_vehhut setVariable["vehhutDown",true,true];
//[[_vehhut],"TON_fnc_vehhut",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.

