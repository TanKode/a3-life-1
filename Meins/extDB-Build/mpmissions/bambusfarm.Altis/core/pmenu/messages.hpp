////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by life, v1.063, #Worery)
////////////////////////////////////////////////////////
class life_messages {
	idd = 10000;
	name= "life_messages";
	onLoad = "uiNamespace setVariable ['life_messages', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['life_messages', nil]";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class Hintergrund2: life_RscText
		{
			idc = 1000;
			text = ""; //--- ToDo: Localize;
			x = 0.252969 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.51 * safezoneW;
			h = 0.646 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			colorActive[] = {-1,-1,-1,0.7};
		};
		class Hintergrund: life_RscText
		{
			idc = 1002;
			text = "GPS Telephone"; //--- ToDo: Localize;
			x = 0.252969 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.51 * safezoneW;
			h = 0.034 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			colorActive[] = {0.1,0.1,1,0.7};
		};
	};
	class controls {
		class WeissIchNed: life_RscEdit
		{
			idc = 1400;
			text = ""; //--- ToDo: Localize;
			lineSpacing = 1;
			x = 0.428281 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.31875 * safezoneW;
			h = 0.272 * safezoneH;
		};
		class MessageList: life_RscListbox
		{
			idc = 1500;
			onLBSelChanged = "_this call life_fnc_getMessage;";
			text = ""; //--- ToDo: Localize;
			x = 0.268906 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.143438 * safezoneW;
			h = 0.459 * safezoneH;
		};
		class ButtonSend0: life_RscButtonMenu
		{
			idc = 1600;
			text = "$STR_messaging_hpp_but1"; //--- ToDo: Localize;
			action = "[0]spawn life_fnc_playerSent;";
			x = 0.428281 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.103594 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class ButtonSend1: life_RscButtonMenu
		{
			idc = 1601;
			text = "$STR_messaging_hpp_but2"; //--- ToDo: Localize;
			action = "[1]spawn life_fnc_playerSent;";
			x = 0.539844 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.095625 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class ButtonSend2: life_RscButtonMenu
		{
			idc = 1602;
			text = "$STR_messaging_hpp_but3"; //--- ToDo: Localize;
			action = "[2]spawn life_fnc_playerSent;";
			x = 0.643438 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.103594 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class GPS: life_RscCheckbox
		{
			idc = 2800;
			text = ""; //--- ToDo: Localize;
			x = 0.420312 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.031875 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class userList: life_RscCombo
		{
			idc = 2100;
			text = ""; //--- ToDo: Localize;
			x = 0.428281 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.31875 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class Ka: life_RscText
		{
			idc = 1001;
			text = "$STR_messaging_hpp_but4"; //--- ToDo: Localize;
			x = 0.268907 * safezoneW + safezoneX;
			y = 0.245 * safezoneH + safezoneY;
			w = 0.143438 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class findUser: life_RscEdit
		{
			idc = 1401;
			onKeyUp = "[] call life_fnc_findUser;";
			text = ""; //--- ToDo: Localize;
			x = 0.268906 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.143438 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class search: life_RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 0.428281 * safezoneW + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.326719 * safezoneW;
			h = 0.136 * safezoneH;
		};
		class message: life_RscStructuredText
		{
			idc = 1101;
			text = "$STR_messaging_hpp_but5"; //--- ToDo: Localize;
			x = 0.460156 * safezoneW + safezoneX;
			y = 0.602 * safezoneH + safezoneY;
			w = 0.294844 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class buttonClear: life_RscButtonMenu
		{
			idc = 1603;
			text = "$STR_messaging_hpp_but6"; //--- ToDo: Localize;
			onMouseButtonDblClick = "[] call life_fnc_clearMessages;";
			x = 0.268906 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.143438 * safezoneW;
			h = 0.034 * safezoneH;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

