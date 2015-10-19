/*
	@Version: 1.0
	@Author: Tonic
	@Edited: 28.08.2013
*/
private ["_vehhut","_lightRed","_lightBlue","_lightright","_leftRed","_brightness","_attach"];

_lights = [_this,0,0,[0]] call BIS_fnc_param;
_side = [_this,1,0,[0]] call BIS_fnc_param;
_vehhut = vehhut;

if (isNil "_vehhut" || isNull _vehhut || !(_vehhut getVariable "lights")) exitWith {};



switch (_lights) do {
	
	case 0: 
	{ 
		//hint "Warnlicht an";
		_vehhut setVariable["lights",TRUE,TRUE];
		_vehhut setVariable["lightsOn",false,true];
		_attach = [[-0.0, 0.0, 0.40], [0.0, 0.0, 0.40]];
		if(_side isEqualTo 1) then
		{
			_lightRed = [20, 20, 0.1];
			_lightBlue = [20, 20, 0.1];
		}else{
			_lightRed = [20, 0.1, 0.1];
			_lightBlue = [0.1, 0.1, 20];
		};
		_lightright = createVehicle ["#lightpoint", getPos _vehhut, [], 0, "CAN_COLLIDE"];
		sleep 0.2;
		_lightright setLightColor _lightBlue;
		_lightright setLightBrightness 0;
		_lightright lightAttachObject [_vehhut, _attach select 0];
		_lightright setLightAttenuation [0.181, 0, 1000, 130];
		_lightright setLightIntensity 10;
		_lightright setLightFlareSize 0.10;
		_lightright setLightFlareMaxDistance 150;
		_lightright setLightUseFlare true;
		_lightright setLightDayLight true;

		
		if (sunOrMoon > 1) then {
		} else {
		_brightness = 30;
		};

		_leftBlue = true;  
		while {(alive _vehhut)} do { 
			if (!(_vehhut getVariable "lights")) exitWith {};
			if (_leftBlue) then {  
				_leftBlue = false;  
				sleep 0.05;
				_lightright setLightBrightness _brightness;  
			} else {  
				_leftBlue = true;  
				_lightright setLightBrightness 0;  
				sleep 0.05;  
			};
			sleep 0.22;  
		};
		deleteVehicle _lightright;
		_vehhut setVariable["lightsOn",true,true];
	};
	case 1: 
	{ 
		//hint "Warnlicht aus";
		_vehhut setVariable["lights",FALSE,TRUE];
	};
};	