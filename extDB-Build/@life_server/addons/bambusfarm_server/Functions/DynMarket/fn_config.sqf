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
DYNMARKET_PriceUpdateInterval  = 01;   // After how many minutes should the price be updated?
DYNMARKET_CreateBackups        = true; // Should the server save write the prices regulary into the Database? If false, it will save the prices before Server-restart?
DYNMARKET_CreateBackupInterval = 01;   // After how many updates (PriceUpdateIntervals) should the prices be saved into the Database?
DYNMARKET_UserNotification     = false; // Should the user be informed with a hint whenever the prices got updated?

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
			["apple",-1,1,50], //25
			["peach",-1,10,50], //25
			["oilp",-1,2000,4786], //3200
			["diamond",-1,286,1000], //750
			["diamondc",-1,1455,5456], //2000
			["iron_r",-1,2546,4678], //3200
			["copper_r",-1,678,2657], //1500
			["salt_r",-1,976,2658], //1650
			["glass",-1,10,2000], //1450
			["fuelF",-1,354,1245], //500
			["cement",-1,964,2836] //1950
		],
		0.5
	],
	["Illegal", 
		[
			["heroinu",-1,1246,3456], //1850
			["heroinp",-1,1987,3546], //2650
			["turtle",-1,2368,4680], //3000
			["marijuana",-1,1257,3458], //2350
			["cocaine",-1,2479,4689], //3000
			["cocainep",-1,3480,6790], //5000
			["goldbar",-1,70000,120000] //95000
		],
		0.5
	],
	["Fish",
     	[
			["salema",-1,10,1000], //45
			["ornate",-1,10,1000], //40
			["mackerel",-1,10,2500], //175
			["tuna",-1,10,8000], //700
			["mullet",-1,10,4000], //250
			["catshark",-1,10,5000] //300
     	],
     	0.5
    ],
	["Aktien",
     	[
			["aktie_FUX",-1,0,1000], //45
			["aktie_windoof",-1,0,1000], //45
			["aktie_doller",-1,0,1000], //45
			["aktie_oel",-1,0,1000], //45
			["aktie_linux",-1,0,1000], //45
			["aktie_gold",-1,0,1000], //45
			["aktie_kupfer",-1,0,1000], //45
			["aktie_facebak",-1,0,1000], //45
			["aktie_altis",-1,0,1000], //45
			["aktie_stratis",-1,0,1000] //45
     	],
     	0.5
    ]
];

// █████████████████    ALL SELLABLE ITEMS    █████████████████

DYNMARKET_Items_ToTrack        = 
[
	["Platzhalter",0],

	["apple",25],
	["oilp",2750],
	["peach",25],
	["diamond",750],
    ["diamondc",2000],
	["iron_r",2750],
    ["copper_r",1500],
    ["salt_r",1500],
    ["glass",1240],
	["cement",1950],

	["Platzhalter",0],

	["heroinu",1850],
	["heroinp",2650],
	["turtle",3000],
	["cocaine",3000],
    ["cocainep",5000],
    ["marijuana",2350],
    ["goldbar",95000],
    ["turtlesoup",1000],

	["Platzhalter",0],

	["salema",450],
    ["ornate",400],
    ["mackerel",1750],
    ["tuna",7000],
    ["mullet",2500],
    ["catshark",3000],

	["Platzhalter",0],

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

	["Platzhalter",0],

	["rabbit",65],
	["water",5],
	["coffee",5],
	["donuts",60],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["fuelF",500],
	["spikeStrip",1200],

	["Platzhalter",0]


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
