class Life_my_smartphone {
	idd = 88888;
	name = "life_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_smartphone;";

	class controlsBackground {	
		class Life_RscTitleBackground: Life_RscText
		{
			idc = 1000;
			x = 0.316053 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
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

			text = "$STR_SMARTPHONE_TITLE";
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.310235 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class PlayerList: Life_RscTitle
		{
			idc = -1;
			//onLBSelChanged = "[2] spawn life_fnc_smartphone;";

			x = 0.402474 * safezoneW + safezoneX;
			y = 0.361278 * safezoneH + safezoneY;
			w = 0.288706 * safezoneW;
			h = 0.16498 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			//sizeEx = 0.030;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		};
		/*class PlayerListTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0.315641 * safezoneW + safezoneX;
			y = 0.33524 * safezoneH + safezoneY;
			w = 0.0824874 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class MessageTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0.397511 * safezoneW + safezoneX;
			y = 0.33436 * safezoneH + safezoneY;
			w = 0.288706 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class RandomTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0.398645 * safezoneW + safezoneX;
			y = 0.533436 * safezoneH + safezoneY;
			w = 0.288706 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};*/
	};
	
	class controls
	{
		class RandomTitle: Life_RscText
		{
			idc = 88890;

			text = "$STR_SMARTPHONE_RANDOMTITLE";
			x = 0.402474 * safezoneW + safezoneX;
			y = 0.533316 * safezoneH + safezoneY;
			w = 0.288706 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			//sizeEx = 0.04;
		};
		
		class PlayerListTitle: Life_RscText
		{
			idc = 345678;

			text = "$STR_SMARTPHONE_PLAYERLISTTITLE";
			x = 0.310622 * safezoneW + safezoneX;
			y = 0.335271 * safezoneH + safezoneY;
			w = 0.0824874 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			//sizeEx = 0.04;
		};
		
		class MessageTitle: Life_RscText
		{
			idc = 88886;

			x = 0.402474 * safezoneW + safezoneX;
			y = 0.335473 * safezoneH + safezoneY;
			w = 0.288706 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			//sizeEx = 0.04;
		};
		
		class PlayerList: Life_RscListBox
		{
			idc = 88881;
			onLBSelChanged = "[2] spawn life_fnc_smartphone;";

			x = 0.310125 * safezoneW + safezoneX;
			y = 0.361417 * safezoneH + safezoneY;
			w = 0.0824874 * safezoneW;
			h = 0.278966 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			//sizeEx = 0.030;
			sizeEx = 0.035;
		};
		
		class MessageList: Life_RscListNBox
		{
			idc = 88882;
			colorBackground[] = {0,0,0,0.4};
			onLBSelChanged = "[(lbCurSel 88882)] call life_fnc_showMsg;";
			columns[] = {0,0.3};

			x = 0.402474 * safezoneW + safezoneX;
			y = 0.361278 * safezoneH + safezoneY;
			w = 0.288706 * safezoneW;
			h = 0.16498 * safezoneH;
			//sizeEx = 0.030;
			sizeEx = "(     (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		};
		
		class TextShow: Life_RscControlsGroup
		{
			idc = 1009;
			x = 0.402474 * safezoneW + safezoneX;
			y = 0.558493 * safezoneH + safezoneY;
			w = 0.288706 * safezoneW;
			h = 0.0824898 * safezoneH;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : Life_RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0,0,0,0.4};
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.69;//w = 0.7;
					h = 1;//h = 2.15;
				};
			};
		};
		
		class Schreiben: Life_RscButtonMenu
		{
			idc = 887892;
			onButtonClick = "[4] call life_fnc_smartphone;";

			text = "$STR_SMARTPHONE_SCHREIBEN";
			x = 0.320333 * safezoneW + safezoneX;
			y = 0.643862 * safezoneH + safezoneY;
			w = 0.0618656 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
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
		
		class Notruf: Life_RscButtonMenu
		{
			onButtonClick = "createDialog ""Life_smartphone_notruf"";";

			idc = 1014;
			text = "$STR_SMARTPHONE_NOTRUF";
			x = 0.621774 * safezoneW + safezoneX;
			y = 0.643862 * safezoneH + safezoneY;
			w = 0.0644433 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
		};
		
		class loeschen: Life_RscButtonMenu
		{
			onButtonClick = "[3] call life_fnc_smartphone;";

			idc = 1015;
			text = "$STR_SMARTPHONE_Loeschen";
			x = 0.402474 * safezoneW + safezoneX;
			y = 0.642762 * safezoneH + safezoneY;
			w = 0.0618656 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		
		class contract: Life_RscButtonMenu
		{
			onButtonClick = "createDialog ""Life_contract"";";

			idc = 1016;
			text = "$STR_SMARTPHONE_Contract";
			x = 0.490103 * safezoneW + safezoneX;
			y = 0.643862 * safezoneH + safezoneY;
			w = 0.103109 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.223529,0.372549,1};
			class Attributes
			{
				align = "center";
			};
		};
	};
};

class Life_smartphone_schreiben
{
	idd = 88883;
	name = "life_my_smartphone_schreiben";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.186651 * safezoneW + safezoneX;
			y = 0.318082 * safezoneH + safezoneY;
			w = 0.577412 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0};
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
		
		class TextEditTitle: Life_RscTitle
		{
			idc = -1;
			//onLBSelChanged = "[2] spawn life_fnc_smartphone;";

			x = 0.350491 * safezoneW + safezoneX;
			y = 0.409001 * safezoneH + safezoneY;
			w = 0.278395 * safezoneW;
			h = 0.131984 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			//sizeEx = 0.030;
			//size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		};
		
	};
	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "$STR_SMARTPHONE_NACHRICHTTITLE";
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			//colorBackground[] = {0,0,0,0};
		};
		
		class Absenden : Life_RscButtonMenu {
			idc = 88885;
			text = "$STR_SMARTPHONE_ABSENDEN";
			onButtonClick = "[1,-1,(ctrlText 88884)] call life_fnc_newMsg;";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			colorBackground[] = {0,0,0,0.4};
			x = 0.506866 * safezoneW + safezoneX;
			y = 0.551984 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
		
		class AdminMsg : life_RscButtonMenu 
		{
			idc = 888897;
			text = "$STR_CELL_AdminMsg";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			onButtonClick = "[5,-1,(ctrlText 88884)] call life_fnc_newMsg;";
			colorBackground[] = {0,0,0,0.4};
			x = 0.4206866 * safezoneW + safezoneX;
			y = 0.551984 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
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
		
		class textEdit : Life_RscEdit {
			idc = 88884;
			style = 16;
			text = "";
			x = 0.350491 * safezoneW + safezoneX;
			y = 0.409001 * safezoneH + safezoneY;
			w = 0.278395 * safezoneW;
			h = 0.131984 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
	
	};
	
};

class Life_smartphone_notruf {
	idd = 887890;
	name= "life_my_smartphone_notruf";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[6] spawn life_fnc_newMsg;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = "21.2 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
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
		
		class TextEditTitle: Life_RscTitle
		{
			idc = -1;
			//onLBSelChanged = "[2] spawn life_fnc_smartphone;";

			x = 0.335491 * safezoneW + safezoneX;
			y = 0.379001 * safezoneH + safezoneY;
			w = 0.328395 * safezoneW;
			h = 0.181984 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			//sizeEx = 0.030;
			//size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0,0,0,0};
			idc = 888892;
			text = "$STR_SMARTPHONE_Notruftitle";
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textEdit : Life_RscEdit {
		
			idc = 888894;
			style = 16;
			text = "";
			x = 0.335491 * safezoneW + safezoneX;
			y = 0.379001 * safezoneH + safezoneY;
			w = 0.328395 * safezoneW;
			h = 0.181984 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		
		};
		
		class TxtCopButton : life_RscButtonMenu 
		{
			idc = 888895;
			text = "$STR_CELL_TextPolice";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[2,-1,(ctrlText 888894)] call life_fnc_newMsg;";
			
			x = 0.31;
			y = 0.65;
			w = 0.18;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};
		
		class TxtAdminButton : life_RscButtonMenu 
		{
			idc = 888896;
			text = "$STR_CELL_TextAdmins";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[3,-1,(ctrlText 888894)] call life_fnc_newMsg;";
			
			x = 0.70;
			y = 0.65;
			w = 0.18;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};
		
		
		class AdminMsgAll : life_RscButtonMenu 
		{
			idc = 888898;
			text = "$STR_CELL_AdminMSGAll";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[7,-1,(ctrlText 888894)] call life_fnc_newMsg;";
			
			x = 0.70;
			y = 0.65;
			w = 0.18;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};
		
		class EMSReq : life_RscButtonMenu
		{
			idc = 888899;
			text = "$STR_CELL_EMSRequest";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[4,-1,(ctrlText 888894)] call life_fnc_newMsg;";
			
			x = 0.115;
			y = 0.65;
			w = 0.18;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};
		
		class ADACReq : life_RscButtonMenu
		{
			idc = 888900;
			text = "$STR_CELL_ADACRequest";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[9,player,(ctrlText 888894),[mapGridPosition player]] call life_fnc_newMsg;";
			
			x = 0.505;
			y = 0.65;
			w = 0.18;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};
		
		class CopMsgAll : life_RscButtonMenu 
		{
			idc = 888901;
			text = "$STR_CELL_CopMSGAll";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[8,-1,(ctrlText 888894)] call life_fnc_newMsg;";
			
			x = 0.31;
			y = 0.65;
			w = 0.18;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
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
		
		class ButtonSettings: Life_RscButtonMenu
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
		
		class ButtonClose: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";

			idc = -1;
			text = "";
			x = 0.315559 * safezoneW + safezoneX;
			y = 0.699973 * safezoneH + safezoneY;
			w = 0.0124433 * safezoneW;
			h = 0.0159973 * safezoneH;
			colorBackground[] = {-1, -1, -1, -1};
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

class life_contract {
	idd = 889999;
	name= "life_contract";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	
	class controlsBackground {
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
		
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;
			text = "Auftrag aufgeben!"; //--- ToDo: Localize;
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class TextEditTitle: Life_RscTitle
		{
			idc = -1;
			//onLBSelChanged = "[2] spawn life_fnc_smartphone;";

			x = 0.350491 * safezoneW + safezoneX;
			y = 0.509001 * safezoneH + safezoneY;
			w = 0.278395 * safezoneW;
			h = 0.131984 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			//sizeEx = 0.030;
			//size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		};
	};
	class controls {	
		class Absenden: Life_RscButtonMenu
		{
			idc = 889991;
			text = "$STR_SMARTPHONE_ABSENDEN";
			x = 0.456866 * safezoneW + safezoneX;
			y = 0.651984 * safezoneH + safezoneY;
			w = 0.0670211 * safezoneW;
			h = 0.0219973 * safezoneH;
			onButtonClick = "[10,-1,(ctrlText 889992),[getPos player]] spawn life_fnc_NewAuftraege;";
			colorBackground[] = {0,0,0,0.4};
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		
		class ButtonSettings: Life_RscButtonMenu
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
		
		class ButtonClose: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";

			idc = -1;
			text = "";
			x = 0.315559 * safezoneW + safezoneX;
			y = 0.699973 * safezoneH + safezoneY;
			w = 0.0124433 * safezoneW;
			h = 0.0159973 * safezoneH;
			colorBackground[] = {-1, -1, -1, -1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class Auftrag_text: Life_RscStructuredText
		{
			idc = -1;
			text = "<t font ='PuristaMedium' size='0.8'>Hier können Sie einen Auftrag aufgeben,<br/>bitte denken Sie dran alle Wichtigen Information mit anzugeben,<br/>da Sie nur alle 15min einen Auftrag aufgeben können!<br/><br/>z.b. Was für einen Unfall, Welches Fahrzeug, Grad der Beschädigung<br/><br/>Ihre Koordinaten werden automatisch erfasst!<br/></t>"; //--- ToDo: Localize;
			x = 0.350491 * safezoneW + safezoneX;
			y = 0.346019 * safezoneH + safezoneY;
			w = 0.278395 * safezoneW;
			h = 0.142982 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		
		class textEdit: Life_RscEdit
		{
			idc = 889992;
			style = 16;
			text = "";
			x = 0.350491 * safezoneW + safezoneX;
			y = 0.509001 * safezoneH + safezoneY;
			w = 0.278395 * safezoneW;
			h = 0.131984 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
	};
};