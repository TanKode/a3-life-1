//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class pInteraction_civ
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
        class Foltern: RscButtonMenu
        {
	        idc = 2404;
	        text = "Foltern"; //--- ToDo: Localize;
	        x = 0.45 * safezoneW + safezoneX;
	        y = 0.36 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
        class OrganeKlauen: RscButtonMenu
        {
	        idc = 2405;
	        text = "Organe Klauen"; //--- ToDo: Localize;
	        x = 0.5875 * safezoneW + safezoneX;
	        y = 0.4 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
        class Mitnehmen: RscButtonMenu
        {
	        idc = 2402;
	        text = "Mitnehmen"; //--- ToDo: Localize;
	        x = 0.5875 * safezoneW + safezoneX;
	        y = 0.52 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
        class Stehenlassen: RscButtonMenu
        {
	        idc = 2402;
	        text = "Stehen lassen"; //--- ToDo: Localize;
	        x = 0.45 * safezoneW + safezoneX;
	        y = 0.6 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
        class insAuto: RscButtonMenu
        {
	        idc = 2403;
	        text = "ins Auto"; //--- ToDo: Localize;
	        x = 0.3125 * safezoneW + safezoneX;
	        y = 0.52 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
        class AusweisZeigen: RscButtonMenu
        {
	        idc = 1607;
	        text = "Ausweis Zeigen"; //--- ToDo: Localize;
	        x = 0.3125 * safezoneW + safezoneX;
	        y = 0.4 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
	};
};