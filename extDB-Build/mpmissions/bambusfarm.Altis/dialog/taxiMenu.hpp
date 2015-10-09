class bambusfarm_taxiMenu {

	idd = 679905443;
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
class _backgroundMain: bambusfarm_RscText
{
	idc = -1;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.402187 * safezoneW;
	h = 0.143 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class _taxiPic: bambusfarm_RscPicture
{
	idc = -1;
	text = "textures\Taxi.paa";
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.143 * safezoneH;
	colorText[] = {0,0,0,1};
	colorBackground[] = {0,0,0,1};
	colorActive[] = {0,0,0,1};
};
	};
	class controls {
class _btn_Kavala: bambusfarm_RscButtonMenu
{
	idc = -1;
	text = "Kavala"; //--- ToDo: Localize;
	action = "[] execVM ""scripts\TaxiKavala.sqf"";";
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class _btnAthira: bambusfarm_RscButtonMenu
{
	idc = -1;
	text = "Athira"; //--- ToDo: Localize;
	action = "[] execVM ""scripts\TaxiAthira.sqf"";";
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class _btnSofia: bambusfarm_RscButtonMenu
{
	idc = -1;
	text = "Sofia"; //--- ToDo: Localize;
	action = "[] execVM ""scripts\TaxiSofia.sqf"";";
	x = 0.510312 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class _btnPyrgos: bambusfarm_RscButtonMenu
{
	idc = -1;
	text = "Pyrgos"; //--- ToDo: Localize;
	action = "[] execVM ""scripts\TaxiPyrgos.sqf"";";
	x = 0.608281 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
	};
	
};