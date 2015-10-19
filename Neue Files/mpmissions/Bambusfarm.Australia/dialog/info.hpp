class life_info
{
	idd = 621000;
	name = "life_info";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[0] spawn life_fnc_info;";

	class controlsBackground
	{
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
		class Title : life_RscTitle
		{
			idc = 621001;

			text = "Infos/Tutorial";
			x = 0.316053 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx =  0.035;
		};
	};
	class controls
	{
		class InfoText: life_RscStructuredText
		{
			idc = 621002;
			text = "";
			x = 0.427824 * safezoneW + safezoneX;
			y = 0.346019 * safezoneH + safezoneY;
			w = 0.257773 * safezoneW;
			h = 0.354952 * safezoneH;
			//sizeEx =  0.015;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			colorBackground[] = {0,0,0,0.4};
		};
		
		class InfoList: life_RscListBox
		{
			idc = 621003;
			onLBSelChanged = "[1] call life_fnc_info;";

			x = 0.319559 * safezoneW + safezoneX;
			y = 0.346019 * safezoneH + safezoneY;
			w = 0.0979538 * safezoneW;
			h = 0.354952 * safezoneH;
			sizeEx =  0.035;
			//colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.4};
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