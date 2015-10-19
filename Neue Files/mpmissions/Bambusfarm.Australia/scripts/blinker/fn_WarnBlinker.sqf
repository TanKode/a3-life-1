/*
	File: fn_WarnBlinker.sqf
	Based on:
		Author: mindstorm, modified by Adanteh
		Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	Mod: Ragebone	

	case "":{	
		_leftFront 		lightAttachObject [_vehicle, []]; 
		_leftBack  		lightAttachObject [_vehicle, []];
		_rightFront 	lightAttachObject [_vehicle, []];
		_rightBack 		lightAttachObject [_vehicle, []];		
	};	
*/
Private ["_RageBlinker","_leftRed","_vehicle","_lightYello","_leftBack","_leftSPOTback","_leftFront","_leftSPOTfront","_rightBack","_rightSPOTback","_rightFront","_rightSPOTfront","_brightSPOT","_bright"]; 
_vehicle = _this select 0;
_time = _this select 1;
_lightYello = _this select 2;
_sound = _this select 3;
_flareSize = _this select 4;

waitUntil{_vehicle getVariable ["RAGE_Bstat",true]};
_vehicle setVariable ["RAGE_Bstat",false,true];

if(isNil "_vehicle" OR isNull _vehicle OR (_vehicle getVariable["RAGE_Blinker",""] != "warning")) exitWith {_vehicle setVariable ["RAGE_Bstat",true,true];};

_pos = getposATL _vehicle;
_leftBack = "#lightpoint" createVehicle _pos;
_leftFront = "#lightpoint" createVehicle _pos;
_rightBack = "#lightpoint" createVehicle _pos;
_rightFront = "#lightpoint" createVehicle _pos;

_leftBack setLightColor _lightYello; 
_leftFront setLightColor _lightYello; 
_rightBack setLightColor _lightYello; 
_rightFront setLightColor _lightYello; 

_leftBack setLightBrightness 0;
_leftFront setLightBrightness 0;
_rightBack setLightBrightness 0;
_rightFront setLightBrightness 0;

_leftBack setLightAmbient _lightYello;
_leftFront setLightAmbient _lightYello;
_rightBack setLightAmbient _lightYello;
_rightFront setLightAmbient _lightYello;

_leftBack setLightIntensity 0;
_leftFront setLightIntensity 0;
_rightBack setLightIntensity 0;
_rightFront setLightIntensity 0;

_leftBack  setLightFlareMaxDistance 500;
_leftFront setLightFlareMaxDistance 500;
_rightBack setLightFlareMaxDistance 500;
_rightFront setLightFlareMaxDistance 500;

_leftBack  setLightUseFlare true;  
_leftFront setLightUseFlare true;
_rightBack setLightUseFlare true;
_rightFront setLightUseFlare true;

switch (typeOf _vehicle) do{
	case "C_Offroad_01_F":{	
		_leftFront 		lightAttachObject [_vehicle, [-0.8, 2.15, -0.35]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.8, -2.95, -0.35]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.15, -0.35]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -2.95, -0.35]];		
	};
	case "C_Offroad_01_repair_F":{
		_leftFront 		lightAttachObject [_vehicle, [-0.8, 2.15, -0.35]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.8, -2.95, -0.35]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.15, -0.35]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -2.95, -0.35]];		
	};
	case "B_G_Offroad_01_F":{		
		_leftFront 		lightAttachObject [_vehicle, [-0.8, 2.15, -0.35]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.8, -2.95, -0.35]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.15, -0.35]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -2.95, -0.35]];		
	};
	case "I_G_Offroad_01_F":{		
		_leftFront 		lightAttachObject [_vehicle, [-0.8, 2.15, -0.35]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.8, -2.95, -0.35]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.15, -0.35]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -2.95, -0.35]];		
	};
	case "B_G_Offroad_01_repair_F":{		
		_leftFront 		lightAttachObject [_vehicle, [-0.8, 2.15, -0.35]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.8, -2.95, -0.35]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.15, -0.35]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -2.95, -0.35]];					
	};		
	//SUV
	case "C_SUV_01_F":{		
		_leftFront 		lightAttachObject [_vehicle, [-0.50,2.6,-0.5]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.52,-3.1,-0.2]];
		_rightFront 	lightAttachObject [_vehicle, [0.50,2.6,-0.5]];
		_rightBack 		lightAttachObject [_vehicle, [0.52,-3.1,-0.2]];		
	};		
	//hetchback
	case "C_Hatchback_01_F":{		 
		_leftFront 		lightAttachObject [_vehicle, [-0.75,1.7,-0.3]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.57,-2.3,-0.4]];
		_rightFront 	lightAttachObject [_vehicle, [0.75,1.7,-0.3]];
		_rightBack 		lightAttachObject [_vehicle, [0.57,-2.3,-0.4]];		
	};
	case "C_Hatchback_01_sport_F":{		
		_leftFront 		lightAttachObject [_vehicle, [-0.75,1.7,-0.3]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.57,-2.3,-0.4]];
		_rightFront 	lightAttachObject [_vehicle, [0.75,1.7,-0.3]];
		_rightBack 		lightAttachObject [_vehicle, [0.57,-2.3,-0.4]];		
	};		
	//Armored
	case "B_MRAP_01_F":{		 
		_leftFront 		lightAttachObject [_vehicle, [-1.05, 1.4, -0.75]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.90, -4.3, -0.7]];
		_rightFront 	lightAttachObject [_vehicle, [1.05, 1.4, -0.75]];
		_rightBack 		lightAttachObject [_vehicle, [0.90, -4.3, -0.7]];		
	};	
	case "O_MRAP_02_F":{ // ifrit		 
		_leftFront 		lightAttachObject [_vehicle, [-0.77,1.45,-1]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.63,-4.55,-1.3]];
		_rightFront 	lightAttachObject [_vehicle, [0.77,1.45,-1]];
		_rightBack 		lightAttachObject [_vehicle, [0.63,-4.55,-1.3]];		
	};	
	case "I_MRAP_03_F":{ 	 
		_leftFront 		lightAttachObject [_vehicle, [-1,2.25,-0.8]]; 
		_leftBack  		lightAttachObject [_vehicle, [-1,-3.2,0]];
		_rightFront 	lightAttachObject [_vehicle, [1,2.25,-0.8]];
		_rightBack 		lightAttachObject [_vehicle, [1,-3.2,0]];		
	};	
	// hemets
	case "B_Truck_01_mover_F":{		  
		_leftFront 		lightAttachObject [_vehicle, [-0.78,4.6,-0.1]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.34,-4.2,-0.55]];
		_rightFront 	lightAttachObject [_vehicle, [0.78,4.6,-0.1]];
		_rightBack 		lightAttachObject [_vehicle, [0.34,-4.2,-0.55]];		
	};		
	case "B_Truck_01_transport_F":{  
		_leftFront 		lightAttachObject [_vehicle, [-0.77,5.2,0.3]]; 
		_leftBack  		lightAttachObject [_vehicle, [-1.15,-5,-0.3]];
		_rightFront 	lightAttachObject [_vehicle, [0.77,5.2,0.3]];
		_rightBack 		lightAttachObject [_vehicle, [1.15,-5,-0.3]];	
	};	
	//Zemeks
	case "I_Truck_02_transport_F":{	
		_leftFront 		lightAttachObject [_vehicle, [-0.75,4.2,-1.2]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.7,-3.4,-1.2]];
		_rightFront 	lightAttachObject [_vehicle, [0.75,4.2,-1.2]];
		_rightBack 		lightAttachObject [_vehicle, [0.7,-3.4,-1.2]];		
	};	
	case "I_Truck_02_covered_F":{	
		_leftFront 		lightAttachObject [_vehicle, [-0.75,4.2,-1.2]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.7,-3.4,-1.2]];
		_rightFront 	lightAttachObject [_vehicle, [0.75,4.2,-1.2]];
		_rightBack 		lightAttachObject [_vehicle, [0.7,-3.4,-1.2]];		
	};	
	//Tempests
	case "O_Truck_03_device_F":{	
		_leftFront 		lightAttachObject [_vehicle, [-0.8,3,-0.8]]; 
		_leftBack  		lightAttachObject [_vehicle, [-1,-4.95,-0.95]];
		_rightFront 	lightAttachObject [_vehicle, [0.8,3,-0.8]];
		_rightBack 		lightAttachObject [_vehicle, [1,-4.95,-0.95]];		
	};	
	case "O_Truck_03_covered_F":{	
		_leftFront 		lightAttachObject [_vehicle, [-1,-4.7,-1.2]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.75,3.2,-1.02]];
		_rightFront 	lightAttachObject [_vehicle, [1,-4.7,-1.2]];
		_rightBack 		lightAttachObject [_vehicle, [0.75,3.2,-1.02]];		
	};	
	case "O_Truck_03_transport_F":{	
		_leftFront 		lightAttachObject [_vehicle, [-1,-4.7,-1.2]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.75,3.2,-1.02]];
		_rightFront 	lightAttachObject [_vehicle, [1,-4.7,-1.2]];
		_rightBack 		lightAttachObject [_vehicle, [0.75,3.2,-1.02]];		
	};		
	//quad
	case "B_Quadbike_01_F":{		 
		_leftFront 		lightAttachObject [_vehicle, [-0.37,1.0,-0.5]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.37,-1.0,0.0]];
		_rightFront 	lightAttachObject [_vehicle, [0.37,1.0,-0.5]];
		_rightBack 		lightAttachObject [_vehicle, [0.37,-1.0,0.0]];		
	};	
};
	
_leftBack setLightFlareSize _flareSize;
_leftFront setLightFlareSize _flareSize;
_rightBack setLightFlareSize _flareSize;
_rightFront setLightFlareSize _flareSize;

_leftBack  setLightDayLight true;
_leftFront setLightDayLight true;
_rightBack setLightDayLight true;
_rightFront setLightDayLight true;

if (sunOrMoon < 1) then {
	_leftBack setLightAttenuation [0.1, 100, 100, 1000]; 
	_leftFront setLightAttenuation [0.1, 100, 100, 1000]; 
	_rightBack setLightAttenuation [0.1, 100, 100, 1000]; 
	_rightFront setLightAttenuation [0.1, 100, 100, 1000]; 
}else{
	_leftBack setLightAttenuation [0.1, 0, 0.1, 1300];
	_leftFront setLightAttenuation [0.1, 0, 0.1, 1300]; 
	_rightBack setLightAttenuation [0.1, 0, 0.1, 1300];
	_rightFront setLightAttenuation [0.1, 0, 0.1, 1300];
};

_leftRed = true;  
while{ (alive _vehicle)} do{  
	_bright = (0.1 + sunOrMoon) * 3;	
	if((_vehicle getVariable["RAGE_Blinker",""] != "warning")) exitWith {_vehicle setVariable ["RAGE_Bstat",true,true];};
	if(_leftRed) then{  
		_leftRed = false;				
		
		_leftFront 		setLightBrightness _bright;  
		_leftBack  		setLightBrightness _bright;		
		_rightFront 	setLightBrightness _bright;  
		_rightBack 		setLightBrightness _bright;  
	}else{  
		_leftRed = true; 				
		_leftFront 		setLightBrightness 0.0;  
		_leftBack  		setLightBrightness 0.0;  
		_rightFront 	setLightBrightness 0.0;  
		_rightBack 		setLightBrightness 0.0;  
	};  	
	_vehicle say3D _sound;
	sleep _time;  
};	

deleteVehicle _leftFront; 		
deleteVehicle _leftBack;  		
deleteVehicle _rightFront; 	
deleteVehicle _rightBack; 

_vehicle setVariable ["RAGE_Bstat",true,true];