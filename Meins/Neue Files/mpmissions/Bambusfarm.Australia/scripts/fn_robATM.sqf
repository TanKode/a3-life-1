#include <macro.h>
/*
    File: fn_robATM.sqf
    Author: PierreAmyf
    
    Description:
    ATM / Geldautomat ausrauben
    
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;
_cops = (west countSide playableUnits);
//if(_cops < 2) exitWith { hint "Es müssen min. 2 Polizisten Online sein!";};
_marker = "";

if !(alive _robber) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
_rip = true;
_kassa = 20000 + round(random 60000);

if(!([false,"boltCutter",1] call life_fnc_handleInv)) exitWith {hint "Du brauchst einen Bolzenschneider!"};
if (_kassa == 0) exitWith { hint "Es ist kein Geld vorhanden!"};

_chance = random(100);
if(_chance >= 15) then { hint "Die Polizei wurde benachrichtig!"; [[3,format["<t color='#CB2525'><t size='2'>!ALARM!:</t><br/><t color='#FFFFFF'>Geldautomat %1 wird gerade ausgeraubt!<br/>",_shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;};
 
_upp = format["Automat wird aufgebrochen, bleib in der Umgebung (5m)!"];
                                                                          
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace GVAR "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_rip) then
{
	
	[[0,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;
    while{true} do
    {
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
			player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};
		sleep 0.26;
		if(isNull _ui) then {
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNamespace GVAR  "life_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		
        sleep 2.00;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if(_cP >= 1) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
        if(_robber distance _shop > 5) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
        if(life_istazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
        if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
        if!(alive _robber) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
        if((_robber GVAR["restrained",false])) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
    
    };  
    if!(alive _robber) exitWith { _rip = false; [[getPlayerUID _robber,name _robber,"48"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
    if(life_istazed) exitWith { _rip = false; [[getPlayerUID _robber,name _robber,"48"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};   
    if(life_interrupted) exitWith {life_interrupted = false; [[getPlayerUID _robber,name _robber,"48"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; _rip = false; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};    
    if(_robber distance _shop > 5) exitWith {hint "Sie haben sich zu weit entfernt!"; [[getPlayerUID _robber,name _robber,"48"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; 5 cutText ["","PLAIN"]; _rip = false;  [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
    
    5 cutText ["","PLAIN"];
    [[3,format["Sie haben %1 geklaut, nichts wie weg hier, die Cops sind schon auf dem Weg!",[_kassa] call life_fnc_numberText]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
    [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;
    if(skill_civ_intimidating) then
    {
        _kassaAdd = round(_kassa * 0.20);
        ADD(_kassa,_kassaAdd);
    };

    _dice = random(100);
    if(_dice < 30) then {
        titleText[localize "STR_ISTR_ATM_Success","PLAIN"];
        ADD(CASH,_kassa);
        [[getPlayerUID player,profileName,"240"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
    } else {
        [[getPlayerUID player,profileName,"48"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
        [[0,"STR_ISTR_ATM_FailedNOTF",true,[profileName]],"life_fnc_broadcast",west,false] call life_fnc_MP;
    };
    
    _rip = false;
    life_use_atm = false;
    sleep (30 + random(180)); //Clerk in the store takes between 10-60 seconds before he manage to warn the police about the robbery. 
    life_use_atm = true; // Robber can not use the ATM at this point.
    if!(alive _robber) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
    [[3,format["<t color='#CB2525'><t size='2'>112 - Geldautomat:</t><br/><t color='#FFFFFF'>%2 wurde gerade von %1 aufgebrochen und hat er $%3 erbeutet!<br/>",name _robber, _shop, [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
    [[3,format["<t color='#CB2525'><t size='2.5'>NEWS:</t><br/>Geldautomat: <t color='#FFFFFF'>%2 wurde gerade von %1 aufgebrochen und hat $%3 erbeutet!<br/>",name _robber, _shop, [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
    [[getPlayerUID _robber,name _robber,"240"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; 
    
};                           
_exp = round(random(300));
[true,_exp] spawn life_fnc_expConfig;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];