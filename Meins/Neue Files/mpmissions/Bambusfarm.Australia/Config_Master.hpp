#define VITEMMACRO(NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON,LEVEL) class NAME { \
		variable = VARNAME; \
		weight = WEIGHT; \
		displayName = DISPLAYNAME; \
		buyPrice = BUYPRICE; \
		sellPrice = SELLPRICE; \
		illegal = ILLEGAL; \
		edible = EDIBLE; \
		icon = ICON; \
		level = LEVEL; \
	};
	
#define LICENSEMACRO(NAME,DISPLAYNAME,VARNAME,PRICE,ILLEGAL,SIDE,LEVEL) class NAME { \
		variable = VARNAME; \
		displayName = DISPLAYNAME; \
		price = PRICE; \
		illegal = ILLEGAL; \
		side = SIDE; \
		level = LEVEL; \
	};

#define SKILLMACRO(NAME,DISPLAYNAME,VARNAME,LEVEL,SKILLPOINT,ILLEGAL,SIDE,DEPENDENCE,KINDOF,PRICE,INFO) class NAME { \
		variable = VARNAME; \
		displayName = DISPLAYNAME; \
		level = LEVEL; \
		skillpoint = SKILLPOINT; \
		illegal = ILLEGAL; \
		side = SIDE; \
		dependence = DEPENDENCE; \
		kindOf = KINDOF; \
		price = PRICE; \
		info = INFO; \
	};

#define true 1
#define false 0
#include "Config_Clothing.hpp"
#include "Config_Shops.hpp"


/*
	Master settings for various features and functionality	
*/
class Life_Settings {
	/* Persistent Settings */
	save_civ_weapons = true; //Allow civilians to save weapons on them?
	save_virtualItems = true; //Save Virtual items (all sides)?

	/* Revive system settings */
	revive_cops = true; //true to enable cops the ability to revive everyone or false for only medics/ems.
	revive_fee = 6000; //Revive fee that players have to pay and medics / EMS are rewarded
	
	/* House related settings */
	house_limit = 5; //Maximum amount of houses a player can own.
	house_limit_skill1 = 6;
	house_limit_skill2 = 7;
	big_house[] = {"Land_HouseDoubleAL2", "Land_HouseDoubleAL" };
	small_car[] = {"B_Quadbike_01_F", "C_Hatchback_01_F", "C_Offroad_01_F", "C_SUV_01_F", "C_Hatchback_01_sport_F", "C_Van_01_transport_F", "B_G_Offroad_01_F" };
	
	/* Gang related settings */
	gang_price = 10000000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
	gang_upgradeBase = 1000000; //The base cost for upgrading slots in a gang
	gang_upgradeMultiplier = 2.5; //Not sure if in use?

	/* Player-related systems */
	enable_fatigue = false; //Set to false to disable the ARMA 3 false system.
	total_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
	total_maxWeightT = 24;  //Static variable for the maximum weight allowed without having a backpack
	paycheck_period = 5; //Scaled in minutes
	
	/* Impound Variables */
	impound_car_cop = 5000; //Cop Price for impounding cars
	impound_boat_cop = 4000; //Cop Price for impounding boats
	impound_air_cop = 7000; //Cop Price for impounding helicopters / planes
	impount_container_cop = 10000; //Cop Price for impounding container
	impound_car_adac = 7000; //ADAC Price for impounding cars
	impound_boat_adac = 4000; //Cop Price for impounding boats
	impound_air_adac = 10000; //Cop Price for impounding helicopters / planes
	impound_container_adac = 15000; //Cop Price for impounding container
	
	/* Car-shop Settings */
	vehicleShop_rentalOnly[] = { "C_Kart_01_Blu_F", "C_Kart_01_Fuel_F", "C_Kart_01_Red_F", "C_Kart_01_Vrana_F" };

	/* Job-related stuff */
	delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

	crimes[] = { 
		{"STR_Crime_1","20000","1"}, 
		{"STR_Crime_2","8000","2"}, 
		{"STR_Crime_3","2000","3"}, 
		{"STR_Crime_4","8000","4"}, 
		{"STR_Crime_5","6000","5"}, 
		{"STR_Crime_6","50000","6"}, 
		{"STR_Crime_7","50000","7"}, 
		{"STR_Crime_8","1500","8"},
		{"STR_Crime_9","1500","9"},
		{"STR_Crime_10","30000","10"},
		{"STR_Crime_11","1","11"},
		{"STR_Crime_12","1","12"},
		{"STR_Crime_13","60000","13"},
		{"STR_Crime_14","100000","14"},
		{"STR_Crime_15","20000","15"},
		{"STR_Crime_16","10000","16"},
		{"STR_Crime_17","15000","17"},
		{"STR_Crime_18","50000","18"},
		{"STR_Crime_19","15000","19"},
		{"STR_Crime_20","30000","20"},
		{"STR_Crime_21","60000","21"},
		{"STR_Crime_22","5000","22"},
		{"STR_Crime_23","50000","23"},
		{"STR_Crime_24","10000","24"},
		{"STR_Crime_25","150000","25"},
		{"STR_Crime_26","10000","26"},
		{"STR_Crime_27","20000","27"},
		{"STR_Crime_28","10000","28"},
		{"STR_Crime_29","30000","29"},
		{"STR_Crime_30","25000","30"},
		{"STR_Crime_31","20000","31"},
		{"STR_Crime_32","3000","32"},
		{"STR_Crime_33","100000","33"},
		{"STR_Crime_34","1","34"},
		{"STR_Crime_35","20000","35"},
		{"STR_Crime_36","20000","36"},
		{"STR_Crime_37","10000","37"},
		{"STR_Crime_38","20000","38"},
		{"STR_Crime_39","1","39"},
		{"STR_Crime_40","20000","40"},
		{"STR_Crime_41","20000","41"},
		{"STR_Crime_42","10000","42"},
		{"STR_Crime_43","10000","43"},
		{"STR_Crime_44","10000","44"},
		{"STR_Crime_45","15000","45"},
		{"STR_Crime_46","25000","46"},
		{"STR_Crime_47","25000","47"},
		{"STR_Crime_48","15000","48"}
	};
	
	sellArray[] = {
		{"arifle_sdar_F",7500},
		{"hgun_P07_snds_F",650},
		{"hgun_P07_F",1500},
		{"Binocular",50},
		{"ItemGPS",45},
		{"ToolKit",75},
		{"FirstAidKit",65},
		{"Medikit",450},
		{"NVGoggles",980},
		{"16Rnd_9x21_Mag",15},
		{"20Rnd_556x45_UW_mag",35},
		{"ItemMap",35},
		{"ItemCompass",25},
		{"Chemlight_blue",50},
		{"Chemlight_yellow",50},
		{"Chemlight_green",50},
		{"Chemlight_red",50},
		{"hgun_Rook40_F",500},
		{"arifle_Katiba_F",5000},
		{"30Rnd_556x45_Stanag",65},
		{"20Rnd_762x51_Mag",85},
		{"30Rnd_65x39_caseless_green",50},
		{"DemoCharge_Remote_Mag",7500},
		{"SLAMDirectionalMine_Wire_Mag",2575},
		{"optic_ACO_grn",250},
		{"acc_flashlight",100},
		{"srifle_EBR_F",15000},
		{"arifle_TRG21_F",3500},
		{"optic_MRCO",5000},
		{"optic_Aco",850},
		{"arifle_MX_F",7500},
		{"arifle_MXC_F",5000},
		{"arifle_MXM_F",8500},
		{"MineDetector",500},
		{"optic_Holosight",275},
		{"acc_pointer_IR",175},
		{"arifle_TRG20_F",2500},
		{"SMG_01_F",1500},
		{"arifle_Mk20C_F",4500},
		{"30Rnd_45ACP_Mag_SMG_01",60},
		{"30Rnd_9x21_Mag",30},
		{"B_9x21_Ball",50},
		{"launch_RPG32_F",1000}
	};

	allowedSavedVirtualItems[] = { "carCharger","firetonne","lautsp","stuhl2","stuhl","abrissbirne","base_toolkit","laborb","halogen","lamp1","leiter","atm","cargo","storagebigb","cargoschwarz","lagerhalle","helig","garage","aid","cargohq","turm","bigturm","helicircle","helisquare","fire","sun","strom","map","camo","ziel","schiessziel","schiessdeckungliegen","schiessdeckungducken","schiessdeckungmitt","schiesswandspring","schiesswandducken","schiesswandfenster","schiesswand","schranke","lampsmall","stachel","hBarriereCorridor","hbarrierEcke","Hbig","hturm","hsmalleinzel","hsmall","bunkersmall","sandsackrund","sandsackecke","sandsack","bunkerbig","craft_innenfutter", "craft_sauerflasche", "craft_leder", "craft_stoff", "craft_faden", "craft_schulters", "craft_hands", "craft_gehause", "craft_trageb", "craft_rohr", "craft_muendungsf", "craft_scheibe", "craft_karosseriet", "craft_dichtung", "craft_fahrg", "craft_rumpf", "craft_seitenf", "craft_hoehenf", "craft_tragf", "craft_pitchk", "craft_rotor", "craft_innena", "craft_draht", "craft_reifen", "craft_spiegel", "craft_kautschuk", "craft_daemmkernt", "craft_streckmetall", "craft_kondenzs", "craft_edelstahll", "craft_edelstahlv", "craft_mineralf", "craft_epdm", "craft_gewinde", "craft_slingshot", "craft_reaver", "craft_repetier", "craft_zweibein", "craft_cheytac", "craft_patronenlager", "craft_boden_schlies", "craft_sicherungsh", "craft_verschluss", "craft_verriegelungs", "craft_landek", "craft_instru", "craft_kabine", "craft_triebw", "craft_pilotensitz", "craft_querr", "craft_hoehenr", "craft_seitenr", "craft_sondert", "craft_kupplung_h", "craft_kupplung_a", "craft_kleinteile", "craft_getriebe_h", "craft_getriebe_a", "craft_motor_h", "craft_motor_a", "i_plane_fighter_03", "o_plane_cas_02", "o_heli_light_02_unarmed", "i_heli_transport", "b_heli_light", "b_truck_fuel", "b_truck_box", "b_truck_transport", "o_truck_device", "o_truck_03_fuel", "o_truck_covered", "o_truck_transport", "o_truck_02_fuel", "i_truck_covered", "i_truck_transport", "c_van_fuel", "c_van_box", "troll_money", "troll_bitering", "troll_nuckel", "troll_taschentuch", "maitp", "sotbp", "pcolap", "cerises", "birne", "banane", "eieromelett", "huehners", "goat_Grilled", "goat_Raw", "sheep_Grilled", "sheep_Raw", "rooster_Grilled", "rooster_Raw", "hen_Fried", "hen_Raw", "catshark_Fried", "catshark_Raw", "mullet_Fried", "mullet_Raw", "tuna_Grilled", "tuna_Raw", "mackerel_Grilled", "mackerel_Raw", "ornate_Grilled", "ornate_Raw", "salema_Grilled", "salema_Raw", "rabbit_Grilled", "rabbit_Raw", "donut", "tbacon", "peach", "apple", "waterBottle", "coffee", "redgull", "mash", "cornmeal", "yeast", "rye", "hops","beerp", "bottles", "bottledbeer", "bottledWhiskey", "whiskey", "gold_processed", "gold_unprocessed", "silber_processed", "silber_unprocessed", "reingold", "cement", "rock", "diamond_cut", "diamond_uncut", "glass", "sand", "salt_refined", "salt_unrefined", "iron_refined", "iron_unrefined", "copper_refined", "copper_unrefined", "oil_processed", "oil_unprocessed", "organttk", "kidney", "firstaidkit", "mauer", "vehhut","wkasten", "adac_paint", "adac_tow", "repairkit", "adac_toolkit", "event_score", "event_3", "event_2", "event_1", "furniture_05", "furniture_04", "furniture_03", "furniture_02", "furniture_01", "bd_mk2_ammo", "bd_mk2_microemp", "bd_mk1_ammo", "bd_mk1_bleachweapon", "gpstracker", "handcuffs", "storageBig", "storageSmall", "defuseKit", "battery", "blastingCharge", "spikeStrip", "fuelFull", "fuelEmpty", "schaufel", "goldsieb", "handschuhe", "pickaxe", "messer", "heier", "craft_zfell", "craft_wolle", "craft_federn", "debitcard", "motorsaege", "faulbaum", "kohle", "zink", "nickel", "blei", "messing", "schwefel", "schwefelsaeure", "kescher", "farbstoff", "patronenh", "schwarzp", "projektil" };
	illegalweapons[] = { "arifle_MXC_Black_F", "arifle_MX_Black_F", "arifle_MX_SW_Black_F", "arifle_MXM_Black_F", "arifle_MX_F", "arifle_MX_GL_F", "arifle_MXM_F",	"srifle_EBR_SOS_F",	"LMG_Mk200_F", "srifle_EBR_F", "launch_O_Titan_short_F", "launch_B_Titan_short_F", "Titan_AP", "MiniGrenade", "HandGrenade", "arifle_Katiba_C_F", "arifle_Katiba_F", "arifle_Mk20C_F", "arifle_Mk20C_plain_F", "arifle_Mk20_GL_plain_F", "arifle_Mk20_F", "arifle_Mk20_plain_F", "srifle_DMR_01_F",	"arifle_TRG20_F", "srifle_DMR_01_F", "srifle_EBR_SOS_F", "LMG_Zafir_F", "SMG_01_F",	"SMG_02_F",	"DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "SmokeShellYellow", "1Rnd_SmokeYellow_Grenade_shell", "UGL_FlareWhite_F", "launch_RPG32_F", "arifle_MX_SW_F", "RPG32_F", "launch_NLAW_F", "NLAW_F" };
};
/*
	Virtual Items
	
	Params:
	NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON,LEVEL
*/
class VirtualItems {
    //Gang Base 
    //Sandsacke
    VITEMMACRO(bunkerbig, "STR_Item_Bunkerbig", "bunkerbig", 1, 1000000, 500000, false, -1, "icons\bunkerbig.paa", -1)
    VITEMMACRO(sandsack, "STR_Item_Sandsack", "sandsack", 1, 500000, 250000, false, -1, "icons\sandsack.paa", -1)
    VITEMMACRO(sandsackecke, "STR_Item_Sandsackecke", "sandsackecke", 1, 450000, 225000, false, -1, "icons\sandsackecke.paa", -1) //eintragen neu
    VITEMMACRO(sandsackrund, "STR_Item_Sandsackrund", "sandsackrund", 1, 400000, 200000, false, -1, "icons\sandsackrund.paa", -1) //eintragen neu
    //H Mauer small
    VITEMMACRO(bunkersmall, "STR_Item_Bunkersmall", "bunkersmall", 1, 3000000, 1500000, false, -1, "icons\bunkersmall.paa", -1)
    VITEMMACRO(hsmall, "STR_Item_Hsmall", "hsmall", 1, 800000, 400000, false, -1, "icons\hsmall.paa", -1)
    VITEMMACRO(hsmalleinzel, "STR_Item_Hsmalleinzel", "hsmalleinzel", 1, 200000, 100000, false, -1, "icons\hsmalleinzel.paa", -1) //eintragen neu
    //H Mauer Big
    VITEMMACRO(hturm, "STR_Item_Hturm", "hturm", 1, 2000000, 1000000, false, -1, "icons\hturm.paa", -1)
    VITEMMACRO(Hbig, "STR_Item_Hbig", "Hbig", 1, 1100000, 550000, false, -1, "icons\Hbig.paa", -1)
    VITEMMACRO(hbarrierEcke, "STR_Item_HbarrierEcke", "hbarrierEcke", 1, 1000000, 500000, false, -1, "icons\hbarrierEcke.paa", -1)
    VITEMMACRO(hBarriereCorridor, "STR_Item_hBarriereCorridor", "hBarriereCorridor", 1, 800000, 400000, false, -1, "icons\hBarriereCorridor.paa", -1)
    //Mauer Sonstiges
    VITEMMACRO(stachel, "STR_Item_Stachel", "stachel", 1, 90000, 45000, false, -1, "icons\stachel.paa", -1)
    VITEMMACRO(lampsmall, "STR_Item_Lampsmall", "lampsmall", 1, 75000, 37500, false, -1, "icons\lampsmall.paa", -1)
    VITEMMACRO(schranke, "STR_Item_Schranke", "schranke", 1, 80000, 40000, false, -1, "icons\schranke.paa", -1)
    //Schhiessstand
    VITEMMACRO(schiesswand, "STR_Item_Schiesswand", "schiesswand", 1, 20000, 10000, false, -1, "icons\schiesswand.paa", -1)    
    VITEMMACRO(schiesswandfenster, "STR_Item_Schiesswandfenster", "schiesswandfenster", 1, 19000, 9500, false, -1, "icons\schiesswandfenster.paa", -1)
    VITEMMACRO(schiesswandducken, "STR_Item_Schiesswandducken", "schiesswandducken", 1, 18000, 9000, false, -1, "icons\schiesswandducken.paa", -1)
    VITEMMACRO(schiesswandspring, "STR_Item_Schiesswandspring", "schiesswandspring", 1, 16000, 80000, false, -1, "icons\schiesswandspring.paa", -1)
    VITEMMACRO(schiessdeckungmitt, "STR_Item_Schiessdeckungmitt", "schiessdeckungmitt", 1, 17000, 85000, false, -1, "icons\schiessdeckungmitt.paa", -1)
    VITEMMACRO(schiessdeckungducken, "STR_Item_Schiessdeckungducken", "schiessdeckungducken", 1, 15000, 75000, false, -1, "icons\schiessdeckungducken.paa", -1)
    VITEMMACRO(schiessdeckungliegen, "STR_Item_Schiessdeckungliegen", "schiessdeckungliegen", 1, 14000, 70000, false, -1, "icons\schiessdeckungliegen.paa", -1)
    VITEMMACRO(schiessziel, "STR_Item_Schiessziel", "schiessziel", 1, 10000, 5000, false, -1, "icons\schiessziel.paa", -1)
    VITEMMACRO(ziel, "STR_Item_Ziel", "ziel", 1, 30000, 15000, false, -1, "icons\ziel.paa", -1)
    //deko
    VITEMMACRO(camo, "STR_Item_Camo", "camo", 1, 500000, 75000, false, -1, "icons\camo.paa", -1)
    VITEMMACRO(map, "STR_Item_Map", "map", 1, 6000, 3000, false, -1, "icons\map.paa", -1)
    VITEMMACRO(strom, "STR_Item_Strom", "strom", 1, 1000, 200, false, -1, "icons\strom.paa", -1)
    VITEMMACRO(sun, "STR_Item_Sun", "sun", 1, 4500, 225000, false, -1, "icons\sun.paa", -1)
    VITEMMACRO(fire, "STR_Item_Fire", "fire", 1, 4500, 2250, false, -1, "icons\fire.paa", -1)
    VITEMMACRO(stuhl, "STR_Item_Stuhl", "stuhl", 1, 450, 225, false, -1, "icons\stuhl.paa", -1)
    VITEMMACRO(stuhl2, "STR_Item_Stuhl2", "stuhl2", 1, 450, 225, false, -1, "icons\stuhl2.paa", -1)
    VITEMMACRO(lautsp, "STR_Item_Lautsp", "lautsp", 1, 450, 225, false, -1, "icons\lautsp.paa", -1)
    VITEMMACRO(firetonne, "STR_Item_Firetonne", "firetonne", 1, 450, 225, false, -1, "icons\firetonne.paa", -1)
    VITEMMACRO(helisquare, "STR_Item_Helisquare", "helisquare", 1, 8000, 4000, false, -1, "icons\helisquare.paa", -1)
    VITEMMACRO(helicircle, "STR_Item_Helicircle", "helicircle", 1, 8000, 4000, false, -1, "icons\helicircle.paa", -1)
    //Groß Gebaeude
    VITEMMACRO(bigturm, "STR_Item_Bigturm", "bigturm", 1, 25000000, 12000000, false, -1, "icons\bigturm.paa", -1)
    VITEMMACRO(turm, "STR_Item_Turm", "turm", 1, 10000000, 5000000, false, -1, "icons\turm.paa", -1)
    VITEMMACRO(cargohq, "STR_Item_Cargohq", "cargohq", 1, 15500000, 7500000, false, -1, "icons\cargohq.paa", -1)
    VITEMMACRO(aid, "STR_Item_Aid", "aid", 1, 2500000, 1250000, false, -1, "icons\aid.paa", -1)
    //Garage lager  
    VITEMMACRO(garage, "STR_Item_Garage", "garage", 1, 30000000, 15000000, false, -1, "icons\garage.paa", -1)
    VITEMMACRO(helig, "STR_Item_Helig", "helig", 1, 20000000, 10000000, false, -1, "icons\helig.paa", -1)
    VITEMMACRO(lagerhalle, "STR_Item_Lagerhalle", "lagerhalle", 1, 12000000, 6000000, false, -1, "icons\lagerhalle.paa", -1)
    VITEMMACRO(cargoschwarz, "STR_Item_Cargoschwarz", "cargoschwarz", 1, 10000000, 5000000, false, -1, "icons\cargoschwarz.paa", -1)
    VITEMMACRO(storagebigb, "STR_Item_Storagebigb", "storagebigb", 1, 10000000, 5000000, false, -1, "icons\storagebigb.paa", -1)
    VITEMMACRO(cargo, "STR_Item_Cargo", "cargo", 1, 10000000, 5000000, false, -1, "icons\cargo.paa", -1)
    //sonstiges
    VITEMMACRO(atm, "STR_Item_Atm", "atm", 1, -1, 200, false, -1, "icons\no.paa", -1)
    VITEMMACRO(leiter, "STR_Item_Leiter", "leiter", 1, 2000000, 1000000, false, -1, "icons\no.paa", -1)
    VITEMMACRO(lamp1, "STR_Item_Lamp1", "lamp1", 1, 800000, 400000, false, -1, "icons\no.paa", -1)
    VITEMMACRO(halogen, "STR_Item_Halogen", "halogen", 1, 900000, 450000, false, -1, "icons\no.paa", -1)
    VITEMMACRO(laborb, "STR_Item_Laborb", "laborb", 1, 8000000, 4000000, false, -1, "icons\no.paa", -1)
	VITEMMACRO(base_toolkit, "STR_Item_BaseRepair", "base_toolkit", 5, 50000, 25000, false, -1, "icons\no.paa", -1)
    VITEMMACRO(abrissbirne, "STR_Item_Abrissbirne", "abrissbirne", 5, 100000, 50000, false, -1, "icons\no.paa", -1)
		
    //Jagt
    VITEMMACRO(h_eier, "STR_Item_Huener_Eier", "h_eier", 1, -1, 200, false, -1, "icons\eier.paa", -1)
    VITEMMACRO(craft_zfell, "STR_Item_Ziegen_Fell", "craft_zfell", 5, -1, 50, false, -1, "icons\ziegenfell.paa", -1)
    VITEMMACRO(craft_rfell, "STR_Item_Hasen_Fell", "craft_rfell", 2, -1, 20, false, -1, "icons\hasenfell.paa", -1)
    VITEMMACRO(craft_wolle, "STR_Item_Wolle", "craft_wolle", 1, -1, 30, false, -1, "icons\wolle.paa", -1)
    VITEMMACRO(craft_federn, "STR_Item_Federn", "craft_federn", 1, -1, 10, false, -1, "icons\feder.paa", -1)
    
    //Bank    
    VITEMMACRO(debitcard, "STR_Item_DebitCard", "debitcard", 0, 10000, -1, false, -1, "icons\debitcard.paa", -1)   
        
    //Farm items
    VITEMMACRO(pickaxe, "STR_Item_Pickaxe", "pickaxe", 1, 750, 350, false, -1, "icons\ico_pickaxe.paa", 2)
    VITEMMACRO(messer, "STR_Item_messer", "messer", 1, 2500, 500, false, -1, "icons\jagtmesser.paa", 3)
    VITEMMACRO(schaufel, "STR_Item_Schaufel", "schaufel", 1, 750, 350, false, -1, "icons\schaufel.paa", 4)
    VITEMMACRO(motorsaege, "STR_Item_Motorsaege", "motorsaege", 1, 750, 350, false, -1, "icons\motorsaege.paa", 2)
    VITEMMACRO(goldsieb, "STR_Item_Goldsieb", "goldsieb", 1, 1000, 500, false, -1, "icons\goldsieb.paa", 4)
    VITEMMACRO(handschuhe, "STR_Item_Handschuhe", "handschuhe", 1, 1500, 750, false, -1, "icons\handschuhe.paa", 8)
    VITEMMACRO(kescher, "STR_Item_Kescher", "kescher", 1, 1500, 750, false, -1, "icons\kescher.paa", 6)
        
	//Misc
	VITEMMACRO(fuelEmpty, "STR_Item_FuelE", "fuelEmpty", 2, 500, -1, false, -1, "icons\ico_fuelempty.paa", -1)
	VITEMMACRO(fuelFull, "STR_Item_FuelF", "fuelFull", 5, 850, 500, false, -1, "icons\ico_fuel.paa", -1)
    VITEMMACRO(fuelPipe, "STR_Item_fuelPipe", "fuelPipe", 0, 500, 250, false, -1, "icons\benzinschlauch.paa", -1) 
	VITEMMACRO(spikeStrip, "STR_Item_SpikeStrip", "spikeStrip", 15, 2500, 1200, false, -1, "icons\ico_spikeStrip.paa", -1)	
	VITEMMACRO(goldbar, "STR_Item_GoldBar", "goldbar", 12, -1, 150000, true, -1, "icons\platin.paa", -1)
	VITEMMACRO(blastingcharge, "STR_Item_BCharge", "blastingCharge", 15, 35000, -1, true, -1, "icons\ico_blastingcharge.paa", -1)
	VITEMMACRO(battery, "STR_Item_Battery", "battery", 1, 750, 500, false, -1, "icons\ico_battery.paa", -1)
	VITEMMACRO(carCharger,"STR_Item_carCharger", "carCharger", 1, 5000, 2500, false, -1, "icons\no.paa", 4)
		
	VITEMMACRO(defusekit, "STR_Item_DefuseKit", "defuseKit", 2, 2500, -1, false, -1, "icons\ico_defuseKit.paa", -1)
	VITEMMACRO(storagesmall, "STR_Item_StorageBS", "storageSmall", 5, 75000, -1, false, -1, "icons\ico_storageSmall.paa", -1)
	VITEMMACRO(storagebig, "STR_Item_StorageBL", "storageBig", 10, 150000, -1, false, -1, "icons\ico_storageSmall.paa", -1)
    VITEMMACRO(handcuffs, "STR_Item_Kabelbinder", "handcuffs", 1, 20000, 1000, true, -1, "icons\kabelbinder.paa", -1)
    VITEMMACRO(gpstracker, "STR_Item_GPS_Tracker", "gpstracker", 4, 5000, 2000, false, -1, "icons\gpstracker.paa", -1)
    VITEMMACRO(gpssuchgeraet, "STR_Item_GPS_Suchgeraet", "gpssuchgeraet", 4, 50000, 25000, true, -1, "icons\gpssucher.paa", -1)
    VITEMMACRO(bd_mk1_bleachweapon, "STR_Item_Fuel_Killer", "bd_mk1_bleachweapon", 25, 80000, 40000, true, -1, "icons\no.paa", -1)                        //noch kein Bild
    VITEMMACRO(bd_mk1_ammo, "STR_Item_Polymerpatrone", "bd_mk1_ammo", 2, 10500, 5000, true, -1, "icons\polymerpatrone.paa", -1)
    VITEMMACRO(bd_mk2_microemp, "STR_Item_Electrostatic", "bd_mk2_microemp", 20, 1100000, 550000, true, -1, "icons\no.paa", -1)                           //noch kein Bild
    VITEMMACRO(bd_mk2_ammo, "STR_Item_EMP_Emitter_Patrone", "bd_mk2_ammo", 4, 44000, 14000, true, -1, "icons\no.paa", -1)                                 //noch kein Bild
    VITEMMACRO(speedtrap, "STR_Item_Speedtrap", "speedtrap", 5, 5000, 3000, true, -1, "icons\no.paa", -1)      
	VITEMMACRO(speedtrapdetector, "STR_Item_Speedtrapdetector", "speedtrapdetector", 5, 50000, 20000, true, -1, "icons\no.paa", -1)
	VITEMMACRO(laptop, "STR_Item_Laptop", "laptop", 2, 5000, 2000, true, -1, "icons\laptop.paa", -1)
  
	//Möbel für Hauserweiterung
    VITEMMACRO(furniture_01, "STR_Item_Holzregal", "furniture_01", 10, 54000, 14000, false, -1, "icons\holzregal.paa", -1)
    VITEMMACRO(furniture_02, "STR_Item_Schrank", "furniture_02", 20, 57000, 17000, false, -1, "icons\schrank.paa", -1)
    VITEMMACRO(furniture_03, "STR_Item_Korb", "furniture_03", 5, 51000, 11000, false, -1, "icons\korb.paa", -1)
    VITEMMACRO(furniture_04, "STR_Item_Metallregal", "furniture_04", 15, 58000, 18000, false, -1, "icons\metalregal.paa", -1)
    VITEMMACRO(furniture_05, "STR_Item_Schubladen", "furniture_05", 15, 57000, 17000, false, -1, "icons\schranklade.paa", -1)
    
    //EVENT
    VITEMMACRO(event_1, "STR_Item_DildoEvent", "event_1", 0, 1, 1, false, -1, "icons\dildoevent.paa", -1)
    VITEMMACRO(event_2, "STR_Item_KondomEvent", "event_2", 0, 1, 1, false, -1, "icons\kondomevent.paa", -1)
    VITEMMACRO(event_3, "STR_Item_GleitcremeEvent", "event_3", 0, 1, 1, false, -1, "icons\gleitcremeevent.paa", -1)
    VITEMMACRO(event_score, "STR_Item_PunkteEvent", "event_score", 0, 1, 1, false, -1, "icons\punkteevent.paa", -1)
      
    //Reb  
    VITEMMACRO(bomb, "STR_Item_Bombenweste", "Bomb", 20, 1500000, 700000, true, -1, "icons\bombenweste.paa", 9)
    VITEMMACRO(lockpick, "STR_Item_Lockpick", "lockpick", 1, 8000, 75, false, -1, "icons\ico_lockpick.paa", -1)
    VITEMMACRO(boltcutter, "STR_Item_BCutter", "boltCutter", 5, 7500, -1, true, -1, "icons\ico_boltcutter.paa", -1)
    VITEMMACRO(underwatercharge, "STR_Item_Underwatercharge", "underwatercharge", 18, 40000, 20000, true, -1, "icons\unterwassersprengladung.paa", 9)
        
    //ADAC
    VITEMMACRO(adac_toolkit, "STR_Item_ADAC_Werkzeugkasten", "adac_toolkit", 10, 500, 250, false, -1, "icons\adacwerkzeug.paa", -1)
    VITEMMACRO(repairkit, "STR_Item_Repairkit", "repairkit", 15, 10000, 250, false, -1, "icons\no.paa", -1)  //item noch aktuel??? noch kein Bild
    VITEMMACRO(adac_tow, "STR_Item_ADAC_Abschleppseil", "adac_tow", 2, 250, 100, false, -1, "icons\adacabschleppseil.paa", -1)
    VITEMMACRO(adac_paint, "STR_Item_ADAC_Autolack", "adac_paint", 5, 600, 300, false, -1, "icons\adaclack.paa", -1)
    VITEMMACRO(vehhut, "STR_Item_ADAC_Verkershuetchen", "vehhut", 4, 2500, 1250, false, -1, "icons\adacverkershut.paa", -1)
    VITEMMACRO(mauer, "STR_Item_ADAC_Absperrung", "mauer", 8, 2500, 1250, false, -1, "icons\no.paa", -1)
    VITEMMACRO(wkasten, "STR_Item_ADAC_Wkasten", "wkasten", 2, 2500, 1250, false, -1, "icons\wkasten.paa", -1)
	//VITEMMACRO(reparaturkrahn, "STR_Item_ADAC_Reparaturkrahn", "reparaturkrahn", 8, 2500, 1250, false, -1, "icons\no.paa", -1)
        
    //Medic
    VITEMMACRO(firstaidkit, "STR_Item_Firstaidkit", "firstaidkit", 12, 5000, 250, false, -1, "icons\firstaidkit.paa", -1) //item noch aktuel noch kein bild
       
    //Organe
    VITEMMACRO(kidney, "STR_Item_kidney", "kidney", 15, 75000, 50000, true, -1, "icons\niere.paa", -1)
    //VITEMMACRO(bein, "STR_Item_Bein", "bein", 0, 30000, -1, false, -1, "icons\no.paa", -1)
    //VITEMMACRO(arm, "STR_Item_Arm", "arm", 0, 20000, -1, false, -1, "icons\no.paa", -1)
    //VITEMMACRO(finger, "STR_Item_Finger", "finger", 0, 10000, -1, false, -1, "icons\no.paa", -1)
    //VITEMMACRO(sehne, "STR_Item_Sehne", "sehne", 0, 5000, -1, false, -1, "icons\no.paa", -1)
        
    //Medic Geräte
    VITEMMACRO(organttk, "STR_Item_organttk", "organttk", 5, 2000, 1000, false, -1, "icons\no.paa", -1)
    VITEMMACRO(scalpel, "STR_Item_Scalpel", "scalpel", 5, 2000, 1000, true, -1, "icons\scalpel.paa", 6)
        
    //Tokens für verschiedene Zwecke
    VITEMMACRO(token_donator, "STR_Item_DonatorToken", "token_donator", 0, 200, 100, false, -1, "icons\no.paa", -1)
    VITEMMACRO(token_rebel, "STR_Item_RebellenToken", "token_rebel", 0, 200, 100, false, -1, "icons\no.paa", -1)
    VITEMMACRO(token_police, "STR_Item_PolizeiToken", "token_police", 0, 200, 100, false, -1, "icons\no.paa", -1)
        
	//Mined Items
	VITEMMACRO(oil_unprocessed, "STR_Item_OilU", "oil_unprocessed", 7, -1, -1, false, -1, "icons\ico_oilu.paa", -1)
	VITEMMACRO(oil_processed, "STR_Item_OilP", "oil_processed", 6, -1, 3200, false, -1, "icons\ico_oilp.paa", -1)
	VITEMMACRO(copper_unrefined, "STR_Item_CopperOre", "copper_unrefined", 4, -1, -1, false, -1, "icons\ico_copperore.paa", -1)
	VITEMMACRO(copper_refined, "STR_Item_CopperIngot", "copper_refined", 3, -1, 1500, false, -1, "icons\ico_copperr.paa", -1)
	VITEMMACRO(iron_unrefined, "STR_Item_IronOre", "iron_unrefined", 5, -1, -1, false, -1, "icons\ico_ironore.paa", -1)
	VITEMMACRO(iron_refined, "STR_Item_IronIngot", "iron_refined", 3, -1, 3200, false, -1, "icons\ico_ironr.paa", -1)
	VITEMMACRO(salt_unrefined, "STR_Item_Salt", "salt_unrefined", 3, -1, -1, false, -1, "icons\ico_saltr.paa", -1)
	VITEMMACRO(salt_refined, "STR_Item_SaltR", "salt_refined", 1, -1, 1450, false, -1, "icons\ico_salt.paa", -1)
	VITEMMACRO(sand, "STR_Item_Sand", "sand", 3, -1, -1, false, -1, "icons\ico_sand.paa", -1)
	VITEMMACRO(glass, "STR_Item_Glass", "glass", 1, -1, 1450, false, -1, "icons\ico_glass.paa", -1)
	VITEMMACRO(diamond_uncut, "STR_Item_DiamondU", "diamond_uncut", 4, -1, -1, false, -1, "icons\ico_diamond.paa", -1)
	VITEMMACRO(diamond_cut, "STR_Item_DiamondC", "diamond_cut", 2, -1, 6000, false, -1, "icons\ico_diamondr.paa", -1)
	VITEMMACRO(rock, "STR_Item_Rock", "rock", 6, -1, -1, false, -1, "icons\ico_rock.paa", -1)
	VITEMMACRO(cement, "STR_Item_CementBag", "cement", 5, -1, 1950, false, -1, "icons\ico_cement.paa", -1)
    VITEMMACRO(reingold, "STR_Item_999_Reingold", "reingold", 5, -1, 75000, false, -1, "icons\999feingold.paa", -1)
    VITEMMACRO(goldbarp, "STR_Item_Goldbarp", "goldbarp", 7, -1, 30000, true, -1, "icons\antiquitaet.paa", -1)  //Antiquitäten 
    VITEMMACRO(silber_unprocessed, "STR_Item_silber_unprocessed", "silber_unprocessed", 7, -1, -1, false, -1, "icons\silbererz.paa", -1)
    VITEMMACRO(silber_processed, "STR_Item_silber_processed", "silber_processed", 5, -1, 1200, false, -1, "icons\silber.paa", -1) 
    VITEMMACRO(gold_unprocessed, "STR_Item_gold_unprocessed", "gold_unprocessed", 7, -1, -1, false, -1, "icons\Golderz.paa", -1) 
    VITEMMACRO(gold_processed, "STR_Item_gold_processed", "gold_processed", 5, -1, 1600, false, -1, "icons\ico_goldbar.paa", -1)       
    VITEMMACRO(whiskey, "STR_Item_Whiskey", "whiskey", 4, 5500, 5000, false, -1, "icons\whisky.paa", -1)
    VITEMMACRO(bottledwhiskey, "STR_Item_BottledWhiskey", "bottledWhiskey", 5, 8000, 11000, false, -1, "icons\flaschewhisky.paa", -1)
    VITEMMACRO(beerp, "STR_Item_Beerp", "beerp", 4, 5000, 4500, false, -1, "icons\bier.paa", -1) 
    VITEMMACRO(bottledbeer, "STR_Item_BottledBeer", "bottledbeer", 4, 8000, 10000, false, -1, "icons\fbier.paa", -1) //noch kein Bild
    VITEMMACRO(bottles, "STR_Item_Bottles", "bottles", 1, 100, 75, false, -1, "icons\flasche.paa", -1) 
    VITEMMACRO(hops, "STR_Item_Hops", "hops", 2, -1, 1800, false, -1, "icons\hopfen.paa", -1) 
    VITEMMACRO(rye, "STR_Item_Rye", "rye", 2, -1, 2000, false, -1, "icons\roggen.paa", -1) 
    VITEMMACRO(yeast, "STR_Item_Yeast", "yeast", 2, -1, 2000, false, -1, "icons\hefe.paa", -1) 
    VITEMMACRO(cornmeal, "STR_Item_Cornmeal", "cornmeal", 2, 500, 200, false, -1, "icons\no.paa", -1) //noch keinBild
    VITEMMACRO(mash, "STR_Item_Mash", "mash", 2, 2500, 2000, false, -1, "icons\maische.paa", -1)
    VITEMMACRO(faulbaum, "STR_Item_Faulbaum", "faulbaum", 4, -1, -1, false, -1, "icons\faulbaum.paa", -1)
    VITEMMACRO(kohle, "STR_Item_Kohle", "kohle", 3, -1, 3000, false, -1, "icons\kohle.paa", -1)
    VITEMMACRO(zink, "STR_Item_Zink", "zink", 3, -1, 2000, false, -1, "icons\zink.paa", -1)
    VITEMMACRO(nickel, "STR_Item_Nickel", "nickel", 2, -1, 2500, false, -1, "icons\nickel.paa", -1)
    VITEMMACRO(blei, "STR_Item_Blei", "blei", 5, -1, 2300, false, -1, "icons\blei.paa", -1)
    VITEMMACRO(messing, "STR_Item_Messing", "messing", 3, -1, 3500, false, -1, "icons\messing.paa", -1)
    VITEMMACRO(schwefel, "STR_Item_Schwefel", "schwefel", 3, -1, -1, false, -1, "icons\schwefel.paa", -1)
    VITEMMACRO(farbstoff, "STR_Item_Farbstoff", "farbstoff", 2, -1, 3000, false, -1, "icons\farbstoff.paa", -1)
        
	//illegal
	VITEMMACRO(heroin_unprocessed, "STR_Item_HeroinU", "heroin_unprocessed", 6, -1, -1, true, -1, "icons\heroin.paa", -1)        //noch kein bild
	VITEMMACRO(heroin_processed, "STR_Item_HeroinP", "heroin_processed", 4, -1, 2560, true, -1, "icons\ico_heroinp.paa", -1)
	VITEMMACRO(cannabis, "STR_Item_Cannabis", "cannabis", 4, -1, -1, true, -1, "icons\ico_cannabis.paa", -1)
	VITEMMACRO(marijuana, "STR_Item_Marijuana", "marijuana", 3, -1, 2500, true, -1, "icons\ico_marijuana.paa", -1)
	VITEMMACRO(cocaine_unprocessed, "STR_Item_CocaineU", "cocaine_unprocessed", 6, -1, -1, true, -1, "icons\ico_coke.paa", -1)
	VITEMMACRO(cocaine_processed, "STR_Item_CocaineP", "cocaine_processed", 4, -1, 5000, true, -1, "icons\ico_cokep.paa", -1)
    VITEMMACRO(uran_unprocessed, "STR_Item_UranU", "uran_unprocessed", 5, -1, -1, true, -1, "icons\uranerz.paa", -1)
    VITEMMACRO(uran_processed, "STR_Item_UranP", "uran_processed", 3, -1, 5500, true, -1, "icons\uran.paa", -1)
    VITEMMACRO(frogs, "STR_Item_frogs", "frogs", 4, -1, -1, true, -1, "icons\lsdsaure.paa", -1)
    VITEMMACRO(frogslsd, "STR_Item_frogslsd", "frogslsd", 2, -1, 2500, true, -1, "icons\lsd.paa", -1)
	VITEMMACRO(meth_unprocessed, "STR_Item_MethU", "meth_unprocessed", 5, -1, -1, true, -1, "icons\methkristal.paa", -1)
	VITEMMACRO(meth_processed, "STR_Item_MethP", "meth_processed", 4, -1, 4000, true, -1, "icons\meth.paa", -1)
    VITEMMACRO(gluew, "STR_Item_Gluew", "gluew", 1, -1, 3500, true, -1, "icons\gluew.paa", -1)
    VITEMMACRO(schwefelsaeure, "STR_Item_Schwefelsaeure", "schwefelsaeure", 2, -1, 3000, true, -1, "icons\schwefelsaeure.paa", -1)
	VITEMMACRO(moonshine, "STR_Item_Moonshine", "moonshine", 5, 7500, 7000, true, -1, "icons\no.paa", -1)// noch kein Bild
    VITEMMACRO(bottledshine, "STR_Item_Bottledshine", "bottledshine", 5, 12500, 15000, true, -1, "icons\no.paa", -1)// noch kein Bild
		
	//Drink
	VITEMMACRO(redgull, "STR_Item_RedGull", "redgull", 1, 1500, 200, false, 100, "icons\ico_redgull.paa", -1)
	VITEMMACRO(coffee, "STR_Item_Coffee", "coffee", 1, 10, 5, false, 100, "icons\ico_coffee.paa", -1)
	VITEMMACRO(waterBottle, "STR_Item_WaterBottle", "waterBottle", 1, 10, 5, false, 100, "icons\ico_waterBottle.paa", -1)
	VITEMMACRO(pcolap, "STR_Item_Pcolap", "pcolap", 1, -1, 200, false, -1, "icons\no.paa", -1)	
	VITEMMACRO(sotbp, "STR_Item_Sotbp", "sotbp", 1, -1, 200, false, -1, "icons\no.paa", -1)
	VITEMMACRO(maitp, "STR_Item_Maitp", "maitp", 1, -1, 200, false, -1, "icons\no.paa", -1)
		
	//Food
	VITEMMACRO(apple, "STR_Item_Apple", "apple", 1, -1, 50, false, 10, "icons\ico_apfel.paa", -1)
	VITEMMACRO(peach, "STR_Item_Peach", "peach", 1, -1, 55, false, 10, "icons\ico_peach.paa", -1)
	VITEMMACRO(tbacon, "STR_Item_TBacon", "tbacon", 1, 75, 25, false, 40, "icons\ico_tbacon.paa", 8)
	VITEMMACRO(donut, "STR_Item_Donuts", "donut", 1, 120, 60, false, 30, "icons\ico_donuts.paa", -1)
	VITEMMACRO(rabbit_raw, "STR_Item_Rabbit", "rabbit_raw", 2, -1, 65, false, -1, "icons\hasenfleisch.paa", -1)
	VITEMMACRO(rabbit_grilled, "STR_Item_RabbitGrilled", "rabbit_grilled", 1, 150, 115, false, 50, "icons\ico_cookedfood.paa", -1)
	VITEMMACRO(salema_raw, "STR_Item_SalemaMeat", "salema_raw", 2, -1, 45, false, -1, "icons\ico_salema.paa", -1)
	VITEMMACRO(salema_grilled, "STR_Item_SalemaGrilled", "salema_grilled", 1, 75, 55, false, 30, "icons\ico_grilledfish.paa", -1)
	VITEMMACRO(ornate_raw, "STR_Item_OrnateMeat", "ornate_raw", 2, -1, 40, false, -1, "icons\ico_ornate.paa", -1)
	VITEMMACRO(ornate_grilled, "STR_Item_OrnateGrilled", "ornate_grilled", 1, 175, 150, false, 25, "icons\ico_grilledfish.paa", -1)
	VITEMMACRO(mackerel_raw, "STR_Item_MackerelMeat", "mackerel_raw", 4, -1, 175, false, -1, "icons\ico_mackerel.paa", -1)
	VITEMMACRO(mackerel_grilled, "STR_Item_MackerelGrilled", "mackerel_grilled", 2, 250, 200, false, 30, "icons\ico_grilledfish.paa", -1)
	VITEMMACRO(tuna_raw, "STR_Item_TunaMeat", "tuna_raw", 6, -1, 700, false, -1, "icons\ico_tuna.paa", -1)
	VITEMMACRO(tuna_grilled, "STR_Item_TunaGrilled", "tuna_grilled", 3, -1, 1000, false, 100, "icons\ico_grilledfish.paa", -1)
	VITEMMACRO(mullet_raw, "STR_Item_MulletMeat", "mullet_raw", 4, -1, 250, false, -1, "icons\ico_mullet.paa", -1)
	VITEMMACRO(mullet_fried, "STR_Item_MulletFried", "mullet_fried", 2, -1, 400, false, 80, "icons\ico_grilledfish.paa", -1)
	VITEMMACRO(catshark_raw, "STR_Item_CatSharkMeat", "catshark_raw", 6, -1, 300, false, -1, "icons\ico_catshark.paa", -1)
	VITEMMACRO(catshark_fried, "STR_Item_CatSharkFried", "catshark_fried", 3, -1, 500, false, 100, "icons\ico_grilledfish.paa", -1)
	VITEMMACRO(turtle_raw, "STR_Item_TurtleMeat", "turtle_raw", 6, -1, 3000, true, -1, "icons\ico_turtle.paa", -1)
	VITEMMACRO(turtle_soup, "STR_Item_turtle_soup", "turtle_soup", 2, -1, 1000, false, 100, "icons\ico_turtlesoup.paa", -1)
	VITEMMACRO(hen_raw, "STR_Item_hen_raw", "hen_raw", 1, -1, 35, false, -1, "icons\ico_rawHen.paa", -1)
	VITEMMACRO(hen_fried, "STR_Item_hen_fried", "hen_fried", 1, 115, 85, false, 65, "icons\ico_cookedfood.paa", -1)
	VITEMMACRO(rooster_raw, "STR_Item_rooster_raw", "rooster_raw", 1, -1, 35, false, -1, "icons\ico_rawHen.paa", -1)
	VITEMMACRO(rooster_grilled, "STR_Item_rooster_grilled", "rooster_grilled",1, 115, 85, false, 45, "icons\ico_cookedfood.paa", -1)
	VITEMMACRO(sheep_raw, "STR_Item_sheep_raw", "sheep_raw", 2, -1, 50, false, -1, "icons\ico_rawSheep.paa", -1)
	VITEMMACRO(sheep_grilled, "STR_Item_sheep_grilled", "sheep_grilled", 2, -1, 115, false, 50, "icons\ico_cookedfood.paa", -1)
	VITEMMACRO(goat_raw, "STR_Item_goat_raw", "goat_raw", 2, -1, 75, false, -1, "icons\ico_rawGoat.paa", -1)
	VITEMMACRO(goat_grilled, "STR_Item_goat_grilled", "goat_grilled", 2, -1, 135, false, 50, "icons\ico_cookedfood.paa", -1)
    VITEMMACRO(huehners, "STR_Item_Huehnersuppe", "huehners", 1, -1, 50, false, 50, "icons\huehnersuppe.paa", -1)
    VITEMMACRO(eieromelett, "STR_Item_Eieromelett", "eieromelett", 1, -1, 50, false, 30, "icons\eieromelett.paa", -1)
    VITEMMACRO(banane, "STR_Item_Banane", "banane", 1, -1, 30, false, 10, "icons\banane.paa", -1)
	VITEMMACRO(birne, "STR_Item_Birne", "birne", 1, -1, 30, false, 10, "icons\birne.paa", -1)
	VITEMMACRO(cerises, "STR_Item_Cerises", "cerises", 1, -1, 30, false, 10, "icons\kirsche.paa", -1)
		
    //Troll items
    VITEMMACRO(troll_taschentuch, "STR_Item_Tempo_Taschentuch", "troll_taschentuch", 0, 5, -1, false, -1, "icons\trolltaschentuch.paa", -1)
    VITEMMACRO(troll_nuckel, "STR_Item_BornBaby_Nuckel", "troll_nuckel", 0, 5, -1, false, -1, "icons\nuckel.paa", -1)
    VITEMMACRO(troll_bitering, "STR_Item_BornBaby_Beissring", "troll_bitering", 0, 5, -1, false, -1, "icons\beissring.paa", -1)    
    VITEMMACRO(troll_money, "STR_Item_Spielgeld", "troll_money", 0, 1, -1, false, -1, "icons\spielgeld.paa", -1)
        
    //Sonstiges
    VITEMMACRO(burglar_tool, "STR_Item_Einbrecherwerkzeug", "burglar_tool", 3, 10000, 2000, true, -1, "icons\einbrecherwerkzeug.paa", -1)
        
    //Baukästen LKW
    VITEMMACRO(c_van_box, "STR_Item_Truck_Box", "c_van_box", 50, -1, -1, false, -1, "icons\truckbox.paa", -1)
    VITEMMACRO(c_van_fuel, "STR_Item_Truck_Tanklaster", "c_van_fuel", 50, -1, -1, false, -1, "icons\truckfuell.paa", -1)
    VITEMMACRO(i_truck_transport, "STR_Item_Zamak_Transporter", "i_truck_transport", 60, -1, -1, false, -1, "icons\zamaktransport.paa", -1)
    VITEMMACRO(i_truck_covered, "STR_Item_Zamak_Transporter_abg", "i_truck_covered", 60, -1, -1, false, -1, "icons\zamakcovered.paa", -1)
    VITEMMACRO(o_truck_02_fuel, "STR_Item_Zamak_Tanker", "o_truck_02_fuel", 65, -1, -1, false, -1, "icons\zamakfuell.paa", -1)
    VITEMMACRO(o_truck_transport, "STR_Item_Tempest_Transporter", "o_truck_transport", 70, -1, -1, false, -1, "icons\tempesttransport.paa", -1)
    VITEMMACRO(o_truck_covered, "STR_Item_Tempest_Transporter_abg", "o_truck_covered", 70, -1, -1, false, -1, "icons\tempestcovered.paa", -1)
    VITEMMACRO(o_truck_03_fuel, "STR_Item_Tempest_Tanker", "o_truck_03_fuel", 75, -1, -1, false, -1, "icons\tempestfuell.paa", -1)
    VITEMMACRO(o_truck_device, "STR_Item_Tempest_geraet", "o_truck_device", 95, -1, -1, false, -1, "icons\tempestgeraet.paa", -1)
    VITEMMACRO(b_truck_transport, "STR_Item_HEMTT_Transporter", "b_truck_transport", 85, -1, -1, false, -1, "icons\hemitttransport.paa", -1)
    VITEMMACRO(b_truck_box, "STR_Item_HEMTT_Box", "b_truck_box", 85, -1, -1, false, -1, "icons\hemittbox.paa", -1)
    VITEMMACRO(b_truck_fuel, "STR_Item_HEMTT_Tanker", "b_truck_fuel", 90, -1, -1, false, -1, "icons\hemittfuell.paa", -1)
       
    //Baukästen Heli
    VITEMMACRO(b_heli_light, "STR_Item_MH_9_Hummingbird", "b_heli_light", 60, -1, -1, false, -1, "icons\heli_light.paa", -1)
    VITEMMACRO(i_heli_transport, "STR_Item_CH_49_Mohawk", "i_heli_transport", 80, -1, -1, false, -1, "icons\mohawk.paa", -1)
    VITEMMACRO(o_heli_light_02_unarmed, "STR_Item_PO_30_Orca", "o_heli_light_02_unarmed", 70, -1, -1, false, -1, "icons\orca.paa", -1)
    
    //Baukästen Jet
    VITEMMACRO(o_plane_cas_02, "STR_Item_TO_199_Neophron", "o_plane_cas_02", 80, -1, -1, false, -1, "icons\neophron.paa", -1)
    VITEMMACRO(i_plane_fighter_03, "STR_Item_A_143_Buzzard", "i_plane_fighter_03", 80, -1, -1, false, -1, "icons\buzzard.paa", -1)
    
    //Kaufteile für Crafting Vehicle
    VITEMMACRO(craft_motor_a, "STR_Item_Fahrzeugmotor", "craft_motor_a", 5, 400000, 200000, false, -1, "icons\fmotor.paa", -1)
    VITEMMACRO(craft_motor_h, "STR_Item_Helikoptermotor", "craft_motor_h", 5, 400000, 200000, false, -1, "icons\hmotor.paa", -1)
    VITEMMACRO(craft_getriebe_a, "STR_Item_Fahrzeuggetriebe", "craft_getriebe_a", 3, 300000, 150000, false, -1, "icons\fgetriebe.paa", -1)
    VITEMMACRO(craft_getriebe_h, "STR_Item_Helikoptergetriebe", "craft_getriebe_h", 3, 300000, 150000, false, -1, "icons\hgetriebe.paa", -1)
    VITEMMACRO(craft_kleinteile, "STR_Item_Diverse_Kleinteile", "craft_kleinteile", 1, 50000, 10000, false, -1, "icons\kleinteile.paa", -1)
    VITEMMACRO(craft_kupplung_a, "STR_Item_Fahrzeugkupplung", "craft_kupplung_a", 3, 150000, 75000, false, -1, "icons\fkupplung.paa", -1)
    VITEMMACRO(craft_kupplung_h, "STR_Item_Helikopterkopplung", "craft_kupplung_h", 3, 300000, 150000, false, -1, "icons\hkupplung.paa", -1)
    VITEMMACRO(craft_sondert, "STR_Item_Sonderteile", "craft_sondert", 5, 500000, 250000, false, -1, "icons\sonderteile.paa", -1)
    VITEMMACRO(craft_seitenr, "STR_Item_Seitenruder", "craft_seitenr", 1, 120000, 60000, false, -1, "icons\seitenruder.paa", -1)
    VITEMMACRO(craft_hoehenr, "STR_Item_Hoehenruder", "craft_hoehenr", 1, 120000, 60000, false, -1, "icons\hoehenruder.paa", -1)
    VITEMMACRO(craft_querr, "STR_Item_Querruder", "craft_querr", 1, 150000, 75000, false, -1, "icons\no.paa", -1)                                         //noch kein Bild
    VITEMMACRO(craft_pilotensitz, "STR_Item_Pilotensitz", "craft_pilotensitz", 1, 150000, 75000, false, -1, "icons\pilotensitz.paa", -1)
    VITEMMACRO(craft_triebw, "STR_Item_Triebwerk", "craft_triebw", 1, 700000, 350000, false, -1, "icons\triebwerk.paa", -1)
    VITEMMACRO(craft_kabine, "STR_Item_Kabine", "craft_kabine", 1, 500000, 250000, false, -1, "icons\no.paa", -1)                                         //noch kein Bild
    VITEMMACRO(craft_instru, "STR_Item_Instrumente", "craft_instru", 1, 400000, 100000, false, -1, "icons\instromente.paa", -1)
    VITEMMACRO(craft_landek, "STR_Item_Landeklappen", "craft_landek", 1, 100000, 50000, false, -1, "icons\landeklappe.paa", -1)
    
    //Kaufteile für Crafting Weapon
    VITEMMACRO(craft_verriegelungs, "STR_Item_Verriegelungsstueck", "craft_verriegelungs", 5, 30000, 15000, false, -1, "icons\no.paa", -1)                //noch kein Bild
    VITEMMACRO(craft_verschluss, "STR_Item_Verschluss", "craft_verschluss", 5, 30000, 15000, false, -1, "icons\verschluss.paa", -1)
    VITEMMACRO(craft_sicherungsh, "STR_Item_Sicherungshebel", "craft_sicherungsh", 5, 50000, 25000, false, -1, "icons\sicherrungshebel.paa", -1)
    VITEMMACRO(craft_boden_schlies, "STR_Item_Bodenstueck_u_Schliessfeder", "craft_boden_schlies", 5, 90000, 45000, false, -1, "icons\bodenstueck_u_schliessfeder.paa", -1)
    VITEMMACRO(craft_patronenlager, "STR_Item_Patronenlager", "craft_patronenlager", 5, 30000, 15000, false, -1, "icons\no.paa", -1)                      //noch kein Bild
    VITEMMACRO(craft_paper, "STR_Item_Gefaelschte_Papiere", "craft_paper", 5, 150000, 75000, true, -1, "icons\gefaelschte_papiere.paa", -1)
    VITEMMACRO(craft_cheytac, "STR_Item_CheyTac_Frontgriff", "craft_cheytac", 5, 200000, 100000, false, -1, "icons\frondgriff.paa", -1)
    VITEMMACRO(craft_zweibein, "STR_Item_Zweibein", "craft_zweibein", 5, 200000, 100000, false, -1, "icons\zweibein.paa", -1)
    VITEMMACRO(craft_repetier, "STR_Item_Repetierkolben", "craft_repetier", 5, 300000, 150000, false, -1, "icons\repetierkolben.paa", -1)
    VITEMMACRO(craft_reaver, "STR_Item_Reaver_Montage", "craft_reaver", 5, 200000, 100000, false, -1, "icons\no.paa", -1)                                 //noch kein Bild
    VITEMMACRO(craft_slingshot, "STR_Item_Slingshot_Bolzensystem", "craft_slingshot", 5, 300000, 150000, false, -1, "icons\no.paa", -1)                   //noch kein Bild
    VITEMMACRO(craft_gewinde, "STR_Item_Gewindekopf", "craft_gewinde", 3, 50000, 25000, false, -1, "icons\no.paa", -1)                                    //noch kein Bild
    VITEMMACRO(craft_epdm, "STR_Item_EPDM_Dichtung", "craft_epdm", 3, 100000, 50000, false, -1, "icons\epdm_dichtung.paa", -1)
    VITEMMACRO(craft_mineralf, "STR_Item_Mineralfaserdaempfung", "craft_mineralf", 3, 100000, 50000, false, -1, "icons\no.paa", -1)                       //noch kein Bild
    VITEMMACRO(craft_edelstahlv, "STR_Item_Edelstahlvlies", "craft_edelstahlv", 3, 100000, 50000, false, -1, "icons\no.paa", -1)                          //noch kein Bild
    VITEMMACRO(craft_edelstahll, "STR_Item_Edelstahllegierung", "craft_edelstahll", 3, 50000, 25000, false, -1, "icons\no.paa", -1)                       //noch kein Bild
    VITEMMACRO(craft_kondenzs, "STR_Item_Kondenzstutzen", "craft_kondenzs", 3, 50000, 25000, false, -1, "icons\no.paa", -1)                               //noch kein Bild
    VITEMMACRO(craft_streckmetall, "STR_Item_Streckmetall", "craft_streckmetall", 3, 30000, 15000, false, -1, "icons\no.paa", -1)                         //noch kein Bild
    VITEMMACRO(craft_daemmkernt, "STR_Item_Daemmkerntraeger", "craft_daemmkernt", 3, 20000, 10000, false, -1, "icons\no.paa", -1)                         //noch kein Bild
        
    //Kaufteile allgemein
    VITEMMACRO(craft_kautschuk, "STR_Item_Kautschuk", "craft_kautschuk", 5, 5000, 1000, false, -1, "icons\kautschuk.paa", -1)
    
    //Herstellbareteile für Crafting Vehicle
    VITEMMACRO(craft_spiegel, "STR_Item_Spiegel", "craft_spiegel", 1, -1, 100, false, -1, "icons\spiegel.paa", -1)
    VITEMMACRO(craft_reifen, "STR_Item_Fahrzeugreifen", "craft_reifen", 2, -1, 300, false, -1, "icons\reifen.paa", -1)
    VITEMMACRO(craft_draht, "STR_Item_Draht", "craft_draht", 1, -1, 200, false, -1, "icons\draht.paa", -1)
    VITEMMACRO(craft_innena, "STR_Item_Innenaustattung", "craft_innena", 2, -1, 100, false, -1, "icons\innenausstattung.paa", -1)
    
    //Herstellbareteile für Crafting Heli
    VITEMMACRO(craft_rotor, "STR_Item_Rotorblaetter", "craft_rotor", 2, -1, 4000, false, -1, "icons\rotorblaetter.paa", -1)
    VITEMMACRO(craft_pitchk, "STR_Item_Pitchknueppel", "craft_pitchk", 2, -1, 4000, false, -1, "icons\pitchknueppel.paa", -1)
    
    //Herstellbareteile für Crafting Jet
    VITEMMACRO(craft_tragf, "STR_Item_Tragflaeche", "craft_tragf", 1, -1, 2000, false, -1, "icons\tragflaeche.paa", -1)
    VITEMMACRO(craft_hoehenf, "STR_Item_Hoehenflosse", "craft_hoehenf", 1, -1, 2000, false, -1, "icons\no.paa", -1)                                         //noch kein Bild gefunden
    VITEMMACRO(craft_seitenf, "STR_Item_Seitenflosse", "craft_seitenf", 1, -1, 2000, false, -1, "icons\jetseitenruder.paa", -1)
    VITEMMACRO(craft_rumpf, "STR_Item_Rumpf", "craft_rumpf", 1, -1, 2000, false, -1, "icons\rumpf.paa", -1)
    VITEMMACRO(craft_fahrg, "STR_Item_Fahrgestell", "craft_fahrg", 1, -1, 2000, false, -1, "icons\fahrgestell.paa", -1)
        
    //Herstellbareteile für Crafting Heli/Vehicle
    VITEMMACRO(craft_dichtung, "STR_Item_Dichtung", "craft_dichtung", 1, -1, 1000, false, -1, "icons\dichtung.paa", -1)
    VITEMMACRO(craft_karosseriet, "STR_Item_karosserieteile", "craft_karosseriet", 3, -1, 1000, false, -1, "icons\karosserie.paa", -1)
    VITEMMACRO(craft_scheibe, "STR_Item_Fahrzeugscheiben", "craft_scheibe", 2, -1, 2000, false, -1, "icons\fscheibe.paa", -1)
    
    //Herstellbareteile für Crafting Weapon
    VITEMMACRO(craft_muendungsf, "STR_Item_Muendungsfeuerdaempfer", "craft_muendungsf", 2, -1, 1000, false, -1, "icons\muendungsfeuerdaempfer.paa", -1)
    VITEMMACRO(craft_rohr, "STR_Item_Rohr", "craft_rohr", 5, -1, 3000, false, -1, "icons\lauf.paa", -1)
    VITEMMACRO(craft_trageb, "STR_Item_Tragebuegel", "craft_trageb", 4, -1, 2000, false, -1, "icons\tragebuegel.paa", -1)
    VITEMMACRO(craft_gehause, "STR_Item_Gehause", "craft_gehause", 5, -1, 5000, false, -1, "icons\gehause.paa", -1)
    VITEMMACRO(craft_hands, "STR_Item_Handschutz", "craft_hands", 2, -1, 2000, false, -1, "icons\handschutz.paa", -1)
    VITEMMACRO(craft_schulters, "STR_Item_Schulterstueck", "craft_schulters", 3, -1, 3000, false, -1, "icons\no.paa", -1)
    VITEMMACRO(patronenh, "STR_Item_Patronenh", "patronenh", 1, -1, 5000, false, -1, "icons\patronenh.paa", -1)
    VITEMMACRO(schwarzp, "STR_Item_Schwarzp", "schwarzp", 1, -1, 4500, false, -1, "icons\schwarzp.paa", -1)
    VITEMMACRO(projektil, "STR_Item_Projektil", "projektil", 1, -1, 4000, false, -1, "icons\projektil.paa", -1)
        
    //Herstellbareteile für Crafting Klamotten
    VITEMMACRO(craft_faden, "STR_Item_Faden", "craft_faden", 1, -1, -1, false, -1, "icons\faden.paa", -1)
    VITEMMACRO(craft_stoff, "STR_Item_Stoff", "craft_stoff", 3, -1, -1, false, -1, "icons\stoff.paa", -1)
    VITEMMACRO(craft_leder, "STR_Item_Leder", "craft_leder", 4, -1, -1, false, -1, "icons\leder.paa", -1)
    VITEMMACRO(craft_sauerflasche, "STR_Item_Sauerstof_Flasche", "craft_sauerflasche", 5, -1, -1, false, -1, "icons\sauerf.paa", -1)
    VITEMMACRO(craft_innenfutter, "STR_Item_Innenfutter", "craft_innenfutter", 3, -1, -1, false, -1, "icons\innenfutter.paa", -1)
};

/*
	Licenses
	
	Params:
	CLASS ENTRY,DisplayName,VariableName,price,illegal,side indicator,level
*/
class Licenses {
	LICENSEMACRO(driver,"STR_License_Driver","driver",500,false,"civ", -1)
	LICENSEMACRO(boat,"STR_License_Boat","boat",3000,false,"civ", -1)
	LICENSEMACRO(pilot,"STR_License_Pilot","pilot",35000,false,"civ", -1)
	LICENSEMACRO(gun,"STR_License_Firearm","gun",50000,false,"civ", 3)
	LICENSEMACRO(dive,"STR_License_Diving","dive",2000,false,"civ", -1)
	LICENSEMACRO(oil,"STR_License_Oil","oil",10000,false,"civ", 3)
	LICENSEMACRO(cAir,"STR_License_Pilot","cAir",15000,false,"cop", -1)
	LICENSEMACRO(cg,"STR_License_CG","cg",8000,false,"cop", -1)
	LICENSEMACRO(heroin,"STR_License_Heroin","heroin",80000,true,"civ", 7)
	LICENSEMACRO(marijuana,"STR_License_Marijuana","marijuana",70000,true,"civ", 6)
	LICENSEMACRO(medmarijuana,"STR_License_Medmarijuana","medmarijuana",2000,false,"civ", 6)
	LICENSEMACRO(rebel,"STR_License_Rebel","rebel",150000,true,"civ", 5)
	LICENSEMACRO(trucking,"STR_License_Truck","trucking",20000,false,"civ", 4)
	LICENSEMACRO(diamond,"STR_License_Diamond","diamond",35000,false,"civ", 5)
	LICENSEMACRO(salt,"STR_License_Salt","salt",12000,false,"civ", 5)
	LICENSEMACRO(cocaine,"STR_License_Cocaine","cocaine",100000,false,"civ", 9)
	LICENSEMACRO(sand,"STR_License_Sand","sand",7500,false,"civ", 3)
	LICENSEMACRO(iron,"STR_License_Iron","iron",9000,false,"civ", 2)
	LICENSEMACRO(copper,"STR_License_Copper","copper",8000,false,"civ", 2)
	LICENSEMACRO(cement,"STR_License_Cement","cement",6500,false,"civ", 3)
	LICENSEMACRO(mAir,"STR_License_Pilot","mAir",15000,false,"med", -1)
	LICENSEMACRO(home,"STR_License_Home","home",500000,false,"civ", -1)
	LICENSEMACRO(aAir,"STR_License_ADAC","aAir",15000,false,"adac", -1)
	LICENSEMACRO(meth,"STR_License_Meth","meth",120000,false,"civ", 8)
	LICENSEMACRO(gold,"STR_License_Gold","gold",30000,false,"civ", 4)
	LICENSEMACRO(silber,"STR_License_Silber","silber",15000,false,"civ", 4)
	LICENSEMACRO(uran,"STR_License_Uran","uran",130000,true,"civ", 8)
	LICENSEMACRO(lsd,"STR_License_Lsd","lsd",115000,true,"civ", 7)
	LICENSEMACRO(pcola,"STR_License_Pcola","pcola",1000,false,"civ", -1)
	LICENSEMACRO(sotb,"STR_License_Sotb","sotb",1000,false,"civ", -1)
	LICENSEMACRO(mait,"STR_License_Mait","mait",1000,false,"civ", -1)
	LICENSEMACRO(stiller,"STR_License_Stiller","stiller",50000,true,"civ", 5)
	LICENSEMACRO(liquor,"STR_License_Liquor","liquor",100000,false,"civ", 4)
	LICENSEMACRO(bottler,"STR_License_Bottler","bottler",100000,false,"civ", 3)
	LICENSEMACRO(hunting,"STR_License_Hunting","hunting",100000,false,"civ", 3)
	LICENSEMACRO(antiquitaeten,"STR_License_Antiquitaeten","antiquitaeten",500000,false,"civ", 9)
	LICENSEMACRO(mash,"STR_License_Mash","mash",100000,false,"civ", 5)
	LICENSEMACRO(craftVehicle,"STR_License_craftVehicle","craftVehicle",400000,false,"civ", -1)
	LICENSEMACRO(craftWeapon,"STR_License_craftWeapon","craftWeapon",400000,false,"civ", -1)
	LICENSEMACRO(craftClothing,"STR_License_craftClothing","craftClothing",200000,false,"civ", -1)
	LICENSEMACRO(taxi,"STR_License_Taxi","taxi",60000,false,"civ", -1)
	LICENSEMACRO(gang,"STR_License_Gang","gang",10000000,false,"civ", -1)
    LICENSEMACRO(kohle,"STR_License_Kohle","kohle",8000,false,"civ", 2)
    LICENSEMACRO(swsaeure,"STR_License_Swsaeure","swsaeure",85000,false,"civ", 6)
    LICENSEMACRO(farbstoff,"STR_License_Farbstoff","farbstoff",40000,false,"civ", 6)
};


/*
	Skills
	
	Params:
	Class Entry, DisplayName,VariableName,Level,Skillpunkte,Illegal,side indecator,dependence,kindOf,price,info
*/
class Skills {
	//Legal
	SKILLMACRO(silver_tg,"STR_SKILL_silver_tg","silver_tg",1,1,false,"civ","","",20000,"STR_SKILL_silver_tgInfo")
	SKILLMACRO(delivery,"STR_SKILL_delivery","delivery",1,1,false,"civ","","",20000,"STR_SKILL_deliveryInfo")
	SKILLMACRO(brawny,"STR_SKILL_brawny","brawny",3,1,false,"civ","","processing",40000,"STR_SKILL_brawnyInfo")
	SKILLMACRO(processing,"STR_SKILL_processing","processing",3,1,false,"civ","brawny","",40000,"STR_SKILL_processingInfo")
	SKILLMACRO(nourished,"STR_SKILL_nourished","nourished",3,1,false,"civ","","hungerGames",40000,"STR_SKILL_nourishedInfo")
	SKILLMACRO(hungerGames,"STR_SKILL_hungerGames","hungerGames",3,1,false,"civ","nourished","survival",40000,"STR_SKILL_hungerGamesInfo")
	SKILLMACRO(survival,"STR_SKILL_survival","survival",3,2,false,"civ","hungerGames","",40000,"STR_SKILL_survivalInfo")
	SKILLMACRO(fishy,"STR_SKILL_fishy","fishy",3,1,false,"civ","","piscator",50000,"STR_SKILL_fishyInfo")
	SKILLMACRO(piscator,"STR_SKILL_piscator","piscator",3,1,false,"civ","fishy","trawler",50000,"STR_SKILL_piscatorInfo")
	SKILLMACRO(trawler,"STR_SKILL_trawler","trawler",3,2,false,"civ","piscator","",50000,"STR_SKILL_trawlerInfo")
	SKILLMACRO(mechanic,"STR_SKILL_mechanic","mechanic",4,1,false,"civ","","mechanic1",40000,"STR_SKILL_mechanicInfo")
	SKILLMACRO(mechanic1,"STR_SKILL_mechanic1","mechanic1",4,1,false,"civ","mechanic","mechanic2",50000,"STR_SKILL_mechanic1Info")
	SKILLMACRO(mechanic2,"STR_SKILL_mechanic2","mechanic2",4,2,false,"civ","mechanic1","",60000,"STR_SKILL_mechanic2Info")
	SKILLMACRO(gps,"STR_SKILL_gps","gps",5,1,false,"civ","","gpsAir",40000,"STR_SKILL_gpsInfo")
	SKILLMACRO(gpsAir,"STR_SKILL_gpsAir","gpsAir",5,1,false,"civ","gps","",40000,"STR_SKILL_gpsAirInfo")
	SKILLMACRO(heal,"STR_SKILL_heal","heal",5,1,false,"civ","","heal1",50000,"STR_SKILL_healInfo")
	SKILLMACRO(homeS,"STR_SKILL_homeS","homeS",6,2,false,"civ","","homeS1",60000,"STR_SKILL_homeSInfo")
	SKILLMACRO(homeS1,"STR_SKILL_homeS1","homeS1",6,3,false,"civ","homeS","",60000,"STR_SKILL_homeSInfo")
	SKILLMACRO(heal1,"STR_SKILL_heal1","heal1",8,3,false,"civ","heal","",50000,"STR_SKILL_heal1Info")
	//Illegal
	SKILLMACRO(twocker,"STR_SKILL_twocker","twocker",5,1,true,"civ","","twocker1",50000,"STR_SKILL_twockerInfo")
	SKILLMACRO(twocker1,"STR_SKILL_twocker1","twocker1",5,1,true,"civ","twocker","",50000,"STR_SKILL_twocker1Info")
	SKILLMACRO(intimidating,"STR_SKILL_Intimidating","intimidating",5,1,true,"civ","","heister",60000,"STR_SKILL_IntimidatingInfo")
	SKILLMACRO(heister,"STR_SKILL_heister","heister",5,2,true,"civ","intimidating","systemE",80000,"STR_SKILL_heisterInfo")
	SKILLMACRO(systemE,"STR_SKILL_systemE","systemE",5,2,true,"civ","heister","",80000,"STR_SKILL_systemEInfo")
	SKILLMACRO(weed,"STR_SKILL_weed","weed",6,1,true,"civ","","heroin",80000,"STR_SKILL_IllegalInfo")
	SKILLMACRO(heroin,"STR_SKILL_heroin","heroin",6,1,true,"civ","weed","lsd",80000,"STR_SKILL_IllegalInfo")
	SKILLMACRO(lsdS,"STR_SKILL_lsdS","lsdS",6,1,true,"civ","heroin","methS",80000,"STR_SKILL_IllegalInfo")
	SKILLMACRO(methS,"STR_SKILL_methS","methS",6,1,true,"civ","lsdS","uranS",80000,"STR_SKILL_IllegalInfo")
	SKILLMACRO(uranS,"STR_SKILL_uranS","uranS",6,2,true,"civ","methS","kokain",80000,"STR_SKILL_IllegalInfo")
	SKILLMACRO(kokain,"STR_SKILL_kokain","kokain",6,2,true,"civ","uranS","",80000,"STR_SKILL_IllegalInfo")
	SKILLMACRO(turtle,"STR_SKILL_turtle","turtle",6,1,true,"civ","","",80000,"STR_SKILL_turtleInfo")
	SKILLMACRO(truck,"STR_SKILL_truck","truck", 10,2,true,"civ","","",80000,"STR_SKILL_truckInfo")
};


class VirtualShops {
	class market {
		name = "STR_Shops_Market";
		items[] = { "waterBottle", "rabbit_grilled","banane","birne","cerises", "apple", "redgull", "tbacon", "farbstoff", "kohle", "lockpick", "carCharger", "pickaxe", "schaufel", "handschuhe", "motorsaege", "kescher", "goldsieb", "messer", "battery", "repairkit", "firstaidkit", "fuelFull", "peach", "boltcutter", "speedtrapdetector", "storagesmall", "storagebig", "farbstoff", "kohle" };
	};

	class rebel {
		name = "STR_Shops_Rebel";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "abrissbirne", "base_toolkit", "handcuffs", "carCharger", "craft_paper", "bomb", "underwatercharge", "lockpick", "pickaxe", "schaufel", "handschuhe", "motorsaege", "kescher", "goldsieb", "messer", "battery", "repairkit", "firstaidkit", "scalpel", "fuelFull", "peach", "boltcutter", "blastingcharge" };
	};
   
	class gang {
		name = "STR_Shops_Gang";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "handcuffs", "carCharger", "craft_paper", "bomb", "underwatercharge", "lockpick", "pickaxe", "schaufel", "handschuhe", "motorsaege", "kescher", "goldsieb", "messer", "battery", "repairkit", "firstaidkit", "scalpel", "fuelFull", "peach", "boltcutter", "blastingcharge" };
	};
    
    class cop {
		name = "STR_Shops_Cop";
		items[] = { "donut", "coffee", "waterBottle", "rabbit_grilled" };
	};
    
    class cop_gear {
        name = "STR_Shops_CopGear";
        items[] = {"debitcard","gpstracker","adac_toolkit","fuelFull","battery", "carCharger", "repairkit","firstaidkit","bd_mk1_bleachweapon","bd_mk1_ammo","troll_taschentuch","troll_nuckel","troll_bitering","troll_money","defusekit","speedtrap","laptop","organttk","kidney"};
    };
    
    class adac {
		name = "STR_Shops_ADAC"	;
		items[] = {"debitcard","waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "carCharger", "wkasten", "fuelEmpty","fuelFull","fuelPipe","adac_toolkit","battery","repairkit","firstaidkit"};
	};
    
    class medic {
        name = "STR_Shops_Medic";
        items[] = {"debitcard","waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "carCharger", "fuelFull","battery","repairkit","firstaidkit","organttk","kidney"};
    };
    
    class bank {
		name = "STR_Shops_Bank";
		items[] = { "debitcard" };
	};

	class wongs {
		name = "STR_Shops_Wongs";
		items[] = { "turtle_soup", "turtle_raw" };
	};

	class coffee {
		name = "STR_Shops_Coffee";
		items[] = { "coffee", "donuts" };
	};
	
	class drugdealer {
		name = "STR_Shops_DrugDealer";
		items[] = { "cocaine_processed", "heroin_processed", "marijuana", "meth_processed", "frogslsd" };
	};

	class oil {
		name = "STR_Shops_Oil";
		items[] = { "oil_processed", "pickaxe", "fuelFull" };
	};

	class fishmarket {
		name = "STR_Shops_FishMarket";
		items[] = { "salema_raw", "salema_grilled", "ornate_raw", "ornate_grilled", "mackerel_raw", "mackerel_grilled", "tuna_raw", "tuna_grilled", "mullet_raw", "mullet_fried", "catshark_raw", "catshark_fried" };
	};

	class glass {
		name = "STR_Shops_Glass";
		items[] = { "glass" };
	};

	class iron  {
		name = "STR_Shops_Minerals";
		items[] = { "iron_refined", "copper_refined" };
	};

	class diamond {
		name = "STR_Shops_Diamond";
		items[] = { "diamond_uncut", "diamond_cut" };
	};

	class salt {
		name = "STR_Shops_Salt";
		items[] = { "salt_refined" };
	};

	class cement {
		name = "STR_Shops_Cement";
		items[] = { "cement" };
	};

	class gold {
		name = "STR_Shops_Gold";
		items[] = { "goldbar" };
	};
		
	class coctail {
		name = "STR_Shops_Coctail";
		items[] = {"apple","peach","banane","cerises","birne","pcolap","sotbp","maitp"};
	};
	
	class beer {
		name = "STR_Shops_Beer";
		items[] = {"bottledbeer","bottledwhiskey","cornmeal","bottles"};
	};
	
	class gas {
		name = "STR_Shops_Gas";
		items[] = {"waterBottle","tbacon","oil_unprocessed","fuelFull","pickaxe", "carCharger"};
	};
		
	class juwel {
		name = "STR_Shops_EdelM";
		items[] = {"gold_processed","reingold","silber_processed", "zink", "nickel", "blei", "messing"};
	};
		
	class blackmarket {
		name = "STR_Shops_Black";
		items[] = {"uran_unprocessed","uran_processed","goldbar","kidney","goldbarp","bottledshine","moonshine", "schwefelsaeure", "patronenh", "schwarzp", "projektil"};
	};
	
	class turtledealer {
		name = "STR_Shops_turtle";
		items[] = {"turtle_raw"};
	};
	
	class weapon_shop {
		name = "STR_Shops_Weapon";
		items[] = {"craft_verriegelungs","craft_verschluss","craft_sicherungsh","craft_boden_schlies","craft_patronenlager","craft_kautschuk","craft_cheytac","craft_zweibein","craft_repetier","craft_reaver","craft_slingshot","craft_gewinde","craft_epdm","craft_mineralf","craft_edelstahlv","craft_edelstahll","craft_kondenzs","craft_streckmetall","craft_daemmkernt"};
	};
	
     class vehicle_shop {
		name = "STR_Shops_Vehicle";
		items[] = {"craft_motor_a","craft_motor_h","craft_getriebe_a","craft_getriebe_h","craft_kleinteile","craft_kupplung_a","craft_kupplung_h","craft_sondert","craft_kautschuk","craft_seitenr","craft_hoehenr","craft_pilotensitz","craft_querr","craft_triebw","craft_kabine","craft_instru","craft_landek"};
	};
    
    class base1 {
		name = "STR_Shops_Base1";
		items[] = {"bunkerbig","sandsack","sandsackecke","sandsackrund"};
	};
    
    class base2 {
		name = "STR_Shops_Base2";
		items[] = {"bunkersmall","hsmall","hsmalleinzel"};
	};
    
    class base3 {
		name = "STR_Shops_Base3";
		items[] = {"hturm","Hbig","hbarrierEcke","hBarriereCorridor"};
	};
    
    class base4 {
		name = "STR_Shops_Base4";
		items[] = {"stachel","lampsmall","schranke"};
	};
    
    class base5 {
		name = "STR_Shops_Base5";
		items[] = {"schiesswand","schiesswandfenster","schiesswandducken","schiesswandspring","schiessdeckungmitt","schiessdeckungducken","schiessdeckungliegen","schiessziel","ziel"};
	};
    
    class base6 {
		name = "STR_Shops_Base6";
		items[] = {"camo","map","strom","sun","fire","stuhl","stuhl2","lautsp","firetonne","helisquare","helicircle"};
	};
    
    class base7 {
		name = "STR_Shops_Base7";
		items[] = {"bigturm","turm","cargohq","aid"};
	};
    
    class base8 {
		name = "STR_Shops_Base8";
		items[] = {"garage","helig","lagerhalle","cargoschwarz","storagebigb","cargo"};
	};
};

#include "Config_Vehicles.hpp"
#include "Config_Houses.hpp"
