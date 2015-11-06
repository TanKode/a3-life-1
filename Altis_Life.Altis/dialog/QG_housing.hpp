class housingSettings {

	idd = 6990;
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
	
	class life_RscTitleBackground:life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.9 - (22 / 250);
		};
		
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Haus Menu";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		//Information
		class InfoHousing : Life_RscStructuredText
		{
			idc = 7100;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.3;
			w = 0.4; 
			h = 0.6;
		};
		
		class Info2Housing : Life_RscStructuredText
		{
			idc = 7101;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.34;
			w = 0.4; 
			h = 0.6;
		};
		
		class Info3Housing : Life_RscStructuredText
		{
			idc = 7102;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.38;
			w = 0.4; 
			h = 0.6;
		};
		
		class Info4Housing : Life_RscStructuredText
		{
			idc = 7103;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.42;
			w = 0.4; 
			h = 0.6;
		};
		
		class Info5Housing : Life_RscStructuredText
		{
			idc = 7104;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.46;
			w = 0.4; 
			h = 0.6;
		};
		
		class Info6Housing : Life_RscStructuredText
		{
			idc = 7105;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.5;
			w = 0.4; 
			h = 0.6;
		};

		class Info9Housing : Life_RscStructuredText
		{
			idc = 7108;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.54;
			w = 0.4; 
			h = 0.6;
		};

		class Info7Housingmietzeit : Life_RscStructuredText
		{
			idc = 7106;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.54;
			w = 0.4; 
			h = 0.6;
		};
		class Info8Housingmieteverl : Life_RscStructuredText
		{
			idc = 7107;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.58;
			w = 0.4; 
			h = 0.6;
		};
		
		class Info9Housalarmanlage : Life_RscStructuredText
		{
			idc = 7108;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.62;
			w = 0.4; 
			h = 0.6;
		};
		class Info10Drogenkuche : Life_RscStructuredText
		{
			idc = 7109;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.66;
			w = 0.4; 
			h = 0.6;
		};
		class Info11Alarmjaodernein : Life_RscStructuredText
		{
			idc = 7110;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.58;
			w = 0.4; 
			h = 0.6;
		};
		class Info11Kuechejaodernein : Life_RscStructuredText
		{
			idc = 7111;
			text = "";
			sizeEx = 0.035;
			
			x = 0.14;
			y = 0.62;
			w = 0.4; 
			h = 0.6;
		};
	};

	
	class controls {
		
		class VerkaufFeld : life_RscButtonMenu {
			
			idc = 7200;
			text = "$STR_HOUSING_VERKAUFEN";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
			
			x = 0.55;
			y = 0.70;
			w = (6.25 / 20);
			h = (1 / 25);
			
		};
		
		class StorageFeld : life_RscButtonMenu {
			
			idc = 7201;
			text = "$STR_HOUSING_KISTE";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
			
			x = 0.55;
			y = 0.4;
			w = (6.25 / 20);
			h = (1 / 25);
			
		};
		
		class LightFeld : life_RscButtonMenu {
			
			idc = 7202;
			text = "$STR_HOUSING_LICHT";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;";
			
			x = 0.55;
			y = 0.46;
			w = (6.25 / 20);
			h = (1 / 25);
			
		};
		
		class AusparkenFeld : life_RscButtonMenu {
			
			idc = 7203;
			text = "$STR_HOUSING_AUSPARKEN";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[life_pInact_curTarget,player] spawn life_fnc_vehicleGarage_housing; closeDialog 0;";
			
			x = 0.55;
			y = 0.52;
			w = (6.25 / 20);
			h = (1 / 25);
			
		};
		
		class EinparkenFeld : life_RscButtonMenu {
			
			idc = 7204;
			text = "$STR_HOUSING_EINPARKEN";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[life_pInact_curTarget,player] spawn life_fnc_vehicleGarage_housingeinparken; closeDialog 0;";
			
			x = 0.55;
			y = 0.58;
			w = (6.25 / 20);
			h = (1 / 25);
			
		};
		
		class SchlafenFeld : life_RscButtonMenu {
			
			idc = 7205;
			text = "$STR_HOUSING_SCHLAFEN";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[life_pInact_curTarget,player] spawn life_fnc_sleep; closeDialog 0;";
			
			x = 0.55;
			y = 0.64;
			w = (6.25 / 20);
			h = (1 / 25);
			
		};

		class Mietzeit : life_RscButtonMenu {
			
			idc = 7206;
			text = "Mietzeit anschauen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[getPosATL cursorTarget,0] spawn life_fnc_QG_GetRentDate; closeDialog 0;";
			
			x = 0.55;
			y = 0.28;
			w = (6.25 / 20);
			h = (1 / 25);
			
		};

		class Mietzeitverl : life_RscButtonMenu {
			
			idc = 7207;
			text = "Mietzeit verlaengern";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[getPosATL cursorTarget,1,life_pInact_curTarget] spawn life_fnc_QG_GetRentDate; closeDialog 0;";
			
			x = 0.55;
			y = 0.34;
			w = (6.25 / 20);
			h = (1 / 25);
			
		};

		
		class Alarmfeld : life_RscButtonMenu {
			
			idc = 7208;
			text = "Alarm abstellen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[life_pInact_curTarget] call life_fnc_HouseAlarmOff; closeDialog 0;";
			
			x = 0.55;
			y = 0.76;
			w = (6.25 / 20);
			h = (1 / 25);
			
		};
		
		class Drogenkueche : life_RscButtonMenu {
			
			idc = 7209;
			text = "Drogen verarbeiten";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[life_pInact_curTarget] spawn life_fnc_openhousekitchendialog ; closeDialog 0;";
			
			x = 0.55;
			y = 0.82;
			w = (6.25 / 20);
			h = (1 / 25);
			
		};


		
		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.4;
			y = 0.92 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};