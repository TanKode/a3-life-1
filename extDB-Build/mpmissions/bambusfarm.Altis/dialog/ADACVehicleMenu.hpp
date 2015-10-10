class life_ADACVehicleMenu
{
    idd = 44000;
    movingEnable = true;
    enableSimulation = true;
    
    class controlsBackground
    {
        class Title: life_RscStructuredText
        {
            idc = -1;
            text = "ADAC - Fahrzeugmenü";
            x = 0.125;
            y = 0;
            w = 0.7375;
            h = 0.04;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        };
        class Background: life_RscBackground
        {
            idc = -1;
            x = 0.125;
            y = 0.04;
            w = 0.7375;
            h = 0.84;
            colorBackground[] = {0,0,0,0.7};
        };     
    };
    
    class Controls
    {
        class Frame: life_RscFrame
        {
            idc = -1;
            x = 0.1375;
            y = 0.06;
            w = 0.425;
            h = 0.8;
        };        
        class Vehiclepartlist: life_RscListbox
        {
            idc = 1;
            x = 0.1375;
            y = 0.06;
            w = 0.425;
            h = 0.8;
            sizeEx = 0.04;
            onLBSelChanged = "[6]call life_fnc_ADACVehicleMenu";
        };  
        class Input: life_RscEdit
        {
            idc = 2;
            text = "";
            colorBackground[] = {0,0,0,0};
            x = 0.575;
            y = 0.2;
            w = 0.275;
            h = 0.06;
        };        
        class Button1: life_RscButtonMenu
        {
            idc = 3;
            onButtonClick = "[0] spawn life_fnc_ADACVehicleMenu";
            text = "Einzelteil reparieren";
            x = 0.575;
            y = 0.06;
            w = 0.275;
            h = 0.06;
        };
        class Button2: life_RscButtonMenu
        {
            idc = 4;
            onButtonClick = "[1] spawn life_fnc_ADACVehicleMenu";
            text = "Komplett reparieren";
            x = 0.575;
            y = 0.128;
            w = 0.275;
            h = 0.06;
        };
        class Button3: life_RscButtonMenu
        {
            idc = -1;
            onButtonClick = "[2] spawn life_fnc_ADACVehicleMenu";
            text = "Auftanken in %";
            x = 0.575;
            y = 0.272;
            w = 0.275;
            h = 0.06;
        };
        class Button4: life_RscButtonMenu
        {
            idc = -1;
            onButtonClick = "[3] spawn life_fnc_ADACVehicleMenu";
            text = "Transportieren";
            x = 0.57452;
            y = 0.340067;
            w = 0.275;
            h = 0.06;
        };
        class Button5: life_RscButtonMenu
        {
            idc = -1;
            onButtonClick = "[4] spawn life_fnc_ADACVehicleMenu";
            text = "Parkkralle";
            x = 0.574495;
            y = 0.407407;
            w = 0.275;
            h = 0.06;
        };
        class Button6: life_RscButtonMenu
        {
            idc = -1;
            text = "Abschleppen";
            onButtonClick = "[7] spawn life_fnc_ADACVehicleMenu";
            x = 0.575;
            y = 0.474949;
            w = 0.275;
            h = 0.06;
        };     
        class Button7: life_RscButtonMenu
        {
            idc = -1;
            text = "Umdrehen";
            onButtonClick = "[8] spawn life_fnc_ADACVehicleMenu";
            x = 0.575;
            y = 0.542491;
            w = 0.275;
            h = 0.06;
        };  
        class Button8: life_RscButtonMenu
        {
            idc = -1;
            text = "Eigentümer";
            onButtonClick = "[9] spawn life_fnc_ADACVehicleMenu";
            x = 0.575;
            y = 0.610033;
            w = 0.275;
            h = 0.06;
        };                       
        class Button9: life_RscButtonMenu
        {
            idc = -1;
            onButtonClick = "closeDialog 0";
            text = "Schließen";
            x = 0.125;
            y = 0.884;
            w = 0.1625;
            h = 0.04;
        };
    };
};