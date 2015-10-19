class Life_ColorList 
{
	idd = 45900;
	name="life_ColorList";
	movingEnabled = 0;
	enableSimulation = 1;
	//onLoad = "[] spawn life_fnc_craftVehicleSpawnMenu";

	class controlsBackground 
	{
		class Life_RscTitleBackground: Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			text = "Farbauswahl"; //--- ToDo: Localize;
			x = 0.2;
			y = 0.23;
			w = 0.6125;
			h = 0.04;
		};
	
		class MainBackground: Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.2;
			y = 0.28;
			w = 0.6125;
			h = 0.32;
		};
	};
	
	class controls 
	{
		class info_text: life_RscStructuredText
		{
			idc = -1;
			text = "Waehle bitte die Fahrzeugfarbe aus die dein Fahrzeug nach der Herstellung haben soll!!"; //--- ToDo: Localize;
			x = 0.212499;
			y = 0.300001;
			w = 0.5875;
			h = 0.15;
			colorBackground[] = {0,0,0,0.7};
		};
	
		class ColorAuswahl: life_RscCombo
		{
			idc = 45904;
			x = 0.374999;
			y = 0.50;
			w = 0.225;
			h = 0.04;
		};
	
		class OkButtonKey: life_RscButtonMenu
		{
			idc = -1;
			text = "Bestaetigen"; //--- ToDo: Localize;
			onButtonClick = "[true] spawn life_fnc_VehicleSpawn;";
			x = 0.505001;
			y = 0.609999;
			w = 0.3075;
			h = 0.04;
		};
		
		class CloseButtonKey: life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.199499;
			y = 0.609999;
			w = 0.3000;
			h = 0.04;
		};
	
	};
};