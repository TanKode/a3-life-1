class pInteraction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class MainBackground : life_RscText
		{
			idc = -1;
			x = -0.5375;
			y = -0.02;
			w = 0.5125;
			h = 1.02;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 37401;
			text = "$STR_pInAct_Title";
			x = -0.5375;
			y = -0.02;
			w = 0.5125;
			h = 0.04;
		};
	};
	
	class controls
	{
		class ButtonClose : life_RscButtonMenu
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			onButtonClick = "closeDialog 0;";
			text = "Menu schliessen."; //--- ToDo: Localize;
           	x = -0.5375;
           	y = 1.02;
           	w = 0.5125;
            h = 0.08;
		};
		
		class RscButtonMenu_2409: life_RscButtonMenu
        {
        	idc = 37464;
        	text = ""; //--- ToDo: Localize;
        	x = -0.5125;
        	y = 0.88;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2408: life_RscButtonMenu
        {
        	idc = 37465;
        	text = ""; //--- ToDo: Localize;
        	x = -0.25;
        	y = 0.88;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2400: life_RscButtonMenu
        {
        	idc = 37463;
        	text = ""; //--- ToDo: Localize;
        	x = -0.25;
        	y = 0.76;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2401: life_RscButtonMenu
        {
        	idc = 37451;
        	text = ""; //--- ToDo: Localize;
        	x = -0.25;
        	y = 0.04;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2402: life_RscButtonMenu
        {
        	idc = 37453;
        	text = ""; //--- ToDo: Localize;
        	x = -0.25;
        	y = 0.16;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2403: life_RscButtonMenu
        {
        	idc = 37455;
        	text = ""; //--- ToDo: Localize;
        	x = -0.25;
        	y = 0.28;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2404: life_RscButtonMenu
        {
        	idc = 37457;
        	text = ""; //--- ToDo: Localize;
        	x = -0.25;
        	y = 0.4;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2405: life_RscButtonMenu
        {
        	idc = 37459;
        	text = ""; //--- ToDo: Localize;
        	x = -0.25;
        	y = 0.52;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2406: life_RscButtonMenu
        {
        	idc = 37461;
        	text = ""; //--- ToDo: Localize;
        	x = -0.25;
        	y = 0.64;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2407: life_RscButtonMenu
        {
        	idc = 37462;
        	text = ""; //--- ToDo: Localize;
        	x = -0.5125;
        	y = 0.76;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2410: life_RscButtonMenu
        {
        	idc = 37460;
        	text = ""; //--- ToDo: Localize;
        	x = -0.5125;
        	y = 0.64;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2411: life_RscButtonMenu
        {
        	idc = 37458;
        	text = ""; //--- ToDo: Localize;
        	x = -0.5125;
        	y = 0.52;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2412: life_RscButtonMenu
        {
        	idc = 37456;
        	text = ""; //--- ToDo: Localize;
        	x = -0.5125;
        	y = 0.4;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2413: life_RscButtonMenu
        {
        	idc = 37454;
        	text = ""; //--- ToDo: Localize;
        	x = -0.5125;
        	y = 0.28;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2414: life_RscButtonMenu
        {
        	idc = 37452;
        	text = ""; //--- ToDo: Localize;
        	x = -0.5125;
        	y = 0.16;
        	w = 0.2;
        	h = 0.08;
        };
        class RscButtonMenu_2415: life_RscButtonMenu
        {
        	idc = 37450;
        	text = ""; //--- ToDo: Localize;
        	x = -0.5125;
        	y = 0.04;
        	w = 0.2;
        	h = 0.08;
        };
	};
};

class vInteraction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Links: life_RscText
		{
			idc = 1000;
			x = -0.025;
			y = 0.28;
			w = 0.3;
			h = 0.64;
			colorBackground[] = {0,0,0,0.4};
		};
		class Rechts: life_RscText
		{
			idc = 1001;
			x = 0.625;
			y = 0.28;
			w = 0.3;
			h = 0.64;
			colorBackground[] = {0,0,0,0.4};
		};
	};

	class controls
	{
		class btn1: life_RscButtonMenu
		{
			idc = 37450;
			x = 0;
			y = 0.32;
			w = 0.25;
			h = 0.08;
		};
		class btn3: life_RscButtonMenu
		{
			idc = 37452;
			x = 0;
			y = 0.44;
			w = 0.25;
			h = 0.08;
		};
		class btn5: life_RscButtonMenu
		{
			idc = 37454;
			x = 0;
			y = 0.56;
			w = 0.25;
			h = 0.08;
		};
		class btn7: life_RscButtonMenu
		{
			idc = 37456;
			x = 0;
			y = 0.68;
			w = 0.25;
			h = 0.08;
		};
		class btn9: life_RscButtonMenu
		{
			idc = 37458;
			x = 0;
			y = 0.8;
			w = 0.25;
			h = 0.08;
		};
		class btn2: life_RscButtonMenu
		{
			idc = 37451;
			x = 0.65;
			y = 0.32;
			w = 0.25;
			h = 0.08;
		};
		class btn4: life_RscButtonMenu
		{
			idc = 37453;
			x = 0.65;
			y = 0.44;
			w = 0.25;
			h = 0.08;
		};
		class btn6: life_RscButtonMenu
		{
			idc = 37455;
			x = 0.65;
			y = 0.56;
			w = 0.25;
			h = 0.08;
		};
		class btn8: life_RscButtonMenu
		{
			idc = 37457;
			x = 0.65;
			y = 0.68;
			w = 0.25;
			h = 0.08;
		};
		class btn10: life_RscButtonMenu
		{
			idc = 37459;
			x = 0.65;
			y = 0.8;
			w = 0.25;
			h = 0.08;
		};
		class BtnCloseRechts: life_RscButtonMenu
		{
			idc = 2410;
			onButtonClick = "closeDialog 0;";
			text = "Menu schliessen."; //--- ToDo: Localize;
			x = 0.625;
			y = 0.94;
			w = 0.3;
			h = 0.04;
		};
		class BtnCloseLinks: life_RscButtonMenu
		{
			idc = 2411;
			onButtonClick = "closeDialog 0;";
			text = "Menu schliessen."; //--- ToDo: Localize;
			x = -0.025;
			y = 0.94;
			w = 0.3;
			h = 0.04;
		};
	};
};