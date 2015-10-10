class life_info
{
	idd = 989898;
	name = "life_info";
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground {
		class backgroundMain: life_RscText
        {
        	idc = 1000;
        	x = 0.05;
        	y = 0.08;
        	w = 0.9;
        	h = 0.84;
        	colorBackground[] = {0,0,0,0.5};
        };

		class titelInfo: life_RscText
        {
        	idc = 1616;
        	text = "Infos..."; //--- ToDo: Localize;
        	x = 0.05;
        	y = 0.04;
        	w = 0.9;
        	h = 0.04;
        	colorBackground[] = {0,0,0,1};
        };
	};

	class controls
	{
		class RscStructuredText_1100: life_RscStructuredText
        {
        	idc = 2400;
        	x = 0.4;
        	y = 0.12;
        	w = 0.525;
        	h = 0.76;
        };
        class RscListbox_1500: life_RscListbox
        {
            onLBSelChanged = "[] call life_fnc_infoMenu;";
            sizeEx = 0.03;
        	idc = 1500;
        	x = 0.075;
        	y = 0.12;
        	w = 0.3;
        	h = 0.76;
        };
        class buttonClose: life_RscButtonMenu
        {
        	idc = 5354;
        	text = "Schliessen..."; //--- ToDo: Localize;
        	onButtonClick = "closeDialog 0;";
        	x = 0.7875;
        	y = 0.94;
        	w = 0.1625;
        	h = 0.06;
        };
	};
};
