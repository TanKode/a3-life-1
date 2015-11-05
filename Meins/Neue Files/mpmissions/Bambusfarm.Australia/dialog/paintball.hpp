class life_paintball {
	idd = 450000;
	name = "life_paintball";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0] spawn life_fnc_paintballDialog;";
	
	class controlsBackground {
		class MainBackground: life_RscPicture
		{
			idc = -1;

			text = "textures\tablet\tablet.paa"; //--- ToDo: Localize;
			x = 0.271186 * safezoneW + safezoneX;
			y = 0.224646 * safezoneH + safezoneY;
			w = 0.461136 * safezoneW;
			h = 0.571078 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class life_adacTitelAuftrag: Life_RscText
		{
			idc = -1;
			text = "Paintball"; //--- ToDo: Localize;
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0};
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class TimeTitel: Life_RscText
		{
			idc = -1;
			text = "Spielzeit: max 30min"; //--- ToDo: Localize;
			x = 0.520622 * safezoneW + safezoneX;
			y = 0.445007 * safezoneH + safezoneY;
			w = 0.108265 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			class Attributes
			{
				align = "center";
			};
		};
		
		class ModusTitel: Life_RscText
		{
			idc = -1;
			text = "Spielmodus"; //--- ToDo: Localize;
			x = 0.355647 * safezoneW + safezoneX;
			y = 0.379015 * safezoneH + safezoneY;
			w = 0.123731 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			class Attributes
			{
				align = "center";
			};
		};
	};
	
	class controls
	{
		class Modus: Life_RscListbox
		{
			idc = 450001;
			x = 0.355647 * safezoneW + safezoneX;
			y = 0.412011 * safezoneH + safezoneY;
			w = 0.123731 * safezoneW;
			h = 0.252969 * safezoneH;
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0.4};
		};
		
		class TimeEdit: Life_RscEdit
		{
			idc = 450002;
			text = "10"; //--- ToDo: Localize;
			x = 0.520622 * safezoneW + safezoneX;
			y = 0.478003 * safezoneH + safezoneY;
			w = 0.108265 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		
		class Start: Life_RscButtonMenu
		{
			idc = -1;
			text = "Starten"; //--- ToDo: Localize;
			x = 0.551555 * safezoneW + safezoneX;
			y = 0.57699 * safezoneH + safezoneY;
			w = 0.0499524 * safezoneW;
			h = 0.026025 * safezoneH;
			onButtonClick = "[1] spawn life_fnc_paintballDialog;";
			colorBackground[] = {0,0,0,0.4};
		};
		
		class ButtonClose: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";

			idc = -1;
			text = "";
			x = 0.315559 * safezoneW + safezoneX;
			y = 0.699973 * safezoneH + safezoneY;
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
			y = 0.699973 * safezoneH + safezoneY;
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
			y = 0.699973 * safezoneH + safezoneY;
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
