class LicenseShop 
{
	idd = 5546;
	name= "life_license_shop";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "uiNamespace setVariable [""LicenseShop"", _this select 0];";
	objects[] = { };
	
	class controlsBackground 
	{
		class RscTitleBackground : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			text = "Licenses"; //--- ToDo: Localize;
			x = 0.335025 * safezoneW + safezoneX;
			y = 0.33502 * safezoneH + safezoneY;
			w = 0.319639 * safezoneW;
			h = 0.0219973 * safezoneH;
		};

		class Mainbackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.335025 * safezoneW + safezoneX;
			y = 0.359217 * safezoneH + safezoneY;
			w = 0.319639 * safezoneW;
			h = 0.285965 * safezoneH;
		};
	};
	
	class controls 
	{
		class listbox: Life_RscListBox
		{
			idc = 55126;
			x = 0.340181 * safezoneW + safezoneX;
			y = 0.390014 * safezoneH + safezoneY;
			w = 0.128887 * safezoneW;
			h = 0.219973 * safezoneH;
			sizeEx = 0.035;
		};
		
		class ShowLicenseslistbox: Life_RscListBox
		{
			idc = 55131;
			x = 0.520622 * safezoneW + safezoneX;
			y = 0.390014 * safezoneH + safezoneY;
			w = 0.128887 * safezoneW;
			h = 0.219973 * safezoneH;
			sizeEx = 0.035;
		};
		
		class MyLicenses : Life_RscText
		{
			idc = 55130;
			text = "$STR_PM_Available"; //--- ToDo: Localize;
			x = 0.371113 * safezoneW + safezoneX;
			y = 0.368016 * safezoneH + safezoneY;
			w = 0.077332 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
		
		class ShowLicenses : Life_RscText
		{
			idc = 55129;
			text = "$STR_PM_Licenses"; //--- ToDo: Localize;
			x = 0.561866 * safezoneW + safezoneX;
			y = 0.368016 * safezoneH + safezoneY;
			w = 0.077332 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
		
		class buybutton: Life_RscButtonMenu
		{
			idc = 55127;
			action = "if( (lbData[55126,lbCurSel (55126)] != """") ) then { [false, false, false, lbData[55126,lbCurSel (55126)]] call life_fnc_buyLicense; closeDialog 0; };";
			
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			text = "$STR_Global_Buy";
			x = 0.438134 * safezoneW + safezoneX;
			y = 0.620985 * safezoneH + safezoneY;
			w = 0.0618656 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
		
		class sellButton: Life_RscButtonMenu
		{
			idc = 55128;
			action = "if( (lbData[55131,lbCurSel (55131)] != """") ) then { [false, false, false, lbData[55131,lbCurSel (55131)]] call life_fnc_sellLicense; closeDialog 0; };";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			text = "$STR_VS_SellItem"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.620985 * safezoneH + safezoneY;
			w = 0.0618656 * safezoneW;
			h = 0.0219973 * safezoneH;
		};
	};
};