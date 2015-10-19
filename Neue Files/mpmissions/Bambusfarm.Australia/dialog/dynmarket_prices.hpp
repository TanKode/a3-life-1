class life_dynmarket_prices {
	idd = 7100;
	name= "life_dynmarket_prices";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {sleep 1;[] call life_fnc_LoadIntoListbox;};";
	
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
		
		class MarktBackground: Life_RscText
		{
			idc = -1;

			x = 0.31068 * safezoneW + safezoneX;
			y = 0.33568 * safezoneH + safezoneY;
			w = 0.382201 * safezoneW;
			h = 0.290533 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
	};
	
	class controls {
		class MarktList: Life_RscListBox
		{
			idc = 7055;
			onLBSelChanged = "[] spawn {[] call life_fnc_DisplayPrices;};";

			x = 0.316248 * safezoneW + safezoneX;
			y = 0.346019 * safezoneH + safezoneY;
			w = 0.182749 * safezoneW;
			h = 0.267771 * safezoneH;
			sizeEx = 0.0260;
		};
		
		class MarktText1: Life_RscText
		{
			idc = -1;

			text = "Aktueller Verkaufspreis"; //--- ToDo: Localize;
			x = 0.501845 * safezoneW + safezoneX;
			y = 0.346019 * safezoneH + safezoneY;
			w = 0.182749 * safezoneW;
			h = 0.0250122 * safezoneH;
		};
		
		class MarktPrice: Life_RscText
		{
			idc = 7056;

			text = "Bitte waehlen sie ein Item"; //--- ToDo: Localize;
			x = 0.501845 * safezoneW + safezoneX;
			y = 0.380995 * safezoneH + safezoneY;
			w = 0.182749 * safezoneW;
			h = 0.0529648 * safezoneH;
			sizeEx = 0.060;
		};
		
		class MarktText3: Life_RscText
		{
			idc = -1;

			text = "Menge an Items, die Sie verkauft haben!"; //--- ToDo: Localize;
			x = 0.501845 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.182749 * safezoneW;
			h = 0.0240052 * safezoneH;
		};
		
		class ItemAmount: Life_RscText
		{
			idc = 7057;

			text = "2345"; //--- ToDo: Localize;
			x = 0.501845 * safezoneW + safezoneX;
			y = 0.521997 * safezoneH + safezoneY;
			w = 0.182749 * safezoneW;
			h = 0.0539716 * safezoneH;
			sizeEx = 0.060;
		};
		
		class OkayButton: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 1006;

			text = "OKAY"; //--- ToDo: Localize;
			x = 0.501845 * safezoneW + safezoneX;
			y = 0.592169 * safezoneH + safezoneY;
			w = 0.182749 * safezoneW;
			h = 0.0229984 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,1};
			class Attributes
			{
				align = "center";
			};
		};
		
		class MarktTrend: Life_RscStructuredText
		{
			idc = 7058;

			x = 0.501845 * safezoneW + safezoneX;
			y = 0.420167 * safezoneH + safezoneY;
			w = 0.182749 * safezoneW;
			h = 0.050951 * safezoneH;
			colorText[] = {0.33,0.33,0.33,1};
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
