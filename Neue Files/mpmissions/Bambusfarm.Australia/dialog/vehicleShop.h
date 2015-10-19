class Life_Vehicle_Shop_v2
{
	idd = 2300;
	name="life_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	class controlsBackground
	{
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;

				x = 0.340197 * safezoneW + safezoneX;
			y = 0.0160839 * safezoneH + safezoneY;
			w = 0.329915 * safezoneW;
			h = 0.0219962 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0.00512714 * safezoneW + safezoneX;
			y = 0.0160839 * safezoneH + safezoneY;
			w = 0.180422 * safezoneW;
			h = 0.428926 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class MainBackground2: Life_RscText
		{
			idc = -1;
			x = 0.814451 * safezoneW + safezoneX;
			y = 0.0160839 * safezoneH + safezoneY;
			w = 0.180422 * safezoneW;
			h = 0.428926 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class Title: Life_RscTitle
		{
			idc = 2301;

			x = 0.340197 * safezoneW + safezoneX;
			y = 0.0160839 * safezoneH + safezoneY;
			w = 0.329915 * safezoneW;
			h = 0.0219962 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			class Attributes
			{
				align = "center";
			};
		};

		class VehicleTitleBox: Life_RscText
		{
			idc = -1;

			text = "$STR_GUI_ShopStock";
			x = 0.0102821 * safezoneW + safezoneX;
			y = 0.027082 * safezoneH + safezoneY;
			w = 0.170113 * safezoneW;
			h = 0.0219962 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			class Attributes
			{
				align = "center";
			};
		};

		class VehicleInfoHeader : Life_RscText
		{
			idc = 2330;

			text = "$STR_GUI_VehInfo";
			x = 0.819605 * safezoneW + safezoneX;
			y = 0.027082 * safezoneH + safezoneY;
			w = 0.170113 * safezoneW;
			h = 0.0219962 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			class Attributes
			{
				align = "center";
			};
		};
	};
	
	class controls
	{
		class CloseBtn: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = 1005;
		text = "$STR_Global_Close";
			x = 0.819605 * safezoneW + safezoneX;
			y = 0.412015 * safezoneH + safezoneY;
			w = 0.170113 * safezoneW;
			h = 0.0219962 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			class Attributes
			{
				align = "center";
			};
		};
		
		class RentCar: Life_RscButtonMenu
		{
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";

			idc = 1006;
			text = "$STR_Global_RentVeh";
			x = 0.0979158 * safezoneW + safezoneX;
			y = 0.412015 * safezoneH + safezoneY;
			w = 0.0824788 * safezoneW;
			h = 0.0219962 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			class Attributes
			{
				align = "center";
			};
		};
		
		class BuyCar: Life_RscButtonMenu
		{
			idc = 2309;
			onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";

			text = "$STR_Global_Buy";
			x = 0.0102821 * safezoneW + safezoneX;
			y = 0.412015 * safezoneH + safezoneY;
			w = 0.0824788 * safezoneW;
			h = 0.0219962 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			class Attributes
			{
				align = "center";
			};
		};
		
		class VehicleList: Life_RscListBox
		{
			idc = 2302;
			text = "";
			sizeEx = 0.04;
			onLBSelChanged = "_this spawn life_fnc_vehicleShopLBChange";
			x = 0.0102821 * safezoneW + safezoneX;
			y = 0.0600763 * safezoneH + safezoneY;
			w = 0.170113 * safezoneW;
			h = 0.296948 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		
		class ColorList: Life_RscCombo
		{
			idc = 2304;
			onLBSelChanged = "[] call life_fnc_vehicleShopColorLBChange";
			x = 0.0102821 * safezoneW + safezoneX;
			y = 0.368023 * safezoneH + safezoneY;
			w = 0.170113 * safezoneW;
			h = 0.0219962 * safezoneH;
		};
		
		class vehicleInfomationList: Life_RscStructuredText
		{
			idc = 2303;
			sizeEx = 0.035;
			x = 0.819605 * safezoneW + safezoneX;
			y = 0.0600763 * safezoneH + safezoneY;
			w = 0.170113 * safezoneW;
			h = 0.340941 * safezoneH;
		};
	};
};
