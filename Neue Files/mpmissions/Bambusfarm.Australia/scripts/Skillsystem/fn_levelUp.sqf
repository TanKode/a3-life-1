#include <macro.h>
/*
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private[];
_onScreenTime = 5;
_levelUpAnzeige = [];

[] spawn BIS_fnc_earthquake; 
uiSleep 2;
[
	"<img size='7' image='icons\levelup.paa'/>",
	[safezoneX + safezoneW - 1.5,0.50],
	[safezoneY + safezoneH - 1.5,0.7]
]spawn BIS_fnc_dynamicText;

0.1 fadesound 0.3;   
playsound "levelUp";   
0.1 fadesound 1;
uiSleep 5;
_level = LEVEL;

switch(_level) do {
	case 1:
	{
		life_firstSpawn = false;
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 1!"];
		_role2 = "Neue Kleidung:";
		_role2names = ["Neue Rucksäcke", "Neue Zivilbekleidung"];
		_role3 = "Neue Fahrzeuge:";
		_role3names = ["Quadbike"];
		_role4 = "Neue Funktionen";
		_role4names = ["Birnen farmen", "Kirchen farmen", "Bananen farmen"];
		_role5 = "Zusatz:";
		_role5names = ["Neuer Skillpunkt"];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]]
	};
	
	case 2:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 2!"];
		_role2 = "Neue Kleidung:";
		_role2names = ["Neue Rucksäcke", "Neue Zivilbekleidung"];
		_role3 = "Neue Fahrzeuge:";
		_role3names = ["Limousine", "Rettungsboot"];
		_role4 = "Neue Funktionen";
		_role4names = ["Spawnpunkt: Sydney", "Kupfer farmen", "Eisen farmen", "Holz farmen"];
		_role5 = "Zusatz:";
		_role5names = ["Neuer Skillpunkt"];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]]
	};
	
	case 3:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 3!"];
		_role2 = "Neue Legale Waffen:";
		_role2names = ["Rook-40", "ACP-C2", "4-five", "PDW2000"];
		_role3 = "Neue Fahrzeuge:";
		_role3names = ["Geländewagen"];
		_role4 = "Neue Funktionen";
		_role4names = ["Sand farmen", "Öl farmen", "Steine farmen", "Jagen", "Kreditkarte"];
		_role5 = "Zusatz:";
		_role5names = ["Neuer Skillpunkt"];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]]
	};
	
	case 4:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 4!"];
		_role2 = "Neue Kleidung:";
		_role2names = ["Neue Rucksäcke", "Neue Zivilbekleidung"];
		_role3 = "Neue Fahrzeuge:";
		_role3names = ["SUV", "Truck Transport", "Truck Box", "Tanktruck"];
		_role4 = "Neue Funktionen";
		_role4names = ["Silber farmen", "Gold farmen", "Bier herstellen", "Fahrzeug Versicherung"];
		_role5 = "Zusatz:";
		_role5names = ["Neuer Skillpunkt", "Neue Crafting möglichkeiten"];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]]
	};
	
	case 5:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 5!"];
		_role2 = "Neue Kleidung:";
		_role2names = [ "Neue Rebellenbekleidung"];
		_role3 = "Neue Fahrzeuge:";
		_role3names = ["Sportlimousine", "Zamak Transport", "Zamak abgedeckt", "Tempest Tanker klein", "MH-9 Hummingbird", "M-900"];
		_role4 = "Neue Funktionen";
		_role4names = ["Spawnpunkt: Brisbane, Cairns", "Diamanten farmen", "Müll", "Salz farmen", "Wisky herstellen"];
		_role5 = "Zusatz";
		_role5names = ["2 neue Skillpunkte"];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]]
	};
	
	case 6:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 6!"];
		_role2 = "Neue Rebellengegenstände:";
		_role2names = ["Neue Rebellenbekleidung", "TRG-20", "SDAR", "Vermin MP 45. ACP", "Zubr .45"];
		_role3 = "Neue Fahrzeuge:";
		_role3names = ["HEMTT Transport", "HEMTT Tanker", "Motorboot", "Orca"];
		_role4 = "Neue Funktionen";
		_role4names = ["Rebellenausbildung", "Schwefel farmen", "Marijuana farmen", "Glühwürmchen fangen"];
		_role5 = "Zusatz:";
		_role5names = ["2 neue Skillpunkte", "Neue Crafting möglichkeiten"];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]]
	};
	
	case 7:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 7!"];
		_role2 = "Neue Rebellengegenstände:";
		_role2names = ["Neue Rebellenbekleidung", "MX SW", "Katiba-Karabiner", "Sprengladung"];
		_role3 = "Neue Fahrzeuge:";
		_role3names = ["CH-49 Mohawk", "Tempest Transport", "Tempest Tanker", "Tempest abgedeckt"];
		_role4 = "Neue Funktionen";
		_role4names = ["Spawnpunkt: Perth, Alice Springs", "LSD farmen", "Heroin farmen"];
		_role5 = "Zusatz";
		_role5names = ["2 neue Skillpunkte"];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]]
	};
	
	case 8:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 8!"];
		_role2 = "Neue Rebellengegenstände:";
		_role2names = ["Neue Rebellenbekleidung", "MK18", "MK14", "MK-1 EMR", "Alamut"];
		_role3 = "Neue Fahrzeuge:";
		_role3names = ["HEMTT Box", "Ifrit", "Taru"];
		_role4 = "Neue Funktionen";
		_role4names = ["Spawnpunkt: Darwin Rebelen Stadt", "Uran farmen", "Meth farmen"];
		_role5 = "Zusatz";
		_role5names = ["2 neue Skillpunkte", "Neue Crafting möglichkeiten"];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]]
	};
	
	case 9:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 9!"];
		_role2 = "Neue Rebellenzubehör:";
		_role2names = ["Bombenweste", "Unterwassersprengladung"];
		_role3 = "Neue Fahrzeuge:";
		_role3names = ["Tempest Gerät", "Orca Bewaffnet(Ohne Munititon)"];
		_role4 = "Neue Funktionen";
		_role4names = ["Kokain farmen", "Antiquitäten farmen", "Moonshine"];
		_role5 = "Zusatz";
		_role5names = ["2 neue Skillpunkte"];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]]
	};
	
	case 10:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 10!"];
		_role2 = "Neue Talente:";
		_role2names = ["Sonderfahrzeug", "Häusersloterweiterung"];
		_role3 = "Neue Fahrzeuge:";
		_role3names = ["Geländewagen (Bewaffnet)"];
		_role4 = "Bonuszahlung:";
		_role4names = ["Sie erhalten +1.500.000$ auf ihr Bankkonto!"];
		_role5 = "Zusatz";
		_role5names = ["2 neue Skillpunkte", "Neue Crafting möglichkeiten"];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]];
		
		ADD(BANK,1500000);
	};
	
		case 11:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 11!"];
		_role2 = "Zusatz:";
		_role2names = ["2 neue Skillpunkte"];
		_role3 = "";
		_role3names = [""];
		_role4 = "";
		_role4names = [""];
		_role5 = "";
		_role5names = [""];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]];
	};
	
		case 12:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 12!"];
		_role2 = "Zusatz:";
		_role2names = ["2 neue Skillpunkte"];
		_role3 = "";
		_role3names = [""];
		_role4 = "";
		_role4names = [""];
		_role5 = "";
		_role5names = [""];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]];
	};
	
		case 13:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 13!"];
		_role2 = "Zusatz:";
		_role2names = ["2 neue Skillpunkte"];
		_role3 = "";
		_role3names = [""];
		_role4 = "";
		_role4names = [""];
		_role5 = "";
		_role5names = [""];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]];
	};
	
		case 14:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 14!"];
		_role2 = "Zusatz:";
		_role2names = ["2 neue Skillpunkte"];
		_role3 = "";
		_role3names = [""];
		_role4 = "";
		_role4names = [""];
		_role5 = "";
		_role5names = [""];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]];
	};
	
		case 15:
	{
		_role1 = "LevelUp!";
		_role1names = ["Herzlichen Glueckwunsch neues Level: 15!"];
		_role2 = "Zusatz:";
		_role2names = ["2 neue Skillpunkte"];
		_role3 = "";
		_role3names = [""];
		_role4 = "";
		_role4names = [""];
		_role5 = "";
		_role5names = [""];
		
		_levelUpAnzeige = [[_role1, _role1names],[_role2, _role2names],[_role3, _role3names],[_role4, _role4names],[_role5, _role5names]];
	};
};

{
	uiSleep 3;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.80' color='#CA0A0A' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.60' color='#f2cb0b' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.9);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	uiSleep (_onScreenTime);
} forEach _levelUpAnzeige;