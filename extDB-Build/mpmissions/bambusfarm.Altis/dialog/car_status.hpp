class bambusfarm_car_Status {
	idd = 3333;
	name= "bambusfarm_car_status";
	movingEnable = false;
	enableSimulation = true;


	class controlsBackground {

		class Hull_Car_Pic: bambusfarm_RscPicture
		{
			idc = 3334;
			text = "\A3\soft_f\Offroad_01\Data\UI\map_offroad_01_CA.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class WLF_Pic: bambusfarm_RscPicture
		{
			idc = 3335;
			text = "textures\tire_top.paa";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class WBL_Pic: bambusfarm_RscPicture
		{
			idc = 3336;
			text = "textures\tire_top.paa";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class WRF_Pic: bambusfarm_RscPicture
		{
			idc = 3337;
			text = "textures\tire_top.paa";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class WBR_Pic: bambusfarm_RscPicture
		{
			idc = 3338;
			text = "textures\tire_top.paa";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Engine_Pic: bambusfarm_RscPicture
		{
			idc = 3339;
			text = "textures\car-engine.paa";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class Fuel_Pic: bambusfarm_RscPicture
		{
			idc = 3340;
			text = "textures\fuel_tank_.paa";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};

	class controls {


		class Hull: bambusfarm_RscButtonMenu
		{
			idc = 3341;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class WLF: bambusfarm_RscButtonMenu
		{
			idc = 3342;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class Engine: bambusfarm_RscButtonMenu
		{
			idc = 3343;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class Fuel: bambusfarm_RscButtonMenu
		{
			idc = 3344;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class WBL: bambusfarm_RscButtonMenu
		{
			idc = 3345;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class WRF: bambusfarm_RscButtonMenu
		{
			idc = 3346;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class WBR: bambusfarm_RscButtonMenu
		{
			idc = 3347;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
	};
};