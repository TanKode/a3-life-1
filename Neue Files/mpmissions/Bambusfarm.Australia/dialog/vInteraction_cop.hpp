//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class vInteraction_cop
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;

	class controls
	{
		class Zerstoeren: RscButtonMenu
		{
			idc = 2405;
			text = "Zerstoeren"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class AusdemFahrzeugziehen: RscButtonMenu
		{
			idc = 2403;
			text = "Aus dem Fahrzeug ziehen"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class ADACReparieren: RscButtonMenu
		{
			idc = 2401;
			text = "ADAC Reparieren"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class EigentuemerSuchen: RscButtonMenu
		{
			idc = 2402;
			text = "Eigentuemer Suchen"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.44 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class FahrzeugDurchsuchen: RscButtonMenu
		{
			idc = 2403;
			text = "Fahrzeug Durchsuchen"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class FahrzeugIndieGerage: RscButtonMenu
		{
			idc = 2406;
			text = "Fahrzeug In die Gerage"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.44 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class Reparieren: RscButtonMenu
		{
			idc = 24012;
			text = "Reparieren"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class BootSchieben: RscButtonMenu
		{
			idc = 2407;
			text = "Boot schieben"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class FahrzeugUmdrehen: RscButtonMenu
		{
			idc = 2409;
			text = "Fahrzeug Umdrehen"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class aufAbschlepphof: RscButtonMenu
		{
			idc = 24011;
			text = "auf Abschlepphof"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class inKartEinsteigen: RscButtonMenu
		{
			idc = 2408;
			text = "in Kart Einsteigen"; //--- ToDo: Localize;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class EinhackenAN: RscButtonMenu
		{
			idc = 24010;
			text = "Einhacken AN"; //--- ToDo: Localize;
			x = 0.6 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
	        text = "textures\logo.jpg";
			x = 0.425 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.16 * safezoneH;
		};
	};
};