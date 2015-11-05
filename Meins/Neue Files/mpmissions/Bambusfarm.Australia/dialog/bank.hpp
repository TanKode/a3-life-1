class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1375;
			y = 0.2;
			w = 0.5125;
			h = 0.04;
		};
		
		class MainBackground: Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1375;
			y = 0.24;
			w = 0.5125;
			h = 0.52;
		};
	};
	
	class controls {
		class CashTitle: Life_RscStructuredText
		{
			idc = 2701;
			text = "";
			
			x = 0.39;
			y = 0.26;
			w = 0.3;
			h = 0.14;
		};
		
		class Title: Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 1};
			idc = -1;
			text = "$STR_ATM_Title";
			x = 0.2625;
			y = 0.2;
			w = 0.6;
			h = 0.04;
		};
		
		class WithdrawButton: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			onButtonClick = "[] call life_fnc_bankWithdraw";
	
			x = 0.432;
			y = 0.46;
			w = 0.15;
			h = 0.04;
		};
		
		class DepositButton: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_ATM_Deposit";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			onButtonClick = "[] call life_fnc_bankDeposit";

			x = 0.432;
			y = 0.512;
			w = 0.15;
			h = 0.04;
		};
		
		class moneyEdit: Life_RscEdit
		{
			idc = 2702;

			text = "1";
			sizeEx = 0.030;
			x = 0.4; y = 0.41;
			w = 0.2; h = 0.03;
		};
		
		class PlayerList: Life_RscListBox
		{
			idc = 2703;
			
			sizeEx = 0.030;
			x = 0.15; y = 0.26;
			w = 0.2125; h = 0.48;
		};
		
		class TransferButton: Life_RscButtonMenu
		{

			idc = -1;
			text = "$STR_ATM_Transfer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			onButtonClick = "[] call life_fnc_bankTransfer";
			x = 0.432;
			y = 0.63;
			w = 0.1325;
			h = 0.04;
		};
		
		class GangDeposit: TransferButton
		{
			idc = 2705;
			text = "$STR_pInAct_DepositToGang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			onButtonClick = "[] call life_fnc_gangDeposit";
			x = 0.365;
			y = 0.7;
			w = 0.275;
		};
		
		class CloseButtonKey: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1375;
			y = 0.762;
			w = 0.15625;
			h = 0.04;
		};
	};
};