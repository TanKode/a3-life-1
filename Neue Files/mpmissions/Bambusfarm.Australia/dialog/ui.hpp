#define INFINITE 1e+1000
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_BAR_MONEY 2204
#define IDC_LIFE_BAR_BANK 2205
#define IDC_LIFE_MAIN_DISP 2203
#define IDC_LIFE_BAR_BATTERY 2206
#define IDC_LIFE_BAR_EXP 2207
#define IDC_LIFE_PICTURE_FOOD 1200
#define IDC_LIFE_PICTURE_WATER 1201
#define IDC_LIFE_PICTURE_HEALTH 1202
#define IDC_LIFE_PICTURE_BATTERY 1203
#define IDC_LIFE_PICTURE_MONEY 1204
#define IDC_LIFE_PICTURE_BANK 1205
#define IDC_LIFE_FOOD_TEXT 1000
#define IDC_LIFE_WATER_TEXT 1001
#define IDC_LIFE_HEALTH_TEXT 1002
#define IDC_LIFE_MONEY_TEXT 1003
#define IDC_LIFE_BANK_TEXT 1004
#define IDC_LIFE_BATTERY_TEXT 1005
#define IDC_LIFE_AIRDROPWAIT_TEXT 1006
#define IDC_LIFE_AIRDROPEND_TEXT 1007
#define IDC_LIFE_LEVELAKTUELL_TEXT 1008
#define IDC_LIFE_EXP_TEXT 1009
#define IDC_LIFE_LEVELNEXT_TEXT 1010
#define IDC_LIFE_EVENTSTART_PIC 3001
#define IDC_LIFE_EVENTEND_PIC 3002
#define IDC_LIFE_AIRDROPWAIT_PIC 3004
#define IDC_LIFE_AIRDROPEND_PIC 3005
/*
        Name: Dillon "Itsyuka" Modine-Thuen
        File: ui.hpp
*/
class playerHUD {
        idd = -1;
        duration = INFINITE;
        movingEnable = 0;
        fadein = 0;
        fadeout = 0;
        name = "playerHUD";
        onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
        objects[] = {};
        controls[] = {
                LIFE_UI_BACK,
                LIFE_BAR_FOOD,
                LIFE_BAR_WATER,
                LIFE_BAR_HEALTH,
				LIFE_BAR_BATTERY,
				LIFE_BAR_MONEY,
				LIFE_BAR_BANK,
				LIFE_BAR_EXP,
                LIFE_PICTURE_FOOD,
                LIFE_PICTURE_WATER,
                LIFE_PICTURE_HEALTH,
				LIFE_PICTURE_BATTERY,
				LIFE_PICTURE_MONEY,
				LIFE_PICTURE_BANK,
				LIFE_EVENTSTART_PIC,
				LIFE_EVENTEND_PIC,
				LIFE_AIRDROPWAIT_PIC,
				LIFE_AIRDROPEND_PIC,
                LIFE_FOOD_TEXT,
                LIFE_WATER_TEXT,
                LIFE_HEALTH_TEXT,
				LIFE_BATTERY_TEXT,
				LIFE_MONEY_TEXT,
				LIFE_BANK_TEXT,
				LIFE_AIRDROPWAIT_TEXT,
				LIFE_AIRDROPEND_TEXT,
				LIFE_EXP_TEXT,
				LIFE_LEVELNEXT_TEXT,
				LIFE_LEVELAKTUELL_TEXT
        };
		
		/* Background */
        class LIFE_UI_BACK: Life_RscBackground
        {
                idc = IDD_LIFE_MAIN_DISP;
                colorBackground[] = {0,0,0,0.5};
                x = 0.917656 * safezoneW + safezoneX;
                y = 0.485 * safezoneH + safezoneY;
                w = 0.0836 * safezoneW;
                h = 0.243 * safezoneH;
        };
 
        /* Progress Bars */
		  class LIFE_BAR_EXP: Life_RscProgress
        {
                idc = IDC_LIFE_BAR_EXP;
                x = 0.932281 * safezoneW + safezoneX;
                y = 0.496 * safezoneH + safezoneY;
                w = 0.056275 * safezoneW;
                h = 0.022 * safezoneH;
        };
        class LIFE_BAR_FOOD: Life_RscProgress
        {
                idc = IDC_LIFE_BAR_FOOD;
                x = 0.938281 * safezoneW + safezoneX;
                y = 0.53 * safezoneH + safezoneY;
                w = 0.061875 * safezoneW;
                h = 0.022 * safezoneH;
        };
        class LIFE_BAR_WATER: Life_RscProgress
        {
                idc = IDC_LIFE_BAR_WATER;
                x = 0.938281 * safezoneW + safezoneX;
                y = 0.563 * safezoneH + safezoneY;
                w = 0.061875 * safezoneW;
                h = 0.022 * safezoneH;
        };
        class LIFE_BAR_HEALTH: Life_RscProgress
        {
                idc = IDC_LIFE_BAR_HEALTH;
                x = 0.938281 * safezoneW + safezoneX;
                y = 0.596 * safezoneH + safezoneY;
                w = 0.061875 * safezoneW;
                h = 0.022 * safezoneH;
        };
		class LIFE_BAR_BATTERY: Life_RscProgress
        {
                idc = IDC_LIFE_BAR_BATTERY;
                x = 0.938281 * safezoneW + safezoneX;
                y = 0.629 * safezoneH + safezoneY;
                w = 0.061875 * safezoneW;
                h = 0.022 * safezoneH;
        };
		class LIFE_BAR_MONEY: Life_RscProgress
        {
                idc = IDC_LIFE_BAR_BANK;
                x = 0.938281 * safezoneW + safezoneX;
                y = 0.662 * safezoneH + safezoneY;
                w = 0.061875 * safezoneW;
                h = 0.022 * safezoneH;
        };
		class LIFE_BAR_BANK: Life_RscProgress
        {
                idc = IDC_LIFE_BAR_BANK;
                x = 0.938281 * safezoneW + safezoneX;
                y = 0.695 * safezoneH + safezoneY;
                w = 0.061875 * safezoneW;
                h = 0.022 * safezoneH;
        };
		/* Text */
 		 class LIFE_EXP_TEXT: Life_RscText
        {
                idc = IDC_LIFE_EXP_TEXT;
                text = "";
                x = 0.931281 * safezoneW + safezoneX;
                y = 0.5013 * safezoneH + safezoneY;
                w = 0.060625 * safezoneW;
                h = 0.011 * safezoneH;
				sizeEx=0.025;
        };
	 	class LIFE_LEVELAKTUELL_TEXT: Life_RscText
        {
                idc = IDC_LIFE_LEVELAKTUELL_TEXT;
                text = "";
                x = 0.919813 * safezoneW + safezoneX;
                y = 0.5013 * safezoneH + safezoneY;
                w = 0.020625 * safezoneW;
                h = 0.011 * safezoneH;
				sizeEx=0.03;
        };
		class LIFE_LEVELNEXT_TEXT: Life_RscText
        {
                idc = IDC_LIFE_LEVELNEXT_TEXT;
                text = "";
                x = 0.987813 * safezoneW + safezoneX;
                y = 0.5013 * safezoneH + safezoneY;
                w = 0.020625 * safezoneW;
                h = 0.011 * safezoneH;
				sizeEx=0.03;
        };
        class LIFE_FOOD_TEXT: Life_RscText
        {
                idc = IDC_LIFE_FOOD_TEXT;
                text = "";
                x = 0.958906 * safezoneW + safezoneX;
                y = 0.5343 * safezoneH + safezoneY;
                w = 0.020625 * safezoneW;
                h = 0.011 * safezoneH;
				sizeEx=0.03;
        };
        class LIFE_WATER_TEXT: Life_RscText
        {
                idc = IDC_LIFE_WATER_TEXT;
                text = "";
                x = 0.958905 * safezoneW + safezoneX;
                y = 0.5673 * safezoneH + safezoneY;
                w = 0.020625 * safezoneW;
                h = 0.011 * safezoneH;
				sizeEx=0.03;
        };
        class LIFE_HEALTH_TEXT: Life_RscText
        {
                idc = IDC_LIFE_HEALTH_TEXT;
                text = "";
                x = 0.958906 * safezoneW + safezoneX;
                y = 0.6003 * safezoneH + safezoneY;
                w = 0.020625 * safezoneW;
                h = 0.011 * safezoneH;
				sizeEx=0.03;
        };
        class LIFE_BATTERY_TEXT: Life_RscText
        {
                idc = IDC_LIFE_BATTERY_TEXT;
                text = "";
                x = 0.958906 * safezoneW + safezoneX;
                y = 0.6333 * safezoneH + safezoneY;
                w = 0.020625 * safezoneW;
                h = 0.011 *safezoneH;
				sizeEx=0.03;
        };
		class LIFE_MONEY_TEXT: Life_RscText
        {
                idc = IDC_LIFE_MONEY_TEXT;
                text = "";
                x = 0.943906 * safezoneW + safezoneX;
                y = 0.6663 * safezoneH + safezoneY;
                w = 0.060625 * safezoneW;
                h = 0.011 *safezoneH;
				sizeEx=0.03;
        };
		class LIFE_BANK_TEXT: Life_RscText
        {
                idc = IDC_LIFE_BANK_TEXT;
                text = "";
                x = 0.943906 * safezoneW + safezoneX;
                y = 0.6993 * safezoneH + safezoneY;
                w = 0.060625 * safezoneW;
                h = 0.011 *safezoneH;
				sizeEx=0.03;
        };
		class LIFE_AIRDROPWAIT_TEXT: Life_RscText
        {
                idc = IDC_LIFE_AIRDROPWAIT_TEXT;
                text = "";
                x = safeZoneX+safeZoneW*0.43; 
				y = safeZoneY+0.45;
				w=0.5;
				h=0.05;
				sizeEx=0.03;
				size=1.1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 0 , 0 , 0.8 };
				shadow=true;
        };
		class LIFE_AIRDROPEND_TEXT: Life_RscText
        {
                idc = IDC_LIFE_AIRDROPEND_TEXT;
                text = "";
                x = safeZoneX+safeZoneW*0.43; 
				y = safeZoneY+0.45;
				w=0.5;
				h=0.05;
				sizeEx=0.03;
				size=1.1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 0 , 0 , 0.8 };
				shadow=true;
        };
		/* Icons */
		class LIFE_PICTURE_FOOD: life_RscPicture
		{
				idc = IDC_LIFE_PICTURE_FOOD;
				text = "icons\food.paa";
				x = 0.922813 * safezoneW + safezoneX;
				y = 0.53 * safezoneH + safezoneY;
				w = 0.03; h = 0.04;
		};
		class LIFE_PICTURE_WATER: life_RscPicture
		{
				idc = IDC_LIFE_PICTURE_WATER;
				text = "icons\water.paa";
				x = 0.922813 * safezoneW + safezoneX;
				y = 0.563 * safezoneH + safezoneY;
				w = 0.03; h = 0.04;
		};
		class LIFE_PICTURE_HEALTH: life_RscPicture
		{
				idc = IDC_LIFE_PICTURE_HEALTH;
				text = "icons\health.paa";
				x = 0.922813 * safezoneW + safezoneX;
				y = 0.596 * safezoneH + safezoneY;
				w = 0.03; h = 0.04;
		};
		class LIFE_PICTURE_BATTERY: life_RscPicture
		{
				idc = IDC_LIFE_PICTURE_BATTERY;
				text = "icons\battery.paa";
				x = 0.922813 * safezoneW + safezoneX;
				y = 0.629 * safezoneH + safezoneY;
				w = 0.03; h = 0.04;
		};
		class LIFE_PICTURE_MONEY: life_RscPicture
		{
				idc = IDC_LIFE_PICTURE_MONEY;
				text = "icons\money.paa";
				x = 0.922813 * safezoneW + safezoneX;
				y = 0.662 * safezoneH + safezoneY;
				w = 0.03; h = 0.04;
		};
		class LIFE_PICTURE_BANK: life_RscPicture
		{
				idc = IDC_LIFE_PICTURE_BANK;
				text = "icons\bank.paa";
				x = 0.922813 * safezoneW + safezoneX;
				y = 0.695 * safezoneH + safezoneY;
				w = 0.03; h = 0.04;
		};
		class LIFE_EVENTSTART_PIC : Life_RscPicture
		{
				idc =  IDC_LIFE_EVENTSTART_PIC;
				text = "icons\EventStart.paa";
				x = safeZoneX+safeZoneW*0.42; 
				y = safeZoneY+safeZoneH*0.1;
				w = 0.45; h = 0.2;
		};		
		class LIFE_EVENTEND_PIC : Life_RscPicture
		{
				idc =  IDC_LIFE_EVENTEND_PIC;
				text = "icons\EventEnd.paa";
				x = safeZoneX+safeZoneW*0.42; 
				y = safeZoneY+safeZoneH*0.1;
				w = 0.45; h = 0.2;
		};	
		class LIFE_AIRDROPWAIT_PIC : Life_RscPicture
		{
				idc = IDC_LIFE_AIRDROPWAIT_PIC;
				text = "icons\AirDropEventWait.paa";
				x = safeZoneX+safeZoneW*0.45; 
				y = safeZoneY+safeZoneH*0.1;
				w = 0.35; h = 0.25;
		};	
		class LIFE_AIRDROPEND_PIC : Life_RscPicture
		{
				idc = IDC_LIFE_AIRDROPEND_PIC;
				text = "icons\AirDropEventEnd.paa";
				x = safeZoneX+safeZoneW*0.45; 
				y = safeZoneY+safeZoneH*0.1;
				w = 0.35; h = 0.25;
		};	
};
/*
		class batteryHIcon : life_RscPicture
		{
				
			idc = -1;
			text = "icons\battery.paa";
			x = safeZoneX+safeZoneW-0.11; y = safeZoneY+safeZoneH-0.610;
			w = 0.02; h = 0.03;
		};	
		
			class moneybHIcon : life_RscPicture
			{
				
				idc = -1;
				text = "icons\money.paa";
				x = safeZoneX+safeZoneW-0.11; y = safeZoneY+safeZoneH-0.560;
				w = 0.02; h = 0.03;
			};	
		
			class EventStart : Life_RscPicture
			{
				idc = 23547;
				text = "icons\EventStart.paa";
				x = safeZoneX+safeZoneW*0.42; y = safeZoneY+safeZoneH*0.1;
				w = 0.45; h = 0.2;
			};	
			
			class EventEnd : Life_RscPicture
			{
				idc = 23548;
				text = "icons\EventEnd.paa";
				x = safeZoneX+safeZoneW*0.42; y = safeZoneY+safeZoneH*0.1;
				w = 0.45; h = 0.2;
			};	
			
			class AirDropPicWait : Life_RscPicture
			{
				idc = 23549;
				text = "icons\AirDropEventWait.paa";
				x = safeZoneX+safeZoneW*0.45; y = safeZoneY+safeZoneH*0.1;
				w = 0.35; h = 0.25;
			};	
			
			class AirDropPicEnd : Life_RscPicture
			{
				idc = 23550;
				text = "icons\AirDropEventEnd.paa";
				x = safeZoneX+safeZoneW*0.45; y = safeZoneY+safeZoneH*0.1;
				w = 0.35; h = 0.25;
			};	
		
		class controls
		{
			class foodtext
			{
				type=0;
				idc=23500;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class watertext
			{
				type=0;
				idc=23510;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class healthtext
			{
				type=0;
				idc=23515;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			
			class batterytext
			{
				type=0;
				idc=23520;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};	
			
			//Display Total Money
			class moneyltext
			{
				type=0;
				idc=23525;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class moneybtext
			{
				type=0;
				idc=23530;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class event1btext
			{
				type=0;
				idc=23545;
				style=0;
				x = safeZoneX+safeZoneW*0.43; 
				y = safeZoneY+0.45;
				w=0.5;
				h=0.05;
				sizeEx=0.03;
				size=1.1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 0 , 0 , 0.8 };
				shadow=true;
				text="";
			};
			
			class event2btext
			{
				type=0;
				idc=23546;
				style=0;
				x = safeZoneX+safeZoneW*0.41; 
				y = safeZoneY+0.45;
				w=0.85;
				h=0.05;
				sizeEx=0.03;
				size=1.1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 0 , 0 , 0.8 };
				shadow=true;
				text="";
			};
		};   
 	};
	*/