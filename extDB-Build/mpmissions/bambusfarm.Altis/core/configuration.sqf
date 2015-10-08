#include <macro.h>
/*
*****************************
****** Backend Variables *****
*****************************
*/
bambusfarm_query_time = time;
bambusfarm_action_delay = time;
bambusfarm_trunk_vehicle = Objnull;
bambusfarm_session_completed = false;
bambusfarm_garage_store = false;
bambusfarm_session_tries = 0;
bambusfarm_net_dropped = false;
bambusfarm_hit_explosive = false;
bambusfarm_siren_active = false;
bambusfarm_clothing_filter = 0;
bambusfarm_clothing_uniform = -1;
bambusfarm_Tswiftie = 5;
bambusfarm_ShakeItOff = 17503;
bambusfarm_sync = true;
bambusfarm_hacker = false;
bambusfarm_redgull_effect = time;
bambusfarm_is_processing = false;
bambusfarm_bail_paid = false;
bambusfarm_impound_inuse = false;
bambusfarm_diagWaiting = false;
bambusfarm_action_inUse = false;
bambusfarm_spikestrip = ObjNull;
bambusfarm_theLappi = ObjNull;
bambusfarm_bet = false;
bambusfarm_knockout = false;
bambusfarm_interrupted = false;
bambusfarm_respawned = false;
bambusfarm_removeWanted = false;
bambusfarm_action_gathering = false;
bambusfarm_action_gatheringPick = false;
SzoneXW = [safezoneX + safezoneW - 0.89,0.50];	//was tolles
SzoneYH = [safezoneY + safezoneH - 1.28,0.7];	//nochwas tolles
DonatorBuyChange = 1;
DonatorBuyChangeCar = 1;
Pay2Don = ceil(random 5000);
Pay1Don = ceil(random 1500);
bambusfarm_Tankt = false;
bambusfarm_BenzinPreis = 150;
bambusfarm_KerosinPreis = 150;
bambusfarm_BuyAble = 0;			//Item auf Lager? 0 = Nein || 1 = Ja
bambusfarm_IsBuying = 0;			//Bereits am kaufen? 0 = Nein ||1 = Ja
bambusfarm_BenzinFuellen = 0;
bambusfarm_Tage = 0;									//wann ist die Periode des Servers wieder f‰llig? (Miete - muﬂ gesetzt sein)
bambusfarm_Karma = 0;								//... is a bitch! (Karma-sys - muﬂ gesetzt sein)
bambusfarm_MieteAbfrage = 0;							//macht Mietabfrage/zahlt gerade?
bambusfarm_messages = [];
bambusfarm_positions = [];
bambusfarm_names = [];
bambusfarm_player = [];


PayDynamicDonator = Pay1Don + Pay2Don + floor(random 300);

//Persistent Saving
__CONST__(bambusfarm_save_civ,true); //Save weapons for civs?
__CONST__(bambusfarm_save_yinv,true); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(bambusfarm_revive_cops,false); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(bambusfarm_revive_fee,250); //Fee for players to pay when revived.

//House Limit
__CONST__(bambusfarm_houseLimit,5); //Maximum amount of houses a player can buy

//Gang related stuff?
__CONST__(bambusfarm_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(bambusfarm_gangUpgradeBase,10000); //MASDASDASD
__CONST__(bambusfarm_gangUpgradeMultipler,2.5); //BLAH

__CONST__(bambusfarm_enableFatigue,true); //Enable / Disable the ARMA 3 Fatigue System

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
bambusfarm_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
bambusfarm_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
bambusfarm_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
bambusfarm_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** bambusfarm Variables *******
*****************************
*/
bambusfarm_net_dropped = false;
bambusfarm_hit_explosive = false;
bambusfarm_siren_active = false;
bambusfarm_bank_fail = false;
bambusfarm_use_atm = true;
bambusfarm_is_arrested = false;
bambusfarm_delivery_in_progress = false;
bambusfarm_action_in_use = false;
bambusfarm_thirst = 100;
bambusfarm_hunger = 100;

bambusfarm_drugged_weed = -1;
bambusfarm_drugged_weed_duration = 3;
__CONST__(bambusfarm_paycheck_period,5); //Five minutes
__CONST__(bambusfarm_steuer_period,10); //Five minutes
bambusfarm_TASCHENGELD = 0;
__CONST__(bambusfarm_impound_car,350);
__CONST__(bambusfarm_impound_boat,250);
__CONST__(bambusfarm_impound_air,850);
bambusfarm_istazed = false;
bambusfarm_my_gang = ObjNull;

bambusfarm_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		bambusfarm_BANK = 70000; //Starting Bank Money
		bambusfarm_paycheck = 500; //Paycheck Amount
	};
	case civilian:
	{
		bambusfarm_BANK = 30000; //Starting Bank Money
		bambusfarm_paycheck = 350; //Paycheck Amount
	};

	case independent: {
		bambusfarm_BANK = 65000;
		bambusfarm_paycheck = 450;
	};
};

bambusfarm_dp_points = [
    "dp_1",
    "dp_2",
    "dp_3",
    "dp_4",
    "dp_5",
    "dp_6",
    "dp_7",
    "dp_8",
    "dp_9",
    "dp_10",
    "dp_11",
    "dp_12",
    "dp_13",
    "dp_14",
    "dp_15",
    "dp_15",
    "dp_16",
    "dp_17",
    "dp_18",
    "dp_19",
    "dp_20",
    "dp_21",
    "dp_22",
    "dp_23",
    "dp_24",
    "dp_25"
];

bambusfarm_MenuContent = [
	["Willkommen","Willkommen auf Bambusfarm Community","Herzlich willkommen mein Freund!<br/> Wir w¸nschen dir viel Spaﬂ auf unserem Server bitte halte dich immer an die Regeln, die anderen tun es schlieﬂlich auch<br/>! Desweitere, riskier bitte nicht zu oft dein Leben! Bei fragen bitte sofort im TS melden oder schreib uns eine E-Mail conntact@bambusfarm.net."],
	["Kontakt","So kannst du uns erreichen","<a color='#D0E354' href='http://www.teamspeak.com/invite/ts.bambusfarm.net/'>Teamspeak</a><br/><br/><a color='#D0E354' href='http://bambusfarm.net'>Webseite</a><br/><br/><a color='#D0E354' href='http://bambusfarm.net/app/forum/4-changelog'>Changelog</a> <br/><br/><a color='#D0E354' href='http://bambusfarm.net/app/forum/10-ankundigungen/6-serverregeln'>Regeln</a>"],
	//["Illegale Lizenzen","Illegale Lizenzen","F¸hrerschein -> 500<br/>Bootscheinw-> 1000<br/>Pilotenschein -> 25000<br/>Waffenschein -> 10000<br/>Tauschschein -> 2000<br/>÷lbohrungslizenz -> 10000<br/>Heroinlizenz -> 25000<br/>Cannabislizenz -> 19500<br/>Rebelenlizenz -> 75000<br/>LKW-F¸hrerschein -> 20000<br/>Diamantenlizenz ->35000<br/>Salzlizenz -> 12000<br/>Kokainlizenz -> 30000<br/>Sandlizenz -> 14500<br/>Eisenlizenz -> 9500<br/>Kupferlizenz -> 8000<br/>Zementlizenz -> 6500<br/>Hausbesitzeruhrkunde -> 75000"],
	//["Legale Lizenzen","Legale Lizenzen","In Arbeit..."],
	["Fahrzeuggewicht","Land","Offroader -> 75<br/>Quadbike -> 40<br/>Zamak Transport (Covered) -> 230<br/>Zamak Transport  -> 215<br/>Zamak Repair  -> 265<br/>Hatchback -> 40<br/>Hatchback Sport -> 45<br/>SUV -> 30<br/>Truck -> 75<br/>Truck Boxer  -> 115<br/>HEMTT Box  -> 375<br/>HEMTT Transport  -> 290<br/>HEMTT Transport (Covered)  -> 355<br/>O_Truck_03_transport_F -> 285<br/>O_Truck_03_covered_F -> 325<br/>O_Truck_03_repair_F -> 380<br/>O_Truck_03_fuel_F -> 50<br/>HEMTT -> 200<br/>O_Truck_03_device_F -> 420	"],
	["Fahrzeuggewicht","Luft","WY-55 Hellcat (Green)  -> 185<br/>MH-9 Hummingbird  -> 250<br/>PO-30 Orca (Black)  -> 360<br/>CH-49 Mohawk  -> 410<br/>"],
	["Fahrzeuggewicht","Wasser","Rescue Boat  -> 45<br/>Assault Boat  -> 45<br/>SDV  -> 70<br/>Motorboat -> 85"],
	["Tastenkombinationen","Geile moves und so..","In Arbeit..."],
	["Sichere Gebiete","Gebiete die Safezoens sind...","Alle ATM's,<br/>Alle Apfelgebiete,<br/>Alle Pfirsischgebiete,<br/>Alle Autoh‰ndler,<br/>Alle Flugh‰ndler,<br/>Alle Bootsh‰ndler"],
	["Bussgeld","Bussgeld","In Arbeit..."]
];

/*
	Master Array of items?
*/
bambusfarm_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
__CONST__(bambusfarm_vShop_rentalOnly,bambusfarm_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

bambusfarm_inv_items =
[
	"bambusfarm_inv_oilu",
	"bambusfarm_inv_oilp",
	"bambusfarm_inv_heroinu",
	"bambusfarm_inv_heroinp",
	"bambusfarm_inv_cannabis",
	"bambusfarm_inv_marijuana",
	"bambusfarm_inv_apple",
	"bambusfarm_inv_rabbit",
	"bambusfarm_inv_salema",
	"bambusfarm_inv_ornate",
	"bambusfarm_inv_mackerel",
	"bambusfarm_inv_tuna",
	"bambusfarm_inv_mullet",
	"bambusfarm_inv_catshark",
	"bambusfarm_inv_turtle",
	"bambusfarm_inv_fishingpoles",
	"bambusfarm_inv_water",
	"bambusfarm_inv_donuts",
	"bambusfarm_inv_turtlesoup",
	"bambusfarm_inv_coffee",
	"bambusfarm_inv_fuelF",
	"bambusfarm_inv_fuelE",
	"bambusfarm_inv_pickaxe",
	"bambusfarm_inv_copperore",
	"bambusfarm_inv_ironore",
	"bambusfarm_inv_ironr",
	"bambusfarm_inv_copperr",
	"bambusfarm_inv_sand",
	"bambusfarm_inv_salt",
	"bambusfarm_inv_saltr",
	"bambusfarm_inv_glass",
	"bambusfarm_inv_tbacon",
	"bambusfarm_inv_lockpick",
	"bambusfarm_inv_redgull",
	"bambusfarm_inv_peach",
	"bambusfarm_inv_diamond",
	"bambusfarm_inv_coke",
	"bambusfarm_inv_cokep",
	"bambusfarm_inv_diamondr",
	"bambusfarm_inv_spikeStrip",
	"bambusfarm_inv_rock",
	"bambusfarm_inv_cement",
	"bambusfarm_inv_goldbar",
	"bambusfarm_inv_blastingcharge",
	"bambusfarm_inv_boltcutter",
	"bambusfarm_inv_defusekit",
	"bambusfarm_inv_storagesmall",
	"bambusfarm_inv_storagebig",
	"bambusfarm_inv_aktie_FUX",
	"bambusfarm_inv_aktie_windoof",
	"bambusfarm_inv_aktie_doller",
	"bambusfarm_inv_aktie_oel",
	"bambusfarm_inv_aktie_linux",
	"bambusfarm_inv_aktie_gold",
	"bambusfarm_inv_aktie_kupfer",
	"bambusfarm_inv_aktie_facebak",
	"bambusfarm_inv_aktie_altis",
	"bambusfarm_inv_aktie_stratis",
	"bambusfarm_inv_Platzhalter",
	"bambusfarm_inv_handcuffs",
	"bambusfarm_inv_Schere",
	"bambusfarm_inv_laptop"
];

//[shortVar,reward]
bambusfarm_illegal_items = [["heroinu",1200],["handcuffs",200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["marijuana",2000],["turtle",3000],["blastingcharge",10000],["boltcutter",500]];


/*
	Sell / buy arrays
*/
sell_array =
[
	["apple",25],
	["heroinu",1850],
	["heroinp",2650],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",2750],
	["turtle",3000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2350],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",24],
	["cocaine",3000],
	["cocainep",5000],
	["diamond",750],
	["diamondc",2000],
	["iron_r",2750],
	["copper_r",1000],
	["salt_r",1500],
	["glass",1240],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1950],
	["goldbar",95000],
	["aktie_FUX",500],
    ["aktie_windoof",500],
    ["aktie_doller",500],
    ["aktie_oel",500],
    ["aktie_linux",500],
    ["aktie_gold",500],
    ["aktie_kupfer",500],
    ["aktie_facebak",500],
    ["aktie_altis",500],
    ["aktie_stratis",500],
    ["handcuffs",200],
    ["Schere",500],
    ["lappi",1000]
];

buy_array =
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["aktie_FUX",500],
    ["aktie_windoof",500],
    ["aktie_doller",500],
    ["aktie_oel",500],
    ["aktie_linux",500],
    ["aktie_gold",500],
    ["aktie_kupfer",500],
    ["aktie_facebak",500],
    ["aktie_altis",500],
    ["aktie_stratis",500],
    ["handcuffs",200],
    ["Schere",500],
    ["lappi",10000]
];
__CONST__(buy_array,buy_array);

bambusfarm_weapon_shop_array =
[
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["Binocular",0],
	["ItemGPS",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",0],
	["Chemlight_yellow",0],
	["Chemlight_green",0],
	["Chemlight_red",0],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",0],
	["acc_flashlight",0],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_Aco",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",0],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",0],
	["arifle_Mk20C_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0]
];
__CONST__(bambusfarm_weapon_shop_array,bambusfarm_weapon_shop_array);
bambusfarm_garage_prices =
[
	["B_Quadbike_01_F",50],
	["C_Hatchback_01_F",175],
	["C_Offroad_01_F", 175],
	["B_G_Offroad_01_F",200],
	["C_SUV_01_F",200],
	["C_Van_01_transport_F",350],
	["C_Hatchback_01_sport_F",400],
	["C_Van_01_fuel_F",200],
	["I_Heli_Transport_02_F",2500],
	["C_Van_01_box_F",500],
	["I_Truck_02_covered_F",1000],
	["I_Truck_02_transport_F",750],
	["I_Truck_02_box_F",1250],
	["B_Truck_01_covered_F",1750],
	["B_Truck_01_transport_F",1500],
	["B_Truck_01_box_F", 1750],
	["O_MRAP_02_F",1500],
	["B_Heli_Light_01_F",1250],
	["O_Heli_Light_02_unarmed_F",2500],
	["C_Rubberboat",500],
	["C_Boat_Civil_01_F",650],
	["B_Boat_Transport_01_F",200],
	["C_Boat_Civil_01_police_F",300],
	["B_Boat_Armed_01_minigun_F",875],
	["B_MRAP_01_F",1500],
	["I_MRAP_03_F",1500],
	["I_Heli_light_03_unarmed_F",2500],
	["C_Kart_01_Blu_F",625],
	["C_Kart_01_Fuel_F",625],
	["C_Kart_01_Red_F",625],
	["C_Kart_01_Vrana_F",625],
	["O_Truck_03_transport_F",1250],
	["O_Truck_03_covered_F",1500],
	["O_Truck_03_repair_F",1750],
	["O_Truck_03_fuel_F",10000],
	["B_Truck_01_mover_F",1750],
	["O_Truck_03_device_F",1750]
];
__CONST__(bambusfarm_garage_prices,bambusfarm_garage_prices);

bambusfarm_garage_sell =
[
	["B_Quadbike_01_F",500],
	["C_Hatchback_01_F",2000],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",12500],
	["C_SUV_01_F",4250],
	["C_Van_01_transport_F",3750],
	["C_Hatchback_01_sport_F",5000],
	["C_Van_01_fuel_F",200],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",7000],
	["I_Truck_02_covered_F",17500],
	["I_Truck_02_transport_F",16250],
	["I_Truck_02_box_F",21250],
	["B_Truck_01_covered_F",75000],
	["B_Truck_01_transport_F",15000],
	["B_Truck_01_box_F", 75000],
	["O_MRAP_02_F",10000],
	["B_Heli_Light_01_F",20000],
	["O_Heli_Light_02_unarmed_F",75000],
	["C_Rubberboat",2500],
	["C_Boat_Civil_01_F",11000],
	["B_Boat_Transport_01_F",750],
	["C_Boat_Civil_01_police_F",1250],
	["B_Boat_Armed_01_minigun_F",3500],
	["B_MRAP_01_F",162500],
	["I_MRAP_03_F",12500],
	["I_Heli_light_03_unarmed_F",7000],
	["C_Kart_01_Blu_F",2500],
	["C_Kart_01_Fuel_F",2500],
	["C_Kart_01_Red_F",2500],
	["C_Kart_01_Vrana_F",2500],
	["O_Truck_03_transport_F",65000],
	["O_Truck_03_covered_F",70000],
	["O_Truck_03_repair_F",75000],
	["O_Truck_03_fuel_F",5000000],
	["B_Truck_01_mover_F",15000],
	["O_Truck_03_device_F",1750]
];
__CONST__(bambusfarm_garage_sell,bambusfarm_garage_sell);

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach bambusfarm_inv_items;
//Licenses [license var, civ/cop]
bambusfarm_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
  	["license_civ_rebel","civ"],
  	["license_civ_coke","civ"],
  	["license_civ_diamond","civ"],
  	["license_civ_copper","civ"],
  	["license_civ_iron","civ"],
  	["license_civ_sand","civ"],
  	["license_civ_salt","civ"],
  	["license_civ_cement","civ"],
  	["license_med_air","med"],
  	["license_civ_home","civ"],
  	["license_med_ADAC","civ"]
  ];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach bambusfarm_licenses;