/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/

// ███████████████████████████████████████████████████████████████████████
// █████████████████ DYNAMIC MARKET BASIC CONFIGURATION ██████████████████
// ███████████████████████████████████████████████████████████████████████

DYNMARKET_Serveruptime         = 06;   // Serveruptime after restart in hours
DYNMARKET_UseExternalDatabase  = true; // Should the script use the External Database?
DYNMARKET_PriceUpdateInterval  = 0.5;   // After how many minutes should the price be updated?
DYNMARKET_CreateBackups        = true; // Should the server save write the prices regulary into the Database? If false, it will save the prices before Server-restart?
DYNMARKET_CreateBackupInterval = 15;   // After how many updates (PriceUpdateIntervals) should the prices be saved into the Database?
DYNMARKET_UserNotification     = false; // Should the user be informed with a hint whenever the prices got updated?
DYNMARKET_createRandomEvents = true;  // Should random events appear that influence the market?

// █████████████████ USER NOTIFICATION TEXTS  █████████████████

DYNMARKET_UserNotification_Text = 
[
	"Your prices have been updated!",
	"The new prices are being calculated by the server..."
];

// █████████████████ ITEM GROUP CONFIGURATION █████████████████

DYNMARKET_Items_Groups =
[
	["Legal",
		[
			["diamond_cut",-1,1500,6500],
			["gold_processed",-1,1000,5500],
			["oil_processed",-1,800,5200],
			["salt_refined",-1,400,3600],
			["silber_processed",-1,650,4300],
			["iron_refined",-1,800,5200],
			["glass",-1,350,3500],
			["bottledbeer",-1,700,7500],
			["cement",-1,750,3950],
			["copper_refined",-1,800,4000],
			["bottledwhiskey",-1,800,8000],
			["bottles",-1,800,2500],
			["kohle",-1,800,4000]
		],
		0.5
	],
	
	["Illegal", 
		[
			["uran_processed",-1,2000,9100],
			["cocaine_processed",-1,3000,9000],
			["frogslsd",-1,1800,8100],
			["heroin_processed",-1,2500,8000],
			["moonshine",-1,1500,7750],
			["marijuana",-1,1200,7500],
			["meth_processed",-1,2750,8750],
			["bottledshine",-1,2750,9500],
			["turtle_raw",-1,6000,18000],
			["schwefelsaeure",-1,1200,6500]
		],
		0.5
	],
	
	["Fische",
		[
			["salema_raw",-1,10,135],
			["ornate_raw",-1,5,120],
			["mackerel_raw",-1,50,600],
			["mullet_raw",-1,100,1500],
			["tuna_raw",-1,200,2500],
			["catshark_raw",-1,300,3000]
		],
	 	0.5
	],
	
	["Obst",
		[
			["apple",-1,20,150],
			["peach",-1,30,180],
			["birne",-1,10,120],
			["banane",-1,15,125],
			["cerises",-1,20,130]
			//["grapes",-1,10,110]
		],
	 	0.5
	]

];

// █████████████████    ALL SELLABLE ITEMS    █████████████████

DYNMARKET_Items_ToTrack        = 
[	
    //Gang Base 
    //Sandsacke
    ["bunkerbig",500000],
    ["sandsack",250000],
    ["sandsackecke",225000],
    ["sandsackrund",200000],
    //H Mauer small
    ["bunkersmall",1500000],
    ["hsmall",400000],
    ["hsmalleinzel",150000],
    //H Mauer Big
    ["hturm",1000000],
    ["Hbig",550000],
    ["hbarrierEcke",500000],
    ["hBarriereCorridor",400000],
    //Mauer Sonstiges
    ["stachel",450000],
    ["lampsmall",375000],
    ["schranke",400000],
    //Schhiessstand
    ["schiesswand",100000],   
    ["schiesswandfenster",95000],
    ["schiesswandducken",90000],
    ["schiesswandspring",80000],
    ["schiessdeckungmitt",85000],
    ["schiessdeckungducken",75000],
    ["schiessdeckungliegen",70000],
    ["schiessziel",50000],
    ["ziel",150000],
    //deko
    ["camo",75000],
    ["map",300000],
    ["strom",200],
    ["sun",225000],
    ["fire",225000],
    ["helisquare",400000],
    ["helicircle",400000],
    //Groß Gebaeude
    ["bigturm",12000000],
    ["turm",5000000],
    ["cargohq",7500000],
    ["aid",125000],
    //Garage lager  
    ["garage",20000000],
    ["helig",10000000],
    ["lagerhalle",6000000],
    ["cargoschwarz",5000000],
    ["storagebigb",5000000],
    ["cargo",5000000],
    //sonstiges
    ["atm",200],
    ["leiter",1000000],
    ["lamp1",400000],
    ["halogen",450000],
    ["laborb",4000000],
	["base_toolkit",25000],
    ["abrissbirne",50000],
		
    //Jagt
    ["h_eier",200],
    ["craft_zfell",50],
    ["craft_rfell",20],
    ["craft_wolle", 30],
    ["craft_federn",10],
    
    //Bank    
    //["debitcard",-1],   
        
    //Farm items
    ["pickaxe",350],
    ["messer",500],
    ["schaufel",350],
    ["motorsaege",350],
    ["goldsieb",500],
    ["handschuhe",750],
    ["kescher",750],
        
	//Misc
	//["fuelEmpty",-1],
	["fuelFull",500],
    ["fuelPipe",250],
	["spikeStrip",1200],
	["goldbar",150000],
	//["blastingcharge",-1],
	["battery",500],
		
	//["defusekit",-1],
	//["storagesmall",-1],
	//["storagebig",-1],
    ["handcuffs",1000],
    ["gpstracker",2000],
    ["gpssuchgeraet",25000],
    ["bd_mk1_bleachweapon",40000],
    ["bd_mk1_ammo",5000],
    ["bd_mk2_microemp",550000],
    ["bd_mk2_ammo",14000],
    ["speedtrap",3000],    
	["speedtrapdetector",20000],
	["laptop",2000],
  
	//Möbel für Hauserweiterung
    ["furniture_01",14000],
    ["furniture_02",17000],
    ["furniture_03",11000],
    ["furniture_04",18000],
    ["furniture_05",17000],
    
    //EVENT
    ["event_1",1],
    ["event_2",1],
    ["event_3",1],
    ["event_score",1],
      
    //Reb  
    ["bomb",700000],
    ["lockpick",75],
    //["boltcutter",-1],
    ["underwatercharge",20000],
        
    //ADAC
    ["adac_toolkit",250],
    ["repairkit",250],
    ["adac_tow",100],
    ["adac_paint",300],
    ["vehhut",1250],
    ["mauer",1250],
    ["wkasten",1250],
	//[reparaturkrahn,1250],
        
    //Medic
    ["firstaidkit",250],
       
    //Organe
    ["kidney",50000],
    //[bein,-1],
    //[arm,-1],
    //[finger,-1],
    //[sehne,-1],
        
    //Medic Geräte
    ["organttk",1000],
    ["scalpel",1000],
        
    //Tokens für verschiedene Zwecke
    ["token_donator",100],
    ["token_rebel",100],
    ["token_police",100],
        
	//Mined Items
	//["oil_unprocessed",-1],
	["oil_processed",3200],
	//["copper_unrefined",-1],
	["copper_refined",1500],
	//["iron_unrefined",-1],
	["iron_refined",3200],
	//["salt_unrefined",-1],
	["salt_refined",1450],
	//["sand",-1],
	["glass",1450],
	//["diamond_uncut",-1],
	["diamond_cut",6000],
	//["rock",-1],
	["cement",1950],
    ["reingold",75000],
    ["goldbarp",30000], 
    //["silber_unprocessed",-1],
    ["silber_processed",1200], 
    //["gold_unprocessed",-1], 
    ["gold_processed",1600],       
    ["whiskey",5000],
    ["bottledwhiskey",11000],
    ["beerp",4500], 
    ["bottledbeer",10000],
    ["bottles",75], 
    ["hops",1800],
    ["rye",2000], 
    ["yeast",2000],
    ["cornmeal",200],
    ["mash",2000],
    ["moonshine",7000],
    ["bottledshine",15000],
    //["faulbaum",-1],
    ["kohle",3000],
    ["zink",2500],
    ["nickel",3000],
    ["blei",2800],
    ["messing",4000],
    //["schwefel",-1],
    ["schwefelsaeure",3000],
    ["farbstoff",3000],
        
	//illegal
	//["heroin_unprocessed",-1],
	["heroin_processed",2560],
	//["cannabis",-1],
	["marijuana",2500],
	//["cocaine_unprocessed",-1],
	["cocaine_processed",5000],
    //["uran_unprocessed",-1],
    ["uran_processed",5500],
    //["frogs",-1],
    ["frogslsd",2500],
	//["meth_unprocessed",-1],
	["meth_processed",4000],
    ["gluew",3500],
        
	//Drink
	["redgull",200],
	["coffee",5],
	["waterBottle",5],
	["pcolap",200],
	["sotbp",200],
	["maitp",200],
		
	//Food
	["apple",50],
	["peach",55],
	["tbacon",25],
	["donut",60],
	["rabbit_raw",65],
	["rabbit_grilled",115],
	["salema_raw",45],
	["salema_grilled",55],
	["ornate_raw",40],
	["ornate_grilled",150],
	["mackerel_raw",175],
	["mackerel_grilled",200],
	["tuna_raw",700],
	["tuna_grilled",1000],
	["mullet_raw",250],
	["mullet_fried",400],
	["catshark_raw",300],
	["catshark_fried",500],
	["turtle_raw",3000],
	["turtle_soup",1000],
	["hen_raw",35],
	["hen_fried",85],
	["rooster_raw",35],
	["rooster_grilled",85],
	["sheep_raw",50],
	["sheep_grilled",115],
	["goat_raw",75],
	["goat_grilled",135],
    ["huehners",50],
    ["eieromelett",50],
    ["banane",30],
	["birne",30],
	["cerises",30],
		
    //Troll items
    //["troll_taschentuch",-1],
    //["troll_nuckel",3],
    //["troll_bitering",-1],    
    //["troll_money",-1],
        
    //Sonstiges
    ["burglar_tool",2000],
        
    //Baukästen LKW
    //["c_van_box",-1],
    //["c_van_fuel",-1],
    //["i_truck_transport",-1],
    //["i_truck_covered",-1],
    //["o_truck_02_fuel",-1],
    //["o_truck_transport",-1],
    //["o_truck_covered",-1],
    //["o_truck_03_fuel",-1],
    //["o_truck_device",-1],
    //["b_truck_transport",-1],
    //["b_truck_box",-1],
    //["b_truck_fuel",-1],
       
    //Baukästen Heli
    //["b_heli_light",-1],
    //["i_heli_transport",-1],
    //["o_heli_light_02_unarmed",-1],
    
    //Baukästen Jet
    //["o_plane_cas_02",-1],
    //["i_plane_fighter_03",-1],
    
    //Kaufteile für Crafting Vehicle
    ["craft_motor_a",200000],
    ["craft_motor_h",200000],
    ["craft_getriebe_a",150000],
    ["craft_getriebe_h",150000],
    ["craft_kleinteile",10000],
    ["craft_kupplung_a",75000],
    ["craft_kupplung_h",150000],
    ["craft_sondert",250000],
    ["craft_seitenr",60000],
    ["craft_hoehenr",60000],
    ["craft_querr",75000],
    ["craft_pilotensitz",75000],
    ["craft_triebw",350000],
    ["craft_kabine",250000],
    ["craft_instru",100000],
    ["craft_landek",50000],
    
    //Kaufteile für Crafting Weapon
    ["craft_verriegelungs",15000],
    ["craft_verschluss",15000],
    ["craft_sicherungsh",25000],
    ["craft_boden_schlies",45000],
    ["craft_patronenlager",15000],                     
    ["craft_paper",75000],
    ["craft_cheytac",100000],
    ["craft_zweibein",100000],
    ["craft_repetier",150000],
    ["craft_reaver",100000],  
    ["craft_slingshot",150000], 
    ["craft_gewinde",25000], 
    ["craft_epdm",50000],
    ["craft_mineralf",50000], 
    ["craft_edelstahlv",50000],
    ["craft_edelstahll",25000],
    ["craft_kondenzs",25000],
    ["craft_streckmetall",15000],        
    ["craft_daemmkernt",10000],                       
        
    //Kaufteile allgemein
    ["craft_kautschuk",1000],
    
    //Herstellbareteile für Crafting Vehicle
    ["craft_spiegel",100],
    ["craft_reifen",300],
    ["craft_draht",200],
    ["craft_innena",100],
    
    //Herstellbareteile für Crafting Heli
    ["craft_rotor",4000],
    ["craft_pitchk",4000],
    
    //Herstellbareteile für Crafting Jet
    ["craft_tragf",2000],
    ["craft_hoehenf",2000],
    ["craft_seitenf",2000],
    ["craft_rumpf",2000],
    ["craft_fahrg",2000],
        
    //Herstellbareteile für Crafting Heli/Vehicle
    ["craft_dichtung",1000],
    ["craft_karosseriet",1000],
    ["craft_scheibe",2000],
    
    //Herstellbareteile für Crafting Weapon
    ["craft_muendungsf",1000],
    ["craft_rohr",3000],
    ["craft_trageb",2000],
    ["craft_gehause",5000],
    ["craft_hands",2000],
    ["craft_schulters",3000],
    ["patronenh",3000],
    ["schwarzp",2500],
    ["projektil",2000]
        
    //Herstellbareteile für Crafting Klamotten
    //["craft_faden",-1],
    //["craft_stoff",-1],
    //["craft_leder",-1],
    //["craft_sauerflasche",-1],
    //["craft_innenfutter",-1]
        
];

//███████████████████████████████████████████████████████████████████████
//██████████████████ DO NOT MODIFY THE FOLLOWING CODE! ██████████████████
//███████████████████████████████████████████████████████████████████████

DYNMARKET_Items_CurrentPriceArr = [];
DYNMARKET_sellarraycopy = DYNMARKET_Items_ToTrack;
DYNMARKET_Serveruptime = (DYNMARKET_Serveruptime * 3600) - 300;
{
	_currentArray = _x;
	DYNMARKET_Items_CurrentPriceArr pushBack [_currentArray select 0,_currentArray select 1,0];
} forEach DYNMARKET_Items_ToTrack;
publicVariable "DYNMARKET_UserNotification";
publicVariable "DYNMARKET_UserNotification_Text";
if (DYNMARKET_UseExternalDatabase) then {[1] call TON_fnc_HandleDB;};
DYNMARKET_UpdateCount = 0;
if (DYNMARKET_UseExternalDatabase) then {
	[] spawn {
		sleep DYNMARKET_Serveruptime;
		diag_log "### DYNMARKET >> CURRENT PRICES ARE BEING WRITTEN TO THE DATABASE    ###";
		diag_log "### DYNMARKET >> AS PLANNED, AWAITING RESULT...                      ###";
		[0] call TON_fnc_HandleDB;
	};
};
sleep 5;
[] call TON_fnc_sleeper;
