class Life_My_Perm_Gang_Diag {
		idd = 3620;
		name= "life_my_gang_menu";
		movingEnable = false;
		enableSimulation = true;
		onLoad = "";

		class controlsBackground {
			class Life_RscTitleBackground:Life_RscText {
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				idc = -1;
				x = 0.1;
				y = 0.2;
				w = 0.6;
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
			
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3629;
			text = "";
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
	};

	class controls {

		class GangMemberList : Life_RscListBox
		{
			idc = 3621;
			text = "";
			sizeEx = 0.035;

			x = 0.20; y = 0.26;
			w = 0.350; h = 0.370;
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

		class GangLeave : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Leave";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_gangLeave";
			x = 0.58;
			y = 0.26;
			w = (9 / 40);
			h = (1 / 25);
		};

		class GangLock : Life_RscButtonMenu
		{
			idc = 3622;
			text = "$STR_Gang_UpgradeSlots";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangUpgrade";
			x = 0.58;
			y = 0.31;
			w = (9 / 40);
			h = (1 / 25);
		};

		class GangKick : Life_RscButtonMenu
		{
			idc = 3624;
			text = "$STR_Gang_Kick";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_gangKick";
			x = 0.58;
			y = 0.36;
			w = (9 / 40);
			h = (1 / 25);
		};

		class GangLeader : Life_RscButtonMenu
		{
			idc = 3625;
			text = "$STR_Gang_SetLeader";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			x = 0.58;
			y = 0.41;
			w = (9 / 40);
			h = (1 / 25);
		};

		class InviteMember : GangLeader
		{
			idc = 3630;
			text = "$STR_Gang_Invite_Player";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
			y = .51;
		};

		class DisbandGang : InviteMember
		{
			idc = 3631;
			text = "$STR_Gang_Disband_Gang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangDisband";
			y = .46;
		};

		class ColorList : Life_RscCombo
		{
			idc = 3632;
			x = 0.58; y = 0.56;
			w = (9 / 40); h = 0.03;
		};

		class GangBank : life_RscTitle {
			idc = 701;
			sizeEx = 0.03;
			x = 0.606083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {-1, -1, -1, -1};
		};
	};
};

class Life_Create_Gang_Diag_Perm {
	idd = 3520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 3520)}; ((findDisplay 3520) displayCtrl 3523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> 'Life_Settings' >> 'gang_price'))] call life_fnc_numberText]};";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
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
		
		class GangBackground: Life_RscText
		{
			idc = -1;

			x = 0.25;
			y = 0.3 + (11 / 250);
			w = 0.5; h = 0.12;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class Title : Life_RscTitle {
			//colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Gang_Title";
			x = 0.316083 * safezoneW + safezoneX;
			y = 0.308986 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};

	class controls {

		class InfoMsg : Life_RscStructuredText
		{
			idc = 3523;
			sizeEx = 0.020;
			text = "";
			x = 0.25;
			y = 0.3 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class ButtonClose: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";

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

		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_createGangPerm";
			x = 0.15 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.60 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
			colorBackground[] = {0,0,0,0.3};
		};

		class CreateGangText : Life_RscEdit
		{
			idc = 3522;
			text = "$STR_Gang_YGN";
			x = 0.35 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.60 - (1 / 25);
			w = (8.25 / 40);
			h = (1 / 25);
			colorBackground[] = {0,0,0,0.3};
		};
	};
};