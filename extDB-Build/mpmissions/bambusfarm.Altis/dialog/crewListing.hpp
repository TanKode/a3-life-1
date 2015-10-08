#define INFINITE 1e+1000

class crewListing
{
    idd = -1;
    duration = INFINITE;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "crewListing";
	onLoad = "uiNamespace setVariable ['crewListing', _this select 0]";
	onUnload = "uiNamespace setVariable ['crewListing', objNull]";
	onDestroy = "uiNamespace setVariable ['crewListing', objNull]";
    objects[] = {};
    controls[] = {
            crewListingText
    };

	class crewListingText: bambusfarm_RscText
	{
		idc = 1005;
		x = 0.901042 * safezoneW + safezoneX;
		y = 0.873854 * safezoneH + safezoneY";
		w = 0.0859375 * safezoneW;
		h = 0.109957 * safezoneH;
		shadow = 1;
		font = "puristaLight";
		size = 0.030;
		type = 13;
		style = 1;
		text="";
		class Attributes {
			align="left";
			color = "#FFFF00";
		};
	};
};