class life_extended_admin_menu {
	idd = 2900;
	name= "life_extended_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu_Extended;";

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
		
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "Erweiterte Admintools"; //--- ToDo: Localize;
			x = 0.316053 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		
		class RscText_Event: Life_RscTitle
		{
			idc = -1;

			text = "Event"; //--- ToDo: Localize;
			x = 0.582075 * safezoneW + safezoneX;
			y = 0.33964 * safezoneH + safezoneY;
			w = 0.0834195 * safezoneW;
			h = 0.0209904 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0,0,0,0.7};
		};
		
		class RscText_Admin: Life_RscTitle
		{
			idc = -1;

			text = "Admin"; //--- ToDo: Localize;
			x = 0.583519 * safezoneW + safezoneX;
			y = 0.446107 * safezoneH + safezoneY;
			w = 0.0834195 * safezoneW;
			h = 0.0189765 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0,0,0,0.7};
		};
		
		class AdminBackground: Life_RscText
		{
			idc = -1;

			x = 0.577641 * safezoneW + safezoneX;
			y = 0.336907 * safezoneH + safezoneY;
			w = 0.0922869 * safezoneW;
			h = 0.373487 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class PlayerInfoBackground: Life_RscText
		{
			idc = -1;

			x = 0.408781 * safezoneW + safezoneX;
			y = 0.335486 * safezoneH + safezoneY;
			w = 0.16637 * safezoneW;
			h = 0.373489 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class PlayerListBackground: Life_RscText
		{
			idc = -1;

			x = 0.315172 * safezoneW + safezoneX;
			y = 0.335408 * safezoneH + safezoneY;
			w = 0.0906394 * safezoneW;
			h = 0.373489 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls 
	{
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
		
		class player_playerList: Life_RscListBox
		{
			idc = 1500;
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery";

			x = 0.319559 * safezoneW + safezoneX;
			y = 0.344005 * safezoneH + safezoneY;
			w = 0.0819306 * safezoneW;
			h = 0.334605 * safezoneH;
			sizeEx = 0.035;
		};
		
		class PlayerBInfo: Life_RscStructuredText
		{
			idc = 1004;

			text = "Player Info"; //--- ToDo: Localize;
			x = 0.413574 * safezoneW + safezoneX;
			y = 0.342685 * safezoneH + safezoneY;
			w = 0.156593 * safezoneW;
			h = 0.357146 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 0.035;
		};
		
		class player_b_EventStart: Life_RscButtonMenu
		{
			onButtonClick = "[[0],""life_fnc_adminEvent"",true,false] spawn life_fnc_MP;";

			idc = 1018;
			text = "EventStart"; //--- ToDo: Localize;
			x = 0.581869 * safezoneW + safezoneX;
			y = 0.363177 * safezoneH + safezoneY;
			w = 0.0412437 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Event Start einleitung"; //--- ToDo: Localize;
		};
		
		class player_b_EventEnd: Life_RscButtonMenu
		{
			onButtonClick = "[[1],""life_fnc_adminEvent"",true,false] spawn life_fnc_MP;";

			idc = 1019;
			text = "EventEnd"; //--- ToDo: Localize;
			x = 0.624968 * safezoneW + safezoneX;
			y = 0.363177 * safezoneH + safezoneY;
			w = 0.0412437 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Event beenden einleitung"; //--- ToDo: Localize;
		};
		
		class player_b_AirDrop: Life_RscButtonMenu
		{
			onButtonClick = "[[2],""life_fnc_adminEvent"",true,false] spawn life_fnc_MP;";

			idc = 1020;
			text = "AirDrop"; //--- ToDo: Localize;
			x = 0.581869 * safezoneW + safezoneX;
			y = 0.388454 * safezoneH + safezoneY;
			w = 0.0412437 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Die Position des AirDrops per Mapklick auswaehlen!"; //--- ToDo: Localize;
		};
		
		class player_adminID: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_admingetID;";

			idc = -1;
			text = "Spieler ID"; //--- ToDo: Localize;
			x = 0.319559 * safezoneW + safezoneX;
			y = 0.683956 * safezoneH + safezoneY;
			w = 0.0819306 * safezoneW;
			h = 0.0199834 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class player_b_freeze: Life_RscButtonMenu
		{
			idc = 2410;
			onButtonClick = "[] call life_fnc_adminFreeze;";

			text = "Freeze"; //--- ToDo: Localize;
			x = 0.580941 * safezoneW + safezoneX;
			y = 0.679938 * safezoneH + safezoneY;
			w = 0.0412437 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Einfrieren"; //--- ToDo: Localize;
		};
		
		class player_b_funBreak: Life_RscButtonMenu
		{
			idc = 2411;
			onButtonClick = "[] spawn life_fnc_adminFunBreakPlayer;";

			text = "FunBreak"; //--- ToDo: Localize;
			x = 0.625278 * safezoneW + safezoneX;
			y = 0.679938 * safezoneH + safezoneY;
			w = 0.0412437 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			tooltip = "laesst den Pc/Arma des anderen Abstuerzen!"; //--- ToDo: Localize;
		};
		
		class esp_b_restrain: Life_RscButtonMenu
		{
			idc = 2425;
			onButtonClick = "[] spawn life_fnc_adminMarkers;";

			text = "ESP"; //--- ToDo: Localize;
			x = 0.624453 * safezoneW + safezoneX;
			y = 0.656181 * safezoneH + safezoneY;
			w = 0.0412437 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Map marker"; //--- ToDo: Localize;
		};
		
		class rebuild_b_unrestrain: Life_RscButtonMenu
		{
			idc = 2426;
			onButtonClick = "[] spawn life_fnc_adminRepairBuild;";

			text = "ReBuild"; //--- ToDo: Localize;
			x = 0.580941 * safezoneW + safezoneX;
			y = 0.656181 * safezoneH + safezoneY;
			w = 0.0412437 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Gebaeude reparieren 500m"; //--- ToDo: Localize;
		};
		
		class tool_b_health: RscButtonMenu
		{
			idc = 2414;
			onButtonClick = "[true,false,false,false] spawn life_fnc_adminInstaHealth;";

			text = "100 Health"; //--- ToDo: Localize;
			x = 0.59076 * safezoneW + safezoneX;
			y = 0.468785 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class tool_b_water: RscButtonMenu
		{
			idc = 2415;
			onButtonClick = "[false,false,true,false] spawn life_fnc_adminInstaHealth;";

			text = "100 Water"; //--- ToDo: Localize;
			x = 0.59076 * safezoneW + safezoneX;
			y = 0.493493 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class tool_b_food: RscButtonMenu
		{
			idc = 2416;
			onButtonClick = "[false,true,false,false] spawn life_fnc_adminInstaHealth;";

			text = "100 Food"; //--- ToDo: Localize;
			x = 0.59076 * safezoneW + safezoneX;
			y = 0.518356 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class RscButtonMenu_2405: RscButtonMenu
		{
			idc = 2416;
			onButtonClick = "[false,false,false,true] spawn life_fnc_adminInstaHealth;";

			text = "100 Battery"; //--- ToDo: Localize;
			x = 0.59076 * safezoneW + safezoneX;
			y = 0.544808 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class tool_b_marketreset: RscButtonMenu
		{
			onButtonClick = "createDialog ""life_dynmarket_changeprice"";";

			idc = 2403;
			text = "Marktpreise Reset"; //--- ToDo: Localize;
			x = 0.59076 * safezoneW + safezoneX;
			y = 0.600923 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class tool_b_debug_console: RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_adminDebugCon;";

			idc = 2404;
			text = "DebugConsole"; //--- ToDo: Localize;
			x = 0.59076 * safezoneW + safezoneX;
			y = 0.577378 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class tool_b_gangLicense: RscButtonMenu
		{
			onButtonClick = "[0] spawn life_fnc_gangLicense;";

			idc = -1;
			text = "GangLizenz"; //--- ToDo: Localize;
			x = 0.59076 * safezoneW + safezoneX;
			y = 0.624468 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
};