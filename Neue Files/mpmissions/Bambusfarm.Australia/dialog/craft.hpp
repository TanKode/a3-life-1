/*
	File: craft.hpp
	Description: Crafting System
	Created by EdgeKiller
*/

class Life_craft {
	idd = 666;
	name= "life_craft";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_craftWeapon";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

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
		
		class craftListBackground : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.3};
			x = 0.105;
			y = 0.31;
			w = 0.275; h = 0.48;
		};
		
		class materialListBackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.3};
			idc = -1;
			w = 0.275;
			h = 0.48;
			x = 0.395;
			y = 0.31;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 667;
			text = "$STR_CRAFT_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
	};

	class controls {
		class craftListHeader : Life_RscText
		{
			idc = 668;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftStats";
			sizeEx = 0.04;
			x = 0.105; y = 0.26;
			w = 0.275; h = 0.04;
		};

		class craftList : life_RscListBox
		{
			idc = 669;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn life_fnc_craft_update";
			x = 0.105;
			y = 0.31;
			w = 0.275; h = 0.48;
		};

		class materialListHeader : Life_RscText
		{
			idc = 670;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftMaterials";
			sizeEx = 0.04;
			x = 0.395; y = 0.26;
			w = 0.275; h = 0.04;
		};

		class materialList : Life_RscControlsGroup
		{
			idc = 671;
			w = 0.275;
			h = 0.48;
			x = 0.395;
			y = 0.30;


			class Controls
			{
				class mats : Life_RscStructuredText
				{
					idc = 672;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; h = 0.60;
				};
			};
		};

		class ButtonCraft : Life_RscButtonMenu {
			idc = 672;
			text = "$STR_CRAFT_Button";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "if(!life_is_processing) then {[] spawn life_fnc_craftAction};";
			x = 0.69;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ColorAuswahl: life_RscCombo
		{
			idc = 673;
			//colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call life_fnc_craftFilter";
			x = 0.69;
			y = 0.35;
			w = (6.25 / 40);
			h = (1 / 25);
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

/*
	File: craft.hpp
	Description: Crafting System
	Created by EdgeKiller
*/

class Life_craft_clothing {
	idd = 766;
	name= "life_craft_clothing";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_craftWeapon";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

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
		
		class craftListBackground : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.3};
			x = 0.105;
			y = 0.31;
			w = 0.275; h = 0.48;
		};
		
		class materialListBackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.3};
			idc = -1;
			w = 0.275;
			h = 0.48;
			x = 0.395;
			y = 0.31;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 767;
			text = "$STR_CRAFT_Title";
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
	};

	class controls {
		class craftListHeader1 : Life_RscText
		{
			idc = 768;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftStats";
			sizeEx = 0.04;
			x = 0.105; y = 0.26;
			w = 0.275; h = 0.04;
		};

		class craftList1 : life_RscListBox
		{
			idc = 769;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn life_fnc_craft_updateClothing";
			x = 0.105;
			y = 0.31;
			w = 0.275; h = 0.48;
		};

		class materialListHeader1 : Life_RscText
		{
			idc = 770;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftMaterials";
			sizeEx = 0.04;
			x = 0.395; y = 0.26;
			w = 0.275; h = 0.04;
		};

		class materialList1 : Life_RscControlsGroup
		{
			idc = 771;
			w = 0.275;
			h = 0.48;
			x = 0.395;
			y = 0.30;


			class Controls
			{
				class mats1 : Life_RscStructuredText
				{
					idc = 772;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; h = 0.60;
				};
			};
		};

		class ButtonCraft1 : Life_RscButtonMenu {
			idc = 772;
			text = "$STR_CRAFT_Button";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "if(!life_is_processing) then {[] spawn life_fnc_craftActionClothing};";
			x = 0.69;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ColorAuswahl1: life_RscCombo
		{
			idc = 773;
			//colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call life_fnc_craftFilterClothing";
			x = 0.69;
			y = 0.35;
			w = (6.25 / 40);
			h = (1 / 25);
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