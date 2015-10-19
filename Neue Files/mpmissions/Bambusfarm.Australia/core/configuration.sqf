#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_siren2_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_mauer = ObjNull;
life_wkasten = ObjNull;
life_respawn_timer = 0.1; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_request_timer = false;
life_smartphoneTarget = ObjNull;
life_aufTarget = ObjNull;
life_bagsound_playing = false;
life_sitting = false;
life_my_gang = ObjNull;
life_TankLaster = 1;
life_drink = 0;
life_action_gathering = false;
life_vdFoot = viewDistance;
life_vdCar = viewDistance;
life_vdAir = viewDistance;
life_action_gather = false;
tawvd_addon_disable = true;
life_god = false;//Add this
life_markers = false; //Finally this
nn_last_vehicles = [];
deleteAufMarker = [];
life_fadeSound = false;
eventStart = false;
eventEnd = false;
eventAirDropWait = false;
eventAirDropEnd = false;
life_oel_pumpe = false;
life_AirDropStart = false;
bk_warning = false;
bg_time = false;
life_money = false;
rulesok = false;
reloadWeapon = false;
newAuftraege = true;
life_nlrtimer_stop = false;
life_nlrtimer_running = false;
life_nottoofast = 0;
life_spyglassamount = 0;
life_calledTaxi = false;
life_isOnDutyTaxi = false;
life_inTaxi = false;
life_canVote = false;
life_voted = false;
life_frozen = false;
life_drug = 0;
life_taxes = 0;
life_sex_ill = 0;	// hooker
life_checked = 0;	// hooker
life_colorEffects = 0;
life_abrissbirne = 0;
life_adminWaring = 0;
//skillsystem
life_skillLegal = true; 
life_skill_mechanic = 0; 
life_skill_heal1 = false;
//positionsave
life_last_position = [];
life_isPlayer_alive = true;

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
life_maxWeightT = LIFE_SETTINGS(getNumber,"total_maxWeightT");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
life_battery = 100;
CASH = 0;

//Starting Bank Money
COP_BANK = 300000;
CIV_BANK = 100000;
MED_BANK = 300000;
ADAC_BANK = 300000;

// Start Skillsystem
LEVEL = 0;
EXP = 0;
SKILLPOINT = 0;
NEXTEXP = 0;

life_istazed = false;
life_vehicles = [];

// Kavala SafeZone
life_safezone_penalty = 0;
life_safezone_penalty_time = time;

switch (playerSide) do {
	case west: {
		BANK = COP_BANK;
		life_paycheck = 6000; //Paycheck Amount
	};
	
	case civilian: {
		BANK = CIV_BANK;
		life_paycheck = 800; //Paycheck Amount
	};
	
	case independent: {
		BANK = MED_BANK;
		life_paycheck = 2000;
	};
	
	case east: {
		BANK = ADAC_BANK;
		life_paycheck = 2000;
	};
};

// Safezone config
life_safezone_status = false;
life_safezone_config = [
["safezone_kavalla","Kavalla",civilian,35,true],
["safezone_Airport","Airport",civilian,135,true],
["safezone_Airsoft","AirSoft-Zone",civilian,180,false],	
["safezone_knast","Knast",civilian,100,false]
];

/*
	Master Array of items?
*/
//Setup variable inv vars.
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

life_licenses = [];
/* Setup the BLAH! */
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");
	life_licenses pushBack [LICENSE_VARNAME(_varName,_sideFlag)];
	SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
} foreach ("true" configClasses (missionConfigFile >> "Licenses"));

/* Setup the SKILLS! */
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");
	
	SVAR_MNS [SKILL_VARNAME(_varName,_sideFlag),false];
} foreach ("true" configClasses (missionConfigFile >> "skills"));
