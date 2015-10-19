#include <macro.h>
/*         
            file: fn_robShops2.sqf
            Author: MrKraken
            Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
            Description:
            Executes the rob shob action!
            Idea developed by PEpwnzya v2.0
            
*/ 
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the _shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if !(alive _robber) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
_rip = true;
_kassa = 15000 + round(random 60000); //Maximal & Minimal Beute
[[_shop,_robber,_action,-1],"TON_fnc_shopState",true,false] spawn life_fnc_MP;

_chance = random(100);
if(_chance >= 30) then { hint "Der Kassierer hat heimlich die Polizei informiert!"; [[3,format["<t color='#CB2525'><t size='2'>!ALARM!:</t><br/><t color='#FFFFFF'>Tankstelle %1 wird gerade ausgeraubt!<br/>",_shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;}; //50% Chance das die Polizei allamiert wird

_upp = format["Geld wird eingepackt , bleib in der Umgebung (5m)"];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
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
        sleep  2.00;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["Geld wird eingepackt, bleib in der Umgebung (5m) (%1%2)...",round(_cP * 100),"%"];
        if(_cP >= 1) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
        if(_robber distance _shop > 5) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
		if(life_istazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
		if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
        if!(alive _robber) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
		if((_robber getVariable["restrained",false])) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
        
    }; // the loop continues til the progressbar is full, distance is exceeded or robber dies. 
    if!(alive _robber) exitWith { _rip = false; [[getPlayerUID _robber,name _robber,"46A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
	if(life_istazed) exitWith { _rip = false; [[getPlayerUID _robber,name _robber,"46A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
	if(life_interrupted) exitWith {life_interrupted = false; [[getPlayerUID _robber,name _robber,"46A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; _rip = false; [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;};
    if(_robber distance _shop > 5) exitWith { hint "Du hast dich zu weit entfernt!"; [[getPlayerUID _robber,name _robber,"46A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; 5 cutText ["","PLAIN"]; _rip = false;  [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP; };
    
	5 cutText ["","PLAIN"];
    [[3,format["Du hast %1 geklaut, nichts wie weg hier, die Cops sind auf dem Weg!",[_kassa] call life_fnc_numberText]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
    [[1,player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;
	if(skill_civ_intimidating) then
	{
		_kassaAdd = round(_kassa * 0.20);
		ADD(_kassa,_kassaAdd);
	};
	ADD(CASH,_kassa); 

    _rip = false;
    life_use_atm = false;
	[[_shop,_robber,_action,0],"TON_fnc_shopState",true,false] spawn life_fnc_MP;
    sleep (30 + random(180)); //Clerk in the store takes between 10-60 seconds before he manage to warn the police about the robbery. 
    life_use_atm = true; // Robber can not use the ATM at this point.
    if!(alive _robber) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	[[3,format["<t color='#CB2525'><t size='2'>112 - Gasstation:</t><br/><t color='#FFFFFF'>%2 wurde gerade von %1 ausgeraubt er hat $%3 erbeutet!<br/>",name _robber, _shop, [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	[[3,format["<t color='#CB2525'><t size='2.5'>NEWS:</t><br/>Gasstation: <t color='#FFFFFF'>%2 wurde gerade von %1 ausgeraubt er hat $%3 erbeutet!<br/>",name _robber, _shop, [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
    [[getPlayerUID _robber,name _robber,"488"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; 
};
_exp = round(random(300));
[true,_exp] spawn life_fnc_expConfig;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];