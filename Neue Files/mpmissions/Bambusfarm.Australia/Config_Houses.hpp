class Houses {
	class Land_i_House_Big_02_V1_F {
		price = 6000000;
		maxStorage = 3;
		alarm = true;
	};
	class Land_i_House_Big_02_V2_F : Land_i_House_Big_02_V1_F{};
	class Land_i_House_Big_02_V3_F : Land_i_House_Big_02_V1_F{};

	class Land_HouseDoubleAL {
		price = 8000000;
		maxStorage = 4;
		alarm = true;
	};
	class Land_HouseDoubleAL2 : Land_HouseDoubleAL{};

	class Land_i_House_Small_01_V1_F {
		price = 5000000;
		maxStorage = 2;
		alarm = true;
	};
	class Land_i_House_Small_01_V2_F : Land_i_House_Small_01_V1_F{};
	class Land_i_House_Small_01_V3_F : Land_i_House_Small_01_V1_F{};

	class Land_HouseA {
		price = 4000000;
		maxStorage = 2;
		alarm = true;
	};
	class Land_HouseA1 : Land_HouseA{};
	class Land_HouseB : Land_HouseA{};
	class Land_HouseB1 : Land_HouseA{};
	class Land_HouseC_R : Land_HouseA{};
	class Land_HouseC1_L : Land_HouseA{};
	class Land_HouseA1_L : Land_HouseA{};
	class Land_HouseB1_L : Land_HouseA{};
	
	class Land_i_House_Small_03_V1_F {
		price = 3000000;
		maxStorage = 2;
		alarm = true;
	};

	class Land_i_Stone_HouseSmall_V2_F {
		price = 2000000;
		maxStorage = 1;
		alarm = true;
	};

	class Land_i_Stone_HouseSmall_V1_F : Land_i_Stone_HouseSmall_V2_F{};
	class Land_i_Stone_HouseSmall_V3_F : Land_i_Stone_HouseSmall_V2_F{};
	
	class Land_i_Garage_V1_F { 
		price = 500000; 
		alarm = false; 
	};
	class Land_i_Garage_V1_dam_F : Land_i_Garage_V1_F{};
	class Land_i_Garage_V2_F : Land_i_Garage_V1_F{};
	class Land_i_Garage_V2_dam_F : Land_i_Garage_V1_F{};
	
	class Land_Cargo_House_V3_f {
		price = 80000000;
		maxStorage = 0;
		alarm = false;
	};
};