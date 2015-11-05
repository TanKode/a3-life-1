/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by Adanteh
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.

	case "":{
		_lightleftBack lightAttachObject [_vehicle, []]; 
		_lightleftFront lightAttachObject [_vehicle, []];
	};	
*/
Private ["_RageBlinker","_vehicle","_lightleftBack","_lightleftFront","_lightYello","_leftRed","_lightSPOTfront","_lightSPOTback","_brightSPOT","_bright"]; 
_vehicle = _this select 0;
_time = _this select 1;
_lightYello = _this select 2;
_sound = _this select 3;
_flareSize = _this select 4;

waitUntil{_vehicle getVariable ["RAGE_Bstat",true]};
_vehicle setVariable ["RAGE_Bstat",false,true];

if(isNil "_vehicle" OR isNull _vehicle OR (_vehicle getVariable["RAGE_Blinker",""] != "left")) exitWith {_vehicle setVariable ["RAGE_Bstat",true,true];};

_lightleftBack = "#lightpoint" createVehicle getposATL _vehicle; 
_lightleftFront = "#lightpoint" createVehicle getposATL _vehicle; 
  
_lightleftBack setLightColor _lightYello; 
_lightleftFront setLightColor _lightYello;

_lightleftBack setLightBrightness 0;
_lightleftFront setLightBrightness 0;

_lightleftBack setLightAmbient _lightYello;
_lightleftFront setLightAmbient _lightYello; 

_lightleftBack setLightAttenuation 	[0, 0, 1000, 1300];
_lightleftFront setLightAttenuation [0, 0, 1000, 1300]; 

_lightleftBack setLightIntensity 0;
_lightleftFront setLightIntensity 0;

_lightleftBack setLightFlareMaxDistance 500;
_lightleftFront setLightFlareMaxDistance 500;

_lightleftFront setLightUseFlare true;
_lightleftBack setLightUseFlare true;

switch (typeOf _vehicle) do{
	case "C_Offroad_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.80, 2.15, -0.35]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.80, -2.95, -0.35]]; 
	};	
	case "B_G_Offroad_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]]; 
	};		
	case "C_Offroad_01_repair_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]]; 
	};	
	case "I_G_Offroad_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]]; 
	};	
	case "B_G_Offroad_01_repair_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]]; 
	};		
	//SUV
	case "C_SUV_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.50, 2.6, -0.5]];
		_lightleftBack lightAttachObject [_vehicle, [-0.52, -3.1, 0.0]]; 
	};
	//hetchback	
	case "C_Hatchback_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.83,1.7,-0.3]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.60,-2.3,-0.4]];
	};
	case "C_Hatchback_01_sport_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.83,1.7,-0.3]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.60,-2.3,-0.4]];
	};	
	//Armored
	case "B_MRAP_01_F":{
		_lightleftBack lightAttachObject [_vehicle, [-0.90, -4.3, -0.7]];
		_lightleftFront lightAttachObject [_vehicle, [-1.05, 1.4, -0.75]]; 
	};	
	case "O_MRAP_02_F":{ // ifrit
		_lightleftFront lightAttachObject [_vehicle, [-0.77,1.45,-1]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.63,-4.55,-1.3]];
	};
	case "I_MRAP_03_F":{
		_lightleftFront lightAttachObject [_vehicle, [-1,2.25,-0.8]]; 
		_lightleftBack lightAttachObject [_vehicle, [-1,-3.2,0]];
	};
	// hemets
	case "B_Truck_01_mover_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.77,4.6,-0.1]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.34,-4.2,-0.55]];	
	};
	case "B_Truck_01_transport_F":{
		_lightleftBack lightAttachObject [_vehicle, [-1.1,-5,-0.3]]; 
		_lightleftFront lightAttachObject [_vehicle, [-0.77,5.2,0.3]];
	};	
	//Zemeks
	case "I_Truck_02_transport_F":{
		_lightleftBack lightAttachObject [_vehicle, [-0.7,-3.4,-1.2]]; 
		_lightleftFront lightAttachObject [_vehicle, [-0.75,4.2,-1.2]];
	};	
	case "I_Truck_02_covered_F":{
		_lightleftBack lightAttachObject [_vehicle, [-0.7,-3.4,-1.2]]; 
		_lightleftFront lightAttachObject [_vehicle, [-0.75,4.2,-1.2]];
	};
	//Tempests
	case "O_Truck_03_device_F":{
		_lightleftBack lightAttachObject [_vehicle, [-1,-4.95,-0.95]]; 
		_lightleftFront lightAttachObject [_vehicle, [-0.8,3,-0.8]];
	};
	case "O_Truck_03_covered_F":{
		_lightleftBack lightAttachObject [_vehicle, [-0.75,3.2,-1.02]]; 
		_lightleftFront lightAttachObject [_vehicle, [-1,-4.7,-1.2]];
	};
	case "O_Truck_03_transport_F":{
		_lightleftBack lightAttachObject [_vehicle, [-0.75,3.2,-1.02]]; 
		_lightleftFront lightAttachObject [_vehicle, [-1,-4.7,-1.2]];
	};
	//quad
	case "B_Quadbike_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.37, 1.0, 0.0]];
		_lightleftBack lightAttachObject [_vehicle, [-0.37, -1.0, 0.0]]; 
	};	
};

_lightleftBack setLightFlareSize _flareSize;
_lightleftFront setLightFlareSize _flareSize;

_lightleftBack  setLightDayLight true;
_lightleftFront setLightDayLight true;

if (sunOrMoon < 1) then { 
	_lightleftFront setLightAttenuation [0.1, 100, 100, 1000]; 
	_lightleftBack setLightAttenuation [0.1, 100, 100, 1000]; 
} else {
	_lightleftFront setLightAttenuation [0.1, 0, 0.1, 1300];
	_lightleftBack setLightAttenuation [0.1, 0, 0.1, 1300];
};

_leftRed = true;  
while{ (alive _vehicle)} do{  
	_bright = (0.1 + sunOrMoon) * 3;	
	if((_vehicle getVariable["RAGE_Blinker",""] != "left")) exitWith {_vehicle setVariable ["RAGE_Bstat",true,true];};
	if(_leftRed) then{  
		_leftRed = false; 

		_lightleftFront setLightBrightness _bright;    		
		_lightleftBack setLightBrightness _bright; 
	}else{  
		_leftRed = true; 

		_lightleftBack setLightBrightness 0.0;  
		_lightleftFront setLightBrightness 0.0;  	
	};  	
	_vehicle say3D _sound;
	sleep _time;  
};  
deleteVehicle _lightleftBack;
deleteVehicle _lightleftFront;

_vehicle setVariable ["RAGE_Bstat",true,true];