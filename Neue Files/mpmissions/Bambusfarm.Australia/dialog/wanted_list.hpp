class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_wantedadd2;";
	
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
		
		class WantedConnection: Life_RscTitle
		{
			idc = 2404;

			x = 0.586099 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "Fahndungsliste"; //--- ToDo: Localize;
			x = 0.316053 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		
		class Background: Life_RscText
		{
			idc = -1;
			
			text = "";
			x = 0.322434 * safezoneW + safezoneX;
			y = 0.335405 * safezoneH + safezoneY;
			w = 0.274939 * safezoneW;
			h = 0.367215 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
	};
	
	class controls {
		class WantedList: Life_RscListBox
		{
			idc = 2401;
			onLBSelChanged = "[] spawn life_fnc_wantedGrab";

			x = 0.333585 * safezoneW + safezoneX;
			y = 0.369556 * safezoneH + safezoneY;
			w = 0.0824874 * safezoneW;
			h = 0.16498 * safezoneH;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			colorBackground[] = {0,0,0,0.4};
		};
		
		class PlayerList: Life_RscListBox
		{
			idc = 2406;
			onLBSelChanged = "";

			x = 0.425661 * safezoneW + safezoneX;
			y = 0.369996 * safezoneH + safezoneY;
			w = 0.0824874 * safezoneW;
			h = 0.16498 * safezoneH;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			colorBackground[] = {0,0,0,0.4};
		};
		
		class WantedDetails: Life_RscListBox
		{
			idc = 2402;

			x = 0.333585 * safezoneW + safezoneX;
			y = 0.554536 * safezoneH + safezoneY;
			w = 0.244971 * safezoneW;
			h = 0.152353 * safezoneH;
			colorBackground[] = {0,0,0,0};
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
		};
		
		class BountyPrice: Life_RscText
		{
			idc = 2403;

			x = 0.333585 * safezoneW + safezoneX;
			y = 0.534536 * safezoneH + safezoneY;
			w = 0.254939 * safezoneW;
			h = 0.0189756 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class WantedAddL: Life_RscCombo
		{
			idc = 2407;

			x = 0.523406 * safezoneW + safezoneX;
			y = 0.384514 * safezoneH + safezoneY;
			w = 0.0634519 * safezoneW;
			h = 0.016498 * safezoneH;
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
		
		class PardonButtonKey: Life_RscButtonMenu
		{
			idc = 2405;
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";

			text = "Erlassen"; //--- ToDo: Localize;
			x = 0.605275 * safezoneW + safezoneX;
			y = 0.401232 * safezoneH + safezoneY;
			w = 0.0644433 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class ButtonWantedAdd: Life_RscButtonMenu
		{
			idc = 9800;
			onButtonClick = "[] call life_fnc_wantedAddP;";

			text = "Add"; //--- ToDo: Localize;
			x = 0.604862 * safezoneW + safezoneX;
			y = 0.444567 * safezoneH + safezoneY;
			w = 0.0644433 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class wantedText: Life_RscText
		{
			idc = 1000;

			text = "$STR_Wanted_People";
			x = 0.331316 * safezoneW + safezoneX;
			y = 0.340418 * safezoneH + safezoneY;
			w = 0.085158 * safezoneW;
			h = 0.0189756 * safezoneH;
		};
		
		class citizensText: Life_RscText
		{
			idc = 1001;

			text = "$STR_Wanted_Citizens";
			x = 0.426074 * safezoneW + safezoneX;
			y = 0.340418 * safezoneH + safezoneY;
			w = 0.0782146 * safezoneW;
			h = 0.0199824 * safezoneH;
		};
		
		class crimesText: Life_RscText
		{
			idc = 1002;

			text = "$STR_Wanted_Crimes";
			x = 0.522684 * safezoneW + safezoneX;
			y = 0.340418 * safezoneH + safezoneY;
			w = 0.0634519 * safezoneW;
			h = 0.016498 * safezoneH;
		};
	};
}; 

class life_wanted_menu_show {
	idd = 2400;
	name= "life_wanted_menu_show";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_wantedadd2;";
	
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
		
		class WantedConnection: Life_RscTitle
		{
			idc = 2404;

			x = 0.586099 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "Fahndungsliste"; //--- ToDo: Localize;
			x = 0.316053 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
			
		class Background: Life_RscText
		{
			idc = -1;
			
			text = "";
			x = 0.322434 * safezoneW + safezoneX;
			y = 0.335405 * safezoneH + safezoneY;
			w = 0.274939 * safezoneW;
			h = 0.367215 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
	};
	
	class controls {
		class WantedList: Life_RscListBox
		{
			idc = 2401;
			onLBSelChanged = "[] spawn life_fnc_wantedGrab";

			x = 0.333585 * safezoneW + safezoneX;
			y = 0.369556 * safezoneH + safezoneY;
			w = 0.0824874 * safezoneW;
			h = 0.16498 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
		};
		
		/*class PlayerList: Life_RscListBox
		{
			idc = 2406;
			onLBSelChanged = "";

			x = 0.425661 * safezoneW + safezoneX;
			y = 0.369996 * safezoneH + safezoneY;
			w = 0.0824874 * safezoneW;
			h = 0.16498 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};*/
		
		class WantedDetails: Life_RscListBox
		{
			idc = 2402;

			x = 0.333585 * safezoneW + safezoneX;
			y = 0.554536 * safezoneH + safezoneY;
			w = 0.244971 * safezoneW;
			h = 0.152353 * safezoneH;
			colorBackground[] = {0,0,0,0};
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
		};
		
		class BountyPrice: Life_RscText
		{
			idc = 2403;

			x = 0.333585 * safezoneW + safezoneX;
			y = 0.534536 * safezoneH + safezoneY;
			w = 0.254939 * safezoneW;
			h = 0.0189756 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		/*class WantedAddL: Life_RscCombo
		{
			idc = 2407;

			x = 0.523406 * safezoneW + safezoneX;
			y = 0.384514 * safezoneH + safezoneY;
			w = 0.0634519 * safezoneW;
			h = 0.016498 * safezoneH;
		};*/
		
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
		
		/*class PardonButtonKey: Life_RscButtonMenu
		{
			idc = 2405;
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";

			text = "Erlassen"; //--- ToDo: Localize;
			x = 0.605275 * safezoneW + safezoneX;
			y = 0.401232 * safezoneH + safezoneY;
			w = 0.0644433 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class ButtonWantedAdd: Life_RscButtonMenu
		{
			idc = 9800;
			onButtonClick = "[] call life_fnc_wantedAddP;";

			text = "Add"; //--- ToDo: Localize;
			x = 0.604862 * safezoneW + safezoneX;
			y = 0.444567 * safezoneH + safezoneY;
			w = 0.0644433 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};*/
		
		class wantedText: Life_RscText
		{
			idc = 1000;

			text = "$STR_Wanted_People";
			x = 0.331316 * safezoneW + safezoneX;
			y = 0.340418 * safezoneH + safezoneY;
			w = 0.085158 * safezoneW;
			h = 0.0189756 * safezoneH;
		};
		
		/*class citizensText: Life_RscText
		{
			idc = 1001;

			text = "$STR_Wanted_Citizens";
			x = 0.426074 * safezoneW + safezoneX;
			y = 0.340418 * safezoneH + safezoneY;
			w = 0.0782146 * safezoneW;
			h = 0.0199824 * safezoneH;
		};
		
		class crimesText: Life_RscText
		{
			idc = 1002;

			text = "$STR_Wanted_Crimes";
			x = 0.522684 * safezoneW + safezoneX;
			y = 0.340418 * safezoneH + safezoneY;
			w = 0.0634519 * safezoneW;
			h = 0.016498 * safezoneH;
		};*/
	};
}; 