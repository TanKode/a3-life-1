/*
    Changes state of stations. serverside
*/
private["_shop","_robber","_action","_state"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_state = [_this,3,-1,[0]] call BIS_fnc_param;
if(isNull _shop) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

switch (_state) do
{
    case -1: //here we set the cooldown variable for the shop, then we fire up a script for all clients that takes care of animations and removal of actions.
    {
		_shop setVariable["rip",false,true];
    };
    case 0: //the cooldown timer is set, and we clear the lock, then calls for a serverwide animation change and reinstatement of the action we removed to prevent spam.
    {
		_shop setVariable["locked",false,true];
		_shop setVariable["rip",true,true];
    	sleep (20*60);
    	_shop setVariable["locked",true,true];
	};
};