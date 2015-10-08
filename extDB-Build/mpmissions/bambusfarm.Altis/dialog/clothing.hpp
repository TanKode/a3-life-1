class bambusfarm_Clothing {
	idd = 3100;
	name= "bambusfarm_Clothing";
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] execVM 'core\client\keychain\init.sqf'";
	
	class controlsBackground {
		class bambusfarm_RscTitleBackground:bambusfarm_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0;
			w = 0.318;
			h = (1 / 25);
		};
		
		class MainBackground:bambusfarm_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0 + (11 / 250);
			w = 0.318;
			h = 0.5 - (22 / 250);
		};
	};
	
	class controls 
	{
		class Title : bambusfarm_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3103;
			text = "";
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0;
			w = 0.6;
			h = (1 / 25);
		};
		
		class ClothingList : bambusfarm_RscListBox
		{
			idc = 3101;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] call bambusfarm_fnc_changeClothes;";
			
			x = 0.01 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.05;
			w = 0.3;
			h = 0.35;
		};
		
		class PriceTag : bambusfarm_RscStructuredText
		{
			idc = 3102;
			text = "";
			sizeEx = 0.035;
			
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0.45 - (1 / 25);
			w = 0.2;
			h = 0.2;
		};
		
		class TotalPrice : bambusfarm_RscStructuredText
		{
			idc = 3106;
			text = "";
			sizeEx = 0.035;
			
			x = 0.15 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.45 - (1 / 25);
			w = 0.2;
			h = 0.13;
		};
		
		class FilterList : bambusfarm_RscCombo
		{
			idc = 3105;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call bambusfarm_fnc_clothingFilter";
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = 0.318;
			h = 0.035;
		};
		
		class CloseButtonKey : bambusfarm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.161 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.54 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BuyButtonKey : bambusfarm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call bambusfarm_fnc_buyClothes;";
			x = (1 / 250 / (safezoneW / safezoneH));
			y = 0.54 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};