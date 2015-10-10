class life_menu
{
	idd = 3453774;
	name = "life_menu";
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground {
		class pictureLogo: life_RscPicture
        {
        	idc = 1200;
        	text = "bambusfarm\Texturen\logo.jpg";
        	x = 0.65;
        	y = 0.36;
        	w = 0.175;
        	h = 0.2;
        };

        class mainBackground: life_RscText
        {
        	idc = 1000;
        	x = 0.175;
        	y = 0.32;
        	w = 0.675;
        	h = 0.4;
        	colorBackground[] = {0,0,0,0.5};
        };
	};

	class controls
	{
		class buttonOne: life_RscButtonMenu
        {
        	idc = 37450;
        	text = "Markt"; //--- ToDo: Localize;
			onButtonClick = "createDialog ""life_dynmarket_prices"";";
        	x = 0.2;
        	y = 0.36;
        	w = 0.2;
        	h = 0.08;
        };
        class buttonTwo: life_RscButtonMenu
        {
        	idc = 37451;
        	text = "Level"; //--- ToDo: Localize;
			onButtonClick = "[] call life_fnc_SkillSys";
        	x = 0.425;
        	y = 0.36;
        	w = 0.2;
        	h = 0.08;
        };
        class buttonThree: life_RscButtonMenu
        {
        	idc = 37452;
        	text = "Bauen"; //--- ToDo: Localize;
			onButtonClick = "createDialog ""life_craft"";";
        	x = 0.2;
        	y = 0.48;
        	w = 0.2;
        	h = 0.08;
        };
        class buttonFour: life_RscButtonMenu
        {
        	idc = 37453;
        	text = "Infos/regeln"; //--- ToDo: Localize;
			onButtonClick = "[0] spawn life_fnc_infoMenu";
        	x = 0.425;
        	y = 0.48;
        	w = 0.2;
        	h = 0.08;
        };
        class buttonFive: life_RscButtonMenu
        {
        	idc = 37454;
        	text = "Knopf"; //--- ToDo: Localize;
			onButtonClick = "hint ""Error 404: System not Found""";
        	x = 0.2;
        	y = 0.6;
        	w = 0.2;
        	h = 0.08;
        };
        class buttonSix: life_RscButtonMenu
        {
        	idc = 37455;
        	text = "Knopf"; //--- ToDo: Localize;
			onButtonClick = "hint ""Error 404: System not Found""";
        	x = 0.425;
        	y = 0.6;
        	w = 0.2;
        	h = 0.08;
        };
        class buttonClose: life_RscButtonMenu
        {
        	idc = 2406;
        	text = "Schliessen"; //--- ToDo: Localize;
        	onButtonClick = "closeDialog 0;";
        	x = 0.65;
        	y = 0.6;
        	w = 0.175;
        	h = 0.08;
        };
	};
};