class lawMenu
{
	idd = 50100;
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
	
		class Title: Life_RscText
		{
			idc = -1;

			text = "Aktuelle Gesetze"; //(Doppelklick auf ein Gesetz, um den gesamten Text zu sehen)"; //--- ToDo: Localize;
			x = 0.316053 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.035;
		};
	};
	
	class controls
	{
		class LawList: Life_RscListBox
		{
			idc = 50101;
			//onLBDblClick = "[1] spawn life_fnc_openLawDialog;";

			x = 0.316569 * safezoneW + safezoneX;
			y = 0.33942 * safezoneH + safezoneY;
			w = 0.367837 * safezoneW;
			h = 0.279826 * safezoneH;
		};

		class DeleteCloseButton: Life_RscButtonMenu
		{
			idc = 50102;
			onButtonClick = "if((life_isGov) OR ((call life_adminlevel) > 0)) then {[] spawn life_fnc_deleteLaw;};[] spawn {sleep 0.1;closeDialog 0;};";

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
			onButtonClick = "closeDialog 0;[] spawn life_fnc_openVoteDialog;";

			text = "Vote Menu"; //--- ToDo: Localize;
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