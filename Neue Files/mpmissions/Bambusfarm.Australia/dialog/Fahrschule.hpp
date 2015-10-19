class fahrschule {
    idd = 123456;
    name = "fahrschule";
    movingEnable = false;
    enableSimulation = true;
    class controlsBackground {
        class fahrschule_pic: RscPicture
        {
            idc = -1;
            text = "textures\bilder\fahrschule.jpg";
            x = 0.278281 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.433125 * safezoneW;
            h = 0.539 * safezoneH;
        };
    };
    
    class controls {
        class Button_GO: Life_PictureButtonMenu
        {
            idc = -1;
            text = "Bereit"; //--- ToDo: Localize;
            x = 0.670156 * safezoneW + safezoneX;
            y = 0.61 * safezoneH + safezoneY;
            w = 0.0360937 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0.98,0.29,1};
            colorActive[] = {0,0,0,0};
            tooltip = "Los Gehts! "; //--- ToDo: Localize;
            //onButtonClick = "[] spawn life_fnc_fahrschule_abfrage; closeDialog 0;";
            action = "ExecVM ""scripts\fahrschule\Abfrage.sqf"";";
			//colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
        };
        class Button_NO: Life_PictureButtonMenu
        {
            idc = -1;
            text = "CLOSE"; //--- ToDo: Localize;
            x = 0.5825 * safezoneW + safezoneX;
            y = 0.61 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {1,0.051,0,1};
            colorActive[] = {0,0,0,0};
            tooltip = "Ich brauch noch ein Paar Theorie-Stunden!"; //--- ToDo: Localize;
            onButtonClick = "closeDialog 0;";
			//colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
        };
    };
};