/*
	File: fn_adminEvent.sqf
	Author: PierreAmyf
	
	Description:
	Evnt Script!
     
*/
private["_event","_handle"];

_event = [_this,0,0,[0]] call BIS_fnc_param;

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

switch (_event) do
{
	case 0: {
		eventStart = true;
		[[eventStart],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;
		playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
		sleep 6;
		eventStart = false;
		[[eventStart],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;
	};
	
	case 1: {
		eventEnd = true;
		[[eventEnd],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;
		playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
		sleep 6;
		eventEnd = false;
		[[eventEnd],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;
	};
	
	case 2: {
		private["_markerEvent","_pos","_position","_handle"];
		if(life_AirDropStart) exitWith {};
		closeDialog 0;
		sleep 0.1;
		closeDialog 0;
		airDropPos =
		{
			[[_this select 0],"TON_fnc_airDrop",true,false] spawn life_fnc_MP;
		};
		hint "Die Position des AirDrops per Mapklick auswaehlen!";
		openMap true;
		//Get the Map click.
			
		if(visibleMap) then
		{
			onMapSingleClick "[_pos] spawn airDropPos; onMapSingleClick """"; openMap false";
		};
		//Clear the Mapclick Handle.
		waitUntil{!visibleMap};
		onMapSingleClick "";
		eventStart = true;
		[[eventStart],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;
		playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
		sleep 6;
		eventStart = false;
		[[eventStart],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;
		life_AirDropStart = true;
		sleep (95*60);
		life_AirDropStart = false;
		eventEnd = true;
		[[eventEnd],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;
		playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
		sleep 6;
		eventEnd = false;
		[[eventEnd],"life_fnc_hudUpdate",true,false] spawn life_fnc_MP;
	};	
};
