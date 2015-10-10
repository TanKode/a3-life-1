class life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		
		class MainBackground:life_RscText {
			idc = -1;
	        x = 0.2;
	        y = 0.24;
	        w = 0.575;
	        h = 0.56;
	        colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls {

		class CashTitle : life_RscStructuredText
		{
			idc = 2701;
			text = "";
			
			x = 0.225;
			y = 0.36;
			w = 0.25;
			h = 0.08;
		};

		class TitleCash : life_RscStructuredText
        {
        	idc = 87895;
        	text = "";

        	x = 0.5;
        	y = 0.36;
        	w = 0.25;
        	h = 0.08;
        };
		
		class WithdrawButton : life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";
			onButtonClick = "[] call life_fnc_bankWithdraw";
			
			x = 0.5;
			y = 0.48;
			w = 0.25;
			h = 0.08;
		};
		
		class DepositButton : life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_ATM_Deposit";
			onButtonClick = "[] call life_fnc_bankDeposit";
			
	        x = 0.225;
	        y = 0.48;
	        w = 0.25;
	        h = 0.08;
		};
		
		class moneyEdit : life_RscEdit {
		
		idc = 2702;

		text = "1";
		sizeEx = 0.030;
		x = 0.225;
	    y = 0.28;
	    w = 0.525;
	    h = 0.04;
		
		};
		
		class PlayerList : life_RscCombo
		{
			idc = 2703;
			x = 0.225;
            y = 0.72;
            w = 0.525;
            h = 0.04;
		};
		
		class TransferButton : life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_ATM_Transfer";
			onButtonClick = "[] call life_fnc_bankTransfer";
			
			x = 0.5;
			y = 0.6;
			w = 0.25;
			h = 0.08;
		};
		
		class GangDeposit : life_RscButtonMenu
		{
			idc = 2705;
			text = "$STR_pInAct_DepositToGang";
			onButtonClick = "[] call life_fnc_gangDeposit";
			x = 0.225;
            y = 0.6;
            w = 0.25;
            h = 0.08;
		};
		
		class CloseButtonKey : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.5875;
			y = 0.82;
			w = 0.1875;
			h = 0.06;
		};
	};
};