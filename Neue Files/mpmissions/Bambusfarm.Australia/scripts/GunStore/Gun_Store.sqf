// Spawn Gun Store
Gun_Store = "Land_i_Shop_01_V1_F" createVehicle position Gun_Store_Position; 
Gun_Store setDir 264.3895; 
Gun_Store attachTo [Gun_Store_Position,[-3.65,-3.35,3]];
Gun_Store allowDamage false; 

// Lock Stockroom Door
Gun_Store setVariable ['bis_disabled_Door_3',1,true];   

// Open Gun Store Door
Gun_Store animate ["door_1_rot",1];

// Gun Store Door Sensor
Sensor attachTo [Gun_Store_Position, [-2.45,-6,-0.85]];

// HocEstBellum Exterior Windows, Panel 01 
private ["_Window_01_01", "_Window_01_02", "_Window_01_03", "_Window_01_04"];

_Window_01_01 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_01_01 setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_01_01.paa"];
_Window_01_01 attachTo [Gun_Store,[-1.185,-2.5,-0.7555]]; 

_Window_01_02 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_01_02 setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_01_02.paa"];
_Window_01_02 attachTo [Gun_Store,[-0.185,-2.5,-0.7555]]; 

_Window_01_03 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_01_03 setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_01_03.paa"];
_Window_01_03 attachTo [Gun_Store,[-1.185,-2.5,-1.755]]; 

_Window_01_04 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_01_04 setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_01_04.paa"];
_Window_01_04 attachTo [Gun_Store,[-0.185,-2.5,-1.755]]; 

// HocEstBellum Exterior Windows, Panel 02 
private ["_Window_02_01", "_Window_02_02", "_Window_02_03", "_Window_02_04"];

_Window_02_01 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_02_01 setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_02_01.paa"];
_Window_02_01 attachTo [Gun_Store,[-3.325,-2.5,-0.7555]]; 

_Window_02_02 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_02_02 setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_02_02.paa"];
_Window_02_02 attachTo [Gun_Store,[-2.325,-2.5,-0.7555]]; 

_Window_02_03 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_02_03 setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_02_03.paa"];
_Window_02_03 attachTo [Gun_Store,[-3.325,-2.5,-1.755]]; 

_Window_02_04 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_02_04 setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_02_04.paa"];
_Window_02_04 attachTo [Gun_Store,[-2.325,-2.5,-1.755]]; 

// HocEstBellum Exterior Windows (Reversed), Panel 01 
private ["_Window_01_01_R", "_Window_01_02_R", "_Window_01_03_R", "_Window_01_04_R"];

_Window_01_01_R = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_01_01_R setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_01_01_Reverse.paa"];
_Window_01_01_R attachTo [Gun_Store,[-0.195,-2.455,-0.755]]; 

_Window_01_02_R = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_01_02_R setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_01_02_Reverse.paa"];
_Window_01_02_R attachTo [Gun_Store,[-1.195,-2.455,-0.755]]; 

_Window_01_03_R = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_01_03_R setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_01_03_Reverse.paa"];
_Window_01_03_R attachTo [Gun_Store,[-0.195,-2.455,-1.755]]; 

_Window_01_04_R = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_01_04_R setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_01_04_Reverse.paa"];
_Window_01_04_R attachTo [Gun_Store,[-1.195,-2.455,-1.755]]; 

// HocEstBellum Exterior Windows (Reversed), Panel 02 
private ["_Window_02_01_R", "_Window_02_02_R", "_Window_02_03_R", "_Window_02_04_R"];

_Window_02_01_R = "UserTexture1M_F" createVehicle Position Gun_Store_Position;
_Window_02_01_R setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_02_01_Reverse.paa"];
_Window_02_01_R attachTo [Gun_Store,[-2.325,-2.455,-0.755]]; 

_Window_02_02_R = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_02_02_R setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_02_02_Reverse.paa"];
_Window_02_02_R attachTo [Gun_Store,[-3.325,-2.455,-0.755]]; 

_Window_02_03_R = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_02_03_R setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_02_03_Reverse.paa"];
_Window_02_03_R attachTo [Gun_Store,[-2.325,-2.455,-1.755]]; 

_Window_02_04_R = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Window_02_04_R setObjectTexture [0, "Images\HocEstBellum_Ext\Windows\Window_02_04_Reverse.paa"];
_Window_02_04_R attachTo [Gun_Store,[-3.325,-2.455,-1.755]]; 

// Reverse Window Directions
{
_X setDir 180
} forEach [_Window_01_01_R, _Window_01_02_R, _Window_01_03_R, _Window_01_04_R, _Window_02_01_R, _Window_02_02_R, _Window_02_03_R, _Window_02_04_R];

// Create Main Shop Sign (Hoc Est Bellum)
private ["_Sign_01", "_Sign_02", "_Sign_03", "_Sign_04", "_Sign_Icon", "_Shop_Light"];

_Sign_01 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Sign_01 setObjectTexture [0, "Images\HocEstBellum_Ext\Main_Sign\Main_Sign_01.paa"];
_Sign_01 attachTo [Gun_Store,[-3.15,-2.755,0.185]]; 

_Sign_02 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Sign_02 setObjectTexture [0, "Images\HocEstBellum_Ext\Main_Sign\Main_Sign_02.paa"];
_Sign_02 attachTo [Gun_Store,[-2.15,-2.755,0.185]]; 

_Sign_03 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Sign_03 setObjectTexture [0, "Images\HocEstBellum_Ext\Main_Sign\Main_Sign_03.paa"];
_Sign_03 attachTo [Gun_Store,[-1.15,-2.755,0.185]]; 

_Sign_04 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Sign_04 setObjectTexture [0, "Images\HocEstBellum_Ext\Main_Sign\Main_Sign_04.paa"];
_Sign_04 attachTo [Gun_Store,[-0.15,-2.755,0.185]]; 

_Sign_Icon = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Sign_Icon setObjectTexture [0, "Images\HocEstBellum_Ext\Main_Sign\Main_Sign_Icon.paa"];
_Sign_Icon attachTo [Gun_Store,[1.25,-2.755,0.285]];

_Shop_Light = "Land_FloodLight_F" createVehicle position Gun_Store_Position; 
_Shop_Light attachTo [Gun_Store, [-1.75,-2.85,0.75]]; 
_Shop_Light setVectorDirAndUp [[1,0,0],[0,-3,1]]; 

// Interior Objects (Counter)
private ["_Desk", "_Cabinet", "_PC_Keyboard", "_PC_Screen", "_PC_Case", "_PC_Mouse", "_Documents_Desk", "_Fire_Extinguisher", "_Store_Chair"];

_Desk = "OfficeTable_01_new_F" createVehicle position Gun_Store_Position;
_Desk attachTo [Gun_Store,[0.715,3.355,-2.375]]; 
_Desk setDir 180; 

_Cabinet = "Land_OfficeCabinet_01_F" createVehicle position Gun_Store_Position;
_Cabinet attachTo [Gun_Store,[1.805,4.275,-1.995]]; 
_Cabinet setDir 90; 

_PC_Keyboard = "Land_PCSet_01_keyboard_F" createVehicle position Gun_Store_Position;
_PC_Keyboard attachTo [_Desk,[-0.25,0,0.405]];

_PC_Screen = "Land_PCSet_01_screen_F" createVehicle position Gun_Store_Position;
_PC_Screen setObjectTexture [0, "Images\HocEstBellum_Int\Screen_Textures\Desk_Screen.paa"];
_PC_Screen attachTo [_Desk, [0.2,0.185,0.665]]; 
_PC_Screen setDir 25;

_PC_Case = "Land_PCSet_01_case_F" createVehicle position Gun_Store_Position;
_PC_Case attachTo [_Desk, [0.55,0.05,0.6585]]; 

_PC_Mouse = "Land_PCSet_01_mouse_F" createVehicle position Gun_Store_Position;
_PC_Mouse attachTo [_Desk,[0.035,0,0.435]];

_Documents_Desk = "Land_File2_F" createVehicle position Gun_Store_Position;
_Documents_Desk attachTo [_Desk,[0.225,-0.15,0.415]];

_Fire_Extinguisher = "Land_FireExtinguisher_F" createVehicle position Gun_Store_Position;
_Fire_Extinguisher attachTo [Gun_Store, [3.85,5.25,-2.405]]; 

_Store_Chair = "Land_ChairWood_F" createVehicle position Gun_Store_Position;
_Store_Chair attachTo [_Desk,[-0.275,-0.715,-0.445]]; 
_Store_Chair setDir 180; 

// Radio (Playing)

Radio = "Land_FMradio_F" createVehicle position Gun_Store_Position;
Radio attachTo [Gun_Store,[1.85,4,-1.1325]]; 
Radio setDir -90;

// Shop Owner

Shop_Owner disableAI "ANIM"; 
Shop_Owner switchMove "HubSittingAtTableU_idle3";
Shop_Owner allowDamage false;
Shop_Owner attachTo [Gun_Store_Position, [-2.65, 0.75,0.215]]; 
Shop_Owner setDir 180;

// Interior Shelves (Front) (Masking Default Texture Flicker)

private ["_Shelves_01", "_Shelves_02", "_Shelves_03", "_Shelves_04"];

_Shelves_01 = "Land_OfficeCabinet_01_F" createVehicle position Gun_Store_Position;
_Shelves_01 attachTo [Gun_Store,[-0.295,-2.275,-2.995]]; 

_Shelves_02 = "Land_OfficeCabinet_01_F" createVehicle Position Gun_Store_Position;
_Shelves_02 attachTo [Gun_Store,[-1.1225,-2.275,-2.995]]; 

_Shelves_03 = "Land_OfficeCabinet_01_F" createVehicle position Gun_Store_Position;
_Shelves_03 attachTo [Gun_Store,[-2.425,-2.275,-2.995]]; 

_Shelves_04 = "Land_OfficeCabinet_01_F" createVehicle position Gun_Store_Position;
_Shelves_04 attachTo [Gun_Store,[-3.2425,-2.275,-2.995]]; 

// Interior Posters (Downstairs)

private ["_Poster_SR_Optics", "_Poster_Ion_Services", "_Poster_ShackTactical", "_Poster_Target_Altis", "_Poster_HocEstBellum_01", "_Poster_HocEstBellum_02", "_Poster_Night_Owl", "_Poster_P07", "_Poster_Bohemia_Industries", "_Poster_Laser_Sight", "_Poster_SDAR_Underwater_Rifle"];

_Poster_SR_Optics = "UserTexture_1x2_F" createvehicle Position Gun_Store_position;
_Poster_SR_Optics setObjectTexture [0, "Images\HocEstBellum_Int\Posters\SR_Optics_Poster.paa"];
_Poster_SR_Optics attachTo [Gun_Store,[0.755,4.815,-1.095]]; 

_Poster_Ion_Services = "UserTexture_1x2_F" createvehicle Position Gun_Store_position;
_Poster_Ion_Services setObjectTexture [0, "Images\HocEstBellum_Int\Posters\Ion_poster.paa"];
_Poster_Ion_Services attachTo [Gun_Store, [2.02,1.85,-1.15]];
_Poster_Ion_Services setVectorDirAndUp [[1,0,0.0085],[0,0,1]]; 

_Poster_ShackTactical = "UserTexture_1x2_F" createvehicle Position Gun_Store_position;
_Poster_ShackTactical setObjectTexture [0, "Images\HocEstBellum_Int\Posters\ShackTactical_Poster.paa"];
_Poster_ShackTactical attachTo [Gun_Store, [2.02,0.75,-1.15]];
_Poster_ShackTactical setVectorDirAndUp [[1,0,0.0085],[0,0,1]]; 

_Poster_Targets_Altis = "UserTexture_1x2_F" createvehicle position Gun_Store_Position;
_Poster_Targets_Altis setObjectTexture [0, "Images\HocEstBellum_Int\Posters\Targets_Altis.paa"];
_Poster_Targets_Altis attachTo [Gun_Store,[1.675,2.925,-1.35]];

_Poster_HocEstBellum_01 = "UserTexture1M_F" createvehicle position Gun_Store_Position;
_Poster_HocEstBellum_01 attachTo [Gun_Store, [2.02,-0.345,-1.05]]; 
_Poster_HocEstBellum_01 setVectorDirAndUp [[1,0,0.0085],[0,0,1]]; 
_Poster_HocEstBellum_01 setObjectTexture [0, "Images\HocEstBellum_Int\Posters\HocEstBellum_Poster_01.paa"];

_Poster_HocEstBellum_02 = "UserTexture1M_F" createvehicle position Gun_Store_Position;
_Poster_HocEstBellum_02 attachTo [Gun_Store, [2.02,-1.3425,-1.05]];
_Poster_HocEstBellum_02 setVectorDirAndUp [[1,0,0.0085],[0,0,1]];
_Poster_HocEstBellum_02 setObjectTexture [0, "Images\HocEstBellum_Int\Posters\HocEstBellum_Poster_02.paa"];

_Poster_Night_Owl = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Poster_Night_Owl setObjectTexture [0, "Images\HocEstBellum_Int\Posters\Night_Owl_Poster.paa"];
_Poster_Night_Owl attachTo [Gun_Store,[-3.805,3,-0.65]]; 
_Poster_Night_Owl setDir -90;

_Poster_P07 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Poster_P07 setObjectTexture [0, "Images\HocEstBellum_Int\Posters\P07_Poster.paa"];
_Poster_P07 attachTo [Gun_Store,[-3.805,2.015,-0.65]]; 
_Poster_P07 setDir -90; 

_Poster_Bohemia_Industries = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Poster_Bohemia_Industries setObjectTexture [0, "Images\HocEstBellum_Int\Posters\Bohemia_Industries_Poster.paa"];
_Poster_Bohemia_Industries attachTo [Gun_Store,[-3.805,1.015,-0.635]]; 
_Poster_Bohemia_Industries setDir -90;

_Poster_Laser_Sight = "UserTexture1M_F" createVehicle position Gun_Store;
_Poster_Laser_Sight setObjectTexture [0, "Images\HocEstBellum_Int\Posters\Laser_Sight_Poster.paa"];
_Poster_Laser_Sight attachTo [Gun_Store,[-3.805,0,-0.635]]; 
_Poster_Laser_Sight setDir -90;

_Poster_SDAR_Underwater_Rifle = "UserTexture1M_F" createVehicle position Gun_Store;
_Poster_SDAR_Underwater_Rifle setObjectTexture [0, "Images\HocEstBellum_Int\Posters\SDAR_Poster.paa"];
_Poster_SDAR_Underwater_Rifle attachTo [Gun_Store,[-3.805,-1,-0.635]]; 
_Poster_SDAR_Underwater_Rifle setDir -90;

// Interior Posters (Upstairs)

private ["_Poster_ZUBR", "_Poster_Larkin_Aviation", "_Poster_Ammo"];

_Poster_ZUBR = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Poster_ZUBR setObjectTexture [0, "Images\HocEstBellum_Int\Posters\ZUBR_Poster.paa"];
_Poster_ZUBR attachTo [Gun_Store,[-3.8065,-1,2.75]]; 

_Poster_Larkin_Aviation = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Poster_Larkin_Aviation setObjectTexture [0, "Images\HocEstBellum_Int\Posters\Larkin_Aviation_Poster.paa"];
_Poster_Larkin_Aviation attachTo [Gun_Store,[-3.8065,0,2.75]];

_Poster_Ammo = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Poster_Ammo setObjectTexture [0, "Images\HocEstBellum_Int\Posters\Ammo_Poster.paa"];
_Poster_Ammo attachTo [Gun_Store,[-3.8065,1,2.75]];

{
_X setVectorDirAndUp [[-1,0,0.0085],[0,0,1]];
} forEach [_Poster_ZUBR, _Poster_Larkin_Aviation, _Poster_Ammo];

// Interior Vrana Banner

private ["_Banner_Vrana_01", "_Banner_Vrana_02"];

_Banner_Vrana_01 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Banner_Vrana_01 setObjectTexture [0, "Images\HocEstBellum_Int\Banners\Vrana_Banner_01.paa"];
_Banner_Vrana_01 attachTo [Gun_Store,[-2.5,6.995,-0.65]];

_Banner_Vrana_02 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Banner_Vrana_02 setObjectTexture [0, "Images\HocEstBellum_Int\Banners\Vrana_Banner_02.paa"];
_Banner_Vrana_02 attachTo [Gun_Store,[-1.5,6.995,-0.65]];

// Interior Weapon Rails

private ["_Rail_01", "_Rail_02", "_Rail_03", "_Rail_04", "_Rail_05", "_Rail_06", "_Rail_07", "_Rail_08", "_Rail_09", "_Rail_10"]; 

_Rail_01 = "Target_Rail_F" createVehicle position Gun_Store; 
_Rail_01 attachTo [Gun_Store,[-3.75,-1,-2.5]]; 

_Rail_02 = "Target_Rail_F" createVehicle position Gun_Store; 
_Rail_02 attachTo [Gun_Store,[-3.75,0,-2.5]];  

_Rail_03 = "Target_Rail_F" createVehicle position Gun_Store; 
_Rail_03 attachTo [Gun_Store,[-3.75,1,-2.5]]; 

_Rail_04 = "Target_Rail_F" createVehicle position Gun_Store; 
_Rail_04 attachTo [Gun_Store,[-3.75,2,-2.5]]; 

_Rail_05 = "Target_Rail_F" createVehicle position Gun_Store; 
_Rail_05 attachTo [Gun_Store,[-3.75,3,-2.5]]; 

_Rail_06 = "Target_Rail_F" createVehicle position Gun_Store; 
_Rail_06 attachTo [Gun_Store,[-3.75,-1,-1.5]]; 

_Rail_07 = "Target_Rail_F" createVehicle position Gun_Store; 
_Rail_07 attachTo [Gun_Store,[-3.75,0,-1.5]]; 

_Rail_08 = "Target_Rail_F" createVehicle position Gun_Store; 
_Rail_08 attachTo [Gun_Store,[-3.75,1,-1.5]]; 

_Rail_09 = "Target_Rail_F" createVehicle position Gun_Store; 
_Rail_09 attachTo [Gun_Store,[-3.75,2,-1.5]]; 

_Rail_10 = "Target_Rail_F" createVehicle position Gun_Store; 
_Rail_10 attachTo [Gun_Store,[-3.75,3,-1.5]]; 

{
_X setVectorUp [150,0,-1]
} forEach [_Rail_01, _Rail_02, _Rail_03, _Rail_04, _Rail_05, _Rail_06, _Rail_07, _Rail_08, _Rail_09, _Rail_10]; 

// Interior Weapon Rails (Rear)

private ["_Rail_01_R", "_Rail_02_R", "_Rail_03_R", "_Rail_04_R"];

_Rail_01_R = "Target_Rail_End_F" createVehicle position Gun_Store;
_Rail_01_R attachTo [Gun_Store,[-2.5,6.95,-1.5]]; 

_Rail_02_R = "Target_Rail_End_F" createVehicle position Gun_Store;
_Rail_02_R attachTo [Gun_Store,[-1.5,6.95,-1.5]]; 

_Rail_03_R = "Target_Rail_End_F" createVehicle position Gun_Store;
_Rail_03_R attachTo [Gun_Store,[-2.5,6.95,-1.95]];

_Rail_04_R = "Target_Rail_End_F" createVehicle position Gun_Store;
_Rail_04_R attachTo [Gun_Store,[-1.5,6.95,-1.95]];

{
_X setDir 90
} forEach [_Rail_01_R, _Rail_02_R, _Rail_03_R, _Rail_04_R];

// Sniper Rifles (Rear)

Sniper_Rifle_01 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Sniper_Rifle_01 addweaponcargo ["srifle_LRR_LRPS_F",1]; 
Sniper_Rifle_01 attachTo [Gun_Store, [-2.25,6.25,-1.525]]; 

Sniper_Rifle_02 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Sniper_Rifle_02 addweaponcargo ["srifle_GM6_LRPS_F",1]; 
Sniper_Rifle_02 attachTo [Gun_Store,[-2.235,6.245,-1.95]];   

{
_X setVectorDirAndUp [[0,0,1],[0,-40,0]];
_X setDamage 1; 
} forEach [Sniper_Rifle_01, Sniper_Rifle_02];  
  
// Interior Ammo Boxes

private ["_AmmoBox_01", "_AmmoBox_02", "_AmmoBox_03", "_AmmoBox_04", "_AmmoBox_05"];

_AmmoBox_01 = "Box_IND_Ammo_F" createVehicle position Gun_Store;
_AmmoBox_01 attachTo [Gun_Store,[-3.495,-1.05,-2.535]]; 

_AmmoBox_02 = "Box_IND_Ammo_F" createVehicle position Gun_Store;
_AmmoBox_02 attachTo [Gun_Store,[-3.495,-0.05,-2.535]]; 

_AmmoBox_03 = "Box_IND_Ammo_F" createVehicle position Gun_Store;
_AmmoBox_03 attachTo [Gun_Store,[-3.495,0.95,-2.535]]; 

_AmmoBox_04 = "Box_IND_Ammo_F" createVehicle position Gun_Store;
_AmmoBox_04 attachTo [Gun_Store,[-3.495,1.95,-2.535]]; 

_AmmoBox_05 = "Box_IND_Ammo_F" createVehicle position Gun_Store;
_AmmoBox_05 attachTo [Gun_Store,[-3.495,2.95,-2.535]]; 

{
clearMagazineCargo _X;
_X enableSimulation false;
_X allowDamage false;
} forEach [_AmmoBox_01, _AmmoBox_02, _AmmoBox_03, _AmmoBox_04, _AmmoBox_05];

// Backroom Weapon Boxes

private ["_WeaponBox_01", "_WeaponBox_02", "_WeaponBox_03", "_WeaponBox_04", "_Trolley"];

_WeaponBox_01 = "Box_IND_Wps_F" createVehicle position Gun_Store_Position;
_WeaponBox_01 attachTo [Gun_Store, [3.65,6,-2.615]];
_WeaponBox_01 setDir 90;

_WeaponBox_02 = "Box_IND_Wps_F" createVehicle position Gun_Store_Position;
_WeaponBox_02 attachTo [Gun_Store, [3.65,6,-2.255]];
_WeaponBox_02 setDir 90;

_WeaponBox_03 = "Box_IND_Wps_F" createVehicle position Gun_Store_Position;
_WeaponBox_03 attachTo [Gun_Store, [3.65,6,-1.915]]; 
_WeaponBox_03 setDir 90;

_WeaponBox_04 = "Box_IND_Wps_F" createVehicle position Gun_Store_Position;
_WeaponBox_04 attachTo [Gun_Store, [3.65,6,-1.575]]; 
_WeaponBox_04 setDir 90;

_WeaponBox_05 = "Box_IND_WpsLaunch_F" createVehicle position Gun_Store_Position;
_WeaponBox_05 attachTo [Gun_Store, [3.65,6.715,-2.045]];
_WeaponBox_05 setVectorDirAndUp [[1,0,0],[0,30,2]];

clearWeaponCargo _WeaponBox_05;
clearMagazineCargo _WeaponBox_05;
_WeaponBox_05 enableSimulation false;

{
clearWeaponCargo _X; 
clearMagazineCargo _X;
_X enableSimulation false;
_X setDir 90;
_X allowDamage false;
} forEach [_WeaponBox_01, _WeaponBox_02, _WeaponBox_03, _WeaponBox_04];

// Interior Racking (Rear - Explosives)

private "_Rack_01";

_Rack_01 = "Land_Metal_rack_F" createVehicle position Gun_Store;
_Rack_01 attachTo [Gun_Store,[-3.65,4.25,-1.885]]; 
_Rack_01 setDir -90; 

Mine_01 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_01 attachTo [Gun_Store, [-3.015,3.75,-1.275]]; 
 
Mine_02 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_02 attachTo [Gun_Store, [-3.015,3.95,-1.275]]; 

Mine_03 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"];  
Mine_03 attachTo [Gun_Store, [-3.015,4.15,-1.275]]; 


Mine_04 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_04 attachTo [Gun_Store, [-3.015,4.35,-1.275]]; 

Mine_05 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_05 attachTo [Gun_Store, [-3.015,4.55,-1.275]]; 

{
_X addMagazineCargo ["ClaymoreDirectionalMine_Remote_Mag",1]; 
_X setVectorDirAndUp[[0,0,1],[5000,-40,0]]; 
_X setDamage 1;
} forEach [Mine_01, Mine_02, Mine_03, Mine_04, Mine_05];

Mine_06 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_06 attachTo [Gun_Store, [-3.795,4.05,-1.1265]]; 

Mine_07 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_07 attachTo [Gun_Store, [-3.795,4.45,-1.1265]]; 

{
_X addMagazineCargo ["ATMine_Range_Mag",1];
_X setDamage 1;
} forEach [Mine_06, Mine_07];

Mine_08 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_08 attachTo [Gun_Store, [-3.75,3.85,-1.565]]; 

Mine_09 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_09 attachTo [Gun_Store, [-3.75,4.05,-1.565]]; 

Mine_10 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_10 attachTo [Gun_Store, [-3.75,4.25,-1.565]]; 

Mine_11 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_11 attachTo [Gun_Store, [-3.75,4.45,-1.565]]; 

Mine_12 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"];  
Mine_12 attachTo [Gun_Store, [-3.75,4.65,-1.565]]; 

{
_X addMagazineCargo ["APERSMine_Range_Mag",1];
_X setDamage 1;
} forEach [Mine_08, Mine_09, Mine_10, Mine_11, Mine_12];

Mine_13 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_13 attachTo [Gun_Store, [-3.75,3.85,-2.035]]; 

Mine_14 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"];  
Mine_14 attachTo [Gun_Store, [-3.75,4.05,-2.035]]; 

Mine_15 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_15 attachTo [Gun_Store, [-3.75,4.25,-2.035]]; 

Mine_16 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_16 attachTo [Gun_Store, [-3.75,4.45,-2.035]]; 

Mine_17 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Mine_17 attachTo [Gun_Store, [-3.75,4.65,-2.035]];

{
_X addMagazineCargo ["SatchelCharge_Remote_Mag",1];
_X setDamage 1;
} forEach [Mine_13, Mine_14, Mine_15, Mine_16, Mine_17];           

// Interior Racking (Rear - Optics / Grenades)

private "_Rack_02";

_Rack_02 = "Land_Metal_rack_F" createVehicle position Gun_Store;
_Rack_02 attachTo [Gun_Store,[-3.65,5.365,-1.885]]; 
_Rack_02 setDir -90; 

Scope_01 = "Item_optic_Nightstalker" createVehicle position Gun_Store;
Scope_01 attachTo [Gun_Store, [-3.65,5,-1.12905]]; 

Scope_02 = "Item_optic_Nightstalker" createVehicle position Gun_Store;
Scope_02 attachTo [Gun_Store, [-3.65,5.225,-1.12905]];

Scope_03 = "Item_optic_Hamr" createVehicle position Gun_Store;
Scope_03 attachTo [Gun_Store, [-3.65,5.45,-1.12905]]; 

Scope_04 = "Item_optic_Hamr" createVehicle position Gun_Store;
Scope_04 attachTo [Gun_Store, [-3.65,5.675,-1.12905]]; 

Scope_05 = "Item_optic_DMS" createVehicle position Gun_Store;
Scope_05 attachTo [Gun_Store, [-3.65,5.1,-1.56405]]; 

Scope_06 = "Item_optic_DMS" createVehicle position Gun_Store;
Scope_06 attachTo [Gun_Store, [-3.65,5.425,-1.56505]]; 

Scope_07 = "Item_optic_LRPS" createVehicle position Gun_Store;
Scope_07 attachTo [Gun_Store, [-3.65,5.135,-2.02015]]; 

Scope_08 = "Item_optic_LRPS" createVehicle position Gun_Store;
Scope_08 attachTo [Gun_Store, [-3.65,5.635,-2.02015]]; 

Scope_09 = "Item_optic_Aco" createVehicle position Gun_Store;
Scope_09 attachTo [Gun_Store, [-3.65,5.635,-1.58015]]; 

Scope_10 = "Item_optic_Aco" createVehicle position Gun_Store;
Scope_10 attachTo [Gun_Store, [-3.65,5.735,-1.58015]];

{
_X setDir 90;
_X setDamage 1;
} forEach [Scope_01, Scope_02, Scope_03, Scope_04, Scope_05, Scope_06, Scope_07, Scope_08];

Grenade_01 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Grenade_01 attachTo [Gun_Store, [-3.75,5,-0.67405]]; 

Grenade_02 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Grenade_02 attachTo [Gun_Store, [-3.75,5.1,-0.67405]];

Grenade_03 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Grenade_03 attachTo [Gun_Store, [-3.75,5.2,-0.67405]];

Grenade_04 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Grenade_04 attachTo [Gun_Store, [-3.75,5.3,-0.67405]]; 

Grenade_05 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Grenade_05 attachTo [Gun_Store, [-3.75,5.4,-0.67405]]; 

Grenade_06 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Grenade_06 attachTo [Gun_Store, [-3.75,5.5,-0.67405]];

Grenade_07 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Grenade_07 attachTo [Gun_Store, [-3.75,5.6,-0.67405]]; 

Grenade_08 = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
Grenade_08 attachTo [Gun_Store, [-3.75,5.7,-0.67405]];

{
_X addMagazineCargo ["HandGrenade",1];
_X setDamage 1;
} forEach [Grenade_01, Grenade_02, Grenade_03, Grenade_04, Grenade_05, Grenade_06, Grenade_07, Grenade_08];   

// Interior Target (Rear / Downstairs)

private "_Target_Ambient";

_Target_Ambient = "TargetBootcampHumanSimple_F" createVehicle position Gun_Store;
_Target_Ambient attachTo [Gun_Store,[-3.255,6.345,-1.95]]; 
_Target_Ambient setDir -45;

// Interior Display Stand (Dummy Vehicle Ammo Crate)

private ["_Display_Stand_Base", "_Stand_Information"];

_Display_Stand_Base = "Box_IND_AmmoVeh_F" createVehicle position Gun_Store;
_Display_Stand_Base attachTo [Gun_Store,[-0.735,1,-3.375]]; 
_Display_Stand_Base setDir 180; 
_Display_Stand_Base setObjectTexture [1, "Images\HocEstBellum_Int\Display_Stand_Canvas.paa"];
_Display_Stand_Base enableSimulation false;
_Display_Stand_Base allowDamage false;

_Stand_Information = "Land_InfoStand_V1_F" createVehicle position Gun_Store; 
_Stand_Information attachTo [Gun_Store,[-0.705,0,-2.205]];
_Stand_Information setObjectTexture [0, "Images\HocEstBellum_Int\PCML_Details.paa"]; 

// Rotating Display

Display = "Land_Can_V2_F" createVehicle position Gun_Store;
Display attachTo [Gun_Store_Position,[-4.365,-2.285,0.25]];
Display hideObject true;

_Pole_Display = "Metal_Pole_F" createVehicle position Gun_Store;
_Pole_Display attachTo [Display, [0,-0.925,0.15]]; 

_Titan_Display = createvehicle ["groundweaponholder", getPos Gun_Store, [], 0, "can_collide"]; 
_Titan_Display addweaponcargo ["launch_NLAW_F", 1];  
_Titan_Display attachTo [_Pole_Display,[0,0.315,1.15]]; 
_Titan_Display setVectorUp [0,-5,1];
_Titan_Display setDamage 1;

// Backroom Mesh

private ["_Mesh_01", "_Mesh_02", "_Mesh_03", "_Mesh_04", "_Mesh_05", "_Mesh_06", "_Mesh_07", "_Mesh_08"];

_Mesh_01 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Mesh_01 attachTo [Gun_Store,[0.1,5.55,0.05]];

_Mesh_02 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Mesh_02 attachTo [Gun_Store,[0.1,5.55,-0.8165]];

_Mesh_03 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Mesh_03 attachTo [Gun_Store,[0.1,6.55,0.05]];

_Mesh_04 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Mesh_04 attachTo [Gun_Store,[0.1,6.55,-0.8165]]; 

_Mesh_05 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Mesh_05 attachTo [Gun_Store,[0.1,5.55,-1.6825]];

_Mesh_06 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Mesh_06 attachTo [Gun_Store,[0.1,6.55,-1.6825]];

_Mesh_07 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Mesh_07 attachTo [Gun_Store,[0.1,5.55,-2.5485]];

_Mesh_08 = "UserTexture1M_F" createVehicle position Gun_Store_Position;
_Mesh_08 attachTo [Gun_Store,[0.1,6.55,-2.5485]];

{
_X setDir 90;
_X setObjectTexture [0, "Images\HocEstBellum_Int\Storeroom_Mesh.paa"];
} forEach [_Mesh_01, _Mesh_01, _Mesh_02, _Mesh_03, _Mesh_04, _Mesh_05, _Mesh_06, _Mesh_07, _Mesh_08];

// BIS' Invisible Wall (Prevent Player from Passing Through Mesh)

BIS_InvisibleWall2 attachTo [Gun_Store,[0.5,6.55,-2.5]];
BIS_Invisiblewall2 setDir 90;

// Backroom Mesh Frame

private ["_Pole_Frame_01", "_Pole_Frame_02", "_Pole_Frame_03", "_Pole_Frame_04", "_Base_Frame_01", "_Trolley"];

_Pole_Frame_01 = "Metal_Pole_F" createVehicle position Gun_Store_Position;
_Pole_Frame_01 attachTo [Gun_Store,[0.105,4.175,-0.5]];

_Pole_Frame_02 = "Metal_Pole_F" createVehicle position Gun_Store_Position;
_Pole_Frame_02 attachTo [Gun_Store,[0.105,4.175,-2.5]];

_Pole_Frame_03 = "Metal_Pole_F" createVehicle position Gun_Store_Position;
_Pole_Frame_03 attachTo [Gun_Store,[0.105,6.055,-0.5]];

_Pole_Frame_04 = "Metal_Pole_F" createVehicle position Gun_Store_Position;
_Pole_Frame_04 attachTo [Gun_Store,[0.105,6.055,-2.05]]; 

_Base_Frame_01 = "Land_CncBarrier_stripes_F" createVehicle position Gun_Store_Position;
_Base_Frame_01 attachTo [Gun_Store,[0.15,6,-3.05]]; 
_Base_Frame_01 setDir 90;
_Base_Frame_01 setVectorUp [0,0,1];

_Trolley = "Land_PalletTrolley_01_khaki_F" createVehicle position Gun_Store_Position;
_Trolley attachTo [Gun_Store, [1,6.5,-2.25]]; 
_Trolley setDir 20;
 
// Ammo Box (Hiding Edge of Base Frame)

private "_Ammo_50cal";

_Ammo_50cal = "Land_Ammobox_rounds_F" createVehicle position Gun_Store_Position;
_Ammo_50cal attachTo [Gun_Store,[0.15,4.75,-2.685]];

// Trophy

private "_Trophy";

_Trophy = "Land_Trophy_01_gold_F" createVehicle position Gun_Store_Position;
_Trophy attachTo [_Cabinet, [-0.15,0,0.925]];

// Food Container

private "_Container";

_Container = "Land_FoodContainer_01_F" createVehicle position Gun_Store_Position;
_Container attachTo [Gun_Store, [-2.885,6.75,-2.55]];

// Pistol Shooting Range (Upstairs)

private ["_Target_01_Upstairs", "_Target_02_Upstairs", "_Target_03_Upstairs", "_Target_04_Upstairs", "_Railing_Upstairs", "_Window_Panel_01", "_Window_Panel_02"];

_Target_01_Upstairs = "TargetBootcampHumanSimple_F" createVehicle position Gun_Store_Position;
_Target_01_Upstairs attachTo [Gun_Store,[1.75,-1.25,1.915]];

_Target_02_Upstairs = "TargetBootcampHumanSimple_F" createVehicle position Gun_Store_Position;
_Target_02_Upstairs attachTo [Gun_Store,[1.75,0,1.915]];

_Target_03_Upstairs = "TargetBootcampHumanSimple_F" createVehicle position Gun_Store_Position;
_Target_03_Upstairs attachTo [Gun_Store,[1.75,1.25,1.915]];

_Target_04_Upstairs = "TargetBootcampHumanSimple_F" createVehicle position Gun_Store_Position;
_Target_04_Upstairs attachTo [Gun_Store,[1.75,2.5,1.915]];

{
_X setDir 90
} forEach [_Target_01_Upstairs, _Target_02_Upstairs, _Target_03_Upstairs, _Target_04_Upstairs];

_Railing_Upstairs = "Land_Pipe_fence_4mNoLC_F" createVehicle position Gun_Store_Position;
_Railing_Upstairs attachTo [Gun_Store, [-0.665,3.235,1.5]];
_Railing_Upstairs setDir 180;

_Target_Screen = "Land_FlatTv_01_F" createVehicle position Gun_Store_Position;
_Target_Screen setObjectTexture [0,"Images\HocEstBellum_Int\Screen_Textures\Target_Screen.paa"];
_Target_Screen attachTo [_Railing_Upstairs,[0,0,2.35]]; 
_Target_Screen setVectorUp [0,0.5,-2];

_Window_Panel_01 = "Land_Shoot_House_Wall_F" createVehicle position Gun_Store_Position;
_Window_Panel_01 attachTo [Gun_Store, [1.05,-2.495,2.35]]; 

_Window_Panel_02 = "Land_Shoot_House_Wall_F" createVehicle position Gun_Store_Position;
_Window_Panel_02 attachTo [Gun_Store, [-2.75,-2.495,2.15]]; 

{
_X setVectorDirAndUp [[1,3000,0],[1,0,450]]
} forEach [_Window_Panel_01, _Window_Panel_02];

// Passageway (Upstairs)

private ["_Gas_Tank_01", "_Gas_Tank_02", "_Empty_Box_01"];

_Gas_Tank_01 = "Land_GasTank_01_khaki_F" createVehicle position Gun_Store_Position;
_Gas_Tank_01 attachTo [Gun_Store,[-2.55,6.75,1.45]]; 
_Gas_Tank_01 setDir -90;

_Gas_Tank_02 = "Land_GasTank_01_khaki_F" createVehicle position Gun_Store_Position;
_Gas_Tank_02 attachTo [Gun_Store,[-3,6.75,1.45]]; 
_Gas_Tank_02 setDir 180;

_Empty_Box_01 = "Land_PaperBox_closed_F" createVehicle position Gun_Store_Position;
_Empty_Box_01 attachTo [Gun_Store,[-3,5.825,1.665]];

// Expo Tent

_Manakin_Stand_01 = "Metal_Pole_Platform_F" createVehicle position Gun_Store_Position;
_Manakin_Stand_01 attachTo [Tent,[-1.75,1,-1.685]];
_Manakin_Stand_01 enableSimulation false; 
_Manakin_Stand_01 setDir 180;

_Manakin_Stand_02 = "Metal_Pole_Platform_F" createVehicle position Gun_Store_Position;
_Manakin_Stand_02 attachTo [Tent,[-1.65,1,-2.355]];
_Manakin_Stand_02 enableSimulation false;
_Manakin_Stand_02 setDir 130;


_Manakin_01 = Manakin_01;
_Manakin_02 = Manakin_02;

{
_X enableSimulation false;
_X disableAI "ANIM"; 
_X disableAI "MOVE";
_X setVectorUp [0,0,-1];
_X forceAddUniform "U_O_CombatUniform_ocamo";
_X addHeadgear "H_HelmetSpecO_blk";
_X addVest "Vest_V_TacVestIR_Russian"; 
_X setFace "CUSTOM"
} forEach [_Manakin_01, _Manakin_02];

_Manakin_01 switchMove "Acts_welcomeOnHUB02_PlayerWalk";
_Manakin_01 addMagazine "10Rnd_93x64_DMR_05_mag";
_Manakin_01 addWeapon "srifle_DMR_05_SOS_F";

_Manakin_01 attachTo [_Manakin_Stand_01,[0,0.925,-0.625]];

_Manakin_02 switchMove "Bipod_140_BottomRight";
_Manakin_02 addMagazine "150Rnd_93x64_mag"; 
_Manakin_02 addWeapon "MMG_01_tan_F";
_Manakin_02 setDir 10;

_Manakin_02 attachTo [_Manakin_Stand_02,[0,0.925,0.025]];

// Assign Manakin Textures
 
_Manakin_01 setObjectTexture [0, "Images\Uniforms\U_RussianCombatFatigues_co.paa"]; 
_Manakin_01 setObjectTexture [1, "Images\Uniforms\U_RussianCombatFatigues_Tech_co.paa"]; 
[_Manakin_01,"Bear"] call BIS_fnc_setUnitInsignia;
_Manakin_02 setObjectTexture [0, "Images\Uniforms\U_CombatFatigues_SpecOp_co.paa"]; 
_Manakin_02 setObjectTexture [1, "Images\Uniforms\U_CombatFatigues_SpecOp_Tech_co.paa"];
[_Manakin_02,"Tarantula"] call BIS_fnc_setUnitInsignia;

_Empty_Box_02 = "Land_PaperBox_closed_F" createVehicle position Gun_Store_Position;
_Empty_Box_02 attachTo [Tent,[-3,3,-1.685]];

_Pallet_Stack_01 = "Land_Pallets_stack_F" createVehicle position Gun_Store_Position;
_Pallet_Stack_01 attachTo [Tent,[-1.515,3,-1.885]];

_Sign_Expo_01 = "SignAd_Sponsor_F" createVehicle position Gun_Store_Position;
_Sign_Expo_01 setObjectTexture [0,"Images\Tent_Expo\Sign_Texture_ELITE.paa"];
_Sign_Expo_01 attachTo [Tent,[-3,2,-1.885]];

_Expo_Table_01 = "Land_CampingTable_F" createVehicle position Gun_Store_Position;
_Expo_Table_01 attachTo [Tent,[-3,-1,-1.885]];

_Expo_Chair_01 = "Land_CampingChair_V2_F" createVehicle position Gun_Store_Position;
_Expo_Chair_01 attachTo [Tent,[-3.5,0.5,-1.825]];

_Sign_Expo_02 = "SignAd_Sponsor_F" createVehicle position Gun_Store_Position;
_Sign_Expo_02 setObjectTexture [0,"Images\Tent_Expo\Sign_Texture_BIFD.paa"];
_Sign_Expo_02 attachTo [Tent,[3.2,2,-1.885]];

_Expo_Table_02 = "Land_CampingTable_F" createVehicle position Gun_Store_Position;
_Expo_Table_02 attachTo [Tent,[3.2,-1,-1.885]];

_Expo_Chair_02 = "Land_CampingChair_V2_F" createVehicle position Gun_Store_Position;
_Expo_Chair_02 attachTo [Tent,[3.75,0.5,-1.825]];

_Rails_NATO_Weapons_01 = "Target_Rail_F" createVehicle position Gun_Store_Position;
_Rails_NATO_Weapons_01 attachTo [Tent,[0.3,1,-2.225]];

_Rails_NATO_Weapons_02 = "Target_Rail_F" createVehicle position Gun_Store_Position;
_Rails_NATO_Weapons_02 attachTo [Tent,[0.3,1,-1.225]];

_Rails_NATO_Weapons_03 = "Target_Rail_F" createVehicle position Gun_Store_Position;
_Rails_NATO_Weapons_03 attachTo [Tent,[1.35,1,-2.225]];

_Rails_NATO_Weapons_04 = "Target_Rail_F" createVehicle position Gun_Store_Position;
_Rails_NATO_Weapons_04 attachTo [Tent,[1.35,1,-1.225]]; 

{
_X setVectorDirAndUp [[-1,0,0],[0,3000,1]]
} forEach [_Rails_NATO_Weapons_01, _Rails_NATO_Weapons_02, _Rails_NATO_Weapons_03, _Rails_NATO_Weapons_04];

Rifle_01_Display = createvehicle ["groundweaponholder", position Tent, [], 0, "can_collide"]; 
Rifle_01_Display addweaponcargo ["MMG_02_black_RCO_BI_F",1]; 
Rifle_01_Display attachTo [_Rails_NATO_Weapons_01,[-1.085,0.25,-0.625]]; 
 
Rifle_02_Display = createvehicle ["groundweaponholder", position Tent, [], 0, "can_collide"]; 
Rifle_02_Display addweaponcargo ["MMG_02_black_RCO_BI_F",1]; 
Rifle_02_Display attachTo [_Rails_NATO_Weapons_01,[-0.685,0.25,-0.625]]; 

Rifle_03_Display = createvehicle ["groundweaponholder", position Tent, [], 0, "can_collide"]; 
Rifle_03_Display addweaponcargo ["srifle_DMR_03_SOS_F",1]; 
Rifle_03_Display attachTo [_Rails_NATO_Weapons_03,[-1.085,0.15,-0.625]]; 

Rifle_04_Display = createvehicle ["groundweaponholder", position Tent, [], 0, "can_collide"]; 
Rifle_04_Display addweaponcargo ["srifle_DMR_03_SOS_F",1]; 
Rifle_04_Display attachTo [_Rails_NATO_Weapons_03,[-0.685,0.15,-0.625]]; 

{
_X setvectordirandup [[-100,0,1],[-3,0,-1]];
_X setDamage 1;
} forEach [Rifle_01_Display, Rifle_02_Display, Rifle_03_Display, Rifle_04_Display];

// BIS' Invisible Wall (Preventing Player from Passing Through Rails)

BIS_invisibleWall2_1 attachTo [_Sign_Expo_02,[-1,-1,0]];

// Showcase Extras

Laptop_Expo attachTo [Tent, [-3.25,-1,-1.315]]; 
Laptop_Expo setDir 180; 

Laptop_MAR10 attachTo [Tent, [2.75,-1,-1.315]]; 
Laptop_MAR10 setDir 180;

File attachTo [Tent, [-3.75,-1,-1.475]]; 
File setDir 200; 

Drink_01 attachTo [Tent, [-2.15,-1,-1.4385]];  
Drink_02 attachTo [Tent, [-2.185,-0.95,-1.4385]]; 
Drink_02 setDir 250; 

Demo_Helmet_01 attachTo [Tent, [-2.365,-0.95,-1.5985]]; 
Demo_Helmet_01 setVectorUp [0,0.5,1]; 

Demo_Helmet_02 attachTo [Tent, [-2.635,-0.95,-1.5985]]; 
Demo_Helmet_02 setVectorUp [0,0.5,1]; 

// Lighting

private ["_Light_Panel", "_Light_Ext", "_Light_Int", "_Light_Screen", "_Light_Main", "_Light_Upstairs", "_Light_Tent", "_Light_Screen_Targets"];

_Light_Ext = "#lightpoint" createVehicleLocal position Gun_Store_Position; 
_Light_Ext attachTo [_Shop_Light, [0,0,0]]; 
_Light_Ext setLightBrightness 0.65; 
_Light_Ext setLightAmbient [0.05, 0.05, 0.05]; 
_Light_Ext setLightColor [0.5, 0.5, 0.6];

_Light_Int = "#lightpoint" createVehicleLocal position Gun_Store_Position; 
_Light_Int attachTo [_Display_Stand_Base, [0,0,0]];
_Light_Int setLightBrightness 2.65; 
_Light_Int setLightAmbient[0.05, 0.05, 0.05];
_Light_Int setLightColor [1, 1, 1.25]; 

_Light_Screen = "#lightpoint" createVehicleLocal position Gun_Store_Position;
_Light_Screen attachTo [_PC_Screen, [0,0,0]];
_Light_Screen setLightBrightness 0.65;
_Light_Screen setLightAmbient [0.15, 0.15, 0.15];
_Light_Screen setLightColor [1, 1, 1.65];

_Light_Main = "#lightpoint" createVehicleLocal position Gun_Store_Position;
_Light_Main attachTo [_Display_Stand_Base, [0,0,3.75]];
_Light_Main setLightBrightness 2; 
_Light_Main setLightAmbient [0.0, 0.0, 0.0]; 
_Light_Main setLightColor [1.0, 1.0, 1.15];  

_Light_Upstairs = "#lightpoint" createVehicleLocal position Gun_Store_Position; 
_Light_Upstairs attachTo [_Display_Stand_Base, [0,0,7]];
_Light_Upstairs setLightBrightness 0.65; 
_Light_Upstairs setLightAmbient [0.0, 0.0, 0.0];
_Light_Upstairs setLightColor[1.0, 1.0, 1.0];

_Light_Tent = "#lightpoint" createVehicleLocal position Gun_Store_Position; 
_Light_Tent attachTo [Tent, [0,-2,0]]; 
_Light_Tent setLightBrightness 0.35; 
_Light_Tent setLightAmbient [0.5, 0.5, 0.5];
_Light_Tent setLightColor [1.0, 1.0, 1.15];

_Light_Screen_Targets = "#lightpoint" createVehicleLocal position Gun_Store_Position; 
_Light_Screen_Targets attachTo [_Target_Screen, [0,-0.45,0]]; 
_Light_Screen_Targets setLightBrightness 0.65; 
_Light_Screen_Targets setLightAmbient [0.0, 0.0, 0.0]; 
_Light_Screen_Targets setLightColor [1, 1, 1.25]; 

_Light_Panel = "UserTexture1M_F" createVehicle position Gun_Store;
_Light_Panel attachTo [_Light_Main,[0,0,0.215]]; 
_Light_Panel setVectorDirAndUp [[0,0,1],[1,0,0]];
_Light_Panel setObjectTexture [0, "Images\HocEstBellum_Int\Light_Panel.paa"];

// Graffiti

Graffiti attachTo [Gun_Store_Position,[-7.8035,-1.15,1.15]]; 
Graffiti setDir 90;  

// Characters

Kruglikov attachTo [Gun_Store_Position,[12.325,-0.995,0.0185]];
Kruglikov setDir 200; 
Kruglikov disableAI "ANIM"; 
Kruglikov switchMove "HubBriefing_think"; 
Kruglikov setFace "Kruglikov"; 

Shop_Worker attachTo [Gun_Store_Position,[-3.5,1,0.215]]; 
Shop_Worker setDir 175; 
Shop_Worker switchMove "HubStandingUC_idle1"; 

Alekos attachTo [Kruglikov,[0.825,2.295,0]]; 
Alekos setFormDir 220; Alekos setDir 220; 
Alekos switchMove "HubStandingUB_idle3"; 

Range_Master attachTo [Gun_Store_Position,[16.725,-2.595,0.0185]]; 
Range_Master addMagazine "10Rnd_338_Mag"; 
Range_Master addWeapon "srifle_DMR_02_DMS_F"; 
Range_Master disableAI "ANIM"; 
Range_Master switchMove "Acts_AidlPercMstpSlowWrflDnon_warmup04"; 
Range_Master setDir 205;  
removeVest Range_Master; 
Range_Master setFace "Whitehead_15";

Shooter_01 attachTo [Shooting_Position,[2.35,-0.5,0.095]]; 
Shooter_01 switchMove "passenger_flatground_1_Aim_Idling"; 
Shooter_01 setVectorUp [0,-0.005,0.15];

Shopper_01 attachTo [Gun_Store_Position,[-6,-0.85,0.205]]; 
Shopper_01 setDir -90; 
Shopper_01 switchMove "HubBriefing_think";

Observer_01 switchMove "HubSittingChairC_idle2"; 
Observer_01 attachTo [Shooting_Position, [2.5,-2.5605,0.05]]; 
Observer_01 setVectorUp [0,1,15];

// Rotate Display

nul = [] execVM "Scripts\Turn_Table.sqf";



