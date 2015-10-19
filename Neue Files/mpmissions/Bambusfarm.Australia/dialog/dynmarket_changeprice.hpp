class life_dynmarket_changeprice {
	idd = 7000;
	name= "life_dynmarket_changeprice";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class MainBackground: life_RscPicture
		{
			idc = -1;

			text = "textures\tablet\tablet.paa"; //--- ToDo: Localize;
			x = 0.2712 * safezoneW + safezoneX;
			y = 0.224594 * safezoneH + safezoneY;
			w = 0.461136 * safezoneW;
			h = 0.601078 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class RscFrame_1800: Life_RscText
		{
			colorBackground[] = {0,0,0,0.3};
			idc = 7001;
			x = 0.322396 * safezoneW + safezoneX;
			y = 0.445021 * safezoneH + safezoneY;
			w = 0.366667 * safezoneW;
			h = 0.07697 * safezoneH;
		};
	};
	
	class controls {
		class RscText_1000: Life_RscText
		{
			idc = 7002;
			sizeEx = 0.030;
			text = "SETZ ITEM"; //--- ToDo: Localize;
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.456017 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class RscText_1001: Life_RscText
		{
			idc = 7003;
			sizeEx = 0.030;
			text = "NEUER PREIS"; //--- ToDo: Localize;
			x = 0.557292 * safezoneW + safezoneX;
			y = 0.456017 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 7004;
			text = "";
			sizeEx = 0.030;
			x = 0.383126 * safezoneW + safezoneX;
			y = 0.458216 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscEdit_1401: Life_RscEdit
		{
			idc = 7005;
			text = "";
			sizeEx = 0.030;
			x = 0.611156 * safezoneW + safezoneX;
			y = 0.458216 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscButton_1600: Life_RscButtonMenu
		{
			idc = 7006;
			colorBackground[] = {0,0.59,0.04,1};
			text = "SENDE REQUEST ZUM SERVER"; //--- ToDo: Localize;
			onButtonClick = "[] spawn {[] call life_fnc_ForcePrice;};";
			x = 0.43698 * safezoneW + safezoneX;
			y = 0.489004 * safezoneH + safezoneY;
			w = 0.246354 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class RscButton_1601: Life_RscButtonMenu
		{
			idc = 7007;
			colorBackground[] = {0.69,0.14,0,1};
			text = "ABRECHEN"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.489004 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		
		class ButtonClose: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";

			idc = -1;
			text = "";
			x = 0.315559 * safezoneW + safezoneX;
			y = 0.725973 * safezoneH + safezoneY;
			w = 0.0124433 * safezoneW;
			h = 0.0159973 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};

		class ButtonColorEffects: Life_PictureButtonMenu
		{
			onButtonClick = "[] call life_fnc_colorEffects";

			idc = -1;
			text = "";
			x = 0.487559 * safezoneW + safezoneX;
			y = 0.725973 * safezoneH + safezoneY;
			w = 0.0124433 * safezoneW;
			h = 0.0159973 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonSettings: Life_PictureButtonMenu
		{
			onButtonClick = "[] call life_fnc_settingsMenu;";

			idc = -1;
			text = "";
			x = 0.36358 * safezoneW + safezoneX;
			y = 0.725973 * safezoneH + safezoneY;
			w = 0.0124433 * safezoneW;
			h = 0.0159973 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
	};
};