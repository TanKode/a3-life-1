/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oilu": {"bambusfarm_inv_oilu"};
			case "oilp": {"bambusfarm_inv_oilp"};
			case "heroinu": {"bambusfarm_inv_heroinu"};
			case "heroinp": {"bambusfarm_inv_heroinp"};
			case "cannabis": {"bambusfarm_inv_cannabis"};
			case "marijuana": {"bambusfarm_inv_marijuana"};
			case "apple": {"bambusfarm_inv_apple"};
			case "water": {"bambusfarm_inv_water"};
			case "rabbit": {"bambusfarm_inv_rabbit"};
			case "salema": {"bambusfarm_inv_salema"};
			case "ornate": {"bambusfarm_inv_ornate"};
			case "mackerel": {"bambusfarm_inv_mackerel"};
			case "tuna": {"bambusfarm_inv_tuna"};
			case "mullet": {"bambusfarm_inv_mullet"};
			case "catshark": {"bambusfarm_inv_catshark"};
			case "turtle": {"bambusfarm_inv_turtle"};
			case "fishing": {"bambusfarm_inv_fishingpoles"};
			case "coffee": {"bambusfarm_inv_coffee"};
			case "turtlesoup": {"bambusfarm_inv_turtlesoup"};
			case "donuts": {"bambusfarm_inv_donuts"};
			case "fuelE": {"bambusfarm_inv_fuelE"};
			case "fuelF": {"bambusfarm_inv_fuelF"};
			case "money": {"bambusfarm_TASCHENGELD"};
			case "pickaxe": {"bambusfarm_inv_pickaxe"};
			case "copperore": {"bambusfarm_inv_copperore"};
			case "ironore": {"bambusfarm_inv_ironore"};
			case "iron_r": {"bambusfarm_inv_ironr"};
			case "copper_r": {"bambusfarm_inv_copperr"};
			case "salt": {"bambusfarm_inv_salt"};
			case "salt_r": {"bambusfarm_inv_saltr"};
			case "sand": {"bambusfarm_inv_sand"};
			case "glass": {"bambusfarm_inv_glass"};
			case "tbacon": {"bambusfarm_inv_tbacon"};
			case "lockpick": {"bambusfarm_inv_lockpick"};
			case "redgull": {"bambusfarm_inv_redgull"};
			case "peach": {"bambusfarm_inv_peach"};
			case "diamond": {"bambusfarm_inv_diamond"};
			case "diamondc": {"bambusfarm_inv_diamondr"};
			case "cocaine": {"bambusfarm_inv_coke"};
			case "cocainep": {"bambusfarm_inv_cokep"};
			case "spikeStrip": {"bambusfarm_inv_spikeStrip"};
			case "cement": {"bambusfarm_inv_cement"};
			case "rock": {"bambusfarm_inv_rock"};
			case "goldbar": {"bambusfarm_inv_goldbar"};
			case "blastingcharge": {"bambusfarm_inv_blastingcharge"};
			case "boltcutter": {"bambusfarm_inv_boltcutter"};
			case "defusekit": {"bambusfarm_inv_defusekit"};
			case "storagesmall": {"bambusfarm_inv_storagesmall"};
			case "storagebig": {"bambusfarm_inv_storagebig"};
			//Aktien
			case "aktie_FUX": {"bambusfarm_inv_aktie_FUX"};
			case "aktie_windoof": {"bambusfarm_inv_aktie_windoof"};
			case "aktie_doller": {"bambusfarm_inv_aktie_doller"};
			case "aktie_oel": {"bambusfarm_inv_aktie_oel"};
			case "aktie_linux": {"bambusfarm_inv_aktie_linux"};
			case "aktie_gold": {"bambusfarm_inv_aktie_gold"};
			case "aktie_kupfer": {"bambusfarm_inv_aktie_kupfer"};
			case "aktie_facebak": {"bambusfarm_inv_aktie_facebak"};
			case "aktie_altis": {"bambusfarm_inv_aktie_altis"};
			case "aktie_stratis": {"bambusfarm_inv_aktie_stratis"};
			case "handcuffs": {"bambusfarm_inv_handcuffs"};
			case "Platzhalter": {"bambusfarm_inv_Platzhalter"};
			case "Schere": {"bambusfarm_inv_Schere"};
			case "lappi":{"bambusfarm_inv_laptop"};
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			case "bambusfarm_inv_oilu": {"oilu"};
			case "bambusfarm_inv_oilp": {"oilp"};
			case "bambusfarm_inv_heroinu": {"heroinu"};
			case "bambusfarm_inv_heroinp": {"heroinp"};
			case "bambusfarm_inv_cannabis": {"cannabis"};
			case "bambusfarm_inv_marijuana": {"marijuana"};
			case "bambusfarm_inv_apple": {"apple"};
			case "bambusfarm_inv_water": {"water"};
			case "bambusfarm_inv_rabbit": {"rabbit"};
			case "bambusfarm_inv_salema": {"salema"};
			case "bambusfarm_inv_ornate": {"ornate"};
			case "bambusfarm_inv_mackerel": {"mackerel"};
			case "bambusfarm_inv_tuna": {"tuna"};
			case "bambusfarm_inv_mullet": {"mullet"};
			case "bambusfarm_inv_catshark": {"catshark"};
			case "bambusfarm_inv_turtle": {"turtle"};
			case "bambusfarm_inv_fishingpoles": {"fishing"};
			case "bambusfarm_inv_coffee": {"coffee"};
			case "bambusfarm_inv_turtlesoup": {"turtlesoup"};
			case "bambusfarm_inv_donuts": {"donuts"};
			case "bambusfarm_inv_fuelE": {"fuelE"};
			case "bambusfarm_inv_fuelF": {"fuelF"};
			case "bambusfarm_TASCHENGELD": {"money"};
			case "bambusfarm_inv_pickaxe": {"pickaxe"};
			case "bambusfarm_inv_copperore": {"copperore"};
			case "bambusfarm_inv_ironore": {"ironore"};
			case "bambusfarm_inv_ironr": {"iron_r"};
			case "bambusfarm_inv_copperr": {"copper_r"};
			case "bambusfarm_inv_sand": {"sand"};
			case "bambusfarm_inv_salt": {"salt"};
			case "bambusfarm_inv_glass": {"glass"};
			case "bambusfarm_inv_redgull": {"redgull"};
			case "bambusfarm_inv_lockpick": {"lockpick"};
			case "bambusfarm_inv_tbacon": {"tbacon"};
			case "bambusfarm_inv_peach": {"peach"};
			case "bambusfarm_inv_diamond": {"diamond"};
			case "bambusfarm_inv_diamondr": {"diamondc"};
			case "bambusfarm_inv_saltr": {"salt_r"};
			case "bambusfarm_inv_coke": {"cocaine"};
			case "bambusfarm_inv_cokep": {"cocainep"};
			case "bambusfarm_inv_spikeStrip": {"spikeStrip"};
			case "bambusfarm_inv_cement": {"cement"};
			case "bambusfarm_inv_rock": {"rock"};
			case "bambusfarm_inv_goldbar": {"goldbar"};
			case "bambusfarm_inv_blastingcharge": {"blastingcharge"};
			case "bambusfarm_inv_boltcutter": {"boltcutter"};
			case "bambusfarm_inv_defusekit": {"defusekit"};
			case "bambusfarm_inv_storagesmall": {"storagesmall"};
			case "bambusfarm_inv_storagebig": {"storagebig"};
			//Aktien
			case "bambusfarm_inv_aktie_FUX": {"aktie_FUX"};
			case "bambusfarm_inv_aktie_windoof": {"aktie_windoof"};
			case "bambusfarm_inv_aktie_doller": {"aktie_doller"};
			case "bambusfarm_inv_aktie_oel": {"aktie_oel"};
			case "bambusfarm_inv_aktie_linux": {"aktie_linux"};
			case "bambusfarm_inv_aktie_gold": {"aktie_gold"};
			case "bambusfarm_inv_aktie_kupfer": {"aktie_kupfer"};
			case "bambusfarm_inv_aktie_facebak": {"aktie_facebak"};
			case "bambusfarm_inv_aktie_altis": {"aktie_altis"};
			case "bambusfarm_inv_aktie_stratis": {"aktie_stratis"};
			case "bambusfarm_inv_handcuffs": {"handcuffs"};
			case "bambusfarm_inv_Platzhalter": {"Platzhalter"};
			case "bambusfarm_inv_Schere": {"Schere"};
			case "bambusfarm_inv_laptop":{"lappi"};
		};
	};
};
