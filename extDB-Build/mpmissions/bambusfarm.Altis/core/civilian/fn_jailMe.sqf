/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_ttime = round(random 60);
if(_bad) then { _time = time + 1100; } else { _time = time + (_ttime * 60); };

if(count _ret > 0) then { bambusfarm_bail_amount = (_ret select 3); } else { bambusfarm_bail_amount = 1500; _time = time + (10 * 60); };
_esc = false;
_bail = false;

[_bad] spawn
{
	bambusfarm_canpay_bail = false;
	if(_this select 0) then
	{
		sleep (10 * 60);
	}
		else
	{
		sleep (5 * 60);
	};
	bambusfarm_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " €%2",_countDown,[bambusfarm_bail_amount] call bambusfarm_fnc_numberText,if(isNil "bambusfarm_canpay_bail") then {"Yes"} else {"No"}];
	};
	
	if(player distance (getMarkerPos "jail_marker") > 60) exitWith {
		_esc = true;
	};
	
	if(bambusfarm_bail_paid) exitWith {
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 0.1;
};


switch (true) do
{
	case (_bail) :
	{
		bambusfarm_is_arrested = false;
		bambusfarm_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"bambusfarm_fnc_wantedRemove",false,false] spawn bambusfarm_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc) :
	{
		bambusfarm_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[[0,"STR_Jail_EscapeNOTF",true,[profileName]],"bambusfarm_fnc_broadcast",nil,false] spawn bambusfarm_fnc_MP;
		[[getPlayerUID player,profileName,"901"],"bambusfarm_fnc_wantedAdd",false,false] spawn bambusfarm_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		bambusfarm_is_arrested = false;
		hint localize "STR_Jail_Released";
		[[getPlayerUID player],"bambusfarm_fnc_wantedRemove",false,false] spawn bambusfarm_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
	};
};