/*
	File: craft.hpp
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
class bambusfarm_craft {
	idd = 666;
	name= "bambusfarm_craft";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn bambusfarm_fnc_craft";

	class controlsBackground {
		class bambusfarm_RscTitleBackground:bambusfarm_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class MainBackground:bambusfarm_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {


		class Title : bambusfarm_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 667;
			text = "$STR_CRAFT_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class craftListHeader : bambusfarm_RscText
		{
			idc = 668;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftStats";
			sizeEx = 0.04;
			x = 0.105; y = 0.26;
			w = 0.275; h = 0.04;
		};

		//Craft list
		class craftList : bambusfarm_RscListBox
		{
			idc = 669;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn bambusfarm_fnc_craft_update";
			x = 0.105;
			y = 0.31;
			w = 0.275; h = 0.44;
		};

		//Materials list header
		class materialListHeader : bambusfarm_RscText
		{
			idc = 670;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftMaterials";
			sizeEx = 0.04;
			x = 0.395; y = 0.26;
			w = 0.275; h = 0.04;
		};

		//Materials list
		class materialList : bambusfarm_RscControlsGroup
		{
			idc = 671;
			w = 0.275;
			h = 0.44;
			x = 0.395;
			y = 0.30;


			class Controls
			{
				class mats : bambusfarm_RscStructuredText
				{
					idc = 672;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; h = 0.44;
				};
			};
		};

		//FILTER
		class FilterList : bambusfarm_RscCombo
		{
			idc = 673;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "[] call bambusfarm_fnc_craft_updateFilter";
			x = 0.69;
			y = 0.32;
			w = (6.25 / 30);
			h = (1 / 25);
		};

		//Craft button
		class ButtonCraft : bambusfarm_RscButtonMenu {
			idc = 674;
			text = "$STR_CRAFT_Button";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "if(!bambusfarm_is_processing) then {[] spawn bambusfarm_fnc_craftAction};";
			x = 0.69;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};


		class CloseButtonKey : bambusfarm_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
}; 