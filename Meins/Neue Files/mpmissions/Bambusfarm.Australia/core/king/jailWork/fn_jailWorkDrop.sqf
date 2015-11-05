/*
	File: fn_jailWorkDrop.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	jailWorkDrop
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

if(!king_jail_work_is_active) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(!(king_jail_work_destination getVariable "king_jail_work_destination_registered")) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(king_jail_work_gathering_is_running) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(king_jail_work_gathering_amount <= 0) exitWith {titleText[format["Deine Taschen sind leer, baue zuerst Steine ab."],"PLAIN"];};

king_jail_work_gathering_is_running = true;

[] spawn
{
    private["_obj","_progress_text","_success"];
    _obj = king_jail_work_destination;
        
	_progress_text = format["Lege Steine in die Kisten..."];

    _success = [20, _progress_text, _obj] call life_fnc_progressWaitUntilFinished;
    if(!_success) exitWith {king_jail_work_gathering_is_running = false;};
	
    titleText[format["Du hast %1 Steine in die Kisten gepackt.", king_jail_work_gathering_amount],"PLAIN"];
    
    //set global var to reduce jail time
    king_jail_reduce_time = floor(king_jail_work_gathering_amount / 1);
    
    king_jail_work_gathering_amount = 0;
    
    king_jail_work_gathering_is_running = false;
};
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
