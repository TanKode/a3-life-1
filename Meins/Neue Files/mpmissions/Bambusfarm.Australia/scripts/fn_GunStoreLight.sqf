{
	// Lighting

	private ["_Light_Panel", "_Light_Ext", "_Light_Int", "_Light_Screen", "_Light_Main", "_Light_Upstairs", "_Light_Tent", "_Light_Screen_Targets"];

	_Light_Ext = "#lightpoint" createVehicleLocal position (_x select 1); 
	_Light_Ext attachTo [(_x select 0), [-1.75,-2.85,0.75]];
	_Light_Ext setLightBrightness 0.65; 
	_Light_Ext setLightAmbient [0.05, 0.05, 0.05]; 
	_Light_Ext setLightColor [0.5, 0.5, 0.6];

	_Light_Int = "#lightpoint" createVehicleLocal position (_x select 1); 
	_Light_Int attachTo [(_x select 0),[-0.735,1,-3.375]];
	_Light_Int setLightBrightness 2.65; 
	_Light_Int setLightAmbient[0.05, 0.05, 0.05];
	_Light_Int setLightColor [1, 1, 1.25]; 

	_desk = "OfficeTable_01_new_F" createVehicleLocal position (_x select 1);
	_Desk attachTo [(_x select 0),[-4.365,-2.285,0.25]];
	_Desk hideObject true;
	_PC_Screen = "Land_PCSet_01_screen_F" createVehicleLocal position (_x select 1);
	_PC_Screen attachTo [_Desk, [0.2,0.185,0.665]]; 
	_PC_Screen setDir 25;
	_PC_Screen hideObject true;
	_Light_Screen = "#lightpoint" createVehicleLocal position (_x select 1);
	_Light_Screen attachTo [_PC_Screen, [0,0,0]];
	_Light_Screen setLightBrightness 0.65;
	_Light_Screen setLightAmbient [0.15, 0.15, 0.15];
	_Light_Screen setLightColor [1, 1, 1.65];

	_Light_Main = "#lightpoint" createVehicleLocal position (_x select 1);
	_Light_Main attachTo [(_x select 0),[-0.735,1,0.375]];
	_Light_Main setLightBrightness 2; 
	_Light_Main setLightAmbient [0.0, 0.0, 0.0]; 
	_Light_Main setLightColor [1.0, 1.0, 1.15];  

	_Light_Upstairs = "#lightpoint" createVehicleLocal position (_x select 1); 
	_Light_Upstairs attachTo [(_x select 0),[-0.735,1,4]];
	_Light_Upstairs setLightBrightness 0.65; 
	_Light_Upstairs setLightAmbient [0.0, 0.0, 0.0];
	_Light_Upstairs setLightColor[1.0, 1.0, 1.0];

	_Railing_Upstairs = "Land_Pipe_fence_4mNoLC_F" createVehicleLocal position (_x select 1);
	_Railing_Upstairs attachTo [(_x select 0), [-0.665,3.235,1.5]];
	_Railing_Upstairs setDir 180;
	_Railing_Upstairs hideObject true;
	_Target_Screen = "Land_FlatTv_01_F" createVehicleLocal position (_x select 1);
	_Target_Screen attachTo [_Railing_Upstairs,[0,0,2.35]]; 
	_Target_Screen setVectorUp [0,0.5,-2];
	_Target_Screen hideObject true;
	_Light_Screen_Targets = "#lightpoint" createVehicleLocal position (_x select 1); 
	_Light_Screen_Targets attachTo [_Target_Screen, [0,-0.45,0]]; 
	_Light_Screen_Targets setLightBrightness 0.65; 
	_Light_Screen_Targets setLightAmbient [0.0, 0.0, 0.0]; 
	_Light_Screen_Targets setLightColor [1, 1, 1.25];
	
	_owner = (_x select 5);
	_owner switchMove "HubSittingAtTableU_idle3";
	_owner disableAI "ANIM"; 
	_owner allowDamage false;
}forEach GunStore;

