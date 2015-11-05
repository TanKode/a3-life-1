/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["187V",1]};                 //Menschen ueberfahren
	case "187": {_type = ["187",1]};                   //Mord
	case "901": {_type = ["901",1]};                   //Gefaengnisausbruch
	case "261": {_type = ["261",50000]};               //Raub
	case "261A": {_type = ["261A",13000]};             //Versuchter Raub
	case "215": {_type = ["215",3000]};                //Versuchter Autodiebstahl
	case "213": {_type = ["213",110000]};              //Benutzen von Sprengstoff
	case "211": {_type = ["211",15000]};               //Spieler ausgeraubt
	case "411A": {_type = ["411A",25000]};             //Tankstellenraub
	case "46A": {_type = ["46A",12500]};               //Versuchter Tankstellenraub
	case "207": {_type = ["207",1]};                   //Kidnapping
	case "207A": {_type = ["207A",1]};                 //Versuchtes Kidnapping
	case "487": {_type = ["487",11500]};               //Diebstahl (hoher Sachschaden)
	case "488": {_type = ["488",1700]};                //Diebstahl (geringer Sachschaden)
	case "480": {_type = ["480",200000]};              //Fahrerflucht
	case "481": {_type = ["481",250000]};              //Drogenbesitz (kleine Mengen)
	case "482": {_type = ["482",1]};                   //Drogenbesitz (großeMengen)
	case "483": {_type = ["483",1]};                   //Drogenhandel
	case "42A": {_type = ["42A",10000]};               //Gluecksspiel
	case "43A": {_type = ["43A",10000]};               //Radar gehackt
	case "800": {_type = ["800",4000]};                //Foltern
	case "459": {_type = ["459",1]};                   //Bankueberfall
	case "460": {_type = ["460",10000]};               //Hauseinbruch
	case "919": {_type = ["919",20000]};               //Organhandel
	case "390": {_type = ["390",50000]};               //Trunkenheit in der Oeffentlichkeit
	case "902": {_type = ["902",1]};                   //Gefaengnis Fluchthilfe
	case "903": {_type = ["903",300000]};              //Gefaengnis Fluchthilfe versucht
	case "customtype": {_type = ["customtype",100]};           //Geschwindigkeit
	case "weapon": {_type = ["weapon",75000]};                 //Waffenbesitz Illegaler Waffen
	case "policeitems": {_type = ["policeitems",100000]};      //Besitz von Polizeieigentum
	
	case "1": {_type = ["1",10000]};        //Fahren ohne Fuehrerschein/B   
	case "2": {_type = ["2",15000]};        //Fahren ohne Fuehrerschein/C
    case "3": {_type = ["3",2000]};         //Fahren ohne Licht
	case "4": {_type = ["4",8000]};         //Fahren auf falescher Strassenseite
    case "5": {_type = ["5",6000]};         //Gefaehrliche Fahrweise
    case "6": {_type = ["6",50000]};        //Landen in einer Flugverbotszone
    case "7": {_type = ["7",50000]};        //Fahren von Illegalen Fahrzeugen
    case "8": {_type = ["8",1500]};         //Unfallverursacher/Fahrerflucht nach Unfall
	case "9": {_type = ["9",1500]};         //Fahrerflucht
    case "10": {_type = ["10",30000]};      //Fahrerflucht vor der Polizei
    case "11": {_type = ["11",1]};          //Ueberfahren eines Zivilisten
	case "12": {_type = ["12",1]};          //Ueberfahren eines Polizisten
	case "13": {_type = ["13",60000]};      //Fahrlässige Toetung eines Zivilisten
    case "14": {_type = ["14",100000]};     //Fahrlässige Toetung eines Beamten
    case "15": {_type = ["15",20000]};      //Widerstand gegen die Staatsgewalt
    case "16": {_type = ["16",10000]};      //Beamtenbeleidigung
    case "17": {_type = ["17",15000]};      //Belaestigung eines Polizisten
	case "18": {_type = ["18",50000]};      //Beschuss/Verletzen eines Beamten
    case "19": {_type = ["19",15000]};      //Waffenbesitz ohne Lizenz
    case "20": {_type = ["20",30000]};      //Mit gez. Waffe durch Stadt
    case "21": {_type = ["21",60000]};      //Besitz einer verbotenen Waffe
    case "22": {_type = ["22",5000]};       //Schusswaffengebrauch innerhalb Stadt
    case "23": {_type = ["23",50000]};      //Geiselnahme
    case "24": {_type = ["24",10000]};      //Ueberfall auf Personen/Fahrzeuge
    case "25": {_type = ["25",150000]};     //Bankraub
    case "26": {_type = ["26",10000]};      //Fliegen/Schweben unterhalb 150m ueber Stadt
    case "27": {_type = ["27",20000]};      //Fliegen ohne Fluglizenz
	case "28": {_type = ["28",10000]};      //Alkohol/Drogen am Steuer
	case "29": {_type = ["29",30000]};      //Angriff durch Rebellen
	case "30": {_type = ["30",25000]};      //Angriff/Belagerung von Hauptstaedten
	case "31": {_type = ["31",20000]};      //Landen ohne Genehmigung
	case "32": {_type = ["32",3000]};       //Dauerhaftes Hupen
	case "33": {_type = ["33",100000]};     //Punktelimit erreicht
	case "34": {_type = ["34",1]};          //Mord
	case "35": {_type = ["35",20000]};      //Aufstand
	case "36": {_type = ["36",20000]};      //Illegale Strassensperren
	case "37": {_type = ["37",10000]};      //Diebstahl Zivilfahrzeuge
	case "38": {_type = ["38",20000]};      //Diebstahl Beamtenfahrzeuge
	case "39": {_type = ["39",1]};          //Ausbruch JVA
	case "40": {_type = ["40",20000]};      //Organhandel
	case "41": {_type = ["41",20000]};      //Falschparken
	case "42": {_type = ["42",10000]};      //Umweltverschmutzung
	case "43": {_type = ["43",10000]};      //Vermummung in Staedten
	case "44": {_type = ["44",10000]};		//Diebstahl
	case "45": {_type = ["45",15000]};		//Körperverletzung
	case "46": {_type = ["46",25000]};		//Versuchter Tankstellenraub
	case "47": {_type = ["47",25000]};		//Gefährliche Körperverletzung
	case "48": {_type = ["48",15000]};      //Versuchter Geldautomatenraub
    
    case "120H": {_type = ["120H",20000]};       //Fahrzeuglizenzen entzogen
    case "120FS": {_type = ["120FS",25000]};     //Gesuchter Raser
    case "120S": {_type = ["120S",30000]};       //Bussgeld/Ordnungshaft
    case "120FSWL":{_type = ["120FSWL",35000]};  //Strafrechtlich Gesuchter Raser
	
	case "240": {_type = ["240",25000]};            //Geldautomaten Raub
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.

_result = format["wantedGetCrimes:%1",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;

_val = [(_type select 1)] call DB_fnc_numberSafe;

if(count _queryResult != 0) then
{
	_pastCrimes = _queryResult select 1;
	_pastCrimes pushBack (_type select 0);
	_query = format["wantedUpdateCrimes:%1:%2:%3",_pastCrimes,_val,_uid];
} else {
	_crimes = [(_type select 0)];
	_query = format["wantedInsertCrimes:%1:%2:%3:%4:1",_uid,_name,_crimes,_val];
};

if(!isNil "_query") then {
	waitUntil{!DB_Async_Active};
	[_query,2] call DB_fnc_asyncCall;
};