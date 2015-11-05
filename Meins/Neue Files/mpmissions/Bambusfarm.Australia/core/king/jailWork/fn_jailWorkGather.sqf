/*
	File: fn_jailWorkGather.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	jailWorkGather
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

if(!king_jail_work_is_active) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(king_jail_work_gathering_is_running) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(!(king_jail_work_source getVariable "king_jail_work_source_registered")) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(king_jail_work_gathering_amount >= king_jail_work_gathering_max_amount) exitWith {titleText[format["Deine Taschen sind voll bringe die Steine zuerst in die Kisten."],"PLAIN"];};

king_jail_work_gathering_is_running = true;

[] spawn
{
    private["_obj","_progress_text","_gathered_amount","_key_roll","_success"];
    _obj = king_jail_work_source;
        
	_progress_text = format["Baue Steine ab..."];

    _success = [20, _progress_text, _obj] call life_fnc_progressWaitUntilFinished;
    if(!_success) exitWith {king_jail_work_gathering_is_running = false;};
    
    _gathered_amount = floor(1 + (random 10));
    
    titleText[format["Du hast %1 Steine abgebaut.", _gathered_amount],"PLAIN"];

    if(king_jail_work_keys_found < king_jail_work_needed_keys) then
    {
        _key_roll = random 100;
        if(_key_roll < king_jail_work_dropchance_key) then
        {
            king_jail_work_keys_found = king_jail_work_keys_found + 1;
            ["InformationMessage",[format["%1 von %2 Schlüssel gefunden",king_jail_work_keys_found,king_jail_work_needed_keys]]] call bis_fnc_showNotification;
        };
        if(king_jail_work_keys_found == king_jail_work_needed_keys) then
        {
            player setVariable["king_jail_work_all_keys_found",true,false];
            sleep 2;
            ["InformationMessage",[format["Gehe doch mal zur Wache!"]]] call bis_fnc_showNotification;
        };
    };
    
    sleep 1;
    
    king_jail_work_gathering_amount = king_jail_work_gathering_amount + _gathered_amount;
    if(king_jail_work_gathering_amount > king_jail_work_gathering_max_amount) then
    {
        king_jail_work_gathering_amount = king_jail_work_gathering_max_amount;
        titleText[format["Deine Taschen sind voll, trage die Steine zu den Kisten."],"PLAIN"];
    };
    
    king_jail_work_gathering_is_running = false;
};
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"]; 