//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class vInteraction_civ
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;

	class controls
	{
		class Fassaufladen: RscButtonMenu
		{
			idc = 2404;
			text = "Fass aufladen"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class VomGeraetabbauen: RscButtonMenu
		{
			idc = 2406;
			text = "Vom Geraet abbauen"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.44 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class FahrzeugIndieGerage: RscButtonMenu
		{
			idc = 2402;
			text = "Fahrzeug In die Gerage"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class Fassabladen: RscButtonMenu
		{
			idc = 2405;
			text = "Fass abladen"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class Bootschieben: RscButtonMenu
		{
			idc = 2407;
			text = "Boot schieben"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class OelMineAnschliessen: RscButtonMenu
		{
			idc = 2405;
			text = "Oel Mine Anschliessen"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class inKartEinsteigen: RscButtonMenu
		{
			idc = 2403;
			text = "in Kart Einsteigen"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.44 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
	        text = "textures\logo.jpg";
			x = 0.4375 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.12 * safezoneH;
		};
		class FahrzeugReparieren: RscButtonMenu
		{
			idc = 2401;
			text = "Fahrzeug Reparieren"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
	};
};