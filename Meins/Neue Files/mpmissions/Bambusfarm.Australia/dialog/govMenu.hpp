class govMenu
{
	idd = 50200;
	movingEnabled = false;
	enableSimulation = true;
	
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
		
		class CashBackground: RscText
		{
			idc = -1;
			x = 0.561866 * safezoneW + safezoneX;
			y = 0.445007 * safezoneH + safezoneY;
			w = 0.11342 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class CreateLaw: Life_RscText
		{
			idc = -1;

			text = "Erstelle ein Neues Gesetz"; //--- ToDo: Localize;
			x = 0.316053 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.11342 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
		class ChangeTaxes: Life_RscText
		{
			idc = -1;

			text = "Neue Steuern erheben"; //--- ToDo: Localize;
			x = 0.314403 * safezoneW + safezoneX;
			y = 0.445013 * safezoneH + safezoneY;
			w = 0.0927984 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
		
		class Withdraw: Life_RscText
		{
			idc = -1;

			text = "Goverment Bankkonto"; //--- ToDo: Localize;
			x = 0.314403 * safezoneW + safezoneX;
			y = 0.521997 * safezoneH + safezoneY;
			w = 0.164975 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
	};
	
	class controls
	{
		class EditLaw: Life_RscEdit
		{
			idc = 50201;
			style = 16;
			text = "";
			x = 0.317103 * safezoneW + safezoneX;
			y = 0.342612 * safezoneH + safezoneY;
			w = 0.22684 * safezoneW;
			h = 0.0879891 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		
		class LawButtom: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_createLaw;";

			idc = 1005;
			text = "Gesetz verabschieden"; //--- ToDo: Localize;
			x = 0.438134 * safezoneW + safezoneX;
			y = 0.313023 * safezoneH + safezoneY;
			w = 0.106109 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class EditTaxes: Life_RscEdit
		{
			idc = 50202;
			text = "";
			x = 0.317103 * safezoneW + safezoneX;
			y = 0.478003 * safezoneH + safezoneY;
			w = 0.22684 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_changeTaxes;";

			idc = 1007;
			text = "Steuern anwenden"; //--- ToDo: Localize;
			x = 0.438134 * safezoneW + safezoneX;
			y = 0.445007 * safezoneH + safezoneY;
			w = 0.106109 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class Kontostand: Life_RscText
		{
			idc = -1;

			text = "Goverment Bankkontostand"; //--- ToDo: Localize;
			x = 0.561866 * safezoneW + safezoneX;
			y = 0.401012 * safezoneH + safezoneY;
			w = 0.118576 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
		
		class Cash: Life_RscText
		{
			idc = -1;

			text = "Geld:"; //--- ToDo: Localize;
			x = 0.561866 * safezoneW + safezoneX;
			y = 0.445007 * safezoneH + safezoneY;
			w = 0.0412437 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
		
		class CashAnzeige: Life_RscText
		{
			idc = 50203;

			text = "0 Dollar"; //--- ToDo: Localize;
			x = 0.623731 * safezoneW + safezoneX;
			y = 0.445007 * safezoneH + safezoneY;
			w = 0.0463992 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorText[] = {0,0.45,0.02,1};
		};
		
		class CashEdit: Life_RscEdit
		{
			idc = 50204;
			text = "";
			x = 0.317103 * safezoneW + safezoneX;
			y = 0.554993 * safezoneH + safezoneY;
			w = 0.22684 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		
		class WithdrawButtom: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_govWithdraw;";

			idc = 1013;
			text = "Abbuchen"; //--- ToDo: Localize;
			x = 0.438134 * safezoneW + safezoneX;
			y = 0.521997 * safezoneH + safezoneY;
			w = 0.106109 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class DeleteCloseButton: Life_RscButtonMenu
		{
			idc = 50102;
			onButtonClick = "if (life_isGov) then {[] spawn life_fnc_deleteLaw;};[] spawn {sleep 0.1;closeDialog 0;[] call life_fnc_p_updateMenu;};";

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
			onButtonClick = "closeDialog 0;["""",0] spawn life_fnc_openLawDialog;";

			text = "Gesetze"; //--- ToDo: Localize;
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