_time = [_this,0,10,[0]] call BIS_fnc_param;
_mode = [_this,1,0,[0]] call BIS_fnc_param;
_time = _time * 60;
paintball123 = _time;

pb_spielstatus=1;
[["Paintballarena","Ein Spieler hat soeben eine Lobby in der Paintballarena eröffnet! Die Lobby schließt sich in 3 Minuten!"],"life_fnc_ryn_message",true,false] spawn life_fnc_MP;
sleep (3*60);

if (count (pb_spieler select 0)>=2) then {

    pb_spielstatus=2;
	_allpnames = pb_spieler select 1;
    {
		if(_mode == 1) then
		{
        	[[2],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
		}else{
			[[10],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
		};
    } forEach (pb_spieler select 0);

	_paintballTime = time + _time;
	while{true} do
	{
		sleep (2*59);
		{
			_paintballUpTime = [(_paintballTime - time),"MM"] call BIS_fnc_secondsToString;
			paintballUpTime = _paintballUpTime;
			_msg = format["Das Spiel läuft noch %1 Minuten",_paintballUpTime];
			[[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
			[[8,_allpnames],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
		} forEach (pb_spieler select 0);
		if((round(_paintballTime - time)) <= 0) exitWith {hint ""};
	};
	
	sleep 1;
    {
        [[3],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
    } forEach (pb_spieler select 0);
	
	sleep 5;
	{
        [[9],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
    } forEach (pb_spieler select 0);
	pb_spieler = [[],[]];
    pb_spielstatus=0;
    joinmode = 0;
    publicVariable "joinmode";

} else {

    _msg = "Da zu wenig Spieler sich in der Lobby befanden wurde das Spiel abgebrochen!";
    {
        [[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
    } forEach (pb_spieler select 0);
    pb_spieler = [[],[]];
    pb_spielstatus=0;
    joinmode = 0;
    publicVariable "joinmode";
	life_paintball_group = [];
	publicVariable "life_paintball_group";
	paintballGroup1 = true;
	publicVariable "paintballGroup1";
	paintballGroup2 = true;
	publicVariable "paintballGroup2";
	life_GameOn = false;
	publicVariable "life_gameOn";
};