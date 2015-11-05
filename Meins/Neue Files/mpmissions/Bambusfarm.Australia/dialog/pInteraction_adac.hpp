//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class pInteraction_adac
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
		class AusweisZeigen: RscButtonMenu
        {
	        idc = 1607;
	        text = "Ausweis Zeigen"; //--- ToDo: Localize;
	        x = 0.3 * safezoneW + safezoneX;
	        y = 0.48 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
        class AdacRechnung: RscButtonMenu
        {
	        idc = 2401;
	        text = "Adac Rechnung"; //--- ToDo: Localize;
	        x = 0.6 * safezoneW + safezoneX;
	        y = 0.48 * safezoneH + safezoneY;
	        w = 0.1 * safezoneW;
	        h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
        };
	};
};