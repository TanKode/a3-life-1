/*
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_time","_timeUp","_time","_countDown"];
_time = [_this,0,0,[0]] call BIS_fnc_param;
player say3D "taxi";
_timeUp = time + _time;
	
player removeAllEventHandlers "handleDamage";
player addEventHandler ["handleDamage", {false}];
player allowDamage false;
disableUserInput true;

while {true} do
{
	if((round(_timeUp - time)) > 0) then {
		_countDown = [(_timeUp - time), "MM:SS"] call BIS_fnc_secondsToString;
		hintSilent parseText format["<t size='1.5'>Du bist noch<t color='#FF0000'> ca. %1 Minute unterwegs...</t></t>", _countDown];	
	};
	
	if(!alive player) exitWith 
	{
		life_action_inUse = false;
	};

	if((round(_timeUp - time)) == 0) exitWith {hint ""};
	sleep 0.1;
};
