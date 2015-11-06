class agb
{
	idd = 32154;
	name = "agb";
	movingEnable = false;
	enableSimulation = false;
	
	class controlsBackground
	{
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.0875;
			y = 0.06;
			w = 0.825;
			h = 0.04;
		};
		
		class RscBackground : Life_RscText
		{
			colorBackground[] = {0.31,0.31,0.31,1};
			idc = -1;
			x = 0.0875;
			y = 0.12;
			w = 0.825;
			h = 0.92;
		};
		
		class RscTitleText : Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Willkommen auf dem Bambusfarm Alits Life Server!";
			x = 0.0875;
			y = 0.06;
			w = 0.825;
			h = 0.04;
			
			class Attributes
			{
				align = "center";
			};
		};
		
		class RsclolStatus : Life_RscStructuredText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			sizeEx = 0.0001;
			text = "<t font ='PuristaBold' size='0.9'>Wichtige Serverregeln!</t><br/><t size = '0.8'>Unerwünschtes Fehlverhalten führt ggf. zu Bann<br / >§1: Hacking / Cheating / Duping / Belleidigungen<br / >§1.1: Selbstmord / Disconect um sich dem Rollenspiel zu entziehen.<br / >§1.2: Bugs/Exploites ausnutzen - im Zweifel Admin fragen<br / >§2:RP wird bei uns Groß geschrieben. Hällst du dich nicht an das RP, hast du hier nichts verloren!<br / >§3: RDM / VDM wird sofort geahndet und die Täter gebannt.<br / ><br / >Unsere Kontaktdaten: <br / >TS³ ts.bambusfarm.net<br / >Homepage http:bambusfarm.net<br / >Hinweis: Wir suchen noch ADAC/Medics und Polizisten. Bewerbungen im Forum.<br / ></t><t font ='PuristaBold' size='0.9'>Um auf den Bambusfarm Server spielen zu können musst du die Regeln Akzeptieren und verpflichtest dich dazu diese einzuhalten!!!<br/>mfg die Admins!<br/>Wir wünschen euch viel spaß auf unserem Server!</t>";
			x = 0.1125;
			y = 0.16;
			w = 0.775;
			h = 0.76;
		};
	};
	
	class Controls
	{
		class naz : Life_RscButtonMenu
		{
			idc = -1;
			text = "Nicht Akzeptieren";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			onButtonClick = "closeDialog 0;";
			x = 0.1075;
			y = 0.98;
			w = 0.3;
			h = 0.04;
			
			class Attributes
			{
				align = "center";
			};
		};
		
		class az : Life_RscButtonMenu
		{
			idc = -1;
			text = "Akzeptieren";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			onButtonClick = "rulesok = true; closeDialog 0;";
			x = 0.5825;
			y = 0.98;
			w = 0.3;
			h = 0.04;
			
			class Attributes
			{
				align = "center";
			};
		};
	};
};