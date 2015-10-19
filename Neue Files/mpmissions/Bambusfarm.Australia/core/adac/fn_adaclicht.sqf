/*
	@Version: 1.0
	@Author: Tonic
	@Edited: 28.08.2013
*/
private ["_mauer","_lightRed","_lightBlue","_lightleft","_lightright","_leftRed","_brightness","_attach"];

_mauer = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_lights = [_this,1,0,[0]] call BIS_fnc_param;
_side = [_this,2,0,[0]] call BIS_fnc_param;

if (isNil "_mauer" || isNull _mauer || !(_mauer getVariable "lights")) exitWith {};

switch (_lights) do {
	
	case 0: 
	{ 
		//[[3,format["Warnlich AN"]],"life_fnc_broadcast",player,FALSE] call life_fnc_MP;
		_mauer setVariable["lights",TRUE,TRUE];
		_attach = [[-0.95, 0.0, 0.50], [0.95, 0.0, 0.50]];
		if(_side isEqualTo 1) then
		{
			_lightRed = [20, 20, 0.1];
			_lightBlue = [20, 20, 0.1];
		}else{
			_lightRed = [20, 0.1, 0.1];
			_lightBlue = [0.1, 0.1, 20];
		};
		_lightleft = createVehicle ["#lightpoint", getPos _mauer, [], 0, "CAN_COLLIDE"];
		sleep 0.2;
		_lightleft setLightColor _lightRed;
		_lightleft setLightBrightness 0;
		_lightleft lightAttachObject [_mauer, _attach select 0];
		_lightleft setLightAttenuation [0.181, 0, 1000, 130];
		_lightleft setLightIntensity 10;
		_lightleft setLightFlareSize 0.10;
		_lightleft setLightFlareMaxDistance 150;
		_lightleft setLightUseFlare true;
		_lightleft setLightDayLight true;

		_lightright = createVehicle ["#lightpoint", getPos _mauer, [], 0, "CAN_COLLIDE"];
		sleep 0.2;
		_lightright setLightColor _lightBlue;
		_lightright setLightBrightness 0;
		_lightright lightAttachObject [_mauer, _attach select 1];
		_lightright setLightAttenuation [0.181, 0, 1000, 130];
		_lightright setLightIntensity 10;
		_lightright setLightFlareSize 0.10;
		_lightright setLightFlareMaxDistance 150;
		_lightright setLightUseFlare true;
		_lightright setLightDayLight true;
		
		if (sunOrMoon < 1) then {
		_brightness = 4;
		} else {
		_brightness = 30;
		};

		_leftRed = true;  
		while {(alive _mauer)} do { 
			if (!(_mauer getVariable "lights")) exitWith {};
			if (_leftRed) then {  
				_leftRed = false;  
				_lightright setLightBrightness 0;  
				sleep 0.05;
				_lightleft setLightBrightness _brightness;  
			} else {  
				_leftRed = true;  
				_lightleft setLightBrightness 0;  
				sleep 0.05;
				_lightright setLightBrightness _brightness;  
			};
			sleep 0.22;  
		};
		deleteVehicle _lightleft;
		deleteVehicle _lightright;
		_mauer setVariable["lightsOn",true,true];
	};
	case 1: 
	{ 
		//[[3,format["Warnlich AUS"]],"life_fnc_broadcast",player,FALSE] call life_fnc_MP;
		_mauer setVariable["lights",FALSE,TRUE];
	};
};	
