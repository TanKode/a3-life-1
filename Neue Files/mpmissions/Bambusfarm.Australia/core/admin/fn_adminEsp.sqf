if((call life_adminlevel) < 3) exitWith {
	closeDialog 0; 
	hint localize "STR_ANOTF_ErrorLevel";
	["Sie haben keine Berechtigung das das AdminMenu zu benutzen!!"] spawn bis_fnc_dynamictext;
	_message = format["%1 versuchte die DebugConsole zu oeffnen!!", name player];
	[["",_message,player,9],"TON_fnc_handleMessages",false,false] spawn life_fnc_MP;
	0 cutText["","BLACK FADED"];
	0 cutFadeOut 9999999;
	disableUserInput true;
	life_frozen = true;
	player setPos [0,0,0];
};

_marker_mapesp = true;
//Alle Vehicle
_list_vec = (allMissionObjects "Plane")+(allMissionObjects "LandVehicle")+(allMissionObjects "Helicopter")+(allMissionObjects "Ship");
//<-----GLOBAL-VARIABLE----->

//hint "Adding Markers on the map";

while {_marker_mapesp} do
{    
    //<-----PLAYER-MARKER----->
    //<----------------------->
    //<-----PLAYER-MARKER----->
    _unitList_player = playableUnits; //getting all units
    _totalunits = count _unitList_player;
    //hint format["%1", totalunits];
    
    o = 0;
    yo = 0;

    for "o" from 0 to _totalunits do
    {
        _actualunit = _unitList_player select 0; //Player1
        //hint format["%1", actualunit];
        
        if ( isPlayer _actualunit && alive _actualunit ) then 
        {
            deleteMarkerLocal ("Player" + (str o));
            yo = o + 1;
            deleteMarkerLocal ("Player" + (str yo));
                
            _namePlayer = "";
            _namePlayer = name _actualunit;
        
            _mark_player = "Player" + (str o); //Player0, Player1, Player2
            _mark_player = createMarkerLocal [_mark_player,getPos _actualunit];
            _mark_player setMarkerTypeLocal "waypoint";
            _mark_player setMarkerPosLocal (getPos _actualunit);
            _mark_player setMarkerColorLocal "ColorBlue";
            _mark_player setMarkerTextLocal format ["%1",_namePlayer];
        };
    };    
    //bit of sleep
    sleep 0.1;
};

k = 0;
for "k" from 0 to 2000 do
{
    deleteMarkerLocal ("Player"+ (str k));
    deleteMarkerLocal ("Vehicle"+ (str k));
};