	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			class PictureHealth: life_RscPicture
			{
				idc = -1;
				text = "icons\health.paa";
				x = 0.290314 * safezoneW + safezoneX;
				y = 0.0381873 * safezoneH + safezoneY;
				w = 0.0458333 * safezoneW;
				h = 0.0659743 * safezoneH;
				colorBackground[] = {0,0,0,0.9};
			};
			class pictureHunger: life_RscPicture
			{
				idc = -1;
				text = "icons\food.paa";
				x = 0.369376 * safezoneW + safezoneX;
				y = 0.0381801 * safezoneH + safezoneY;
				w = 0.0458333 * safezoneW;
				h = 0.0659743 * safezoneH;
				colorBackground[] = {0,0,0,0.9};
			};
			class pictureWater: life_RscPicture
			{
				idc = -1;
				text = "icons\water.paa";
				x = 0.583646 * safezoneW + safezoneX;
				y = 0.0381801 * safezoneH + safezoneY;
				w = 0.0458333 * safezoneW;
				h = 0.0659743 * safezoneH;
				colorBackground[] = {0,0,0,0.9};
			};
			class pictureBattery: life_RscPicture
			{
				idc = -1;
				text = "icons\battery.paa";
				x = 0.662709 * safezoneW + safezoneX;
				y = 0.0381906 * safezoneH + safezoneY;
				w = 0.0458333 * safezoneW;
				h = 0.0659743 * safezoneH;
				colorBackground[] = {0,0,0,0.9};
			};
			class logoPicture: life_RscPicture
			{
				idc = -1;
				//text = "#(argb,8,8,3)color(1,1,1,1)";
				text = "images\acryl.paa";
				x = 0.447292 * safezoneW + safezoneX;
				y = 0.0205952 * safezoneH + safezoneY;
				w = 0.103125 * safezoneW;
				h = 0.15394 * safezoneH;
			};			
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
		};   
 	};