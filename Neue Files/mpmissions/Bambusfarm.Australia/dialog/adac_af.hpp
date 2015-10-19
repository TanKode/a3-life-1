class life_adacAuftragsbuch{
	idd = 103450;
	name = "life_adacAuftragsbuch";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_auftragsBuch";
	
	class controlsBackground {
		class MainBackground: life_RscPicture
		{
			idc = -1;

			text = "textures\tablet\tablet.paa"; //--- ToDo: Localize;
			x = 0.126135 * safezoneW + safezoneX;
			y = 0.206019 * safezoneH + safezoneY;
			w = 0.697412 * safezoneW;
			h = 0.621956 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class life_adacTitelAuftrag: Life_RscText
		{
			idc = -1;
			text = "Auftragsbuch"; //--- ToDo: Localize;
			x = 0.186651 * safezoneW + safezoneX;
			y = 0.318082 * safezoneH + safezoneY;
			w = 0.577412 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0};
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class life_offeneAuftragBackground: Life_RscText
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.189022 * safezoneW + safezoneX;
			y = 0.378575 * safezoneH + safezoneY;
			w = 0.247462 * safezoneW;
			h = 0.120985 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class life_meineAuftragBackground: Life_RscText
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.189022 * safezoneW + safezoneX;
			y = 0.558953 * safezoneH + safezoneY;
			w = 0.247462 * safezoneW;
			h = 0.131984 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class life_offenAuftraeTitel: Life_RscText
		{
			idc = -1;
			text = "Offene Aufträge"; //--- ToDo: Localize;
			x = 0.189022 * safezoneW + safezoneX;
			y = 0.352838 * safezoneH + safezoneY;
			w = 0.247462 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class life_MeineAuftraegeTitel: Life_RscText
		{
			idc = -1;
			text = "Meine Aufträge"; //--- ToDo: Localize;
			x = 0.189022 * safezoneW + safezoneX;
			y = 0.531016 * safezoneH + safezoneY;
			w = 0.247462 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class life_NachrichtenTitel: Life_RscText
		{
			idc = -1;
			text = "Nachrichten"; //--- ToDo: Localize;
			x = 0.44173 * safezoneW + safezoneX;
			y = 0.351983 * safezoneH + safezoneY;
			w = 0.14727 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	class controls {
		
		class life_Auftrage: Life_RscListNBox
		{
			idc = 103451;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.65)";
			colorBackground[] = {0,0,0,0.3};
			onLBSelChanged = "[(lbCurSel 103451),0] call life_fnc_showAuftraege;";
			coloumns[] = {0,0,0.3};
			drawSideArrows = false;
			idcLeft = -1;
			dcRight = -1;
			rowHeight = 0.050;
			x = 0.189022 * safezoneW + safezoneX;
			y = 0.378575 * safezoneH + safezoneY;
			w = 0.247462 * safezoneW;
			h = 0.120985 * safezoneH;
		};
		
		class life_AuftragBestaetigen: Life_RscButtonMenu
		{
			idc = 103452;
			text ="Auftrag annehmen"; //--- ToDo: Localize;
			//style = 2;
			x = 0.189022 * safezoneW + safezoneX;
			y = 0.505059 * safezoneH + safezoneY;
			w = 0.247462 * safezoneW;
			h = 0.0219973 * safezoneH;
			onButtonClick = "[] spawn life_fnc_meineAuftraege";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			class Attributes
			{
				align = "center";
			};
		};
		
		class life_MeineAuftraege: Life_RscListNBox
		{
			idc = 103454;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.65)";
			colorBackground[] = {0,0,0,0.3};
			onLBSelChanged = "[0,1,(lbCurSel 103454)] call life_fnc_showAuftraege;";
			coloumns[] = {0,0,0.3};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.189022 * safezoneW + safezoneX;
			y = 0.558953 * safezoneH + safezoneY;
			w = 0.247462 * safezoneW;
			h = 0.131984 * safezoneH;
		};
		
		class life_NachrichtenShow: Life_RscControlsGroup
		{
			idc = -1;
			x = 0.44173 * safezoneW + safezoneX;
			y = 0.384638 * safezoneH + safezoneY;
			w = 0.14727 * safezoneW;
			h = 0.271984 * safezoneH;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showNachrichten : Life_RscStructuredText {
					idc = 103455;
					text = "";
					colorBackground[] = {0,0,0,0.3};
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.35;
					h = 1;
				};
			};
		};
		
		class MapView: Life_RscMapControl
		{
			idc = 103453;
			x = 0.592798 * safezoneW + safezoneX;
			y = 0.357018 * safezoneH + safezoneY;
			w = 0.164975 * safezoneW;
			h = 0.296963 * safezoneH;
		};
		
		/*class life_MapZoomIn: Life_RscButtonMenu
		{
			idc = -1;
			text = "Zoom +"; //--- ToDo: Localize;
			style = 2;
			x = 0.590847 * safezoneW + safezoneX;
			y = 0.663973 * safezoneH + safezoneY;
			w = 0.077332 * safezoneW;
			h = 0.0219973 * safezoneH;
			onButtonClick = "[] spawn life_fnc_mapZoomIn;";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			class Attributes
			{
				align = "center";
			};
		};
		
		class life_MapZoomOut: Life_RscButtonMenu
		{
			idc = -1;
			text = "Zoom -"; //--- ToDo: Localize;
			style = 2;
			x = 0.680441 * safezoneW + safezoneX;
			y = 0.66498 * safezoneH + safezoneY;
			w = 0.077332 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			class Attributes
			{
				align = "center";
			};
		};*/
		
		class life_Erledigt: Life_RscButtonMenu
		{
			idc = 103457;
			text = "Erledigt"; //--- ToDo: Localize;
			style = 2;
			x = 0.592798 * safezoneW + safezoneX;
			y = 0.663973 * safezoneH + safezoneY;
			w = 0.164975 * safezoneW;
			h = 0.0219973 * safezoneH;
			onButtonClick = "[] spawn life_fnc_deleteAuftraege;";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			class Attributes
			{
				align = "center";
			};
		};
		
		class life_Antworten: Life_RscButtonMenu
		{
			idc = 103456;
			text = "Antworten"; //--- ToDo: Localize;
			x = 0.44173 * safezoneW + safezoneX;
			y = 0.663973 * safezoneH + safezoneY;
			w = 0.14727 * safezoneW;
			h = 0.0219973 * safezoneH;
			onButtonClick = "[1] call life_fnc_auftragsBuch;";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			class Attributes
			{
				align = "center";
			};
		};
		
		class ButtonClose: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;[] call life_fnc_p_openMenu;";

			idc = -1;
			text = "";
			x = 0.193559 * safezoneW + safezoneX;
			y = 0.720973 * safezoneH + safezoneY;
			w = 0.0182433 * safezoneW;
			h = 0.0225973 * safezoneH;
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
			x = 0.26558 * safezoneW + safezoneX;
			y = 0.720973 * safezoneH + safezoneY;
			w = 0.0182433 * safezoneW;
			h = 0.0225973 * safezoneH;
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

class Life_auf_schreiben
{
	idd = 88990;
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
			idc = 88991;
			text = "$STR_SMARTPHONE_NACHRICHTTITLE";
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			//colorBackground[] = {0,0,0,0};
		};
		
		class Absenden : Life_RscButtonMenu {
			idc = 88992;
			text = "$STR_SMARTPHONE_ABSENDEN";
			onButtonClick = "[11,-1,(ctrlText 88993)] call life_fnc_newMsg;";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			colorBackground[] = {0,0,0,0.4};
			x = 0.456866 * safezoneW + safezoneX;
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
		
			idc = 88993;
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
