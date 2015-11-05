class voteMenu
{
	idd = 50000;
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "[] spawn {if(!life_isGov) then { if((call life_adminlevel) < 1) then {ctrlShow[50301,false];};};}";

	class controlsBackground {
		class MainBackground: life_RscPicture
		{
			idc = -1;

			text = "textures\tablet\tablet.paa"; //--- ToDo: Localize;
			x = 0.2712 * safezoneW + safezoneX;
			y = 0.224594 * safezoneH + safezoneY;
			w = 0.461136 * safezoneW;
			h = 0.571078 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class Titel: Life_RscText
		{
			idc = -1;
			text = "Kandidaten:"; //--- ToDo: Localize;
			x = 0.316053 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
	};
	
	class controls
	{
		class RscListbox_1500: Life_RscListbox
		{
			idc = 50001;
			x = 0.32987 * safezoneW + safezoneX;
			y = 0.33502 * safezoneH + safezoneY;
			w = 0.242242 * safezoneW;
			h = 0.301519 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "Voten"; //--- ToDo: Localize;
			x = 0.592798 * safezoneW + safezoneX;
			y = 0.357018 * safezoneH + safezoneY;
			w = 0.0781765 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			onButtonClick = "[] spawn life_fnc_voteForPlayer;hint ""wow"";";
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = -1;
			text = "Storniere Vote"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.592798 * safezoneW + safezoneX;
			y = 0.407018 * safezoneH + safezoneY;
			w = 0.0781765 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class DeleteCloseButton: Life_RscButtonMenu
		{
			idc = 50102;
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";

			text = "Schließen"; //--- ToDo: Localize;
			x = 0.314403 * safezoneW + safezoneX;
			y = 0.642982 * safezoneH + safezoneY;
			w = 0.0876429 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class VoteMenuButtom: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;[0,0] spawn life_fnc_openLawDialog;";

			text = "Gesetze"; //--- ToDo: Localize;
			x = 0.407202 * safezoneW + safezoneX;
			y = 0.642982 * safezoneH + safezoneY;
			w = 0.0876429 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class GovMenuButtom: Life_RscButtonMenu
		{
			idc = 50301;
			onButtonClick = "closeDialog 0;[] spawn life_fnc_openGovDialog;";
			text = "Gov Menu"; //--- ToDo: Localize;
			x = 0.505155 * safezoneW + safezoneX;
			y = 0.642982 * safezoneH + safezoneY;
			w = 0.0876429 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
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