#include <macro.h>
/*
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
if(isNil "king_get_out_of_jail_for_free") then {king_get_out_of_jail_for_free = false;};

private["_ret","_bad","_time","_bail","_esc","_countDown","_king_jail_time","_key_text"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param; //##80

_time = time + (_time * 60); //x Minutes
//if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); };

if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 75000; /*_time = time + (10 * 60); */};
_esc = false;
_bail = false;
_free = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Bitte Admin melden: JAIL_FALLBACK_15, time is zero!"; };

[_bad,_time] spawn {
	life_canpay_bail = false;
	life_bail_amount = life_bail_amount * 5;
	if(_this select 0) then {
		//sleep (10 * 60);
		sleep ( (_this select 1) * 0.5 );
	} else {
		//sleep (5 * 60);
		sleep ( (_this select 1) * 0.2 );
	};
	life_canpay_bail = nil;
};

while {true} do
{
	 //reduce the jail time in case of some work
    if(!isNil "king_jail_reduce_time") then
    {
        if(king_jail_reduce_time > 0) then
        {
            _time = _time - king_jail_reduce_time;
            titleText[format["Deine Haftzeit wurde um %1 Sekunden reduziert.", king_jail_reduce_time],"PLAIN"];
            king_jail_reduce_time = 0;
        };
    };

	if((round(_time - time)) > 0) then
	{
        _key_text = "";
        if(!isNil "king_jail_work_keys_found") then
        {
            _key_text = format["%1 von %2 Schlüssel gefunden<br/>baue mehr Steine ab!",king_jail_work_keys_found,king_jail_work_needed_keys];
        };
		//_countDown = if(round (_time - time) > 60) then {format["%1 minute(s)",round(round(_time - time) / 60)]} else {format["%1 second(s)",round(_time - time)]};
		//hintSilent format["Verbleibende Zeit:\n %1\n %2", _countDown, _key_text];
		_countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='1.5'><t color='#FF0000'>%1<br/>%4</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"},_key_text];
		
	};
	
	if(player distance (getMarkerPos "jail_marker") > 80) exitWith
	{
		_esc = true;
	};
	
	if(life_bail_paid) exitWith
	{
		_bail = true;
	};
	
    if(king_get_out_of_jail_for_free) exitWith
    {
        _free = true;
    };

	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith
	{
	
	};
	sleep 1;
};


switch (true) do
{
	case (_free) :
	{
		life_is_arrested = false;
        life_time_arrested = 0;
		life_bail_paid = false;
        king_get_out_of_jail_for_free = false;
        player SVAR["king_jail_work_all_keys_found",false,false];
        king_jail_work_keys_found = 0;
        king_jail_work_gathering_amount = 0;
		hint "Du bist wieder frei!";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_bail): 
	{
		life_is_arrested = false;
		life_time_arrested = 0;
		life_bail_paid = false;
		king_get_out_of_jail_for_free = false;
        player SVAR["king_jail_work_all_keys_found",false,false];
        king_jail_work_keys_found = 0;
        king_jail_work_gathering_amount = 0;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc): {
		life_is_arrested = false;
		 life_time_arrested = 0;
        life_bail_paid = false;
        king_get_out_of_jail_for_free = false;
        player SVAR["king_jail_work_all_keys_found",false,false];
        king_jail_work_keys_found = 0;
        king_jail_work_gathering_amount = 0;
		hint localize "STR_Jail_EscapeSelf";
		[[0,"STR_Jail_EscapeNOTF",true,[profileName]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail): {
		life_is_arrested = false;
		life_time_arrested = 0;
        life_bail_paid = false;
        king_get_out_of_jail_for_free = false;
        player SVAR["king_jail_work_all_keys_found",false,false];
        king_jail_work_keys_found = 0;
        king_jail_work_gathering_amount = 0;
		hint localize "STR_Jail_Released";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
	};
};