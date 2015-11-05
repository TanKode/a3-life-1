#include "player_sys.sqf"

class Life_items_show {
	idd = 3955;
	name= "life_items_show";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_itemsShow;";
	
	class controlsBackground {
		class life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0.336976 * safezoneW + safezoneX;
			y = 0.251138 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class MainBackground: life_RscPicture
		{
			idc = -1;

			text = "textures\tablet\tablet.paa"; //--- ToDo: Localize;
			x = 0.271186 * safezoneW + safezoneX;
			y = 0.224646 * safezoneH + safezoneY;
			w = 0.461136 * safezoneW;
			h = 0.571078 * safezoneH;
			colorBackground[] = {-1, -1, -1, -1};
		};
		
		class PlayersName: life_RscTitle
		{
			idc = 2009;
			style = 1;
			sizeEx = 0.03;
			text = "";
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {-1, -1, -1, -1};
		};
	};
	
	class controls {

		class itemHeader : Life_RscText
		{
			idc = -1;
			//colorBackground[] = {0,0,0,0.};
			text = "$STR_PM_cItems";
			sizeEx = 0.04;
			
			x = 0.322652 * safezoneW + safezoneX;
			y = 0.362517 * safezoneH + safezoneY;
			w = 0.164975 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
		
		class itemList : life_RscListBox 
		{
			idc = item_list;
			sizeEx = 0.030;
			colorBackground[] = {0,0,0,0.3};
			
			x = 0.322652 * safezoneW + safezoneX;
			y = 0.390014 * safezoneH + safezoneY;
			w = 0.164975 * safezoneW;
			h = 0.247469 * safezoneH;
		};
		
		class itemEdit : Life_RscEdit {
		
		idc = item_edit;
		
			text = "1";
			sizeEx = 0.030;
			x = 0.322652 * safezoneW + safezoneX;
			y = 0.642982 * safezoneH + safezoneY;
			w = 0.0783631 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		
		};
		
		class iNearPlayers : Life_RscCombo
		{
			idc = 2023;
			x = 0.409264 * safezoneW + safezoneX;
			y = 0.642982 * safezoneH + safezoneY;
			w = 0.0783631 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class DropButton : life_RscButtonMenu {
			
			idc = -1;
			text = "$STR_Global_Give";
			colorBackground[] = {0,0,0,0.3};
			onButtonClick = "[] call life_fnc_giveItem; [] spawn life_fnc_itemsShow;";
			
			x = 0.495876 * safezoneW + safezoneX;
			y = 0.390014 * safezoneH + safezoneY;
			w = 0.0541324 * safezoneW;
			h = 0.0219973 * safezoneH;
			
		};
		
		class UseButton : life_RscButtonMenu {
			
			idc = -1;
			text = "$STR_Global_Use";
			colorBackground[] = {0,0,0,0.3};
			onButtonClick = "[] call life_fnc_useItem; [] spawn life_fnc_itemsShow;";
			
			x = 0.495876 * safezoneW + safezoneX;
			y = 0.41751 * safezoneH + safezoneY;
			w = 0.0541324 * safezoneW;
			h = 0.0219973 * safezoneH;
			
		};
		
		class RemoveButton : life_RscButtonMenu {
			
			idc = -1;
			text = "$STR_Global_Remove";
			colorBackground[] = {0,0,0,0.3};
			onButtonClick = "[] call life_fnc_removeItem; [] spawn life_fnc_itemsShow;";
			
			x = 0.495876 * safezoneW + safezoneX;
			y = 0.445007 * safezoneH + safezoneY;
			w = 0.0541324 * safezoneW;
			h = 0.0219973 * safezoneH;
			
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