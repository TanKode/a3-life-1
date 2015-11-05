GunStore = [[Gun_Store_1,Gun_Store_Position_1,Display_1,Radio_1,Sensor_1,Shop_Owner_1],[Gun_Store_2,Gun_Store_Position_2,Display_2,Radio_2,Sensor_2,Shop_Owner_2]];
publicVariable "GunStore";
{
	// Allow Gun Store Damage (Recommended false)

	(_x select 0) allowDamage false; 

	// Set Gun Store Direction

	(_x select 0) setDir 0; 

	// Lock Stockroom Door

	(_x select 0) setVariable ['bis_disabled_Door_3',1,true];   

	// Open Gun Store Door

	(_x select 0) animate ["door_1_rot",1];
	
	//Sensor
	(_x select 4) setPosATL ((_x select 0) modelToWorld [1.2,-2.275,-2.995]);

	// HocEstBellum Exterior Windows, Panel 01 

	private ["_Window_01_01", "_Window_01_02", "_Window_01_03", "_Window_01_04"];

	_Window_01_01 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_01_01 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_01_01.paa"];
	_Window_01_01 attachTo [(_x select 0),[-1.185,-2.5,-0.7555]]; 

	_Window_01_02 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_01_02 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_01_02.paa"];
	_Window_01_02 attachTo [(_x select 0),[-0.185,-2.5,-0.7555]]; 

	_Window_01_03 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_01_03 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_01_03.paa"];
	_Window_01_03 attachTo [(_x select 0),[-1.185,-2.5,-1.755]]; 

	_Window_01_04 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_01_04 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_01_04.paa"];
	_Window_01_04 attachTo [(_x select 0),[-0.185,-2.5,-1.755]]; 

	// HocEstBellum Exterior Windows, Panel 02 

	private ["_Window_02_01", "_Window_02_02", "_Window_02_03", "_Window_02_04"];

	_Window_02_01 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_02_01 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_02_01.paa"];
	_Window_02_01 attachTo [(_x select 0),[-3.325,-2.5,-0.7555]]; 

	_Window_02_02 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_02_02 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_02_02.paa"];
	_Window_02_02 attachTo [(_x select 0),[-2.325,-2.5,-0.7555]]; 

	_Window_02_03 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_02_03 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_02_03.paa"];
	_Window_02_03 attachTo [(_x select 0),[-3.325,-2.5,-1.755]]; 

	_Window_02_04 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_02_04 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_02_04.paa"];
	_Window_02_04 attachTo [(_x select 0),[-2.325,-2.5,-1.755]]; 

	// HocEstBellum Exterior Windows (Reversed), Panel 01 

	private ["_Window_01_01_R", "_Window_01_02_R", "_Window_01_03_R", "_Window_01_04_R"];

	_Window_01_01_R = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_01_01_R setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_01_01_Reverse.paa"];
	_Window_01_01_R attachTo [(_x select 0),[-0.195,-2.455,-0.755]]; 

	_Window_01_02_R = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_01_02_R setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_01_02_Reverse.paa"];
	_Window_01_02_R attachTo [(_x select 0),[-1.195,-2.455,-0.755]]; 

	_Window_01_03_R = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_01_03_R setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_01_03_Reverse.paa"];
	_Window_01_03_R attachTo [(_x select 0),[-0.195,-2.455,-1.755]]; 

	_Window_01_04_R = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_01_04_R setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_01_04_Reverse.paa"];
	_Window_01_04_R attachTo [(_x select 0),[-1.195,-2.455,-1.755]]; 

	// HocEstBellum Exterior Windows (Reversed), Panel 02 

	private ["_Window_02_01_R", "_Window_02_02_R", "_Window_02_03_R", "_Window_02_04_R"];

	_Window_02_01_R = "UserTexture1M_F" createVehicle Position (_x select 1);
	_Window_02_01_R setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_02_01_Reverse.paa"];
	_Window_02_01_R attachTo [(_x select 0),[-2.325,-2.455,-0.755]]; 

	_Window_02_02_R = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_02_02_R setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_02_02_Reverse.paa"];
	_Window_02_02_R attachTo [(_x select 0),[-3.325,-2.455,-0.755]]; 

	_Window_02_03_R = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_02_03_R setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_02_03_Reverse.paa"];
	_Window_02_03_R attachTo [(_x select 0),[-2.325,-2.455,-1.755]]; 

	_Window_02_04_R = "UserTexture1M_F" createVehicle position (_x select 1);
	_Window_02_04_R setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Windows\Window_02_04_Reverse.paa"];
	_Window_02_04_R attachTo [(_x select 0),[-3.325,-2.455,-1.755]]; 

	// Reverse Window Directions

	{
	_X setDir 180
	} forEach [_Window_01_01_R, _Window_01_02_R, _Window_01_03_R, _Window_01_04_R, _Window_02_01_R, _Window_02_02_R, _Window_02_03_R, _Window_02_04_R];

	// Create Main Shop Sign (Hoc Est Bellum)

	private ["_Sign_01", "_Sign_02", "_Sign_03", "_Sign_04", "_Sign_Icon", "_Shop_Light"];

	_Sign_01 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Sign_01 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Main_Sign\Main_Sign_01.paa"];
	_Sign_01 attachTo [(_x select 0),[-3.15,-2.755,0.185]]; 

	_Sign_02 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Sign_02 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Main_Sign\Main_Sign_02.paa"];
	_Sign_02 attachTo [(_x select 0),[-2.15,-2.755,0.185]]; 

	_Sign_03 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Sign_03 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Main_Sign\Main_Sign_03.paa"];
	_Sign_03 attachTo [(_x select 0),[-1.15,-2.755,0.185]]; 

	_Sign_04 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Sign_04 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Main_Sign\Main_Sign_04.paa"];
	_Sign_04 attachTo [(_x select 0),[-0.15,-2.755,0.185]]; 

	_Sign_Icon = "UserTexture1M_F" createVehicle position (_x select 1);
	_Sign_Icon setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Ext\Main_Sign\Main_Sign_Icon.paa"];
	_Sign_Icon attachTo [(_x select 0),[1.25,-2.755,0.285]];

	_Shop_Light = "Land_FloodLight_F" createVehicle position (_x select 1); 
	_Shop_Light attachTo [(_x select 0), [-1.75,-2.85,0.75]]; 
	_Shop_Light setVectorDirAndUp [[1,0,0],[0,-3,1]]; 

	// Interior Objects (Counter)

	private ["_Desk", "_Cabinet", "_PC_Keyboard", "_PC_Screen", "_PC_Case", "_PC_Mouse", "_Documents_Desk", "_Fire_Extinguisher", "_Store_Chair"];

	_Desk = "OfficeTable_01_new_F" createVehicle position (_x select 1);
	_Desk attachTo [(_x select 0),[0.715,3.355,-2.375]]; 
	_Desk setDir 180; 

	_Cabinet = "Land_OfficeCabinet_01_F" createVehicle position (_x select 1);
	_Cabinet attachTo [(_x select 0),[1.805,4.275,-1.995]]; 
	_Cabinet setDir 90; 

	_PC_Keyboard = "Land_PCSet_01_keyboard_F" createVehicle position (_x select 1);
	_PC_Keyboard attachTo [_Desk,[-0.25,0,0.405]];

	_PC_Screen = "Land_PCSet_01_screen_F" createVehicle position (_x select 1);
	_PC_Screen setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Screen_Textures\Desk_Screen.paa"];
	_PC_Screen attachTo [_Desk, [0.2,0.185,0.665]]; 
	_PC_Screen setDir 25;

	_PC_Case = "Land_PCSet_01_case_F" createVehicle position (_x select 1);
	_PC_Case attachTo [_Desk, [0.55,0.05,0.6585]]; 

	_PC_Mouse = "Land_PCSet_01_mouse_F" createVehicle position (_x select 1);
	_PC_Mouse attachTo [_Desk,[0.035,0,0.435]];

	_Documents_Desk = "Land_File2_F" createVehicle position (_x select 1);
	_Documents_Desk attachTo [_Desk,[0.225,-0.15,0.415]];

	_Fire_Extinguisher = "Land_FireExtinguisher_F" createVehicle position (_x select 1);
	_Fire_Extinguisher attachTo [(_x select 0), [3.85,5.25,-2.405]]; 

	_Store_Chair = "Land_ChairWood_F" createVehicle position (_x select 1);
	_Store_Chair attachTo [_Desk,[-0.275,-0.715,-0.445]]; 
	_Store_Chair setDir 180; 

	// Radio (Public Variable - For Music)
	(_x select 3) attachTo [(_x select 0),[1.85,4,-1.1325]]; 
	(_x select 3) setDir -90;

	// Shop Owner
	_civ = (_x select 5);
	_civ switchMove "HubSittingAtTableU_idle3";
	_civ attachTo [(_x select 1), [-2.65, 0.75,0.215]]; 
	_civ setDir 180;

	// Interior Shelves (Front) (Masking Default Texture Flicker)

	private ["_Shelves_01", "_Shelves_02", "_Shelves_03", "_Shelves_04"];

	_Shelves_01 = "Land_OfficeCabinet_01_F" createVehicle position (_x select 1);
	_Shelves_01 attachTo [(_x select 0),[-0.295,-2.275,-2.995]]; 

	_Shelves_02 = "Land_OfficeCabinet_01_F" createVehicle Position (_x select 1);
	_Shelves_02 attachTo [(_x select 0),[-1.1225,-2.275,-2.995]]; 

	_Shelves_03 = "Land_OfficeCabinet_01_F" createVehicle position (_x select 1);
	_Shelves_03 attachTo [(_x select 0),[-2.425,-2.275,-2.995]]; 

	_Shelves_04 = "Land_OfficeCabinet_01_F" createVehicle position (_x select 1);
	_Shelves_04 attachTo [(_x select 0),[-3.2425,-2.275,-2.995]]; 

	// Interior Posters (Downstairs)

	_Poster_SR_Optics = "UserTexture_1x2_F" createvehicle Position (_x select 1);
	_Poster_SR_Optics setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\SR_Optics_Poster.paa"];
	_Poster_SR_Optics attachTo [(_x select 0),[0.755,4.815,-1.095]]; 

	_Poster_Ion_Services = "UserTexture_1x2_F" createvehicle Position (_x select 1);
	_Poster_Ion_Services setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\Ion_poster.paa"];
	_Poster_Ion_Services attachTo [(_x select 0), [2.02,1.85,-1.15]];
	_Poster_Ion_Services setVectorDirAndUp [[1,0,0.0085],[0,0,1]]; 

	_Poster_ShackTactical = "UserTexture_1x2_F" createvehicle Position (_x select 1);
	_Poster_ShackTactical setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\ShackTactical_Poster.paa"];
	_Poster_ShackTactical attachTo [(_x select 0), [2.02,0.75,-1.15]];
	_Poster_ShackTactical setVectorDirAndUp [[1,0,0.0085],[0,0,1]]; 

	_Poster_Targets_Altis = "UserTexture_1x2_F" createvehicle position (_x select 1);
	_Poster_Targets_Altis setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\Targets_Altis.paa"];
	_Poster_Targets_Altis attachTo [(_x select 0),[1.675,2.925,-1.35]];

	_Poster_HocEstBellum_01 = "UserTexture1M_F" createvehicle position (_x select 1);
	_Poster_HocEstBellum_01 attachTo [(_x select 0), [2.02,-0.345,-1.05]]; 
	_Poster_HocEstBellum_01 setVectorDirAndUp [[1,0,0.0085],[0,0,1]]; 
	_Poster_HocEstBellum_01 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\HocEstBellum_Poster_01.paa"];

	_Poster_HocEstBellum_02 = "UserTexture1M_F" createvehicle position (_x select 1);
	_Poster_HocEstBellum_02 attachTo [(_x select 0), [2.02,-1.3425,-1.05]];
	_Poster_HocEstBellum_02 setVectorDirAndUp [[1,0,0.0085],[0,0,1]];
	_Poster_HocEstBellum_02 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\HocEstBellum_Poster_02.paa"];

	_Poster_Night_Owl = "UserTexture1M_F" createVehicle position (_x select 1);
	_Poster_Night_Owl setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\Night_Owl_Poster.paa"];
	_Poster_Night_Owl attachTo [(_x select 0),[-3.805,3,-0.65]]; 
	_Poster_Night_Owl setDir -90;

	_Poster_P07 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Poster_P07 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\P07_Poster.paa"];
	_Poster_P07 attachTo [(_x select 0),[-3.805,2.015,-0.65]]; 
	_Poster_P07 setDir -90; 

	_Poster_Bohemia_Industries = "UserTexture1M_F" createVehicle position (_x select 1);
	_Poster_Bohemia_Industries setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\Bohemia_Industries_Poster.paa"];
	_Poster_Bohemia_Industries attachTo [(_x select 0),[-3.805,1.015,-0.635]]; 
	_Poster_Bohemia_Industries setDir -90;

	_Poster_Laser_Sight = "UserTexture1M_F" createVehicle position (_x select 0);
	_Poster_Laser_Sight setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\Laser_Sight_Poster.paa"];
	_Poster_Laser_Sight attachTo [(_x select 0),[-3.805,0,-0.635]]; 
	_Poster_Laser_Sight setDir -90;

	_Poster_SDAR_Underwater_Rifle = "UserTexture1M_F" createVehicle position (_x select 0);
	_Poster_SDAR_Underwater_Rifle setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\SDAR_Poster.paa"];
	_Poster_SDAR_Underwater_Rifle attachTo [(_x select 0),[-3.805,-1,-0.635]]; 
	_Poster_SDAR_Underwater_Rifle setDir -90;

	// Interior Posters (Upstairs)

	_Poster_ZUBR = "UserTexture1M_F" createVehicle position (_x select 1);
	_Poster_ZUBR setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\ZUBR_Poster.paa"];
	_Poster_ZUBR attachTo [(_x select 0),[-3.8065,-1,2.75]]; 

	_Poster_Larkin_Aviation = "UserTexture1M_F" createVehicle position (_x select 1);
	_Poster_Larkin_Aviation setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\Larkin_Aviation_Poster.paa"];
	_Poster_Larkin_Aviation attachTo [(_x select 0),[-3.8065,0,2.75]];

	_Poster_Sting = "UserTexture1M_F" createVehicle position (_x select 1);
	_Poster_Sting setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Posters\Sting_Poster.paa"];
	_Poster_Sting attachTo [(_x select 0),[-3.8065,1,2.75]];

	{
	_X setVectorDirAndUp [[-1,0,0.0085],[0,0,1]];
	} forEach [_Poster_ZUBR, _Poster_Larkin_Aviation, _Poster_Sting];

	// Interior Vrana Banner

	private ["_Banner_Vrana_01", "_Banner_Vrana_02"];

	_Banner_Vrana_01 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Banner_Vrana_01 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Banners\Vrana_Banner_01.paa"];
	_Banner_Vrana_01 attachTo [(_x select 0),[-2.5,6.995,-0.65]];

	_Banner_Vrana_02 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Banner_Vrana_02 setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Banners\Vrana_Banner_02.paa"];
	_Banner_Vrana_02 attachTo [(_x select 0),[-1.5,6.995,-0.65]];

	// Interior Weapon Rails

	private ["_Rail_01", "_Rail_02", "_Rail_03", "_Rail_04", "_Rail_05", "_Rail_06", "_Rail_07", "_Rail_08", "_Rail_09", "_Rail_10"]; 

	_Rail_01 = "Target_Rail_F" createVehicle position (_x select 0); 
	_Rail_01 attachTo [(_x select 0),[-3.75,-1,-2.5]]; 

	_Rail_02 = "Target_Rail_F" createVehicle position (_x select 0); 
	_Rail_02 attachTo [(_x select 0),[-3.75,0,-2.5]];  

	_Rail_03 = "Target_Rail_F" createVehicle position (_x select 0); 
	_Rail_03 attachTo [(_x select 0),[-3.75,1,-2.5]]; 

	_Rail_04 = "Target_Rail_F" createVehicle position (_x select 0); 
	_Rail_04 attachTo [(_x select 0),[-3.75,2,-2.5]]; 

	_Rail_05 = "Target_Rail_F" createVehicle position (_x select 0); 
	_Rail_05 attachTo [(_x select 0),[-3.75,3,-2.5]]; 

	_Rail_06 = "Target_Rail_F" createVehicle position (_x select 0); 
	_Rail_06 attachTo [(_x select 0),[-3.75,-1,-1.5]]; 

	_Rail_07 = "Target_Rail_F" createVehicle position (_x select 0); 
	_Rail_07 attachTo [(_x select 0),[-3.75,0,-1.5]]; 

	_Rail_08 = "Target_Rail_F" createVehicle position (_x select 0); 
	_Rail_08 attachTo [(_x select 0),[-3.75,1,-1.5]]; 

	_Rail_09 = "Target_Rail_F" createVehicle position (_x select 0); 
	_Rail_09 attachTo [(_x select 0),[-3.75,2,-1.5]]; 

	_Rail_10 = "Target_Rail_F" createVehicle position (_x select 0); 
	_Rail_10 attachTo [(_x select 0),[-3.75,3,-1.5]]; 

	{
	_X setVectorUp [150,0,-1]
	} forEach [_Rail_01, _Rail_02, _Rail_03, _Rail_04, _Rail_05, _Rail_06, _Rail_07, _Rail_08, _Rail_09, _Rail_10]; 

	// Interior Weapon Rails (Rear)

	private ["_Rail_01_R", "_Rail_02_R", "_Rail_03_R", "_Rail_04_R"];

	_Rail_01_R = "Target_Rail_End_F" createVehicle position (_x select 0);
	_Rail_01_R attachTo [(_x select 0),[-2.5,6.95,-1.5]]; 

	_Rail_02_R = "Target_Rail_End_F" createVehicle position (_x select 0);
	_Rail_02_R attachTo [(_x select 0),[-1.5,6.95,-1.5]]; 

	_Rail_03_R = "Target_Rail_End_F" createVehicle position (_x select 0);
	_Rail_03_R attachTo [(_x select 0),[-2.5,6.95,-1.95]];

	_Rail_04_R = "Target_Rail_End_F" createVehicle position (_x select 0);
	_Rail_04_R attachTo [(_x select 0),[-1.5,6.95,-1.95]];

	{
	_X setDir 90
	} forEach [_Rail_01_R, _Rail_02_R, _Rail_03_R, _Rail_04_R];

	// Sniper Rifles (Rear)

	_Sniper_Rifle_01 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Sniper_Rifle_01 addWeaponCargoGlobal ["srifle_LRR_LRPS_F",1]; 
	_Sniper_Rifle_01 attachTo [(_x select 0), [-2.25,6.25,-1.525]]; 

	_Sniper_Rifle_02 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Sniper_Rifle_02 addWeaponCargoGlobal ["srifle_GM6_LRPS_F",1]; 
	_Sniper_Rifle_02 attachTo [(_x select 0),[-2.235,6.245,-1.95]];   

	{
	_X setVectorDirAndUp [[0,0,1],[0,-40,0]];
	_x enableSimulationGlobal false;
	_X setDamage 1; 
	} forEach [_Sniper_Rifle_01, _Sniper_Rifle_02];  

	// Interior Ammo Boxes

	private ["_AmmoBox_01", "_AmmoBox_02", "_AmmoBox_03", "_AmmoBox_04", "_AmmoBox_05"];

	_AmmoBox_01 = "Box_IND_Ammo_F" createVehicle position (_x select 0);
	_AmmoBox_01 attachTo [(_x select 0),[-3.495,-1.05,-2.535]]; 

	_AmmoBox_02 = "Box_IND_Ammo_F" createVehicle position (_x select 0);
	_AmmoBox_02 attachTo [(_x select 0),[-3.495,-0.05,-2.535]]; 

	_AmmoBox_03 = "Box_IND_Ammo_F" createVehicle position (_x select 0);
	_AmmoBox_03 attachTo [(_x select 0),[-3.495,0.95,-2.535]]; 

	_AmmoBox_04 = "Box_IND_Ammo_F" createVehicle position (_x select 0);
	_AmmoBox_04 attachTo [(_x select 0),[-3.495,1.95,-2.535]]; 

	_AmmoBox_05 = "Box_IND_Ammo_F" createVehicle position (_x select 0);
	_AmmoBox_05 attachTo [(_x select 0),[-3.495,2.95,-2.535]]; 

	{
	clearMagazineCargoGlobal _X;
	_X enableSimulationGlobal false;
	_X allowDamage false;
	} forEach [_AmmoBox_01, _AmmoBox_02, _AmmoBox_03, _AmmoBox_04, _AmmoBox_05];

	// Backroom Weapon Boxes

	private ["_WeaponBox_01", "_WeaponBox_02", "_WeaponBox_03", "_WeaponBox_04", "_Trolley"];

	_WeaponBox_01 = "Box_IND_Wps_F" createVehicle position (_x select 1);
	_WeaponBox_01 attachTo [(_x select 0), [3.65,6,-2.615]];
	_WeaponBox_01 setDir 90;

	_WeaponBox_02 = "Box_IND_Wps_F" createVehicle position (_x select 1);
	_WeaponBox_02 attachTo [(_x select 0), [3.65,6,-2.255]];
	_WeaponBox_02 setDir 90;

	_WeaponBox_03 = "Box_IND_Wps_F" createVehicle position (_x select 1);
	_WeaponBox_03 attachTo [(_x select 0), [3.65,6,-1.915]]; 
	_WeaponBox_03 setDir 90;

	_WeaponBox_04 = "Box_IND_Wps_F" createVehicle position (_x select 1);
	_WeaponBox_04 attachTo [(_x select 0), [3.65,6,-1.575]]; 
	_WeaponBox_04 setDir 90;

	_WeaponBox_05 = "Box_IND_WpsLaunch_F" createVehicle position (_x select 1);
	_WeaponBox_05 attachTo [(_x select 0), [3.65,6.715,-2.045]];
	_WeaponBox_05 setVectorDirAndUp [[1,0,0],[0,30,2]];

	clearWeaponCargoGlobal _WeaponBox_05;
	clearMagazineCargoGlobal _WeaponBox_05;
	_WeaponBox_05 enableSimulationGlobal false;

	{
	clearWeaponCargoGlobal _X; 
	clearMagazineCargoGlobal _X;
	_X enableSimulationGlobal false;
	_X setDir 90;
	_X allowDamage false;
	} forEach [_WeaponBox_01, _WeaponBox_02, _WeaponBox_03, _WeaponBox_04];

	// Interior Racking (Rear - Explosives)

	private "_Rack_01";

	_Rack_01 = "Land_Metal_rack_F" createVehicle position (_x select 0);
	_Rack_01 attachTo [(_x select 0),[-3.65,4.25,-1.885]]; 
	_Rack_01 setDir -90; 

	_Mine_01 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_01 attachTo [(_x select 0), [-3.015,3.75,-1.275]]; 

	_Mine_02 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_02 attachTo [(_x select 0), [-3.015,3.95,-1.275]]; 

	_Mine_03 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"];  
	_Mine_03 attachTo [(_x select 0), [-3.015,4.15,-1.275]]; 

	_Mine_04 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_04 attachTo [(_x select 0), [-3.015,4.35,-1.275]]; 

	_Mine_05 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_05 attachTo [(_x select 0), [-3.015,4.55,-1.275]]; 

	{
	_X addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag",1]; 
	_x enableSimulationGlobal false;
	_X setVectorDirAndUp[[0,0,1],[5000,-40,0]]; 
	_X setDamage 1;
	} forEach [_Mine_01, _Mine_02, _Mine_03, _Mine_04, _Mine_05];

	_Mine_06 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_06 attachTo [(_x select 0), [-3.795,4.05,-1.1265]]; 

	_Mine_07 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_07 attachTo [(_x select 0), [-3.795,4.45,-1.1265]]; 

	{
	_X addMagazineCargoGlobal ["ATMine_Range_Mag",1];
	_x enableSimulationGlobal false;
	_x setDamage 1;
	} forEach [_Mine_06, _Mine_07];

	_Mine_08 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_08 attachTo [(_x select 0), [-3.75,3.85,-1.565]]; 

	_Mine_09 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_09 attachTo [(_x select 0), [-3.75,4.05,-1.565]]; 

	_Mine_10 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_10 attachTo [(_x select 0), [-3.75,4.25,-1.565]]; 

	_Mine_11 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_11 attachTo [(_x select 0), [-3.75,4.45,-1.565]]; 

	_Mine_12 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"];  
	_Mine_12 attachTo [(_x select 0), [-3.75,4.65,-1.565]]; 

	{
	_X addMagazineCargoGlobal ["APERSMine_Range_Mag",1];
	_x enableSimulationGlobal false;
	_X setDamage 1;
	} forEach [_Mine_08, _Mine_09, _Mine_10, _Mine_11, _Mine_12];

	_Mine_13 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_13 attachTo [(_x select 0), [-3.75,3.85,-2.035]]; 

	_Mine_14 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"];  
	_Mine_14 attachTo [(_x select 0), [-3.75,4.05,-2.035]]; 

	_Mine_15 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_15 attachTo [(_x select 0), [-3.75,4.25,-2.035]]; 

	_Mine_16 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_16 attachTo [(_x select 0), [-3.75,4.45,-2.035]]; 

	_Mine_17 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Mine_17 attachTo [(_x select 0), [-3.75,4.65,-2.035]];

	{
	_X addMagazineCargoGlobal ["SatchelCharge_Remote_Mag",1];
	_x enableSimulationGlobal false;
	_X setDamage 1;
	} forEach [_Mine_13, _Mine_14, _Mine_15, _Mine_16, _Mine_17];           

	// Interior Racking (Rear - Optics / Grenades)

	private "_Rack_02";

	_Rack_02 = "Land_Metal_rack_F" createVehicle position (_x select 0);
	_Rack_02 attachTo [(_x select 0),[-3.65,5.365,-1.885]]; 
	_Rack_02 setDir -90; 

	_Scope_01 = "Item_optic_Nightstalker" createVehicle position (_x select 0);
	_Scope_01 attachTo [(_x select 0), [-3.65,5,-1.12905]]; 

	_Scope_02 = "Item_optic_Nightstalker" createVehicle position (_x select 0);
	_Scope_02 attachTo [(_x select 0), [-3.65,5.225,-1.12905]];

	_Scope_03 = "Item_optic_Hamr" createVehicle position (_x select 0);
	_Scope_03 attachTo [(_x select 0), [-3.65,5.45,-1.12905]]; 

	_Scope_04 = "Item_optic_Hamr" createVehicle position (_x select 0);
	_Scope_04 attachTo [(_x select 0), [-3.65,5.675,-1.12905]]; 

	_Scope_05 = "Item_optic_DMS" createVehicle position (_x select 0);
	_Scope_05 attachTo [(_x select 0), [-3.65,5.1,-1.56405]]; 

	_Scope_06 = "Item_optic_DMS" createVehicle position (_x select 0);
	_Scope_06 attachTo [(_x select 0), [-3.65,5.425,-1.56505]]; 

	_Scope_07 = "Item_optic_LRPS" createVehicle position (_x select 0);
	_Scope_07 attachTo [(_x select 0), [-3.65,5.135,-2.02015]]; 

	_Scope_08 = "Item_optic_LRPS" createVehicle position (_x select 0);
	_Scope_08 attachTo [(_x select 0), [-3.65,5.635,-2.02015]]; 

	_Scope_09 = "Item_optic_Aco" createVehicle position (_x select 0);
	_Scope_09 attachTo [(_x select 0), [-3.65,5.635,-1.58015]]; 

	_Scope_10 = "Item_optic_Aco" createVehicle position (_x select 0);
	_Scope_10 attachTo [(_x select 0), [-3.65,5.735,-1.58015]];

	{
		_x setDir 90;
		_x enableSimulationGlobal false;
		_x setDamage 1;
	} forEach [_Scope_01, _Scope_02, _Scope_03, _Scope_04, _Scope_05, _Scope_06, _Scope_07, _Scope_08, _Scope_09, _Scope_10];

	_Grenade_01 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Grenade_01 attachTo [(_x select 0), [-3.75,5,-0.67405]]; 

	_Grenade_02 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Grenade_02 attachTo [(_x select 0), [-3.75,5.1,-0.67405]];

	_Grenade_03 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Grenade_03 attachTo [(_x select 0), [-3.75,5.2,-0.67405]];

	_Grenade_04 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Grenade_04 attachTo [(_x select 0), [-3.75,5.3,-0.67405]]; 

	_Grenade_05 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Grenade_05 attachTo [(_x select 0), [-3.75,5.4,-0.67405]]; 

	_Grenade_06 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Grenade_06 attachTo [(_x select 0), [-3.75,5.5,-0.67405]];

	_Grenade_07 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Grenade_07 attachTo [(_x select 0), [-3.75,5.6,-0.67405]]; 

	_Grenade_08 = createvehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"]; 
	_Grenade_08 attachTo [(_x select 0), [-3.75,5.7,-0.67405]];

	{
		_X addMagazineCargoGlobal ["HandGrenade",1];
		_X setDamage 1;
	} forEach [_Grenade_01, _Grenade_02, _Grenade_03, _Grenade_04, _Grenade_05, _Grenade_06, _Grenade_07, _Grenade_08];   
	// Interior Target (Rear / Downstairs)

	private "_Target_Ambient";

	_Target_Ambient = "TargetBootcampHumanSimple_F" createVehicle position (_x select 1);
	_Target_Ambient attachTo [(_x select 0),[-3.255,6.345,-1.95]]; 
	_Target_Ambient setDir -45;

	// Interior Display Stand (Dummy Vehicle Ammo Crate)

	_Display_Stand_Base = "Box_IND_AmmoVeh_F" createVehicle position (_x select 1);
	_Display_Stand_Base attachTo [(_x select 0),[-0.735,1,-3.375]]; 
	_Display_Stand_Base setDir 180; 
	_Display_Stand_Base setObjectTextureGlobal [1, "\Monkey\Images\HocEstBellum_Int\Display_Stand_Canvas.paa"];
	_Display_Stand_Base enableSimulationGlobal false;
	_Display_Stand_Base allowDamage false;

	_Stand_Information = "Land_InfoStand_V1_F" createVehicle position (_x select 1); 
	_Stand_Information attachTo [(_x select 0),[-0.705,0,-2.205]];
	_Stand_Information setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\PCML_Details.paa"]; 

	// Rotating Display
	(_x select 2) hideObjectGlobal true;

	_Pole_Display = "Metal_Pole_F" createVehicle position (_x select 0);
	_Pole_Display attachTo [(_x select 2), [0,-0.925,0.15]]; 

	_Titan_Display = createVehicle ["groundweaponholder", getPos (_x select 0), [], 0, "can_collide"];  
	_Titan_Display addWeaponCargoGlobal ["launch_NLAW_F", 1];
	_Titan_Display attachTo [_Pole_Display,[0,0.315,1.15]]; 
	_Titan_Display setVectorUp [0,-5,1];
	_Titan_Display enableSimulationGlobal false;
	_Titan_Display setDamage 1;
	// Backroom Mesh

	/*private ["_Mesh_01", "_Mesh_02", "_Mesh_03", "_Mesh_04", "_Mesh_05", "_Mesh_06", "_Mesh_07", "_Mesh_08"];

	_Mesh_01 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Mesh_01 attachTo [(_x select 0),[0.1,5.55,0.05]];

	_Mesh_02 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Mesh_02 attachTo [(_x select 0),[0.1,5.55,-0.8165]];

	_Mesh_03 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Mesh_03 attachTo [(_x select 0),[0.1,6.55,0.05]];

	_Mesh_04 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Mesh_04 attachTo [(_x select 0),[0.1,6.55,-0.8165]]; 

	_Mesh_05 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Mesh_05 attachTo [(_x select 0),[0.1,5.55,-1.6825]];

	_Mesh_06 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Mesh_06 attachTo [(_x select 0),[0.1,6.55,-1.6825]];

	_Mesh_07 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Mesh_07 attachTo [(_x select 0),[0.1,5.55,-2.5485]];

	_Mesh_08 = "UserTexture1M_F" createVehicle position (_x select 1);
	_Mesh_08 attachTo [(_x select 0),[0.1,6.55,-2.5485]];

	{
	_X setDir 90;
	_X setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Storeroom_Mesh.paa"];
	} forEach [_Mesh_01, _Mesh_01, _Mesh_02, _Mesh_03, _Mesh_04, _Mesh_05, _Mesh_06, _Mesh_07, _Mesh_08];

	// BIS' Invisible Wall (Prevent Player from Passing Through Mesh)
	BIS_InvisibleWall2 attachTo [Gun_Store,[0.5,6.55,-2.5]];
	BIS_Invisiblewall2 setDir 90;*/
	
	_gate = "Land_GateB" createVehicle position (_x select 1);
	_gate attachTo [(_x select 0),[0.3,7.5,-1.5]];
	_gate setDir 90;

	// Backroom Mesh Frame

	_Pole_Frame_01 = "Metal_Pole_F" createVehicle position (_x select 1);
	_Pole_Frame_01 attachTo [(_x select 0),[0.105,4.175,-0.5]];

	_Pole_Frame_02 = "Metal_Pole_F" createVehicle position (_x select 1);
	_Pole_Frame_02 attachTo [(_x select 0),[0.105,4.175,-2.5]];

	_Pole_Frame_03 = "Metal_Pole_F" createVehicle position (_x select 1);
	_Pole_Frame_03 attachTo [(_x select 0),[0.105,6.055,-0.5]];

	_Pole_Frame_04 = "Metal_Pole_F" createVehicle position (_x select 1);
	_Pole_Frame_04 attachTo [(_x select 0),[0.105,6.055,-2.05]]; 

	/*
	_Base_Frame_01 = "Land_CncBarrier_stripes_F" createVehicle position (_x select 1);
	_Base_Frame_01 attachTo [(_x select 0),[0.15,6,-3.05]]; 
	_Base_Frame_01 setDir 90;
	_Base_Frame_01 setVectorUp [0,0,1];
	*/
	_Trolley = "Land_PalletTrolley_01_khaki_F" createVehicle position (_x select 1);
	_Trolley attachTo [(_x select 0), [1,6.5,-2.25]]; 
	_Trolley setDir 20;

	// Ammo Box (Hiding Edge of Base Frame)

	private "_Ammo_50cal";

	_Ammo_50cal = "Land_Ammobox_rounds_F" createVehicle position (_x select 1);
	_Ammo_50cal attachTo [(_x select 0),[0.15,4.75,-2.685]];

	// Trophy

	private "_Trophy";

	_Trophy = "Land_Trophy_01_gold_F" createVehicle position (_x select 1);
	_Trophy attachTo [_Cabinet, [-0.15,0,0.925]];

	// Food Container

	private "_Container";

	_Container = "Land_FoodContainer_01_F" createVehicle position (_x select 1);
	_Container attachTo [(_x select 0), [-2.885,6.75,-2.55]];

	// Pistol Shooting Range (Upstairs)

	private ["_Target_01_Upstairs", "_Target_02_Upstairs", "_Target_03_Upstairs", "_Target_04_Upstairs", "_Railing_Upstairs", "_Window_Panel_01", "_Window_Panel_02"];

	_Target_01_Upstairs = "TargetBootcampHumanSimple_F" createVehicle position (_x select 1);
	_Target_01_Upstairs attachTo [(_x select 0),[1.75,-1.25,1.915]];

	_Target_02_Upstairs = "TargetBootcampHumanSimple_F" createVehicle position (_x select 1);
	_Target_02_Upstairs attachTo [(_x select 0),[1.75,0,1.915]];

	_Target_03_Upstairs = "TargetBootcampHumanSimple_F" createVehicle position (_x select 1);
	_Target_03_Upstairs attachTo [(_x select 0),[1.75,1.25,1.915]];

	_Target_04_Upstairs = "TargetBootcampHumanSimple_F" createVehicle position (_x select 1);
	_Target_04_Upstairs attachTo [(_x select 0),[1.75,2.5,1.915]];

	{
	_X setDir 90
	} forEach [_Target_01_Upstairs, _Target_02_Upstairs, _Target_03_Upstairs, _Target_04_Upstairs];

	_Railing_Upstairs = "Land_Pipe_fence_4mNoLC_F" createVehicle position (_x select 1);
	_Railing_Upstairs attachTo [(_x select 0), [-0.665,3.235,1.5]];
	_Railing_Upstairs setDir 180;

	_Target_Screen = "Land_FlatTv_01_F" createVehicle position (_x select 1);
	_Target_Screen setObjectTextureGlobal [0,"\Monkey\Images\HocEstBellum_Int\Screen_Textures\Target_Screen.paa"];
	_Target_Screen attachTo [_Railing_Upstairs,[0,0,2.35]]; 
	_Target_Screen setVectorUp [0,0.5,-2];

	_Window_Panel_01 = "Land_Shoot_House_Wall_F" createVehicle position (_x select 1);
	_Window_Panel_01 attachTo [(_x select 0), [1.05,-2.495,2.35]]; 

	_Window_Panel_02 = "Land_Shoot_House_Wall_F" createVehicle position (_x select 1);
	_Window_Panel_02 attachTo [(_x select 0), [-2.75,-2.495,2.15]]; 

	{
	_X setVectorDirAndUp [[1,3000,0],[1,0,450]]
	} forEach [_Window_Panel_01, _Window_Panel_02];

	// Passageway (Upstairs)

	_Gas_Tank_01 = "Land_GasTank_01_khaki_F" createVehicle position (_x select 1);
	_Gas_Tank_01 attachTo [(_x select 0),[-2.55,6.75,1.45]]; 
	_Gas_Tank_01 setDir -90;

	_Gas_Tank_02 = "Land_GasTank_01_khaki_F" createVehicle position (_x select 1);
	_Gas_Tank_02 attachTo [(_x select 0),[-3,6.75,1.45]]; 
	_Gas_Tank_02 setDir 180;

	_Empty_Box_01 = "Land_PaperBox_closed_F" createVehicle position (_x select 1);
	_Empty_Box_01 attachTo [(_x select 0),[-3,5.825,1.665]];

	// Lighting

	private ["_Light_Panel", "_Light_Ext", "_Light_Int", "_Light_Screen", "_Light_Main", "_Light_Upstairs", "_Light_Tent", "_Light_Screen_Targets"];
/*
	_Light_Ext = "#lightpoint" createVehicleLocal position (_x select 1); 
	_Light_Ext attachTo [_Shop_Light, [0,0,0]]; 
	_Light_Ext setLightBrightness 0.65; 
	_Light_Ext setLightAmbient [0.05, 0.05, 0.05]; 
	_Light_Ext setLightColor [0.5, 0.5, 0.6];

	_Light_Int = "#lightpoint" createVehicleLocal position (_x select 1); 
	_Light_Int attachTo [_Display_Stand_Base, [0,0,0]];
	_Light_Int setLightBrightness 2.65; 
	_Light_Int setLightAmbient[0.05, 0.05, 0.05];
	_Light_Int setLightColor [1, 1, 1.25]; 

	_Light_Screen = "#lightpoint" createVehicleLocal position (_x select 1);
	_Light_Screen attachTo [_PC_Screen, [0,0,0]];
	_Light_Screen setLightBrightness 0.65;
	_Light_Screen setLightAmbient [0.15, 0.15, 0.15];
	_Light_Screen setLightColor [1, 1, 1.65];

	_Light_Main = "#lightpoint" createVehicleLocal position (_x select 1);
	_Light_Main attachTo [_Display_Stand_Base, [0,0,3.75]];
	_Light_Main setLightBrightness 2; 
	_Light_Main setLightAmbient [0.0, 0.0, 0.0]; 
	_Light_Main setLightColor [1.0, 1.0, 1.15];  

	_Light_Upstairs = "#lightpoint" createVehicleLocal position (_x select 1); 
	_Light_Upstairs attachTo [_Display_Stand_Base, [0,0,7]];
	_Light_Upstairs setLightBrightness 0.65; 
	_Light_Upstairs setLightAmbient [0.0, 0.0, 0.0];
	_Light_Upstairs setLightColor[1.0, 1.0, 1.0];

	_Light_Screen_Targets = "#lightpoint" createVehicleLocal position (_x select 1); 
	_Light_Screen_Targets attachTo [_Target_Screen, [0,-0.45,0]]; 
	_Light_Screen_Targets setLightBrightness 0.65; 
	_Light_Screen_Targets setLightAmbient [0.0, 0.0, 0.0]; 
	_Light_Screen_Targets setLightColor [1, 1, 1.25]; */

	_Light_Main = "#lightpoint" createVehicleLocal position (_x select 1);
	_Light_Main attachTo [(_x select 0),[-0.735,1,0.375]];
	_Light_Main setLightBrightness 2; 
	_Light_Main setLightAmbient [0.0, 0.0, 0.0]; 
	_Light_Main setLightColor [1.0, 1.0, 1.15];  
	
	_Light_Panel = "UserTexture1M_F" createVehicle position (_x select 0);
	_Light_Panel attachTo [_Light_Main,[0,0,0.215]]; 
	_Light_Panel setVectorDirAndUp [[0,0,1],[1,0,0]];
	_Light_Panel setObjectTextureGlobal [0, "\Monkey\Images\HocEstBellum_Int\Light_Panel.paa"];

	/*// Graffiti

	Graffiti attachTo [(_x select 1),[-7.8035,-1.15,1.15]]; 
	Graffiti setDir 90;  
	*/

	// Rifle Types (Change the Class Names of the Variables Below for Different Weapons)

	_Type_01 = "arifle_MXM_Black_F";
	_Type_02 = "arifle_Katiba_F";
	_Type_03 = "arifle_MX_GL_Black_F";
	_Type_04 = "LMG_Zafir_F";
	_Type_05 = "arifle_MX_SW_Black_F";


	// Rifles

	_Rifle_01_01 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_01_01 attachTo [(_x select 0),[-3.015,-1.105,-1.15]];  

	_Rifle_02_01 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_02_01 attachTo [(_x select 0),[-3.015,-1.105,-1.45]];  

	_Rifle_03_01 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_03_01 attachTo [(_x select 0),[-3.015,-1.105,-1.75]];  

	_Rifle_04_01 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_04_01 attachTo [(_x select 0),[-3.015,-1.105,-2.05]]; 

	{
	_X addWeaponCargoGlobal [_Type_01,1];
	_x enableSimulationGlobal false;
	} forEach [_Rifle_01_01, _Rifle_02_01, _Rifle_03_01, _Rifle_04_01]; 

	uiSleep 0.25;   

	_Rifle_01_02 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_01_02 attachTo [(_x select 0),[-3.015,-0.05,-1.15]];  

	_Rifle_02_02 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_02_02 attachTo [(_x select 0),[-3.015,-0.05,-1.45]]; 

	_Rifle_03_02 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_03_02 attachTo [(_x select 0),[-3.015,-0.05,-1.75]];  

	_Rifle_04_02 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_04_02 attachTo [(_x select 0),[-3.015,-0.05,-2.05]];   

	{
	_X addWeaponCargoGlobal [_Type_02,1];
	_x enableSimulationGlobal false;
	} forEach [_Rifle_01_02, _Rifle_02_02, _Rifle_03_02, _Rifle_04_02];    

	uiSleep 0.25;

	_Rifle_01_03 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"];  
	_Rifle_01_03 attachTo [(_x select 0),[-3.015,0.95,-1.15]];   

	_Rifle_02_03 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_02_03 attachTo [(_x select 0),[-3.015,0.95,-1.45]];  

	_Rifle_03_03 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_03_03 attachTo [(_x select 0),[-3.015,0.95,-1.75]];  

	_Rifle_04_03 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_04_03 attachTo [(_x select 0),[-3.015,0.95,-2.05]]; 

	{
	_X addWeaponCargoGlobal [_Type_03,1];
	_x enableSimulationGlobal false;
	} forEach [_Rifle_01_03, _Rifle_02_03, _Rifle_03_03, _Rifle_04_03];   

	uiSleep 0.25;   

	_Rifle_01_04 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_01_04 attachTo [(_x select 0),[-3.015,1.85,-1.15]];  

	_Rifle_02_04 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_02_04 attachTo [(_x select 0),[-3.015,1.85,-1.45]]; 

	_Rifle_03_04 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_03_04 attachTo [(_x select 0),[-3.015,1.85,-1.75]];  

	_Rifle_04_04 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_04_04 attachTo [(_x select 0),[-3.015,1.85,-2.05]];  

	{
	_X addWeaponCargoGlobal [_Type_04,1];
	_x enableSimulationGlobal false;
	} forEach [_Rifle_01_04, _Rifle_02_04, _Rifle_03_04, _Rifle_04_04];  

	uiSleep 0.25; 

	_Rifle_01_05 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_01_05 attachTo [(_x select 0),[-3.015,2.85,-1.15]];   

	_Rifle_02_05 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"];  
	_Rifle_02_05 attachTo [(_x select 0),[-3.015,2.85,-1.45]]; 

	_Rifle_03_05 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_03_05 attachTo [(_x select 0),[-3.015,2.85,-1.75]];  

	_Rifle_04_05 = createvehicle ["groundweaponholder", getpos (_x select 0), [], 0, "can_collide"]; 
	_Rifle_04_05 attachTo [(_x select 0),[-3.015,2.85,-2.05]]; 

	{
	_X addWeaponCargoGlobal [_Type_05,1];
	_x enableSimulationGlobal false;
	} forEach [_Rifle_01_05, _Rifle_02_05, _Rifle_03_05, _Rifle_04_05];    

	uiSleep 0.25;

	{
		_X setvectordirandup [[0,0,1],[5000,-40,0]];
		_X setDamage 1;
	} forEach [_Rifle_01_01, _Rifle_02_01, _Rifle_03_01, _Rifle_04_01, _Rifle_01_02, _Rifle_02_02, _Rifle_03_02, _Rifle_04_02,
	_Rifle_01_03, _Rifle_02_03, _Rifle_03_03, _Rifle_04_03, _Rifle_01_04, _Rifle_02_04, _Rifle_03_04, _Rifle_04_04, _Rifle_01_05,
	_Rifle_02_05, _Rifle_03_05, _Rifle_04_05];
	
		// Rotate Display
	(_x select 2) spawn {
		// Turn Table 
		_dir = getDir _this;

		waitUntil {
			_dir = _dir + (
			if (_dir > 360) then [{-360},{0.5}]
			);
			_this setDir _dir;
		};
		// (Thanks to Killzone Kid)
	};
	
	(_x select 3) spawn {
		waitUntil {(player distance _this) < 4.5};

		// Playmusic

		0 fadeMusic 0; 
		3 fadeMusic 0.2;   
		playMusic "radio_music"; 
		MusicEventHandler = addMusicEventHandler ["MusicStop", {playMusic "radio_music"}]; 

		waitUntil {(player distance _this) > 12.5}; 

		3 fadeMusic 0;   
		removeAllMusicEventHandlers "MusicStop";
	};
}forEach GunStore;

// Rotate Display
//[] execVM "Scripts\Turn_Table.sqf";