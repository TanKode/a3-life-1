// Spawn Gun Store
Gun_Store_1 = "Land_i_Shop_01_V1_F" createVehicle position Gun_Store_Position_1; 
Gun_Store_1 attachTo [Gun_Store_Position_1,[-3.65,-3.35,3]];

Radio_1 = "Land_FMradio_F" createVehicle position Gun_Store_Position_1;

Display_1 = "Land_Can_V2_F" createVehicle position Gun_Store_1;
Display_1 attachTo [Gun_Store_Position_1,[-4.365,-2.285,0.25]];

Gun_Store_2 = "Land_i_Shop_01_V1_F" createVehicle position Gun_Store_Position_2; 
Gun_Store_2 attachTo [Gun_Store_Position_2,[-3.65,-3.35,3]];

Radio_2 = "Land_FMradio_F" createVehicle position Gun_Store_Position_2;

Display_2 = "Land_Can_V2_F" createVehicle position Gun_Store_2;
Display_2 attachTo [Gun_Store_Position_2,[-4.365,-2.285,0.25]];

/*
Gun_Store_3 = "Land_i_Shop_01_V1_F" createVehicle position Gun_Store_Position_3; 
Gun_Store_3 attachTo [Gun_Store_Position_3,[-3.65,-3.35,3]];
	
_groupCiv3 = createGroup CIVILIAN;
"C_man_polo_1_F_euro" createUnit [position Gun_Store_3, _groupCiv3,"Shop_Owner_3 = this;", 0.6, "PRIVATE"];
	
Gun_Store_4 = "Land_i_Shop_01_V1_F" createVehicle position Gun_Store_Position_4; 
Gun_Store_4 attachTo [Gun_Store_Position_4,[-3.65,-3.35,3]];
	
_groupCiv4 = createGroup CIVILIAN;
"C_man_polo_1_F_euro" createUnit [position Gun_Store_4, _groupCiv4,"Shop_Owner_4 = this;", 0.6, "PRIVATE"];

Gun_Store_5 = "Land_i_Shop_01_V1_F" createVehicle position Gun_Store_Position_5; 
Gun_Store_5 attachTo [Gun_Store_Position_5,[-3.65,-3.35,3]];
	
_groupCiv5 = createGroup CIVILIAN;
"C_man_polo_1_F_euro" createUnit [position Gun_Store_5, _groupCiv5,"Shop_Owner_5 = this;", 0.6, "PRIVATE"];
	
Gun_Store_6 = "Land_i_Shop_01_V1_F" createVehicle position Gun_Store_Position_6; 
Gun_Store_6 attachTo [Gun_Store_Position_6,[-3.65,-3.35,3]];
	
_groupCiv6 = createGroup CIVILIAN;
"C_man_polo_1_F_euro" createUnit [position Gun_Store_6, _groupCiv6,"Shop_Owner_6 = this;", 0.6, "PRIVATE"];
	
Gun_Store_7 = "Land_i_Shop_01_V1_F" createVehicle position Gun_Store_Position_7; 
Gun_Store_7 attachTo [Gun_Store_Position_7,[-3.65,-3.35,3]];
	
_groupCiv7 = createGroup CIVILIAN;
"C_man_polo_1_F_euro" createUnit [position Gun_Store_7, _groupCiv7,"Shop_Owner_7 = this;", 0.6, "PRIVATE"];

Gun_Store_8 = "Land_i_Shop_01_V1_F" createVehicle position Gun_Store_Position_8; 
Gun_Store_8 attachTo [Gun_Store_Position_8,[-3.65,-3.35,3]];

_groupCiv8 = createGroup CIVILIAN;
"C_man_polo_1_F_euro" createUnit [position Gun_Store_8, _groupCiv8,"Shop_Owner_8 = this;", 0.6, "PRIVATE"];
*/
[] execVM "\life_server\scripts\GunStore\Gun_Store.sqf";