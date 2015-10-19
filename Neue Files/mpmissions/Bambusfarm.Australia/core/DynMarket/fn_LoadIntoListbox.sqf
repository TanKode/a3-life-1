#include <macro.h>
/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/

if (isNil "DYNMARKET_prices") then {[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;hint "Getting current prices from the server..";sleep 1;};

disableSerialization;
_dialog = findDisplay 7100;
_listbox = _dialog displayCtrl 7055;
_blacklist =
[
	//Gang Base 
    //Sandsacke
    "bunkerbig",
    "sandsack",
    "sandsackecke",
    "sandsackrund",
    //H Mauer small
    "bunkersmall",
    "hsmall",
    "hsmalleinzel",
    //H Mauer Big
    "hturm",
    "Hbig",
    "hbarrierEcke",
    "hBarriereCorridor",
    //Mauer Sonstiges
    "stachel",
    "lampsmall",
    "schranke",
    //Schhiessstand
    "schiesswand",
    "schiesswandfenster",
    "schiesswandducken",
    "schiesswandspring",
    "schiessdeckungmitt",
    "schiessdeckungducken",
    "schiessdeckungliegen",
    "schiessziel",
    "ziel",
    //deko
    "camo",
    "map",
    "strom",
    "sun",
    "fire",
    "helisquare",
    "helicircle",
    //Groß Gebaeude
    "bigturm",
    "turm",
    "cargohq",
    "aid",
    //Garage lager  
    "garage",
    "helig",
    "lagerhalle",
    "cargoschwarz",
    "storagebigb",
    "cargo",
    //sonstiges
    "atm",
    "leiter",
    "lamp1",
    "halogen",
    "laborb",
	"base_toolkit",
    "abrissbirne",
		
    //Jagt
    "h_eier",
    "craft_zfell",
    "craft_rfell",
    "craft_wolle",
    "craft_federn",
    
    //Bank    
    //"debitcard", 
        
    //Farm items
    "pickaxe",
    "messer",
    "schaufel",
    "motorsaege",
    "goldsieb",
    "handschuhe",
    "kescher",
        
	//Misc
	//"fuelEmpty",
	"fuelFull",
    "fuelPipe",
	"spikeStrip",
	"goldbar",
	//"blastingcharge",
	"battery",
		
	//"defusekit",
	//"storagesmall",
	//"storagebig",
    "handcuffs",
    "gpstracker",
    "gpssuchgeraet",
    "bd_mk1_bleachweapon",
    "bd_mk1_ammo",
    "bd_mk2_microemp",
    "bd_mk2_ammo",
    "speedtrap",   
	"speedtrapdetector",
	"laptop",
  
	//Möbel für Hauserweiterung
    "furniture_01",
    "furniture_02",
    "furniture_03",
    "furniture_04",
    "furniture_05",
    
    //EVENT
    "event_1",
    "event_2",
    "event_3",
    "event_score",
      
    //Reb  
    "bomb",
    "lockpick",
    //"boltcutter",
    "underwatercharge",
        
    //ADAC
    "adac_toolkit",
    "repairkit",
    "adac_tow",
    "adac_paint",
    "vehhut",
    "mauer",
    "wkasten",
	//reparaturkrahn,
        
    //Medic
    "firstaidkit",
       
    //Organe
    "kidney",
    //bein,
    //arm,
    //finger,
    //sehne,
        
    //Medic Geräte
    "organttk",
    "scalpel",
        
    //Tokens für verschiedene Zwecke
    "token_donator",
    "token_rebel",
    "token_police",
        
	//Mined Items
	//"oil_unprocessed",
	//"oil_processed",
	//"copper_unrefined",
	//"copper_refined",
	//"iron_unrefined",
	//"iron_refined",
	//"salt_unrefined",
	//"salt_refined",
	//"sand",
	//"glass",
	//"diamond_uncut",
	//"diamond_cut",
	//"rock",
	//"cement",
    "reingold",
    "goldbarp", 
    //"silber_unprocessed",
    //"silber_processed", 
    //"gold_unprocessed", 
    //"gold_processed",       
    "whiskey",
    //"bottledwhiskey",
    "beerp", 
    //"bottledbeer",
    //"bottles", 
    "hops",
    "rye", 
    "yeast",
    "cornmeal",
    "mash",
    //"moonshine",
    //"bottledshine",
    //"faulbaum",
    //"kohle",
    "zink",
    "nickel",
    "blei",
    "messing",
    //"schwefel",
    //"schwefelsaeure",
    "farbstoff",
        
	//illegal
	//"heroin_unprocessed",
	//"heroin_processed",
	//"cannabis",
	//"marijuana",
	//"cocaine_unprocessed",
	//"cocaine_processed",
    //"uran_unprocessed",
    //"uran_processed",
    //"frogs",
    //"frogslsd",
	//"meth_unprocessed",
	//"meth_processed",
    "gluew",
        
	//Drink
	"redgull",
	"coffee",
	"waterBottle",
	"pcolap",
	"sotbp",
	"maitp",
		
	//Food
	//"apple",
	//"peach",
	"tbacon",
	"donut",
	"rabbit_raw",
	"rabbit_grilled",
	//"salema_raw",
	"salema_grilled",
	//"ornate_raw",
	"ornate_grilled",
	//"mackerel_raw",
	"mackerel_grilled",
	//"tuna_raw",
	"tuna_grilled",
	//"mullet_raw",
	"mullet_fried",
	//"catshark_raw",
	"catshark_fried",
	//"turtle_raw",
	"turtle_soup",
	"hen_raw",
	"hen_fried",
	"rooster_raw",
	"rooster_grilled",
	"sheep_raw",
	"sheep_grilled",
	"goat_raw",
	"goat_grilled",
    "huehners",
    "eieromelett",
    //"banane",
	//"birne",
	//"cerises",
		
    //Troll items
    //"troll_taschentuch",
    //"troll_nuckel",
    //"troll_bitering",    
    //"troll_money",
        
    //Sonstiges
    "burglar_tool",
        
    //Baukästen LKW
    //"c_van_box",
    //"c_van_fuel",
    //"i_truck_transport",
    //"i_truck_covered",
    //"o_truck_02_fuel",
    //"o_truck_transport",
    //"o_truck_covered",
    //"o_truck_03_fuel",
    //"o_truck_device",
    //"b_truck_transport",
    //"b_truck_box",
    //"b_truck_fuel",
       
    //Baukästen Heli
    //"b_heli_light",
    //"i_heli_transport",
    //"o_heli_light_02_unarmed",
    
    //Baukästen Jet
    //"o_plane_cas_02",
    //"i_plane_fighter_03",
    
    //Kaufteile für Crafting Vehicle
    "craft_motor_a",
    "craft_motor_h",
    "craft_getriebe_a",
    "craft_getriebe_h",
    "craft_kleinteile",
    "craft_kupplung_a",
    "craft_kupplung_h",
    "craft_sondert",
    "craft_seitenr",
    "craft_hoehenr",
    "craft_querr",
    "craft_pilotensitz",
    "craft_triebw",
    "craft_kabine",
    "craft_instru",
    "craft_landek",
    
    //Kaufteile für Crafting Weapon
    "craft_verriegelungs",
    "craft_verschluss",
    "craft_sicherungsh",
    "craft_boden_schlies",
    "craft_patronenlager",                    
    "craft_paper",
    "craft_cheytac",
    "craft_zweibein",
    "craft_repetier",
    "craft_reaver", 
    "craft_slingshot", 
    "craft_gewinde",
    "craft_epdm",
    "craft_mineralf",
    "craft_edelstahlv",
    "craft_edelstahll",
    "craft_kondenzs",
    "craft_streckmetall",       
    "craft_daemmkernt",                      
    
    //Kaufteile allgemein
    "craft_kautschuk",

    //Herstellbareteile für Crafting Vehicle
    "craft_spiegel",
    "craft_reifen",
    "craft_draht",
    "craft_innena",
    
    //Herstellbareteile für Crafting Heli
    "craft_rotor",
    "craft_pitchk",
    
    //Herstellbareteile für Crafting Jet
    "craft_tragf",
    "craft_hoehenf",
    "craft_seitenf",
    "craft_rumpf",
    "craft_fahrg",
        
    //Herstellbareteile für Crafting Heli/Vehicle
    "craft_dichtung",
    "craft_karosseriet",
    "craft_scheibe",
    
    //Herstellbareteile für Crafting Weapon
    "craft_muendungsf",
    "craft_rohr",
    "craft_trageb",
    "craft_gehause",
    "craft_hands",
    "craft_schulters",
    "patronenh",
    "schwarzp",
    "projektil"
        
    //Herstellbareteile für Crafting Klamotten
    //"craft_faden",
    //"craft_stoff",
    //"craft_leder",
    //"craft_sauerflasche",
    //"craft_innenfutter",
 ];

{
	_itemName = _x select 0;
	_itemDisplayName = M_CONFIG(getText,"VirtualItems",_itemName,"displayname");
	_itemDisplayIcon = M_CONFIG(getText,"VirtualItems",_itemName,"icon");
	_itemDisplayName = localize _itemDisplayName;
	if!(_x select 0 in _blacklist) then {		
		_listbox lbAdd format ["%1",_itemDisplayName];
		_listbox lbSetData [(lbSize _listbox)-1,_x select 0];
		_listbox lbSetPicture [(lbSize _listbox )-1,_itemDisplayIcon];
	};
} forEach DYNMARKET_prices;