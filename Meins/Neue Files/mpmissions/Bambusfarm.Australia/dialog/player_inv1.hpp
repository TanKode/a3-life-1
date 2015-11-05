#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;

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
			colorBackground[] = {0,0,0,0};
		};
		
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "$STR_PM_Title";
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class moneyStatusInfo: Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.599604 * safezoneW + safezoneX;
			y = 0.378082 * safezoneH + safezoneY;
			w = 0.0862262 * safezoneW;
			h = 0.122999 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class PlayersName: Title
		{
			idc = carry_weight;
			style = 1;
			text = "";
			sizeEx = 0.03;
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {-1, -1, -1, -1};
		};
		
		class ButtonSyncData : life_RscPicture {
			idc = -1;
			text = "textures\tablet\speichern.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.333478 * safezoneW + safezoneX;
			y = 0.353885 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonCallTaxi : life_RscPicture {
			idc = -1;
			text = "textures\tablet\CallTaxi.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.353665 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonTaxiMenu : life_RscPicture {
			idc = 60001;
			text = "textures\tablet\TaxiMenu.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.404005 * safezoneW + safezoneX;
			y = 0.456613 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonHandy : life_RscPicture {
			idc = -1;
			text = "textures\tablet\handy.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.404005 * safezoneW + safezoneX;
			y = 0.353665 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonMarkt : life_RscPicture {
			idc = -1;
			text = "textures\tablet\markt.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.438856 * safezoneW + safezoneX;
			y = 0.353665 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonKey : life_RscPicture {
			idc = -1;
			text = "textures\tablet\key.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.333478 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonGang : life_RscPicture {
			idc = 60002;
			text = "textures\tablet\gang.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonAdmin : life_RscPicture {
			idc = 60003;
			text = "textures\tablet\admin.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.609986 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonCrafting : life_RscPicture {
			idc = 60004;
			text = "textures\tablet\Crafting.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.404005 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonCraftClothing : life_RscPicture {
			idc = 60005;
			text = "textures\tablet\Schneiderei.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.438856 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonSaveData : life_RscPicture {
			idc = 60006;
			text = "textures\tablet\speichern.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.404005 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonWandet : life_RscPicture {
			idc = 60007;
			text = "textures\tablet\wanted.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonContract : life_RscPicture {
			idc = 60008;
			text = "textures\tablet\contract.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonGov : life_RscPicture {
			idc = 600010;
			text = "textures\tablet\goverment.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.333478 * safezoneW + safezoneX;
			y = 0.456613 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonPaintball : life_RscPicture {
			idc = 60011;
			text = "textures\tablet\paintball.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.456613 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonInfo : life_RscPicture {
			idc = 60012;
			text = "textures\tablet\help.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.333478 * safezoneW + safezoneX;
			y = 0.609986 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
		
		class ButtonSkill : life_RscPicture {
			idc = 60009;
			text = "textures\tablet\skill.paa";
			colorBackground[] = {1,0,0,0};
			x = 0.333478 * safezoneW + safezoneX;
			y = 0.506327 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
		};
	};
	
	class controls {
		
		class itemHeader: Life_RscButtonMenu
		{
			idc = -1;
			
			text = "$STR_PM_cItems";
			sizeEx = 0.04;
			x = 0.572383 * safezoneW + safezoneX;
			y = 0.609986 * safezoneH + safezoneY;
			w = 0.112886 * safezoneW;
			h = 0.0219973 * safezoneH;
			onButtonClick = "createDialog ""Life_items_show"";";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			colorBackground[] = {0,0,0,0.3};
			class Attributes
			{
				align = "center";
			};
		};
		
		class licenseHeader: Life_RscText
		{
			idc = -1;

			text = "$STR_PM_Licenses";
			sizeEx = 0.04;
			x = 0.481028 * safezoneW + safezoneX;
			y = 0.351026 * safezoneH + safezoneY;
			w = 0.112886 * safezoneW;
			h = 0.0220747 * safezoneH;
			colorBackground[] = {-1, -1, -1, -1};
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		
		class moneySHeader: Life_RscText
		{
			idc = -1;

			text = "$STR_PM_MoneyStats";
			sizeEx = 0.04;
			x = 0.597954 * safezoneW + safezoneX;
			y = 0.351026 * safezoneH + safezoneY;
			w = 0.0903238 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {-1, -1, -1, -1};
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		
		/*class itemList: Life_RscListBox
		{
			idc = item_list;
			sizeEx = 0.030;
			
			x = 0.57496 * safezoneW + safezoneX;
			y = 0.556093 * safezoneH + safezoneY;
			w = 0.109147 * safezoneW;
			h = 0.163973 * safezoneH;
		};*/
		
		class moneyEdit: Life_RscEdit
		{
			idc = 2018;

			text = "1"; //--- ToDo: Localize;
			x = 0.600635 * safezoneW + safezoneX;
			y = 0.512046 * safezoneH + safezoneY;
			w = 0.0843866 * safezoneW;
			h = 0.016498 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		
		class NearPlayers: Life_RscCombo
		{
			idc = 2022;

			x = 0.627031 * safezoneW + safezoneX;
			y = 0.55714 * safezoneH + safezoneY;
			w = 0.0583124 * safezoneW;
			h = 0.0140194 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		
		class moneyDrop: Life_RscButtonMenu
		{
			idc = 2001;
			onButtonClick = "[] call life_fnc_giveMoney";

			text = "$STR_Global_Give";
			sizeEx = 0.025;
			x = 0.572177 * safezoneW + safezoneX;
			y = 0.554061 * safezoneH + safezoneY;
			w = 0.0515547 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		
		class ButtonClose: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0;";

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
		
		class ButtonMyGang: Life_PictureButtonMenu
		{
			idc = 2011;
			onButtonClick = "closeDialog 0; createDialog ""Life_gang_auswahl""";

			tooltip = "$STR_PM_MyGang";
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ADACAuftraege: Life_PictureButtonMenu
		{
			idc = 2013;
			onButtonClick = "[] call life_fnc_aufBuchMenu;";

			tooltip = "Auftragsbuch"; //--- ToDo: Localize;
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class Licenses_Menu: Life_RscControlsGroup
		{
			idc = -1;
			x = 0.482884 * safezoneW + safezoneX;
			y = 0.380062 * safezoneH + safezoneY;
			w = 0.108539 * safezoneW;
			h = 0.165676 * safezoneH;
			
			class Controls
			{
				class Life_Licenses : Life_rscStructuredText
				{
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.25; h = 0.80;
					colorBackground[] = {0,0,0,0.4};
				};
			};
		};
		
		class ButtonWandetList: Life_PictureButtonMenu
		{
			idc = 2012;
			onButtonClick = "[] spawn life_fnc_wantedMenu";

			tooltip = "$STR_PM_WantedList";
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonKeys: Life_PictureButtonMenu
		{
			idc = 2013;
			onButtonClick = "createDialog ""Life_key_management"";";

			tooltip = "$STR_PM_KeyChain";
			x = 0.333478 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonCell: Life_PictureButtonMenu
		{
			idc = 2014;
			onButtonClick = "[] call life_fnc_callCellPhone";

			tooltip = "$STR_PM_CellPhone";
			x = 0.404005 * safezoneW + safezoneX;
			y = 0.353665 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonAdminMenu: Life_PictureButtonMenu
		{
			idc = 2021;
			onButtonClick = "createDialog ""life_extended_admin_menu"";";

			tooltip = "$STR_PM_AdminMenu";
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.609986 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonSyncData: Life_PictureButtonMenu
		{
			onButtonClick = "[] call SOCK_fnc_syncData;";
			idc = -1;

			tooltip = "$STR_PM_SyncData";
			x = 0.333478 * safezoneW + safezoneX;
			y = 0.353885 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonSaveGear: Life_PictureButtonMenu
		{
			idc = 9900;
			onButtonClick = "[] call SOCK_fnc_syncGear;";

			tooltip = "Save Gear"; //--- ToDo: Localize;
			x = 0.404005 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonMarket: Life_PictureButtonMenu
		{
			onButtonClick = "createDialog ""life_dynmarket_prices"";";
			idc = 1028;

			tooltip = "Markt"; //--- ToDo: Localize;
			x = 0.438856 * safezoneW + safezoneX;
			y = 0.353665 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonCraft: Life_PictureButtonMenu
		{
			idc = 2025;
			onButtonClick = "[] spawn life_fnc_craft;";

			tooltip = "$STR_PM_Craft";
			x = 0.404005 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonCraftClothing: Life_PictureButtonMenu
		{
			idc = 2026;
			onButtonClick = "[] spawn life_fnc_craftClothing;";

			tooltip = "$STR_PM_CraftClothing";
			x = 0.438856 * safezoneW + safezoneX;
			y = 0.406899 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonTaxiMenu: Life_PictureButtonMenu
		{
			idc = 2027;
			onButtonClick = "if (license_civ_taxi AND life_isOnDutyTaxi) then { [] spawn life_fnc_openTaxiMenu; } else { hint ""Sie sind kein Taxifahrer oder nicht im Dienst!""; };";

			tooltip = "TAXIMENU"; //--- ToDo: Localize;
			x = 0.404005 * safezoneW + safezoneX;
			y = 0.456613 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonCallTaxi: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0;[] call life_fnc_taxi_call;";
			idc = 2028;

			tooltip = "CALL TAXI"; //--- ToDo: Localize;
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.353665 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonGov: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0;[0,0] spawn life_fnc_openLawDialog;";
			idc = -1;

			tooltip = "Goverment Menu"; //--- ToDo: Localize;
			x = 0.333478 * safezoneW + safezoneX;
			y = 0.456613 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonPaintball: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0; createDialog ""life_paintball_mode"";";
			//onLBDblClick = "if(getVariable[""paintballstats"",false]) then {[] call life_fnc_pb_response}";
			idc = 2029;

			tooltip = "Join Paintball"; //--- ToDo: Localize;
			x = 0.368948 * safezoneW + safezoneX;
			y = 0.456613 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonInfo: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0; createDialog ""life_info"";";
			//onButtonClick = "[0] spawn life_fnc_info;";
			idc = -1;

			tooltip = "Hilfe"; //--- ToDo: Localize;
			x = 0.333478 * safezoneW + safezoneX;
			y = 0.609986 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class ButtonSkill: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0; createDialog ""life_skillMenu"";";
			//onButtonClick = "[0] spawn life_fnc_info;";
			idc = 2030;

			tooltip = "Talentbaum"; //--- ToDo: Localize;
			x = 0.333478 * safezoneW + safezoneX;
			y = 0.506327 * safezoneH + safezoneY;
			w = 0.0309328 * safezoneW;
			h = 0.0439946 * safezoneH;
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