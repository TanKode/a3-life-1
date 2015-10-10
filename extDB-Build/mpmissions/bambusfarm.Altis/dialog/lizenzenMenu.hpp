class life_lizenzen_menu
{
	idd = 2900;
	name = "life_lizenzen_menu";
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground {
        class MainBackground: life_RscText
        {
        	idc = 1000;
        	x = 0.2;
        	y = 0.16;
        	w = 0.5;
        	h = 0.6;
        	colorBackground[] = {0,0,0,0.5};
        };
	};

	class controls
	{
        class Liste: life_RscListbox
        {
        	idc = 1500;
        	x = 0.225;
        	y = 0.2;
        	w = 0.45;
        	h = 0.52;
        };
        class closeButton: life_RscButtonMenu
        {
        	x = 0.55;
        	y = 0.78;
        	w = 0.15;
        	h = 0.08;
        };
	};
};