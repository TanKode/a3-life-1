//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class pInteraction_cop
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controls
	{
		class bClose: RscPicture
		{
			idc = 1800;
	        text = "textures\logo.jpg";
	        x = 0.425 * safezoneW + safezoneX;
	        y = 0.44 * safezoneH + safezoneY;
	        w = 0.15 * safezoneW;
	        h = 0.16 * safezoneH;
			onButtonClick="closeDialog 0;";
		};
		class licence: RscButtonMenu
        {
	        idc = 2402;
	        text = "Licence Check"; //--- ToDo: Localize;
	        x = 0.55 * safezoneW + safezoneX;
	        y = 0.38 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
		class MaskeWeg: RscButtonMenu
        {
	        idc = 2410;
	        text = "Maske Wegnehmen"; //--- ToDo: Localize;
	        x = 0.6 * safezoneW + safezoneX;
	        y = 0.44 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
		    colorBackground[] = {0,0,0,0.6};
        };
		class Losmachen: RscButtonMenu
        {
	        idc = 2401;
	        text = "Losmachen"; //--- ToDo: Localize;
	        x = 0.65 * safezoneW + safezoneX;
	        y = 0.5 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
		class Mitnehmen: RscButtonMenu
        {
	        idc = 2404;
	        text = "Mitnehmen"; //--- ToDo: Localize;
	        x = 0.6 * safezoneW + safezoneX;
	        y = 0.56 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
		class Stehenlassen: RscButtonMenu
        {
	        idc = 2404;
	        text = "Stehen lassen"; //--- ToDo: Localize;
	        x = 0.45 * safezoneW + safezoneX;
	        y = 0.68 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
		class insAuto: RscButtonMenu
        {
	        idc = 2407;
	        text = "ins Auto"; //--- ToDo: Localize;
	        x = 0.35 * safezoneW + safezoneX;
	        y = 0.62 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
		class Durchsuchen: RscButtonMenu
        {
	        idc = 1606;
	        text = "Durchsuchen"; //--- ToDo: Localize;
	        x = 0.25 * safezoneW + safezoneX;
	        y = 0.5 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
		class AusweisZeigen: RscButtonMenu
        {
	        idc = 1607;
	        text = "Ausweis Zeigen"; //--- ToDo: Localize;
	        x = 0.35 * safezoneW + safezoneX;
	        y = 0.38 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
		class insGefaengnis: RscButtonMenu
        {
	        idc = 2406;
	        text = "ins Gefaengnis"; //--- ToDo: Localize;
	        x = 0.3 * safezoneW + safezoneX;
	        y = 0.56 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
	    class DrogenTest: RscButtonMenu
        {
	        idc = 2408;
	        text = "Drogen Test"; //--- ToDo: Localize;
	        x = 0.3 * safezoneW + safezoneX;
	        y = 0.44 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
		class AlkoholTest: RscButtonMenu
        {
	        idc = 2409;
	        text = "Alkohol Test"; //--- ToDo: Localize;
	        x = 0.55 * safezoneW + safezoneX;
	        y = 0.62 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
		class Rechnung: RscButtonMenu
        {
	        idc = 2405;
	        text = "Rechnung"; //--- ToDo: Localize;
	        x = 0.45 * safezoneW + safezoneX;
           	y = 0.32 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
	};
};