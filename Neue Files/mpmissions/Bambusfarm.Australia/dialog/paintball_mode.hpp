class life_paintball_mode {
	idd = -1;
	name = "life_paintball_mode";
	moveingEnable = false;
	enableSimulation = true;
	
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
		
		class BackgroundTitel: Life_RscText
		{
			idc = -1;

			x = 0.376269 * safezoneW + safezoneX;
			y = 0.379015 * safezoneH + safezoneY;
			w = 0.21653 * safezoneW;
			h = 0.131984 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		
		class Titel: Life_RscStructuredText
		{
			idc = -1;

			text = "Hier koennen Sie ein Paintball Spiel erstellen <br/>oder beitretten!"; //--- ToDo: Localize;
			x = 0.381424 * safezoneW + safezoneX;
			y = 0.390014 * safezoneH + safezoneY;
			w = 0.206219 * safezoneW;
			h = 0.0659918 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};

	class controls
	{
		class Erstellen: Life_RscButtonMenu
		{
			onButtonClick = "if(!life_GameOn) then {closeDialog 0; createDialog ""life_paintball""}else{hintSilent ""Es wurde bereits ein Spiel erstellt"";}";

			idc = 1006;
			text = "Erstellen"; //--- ToDo: Localize;
			x = 0.391735 * safezoneW + safezoneX;
			y = 0.467004 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.4};
		};

		class ButtuonBeitretten: Life_RscButtonMenu
		{
			onButtonClick = "if(life_gameOn) then {[] execVM ""scripts\paintball\pb_join.sqf"";}else{hintSilent ""Es muss zuerst ein Paintball Spiel erstellt werden!""};";

			idc = 1002;
			text = "Beitretten"; //--- ToDo: Localize;
			x = 0.510311 * safezoneW + safezoneX;
			y = 0.467004 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {1,1,1,1};
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