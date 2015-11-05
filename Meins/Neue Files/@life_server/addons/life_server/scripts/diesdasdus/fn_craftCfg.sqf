#include "\life_server\script_macros.hpp"
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft"];
_craft = [_this,0,0,[0]] call BIS_fnc_param;
_shop = craft_shop;
//_varieante = [_this,1,"",[""]] call BIS_fnc_param;
//if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	if(_shop == "weapons") then
	{
		case 0:
		{	
			[
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2],outputitem,level]
				["hgun_Rook40_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_sicherungsh",1,"craft_patronenlager",1,"craft_gehause",1,"craft_rohr",1], "", 4],
				["hgun_Pistol_heavy_02_Yorris_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_sicherungsh",1,"craft_patronenlager",1,"craft_gehause",1,"craft_rohr",1], "", 4],
				["hgun_ACPC2_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_sicherungsh",1,"craft_patronenlager",1,"craft_gehause",1,"craft_rohr",1], "", 4],
				["hgun_Pistol_heavy_01_MRD_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_sicherungsh",1,"craft_patronenlager",1,"craft_gehause",1,"craft_rohr",1], "", 4],
				["hgun_PDW2000_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_sicherungsh",1,"craft_patronenlager",1,"craft_gehause",1,"craft_rohr",1,"craft_hands",1,"craft_schulters",1], "", 4],
				["arifle_TRG20_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_patronenlager",1,"craft_boden_schlies",1,"craft_gehause",1,"craft_rohr",1,"craft_hands",1,"craft_schulters",1,"craft_paper",1], "", 6],
				["arifle_Katiba_C_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_patronenlager",1,"craft_boden_schlies",1,"craft_gehause",1,"craft_rohr",1,"craft_hands",1,"craft_schulters",1,"craft_paper",1], "", 8],
                ["30Rnd_65x39_caseless_green_mag_Tracer", ["patronenh",5,"projektil",5,"schwarzp",3,"farbstoff",30], "", -1],
				["SMG_01_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_patronenlager",1,"craft_boden_schlies",1,"craft_gehause",1,"craft_rohr",1,"craft_hands",1,"craft_schulters",1,"craft_paper",1], "", 6],
                ["30Rnd_45ACP_Mag_SMG_01_tracer_green", ["patronenh",10,"projektil",10,"schwarzp",5,"farbstoff",30], "", -1],
				["arifle_SDAR_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_patronenlager",1,"craft_boden_schlies",1,"craft_gehause",1,"craft_rohr",1,"craft_hands",1,"craft_schulters",1], "", 6],
                ["30Rnd_556x45_Stanag_Tracer_Red", ["patronenh",10,"projektil",10,"schwarzp",5,"farbstoff",30], "", -1],
                ["30Rnd_556x45_Stanag_Tracer_Green", ["patronenh",10,"projektil",10,"schwarzp",5,"farbstoff",30], "", -1],
                ["30Rnd_556x45_Stanag_Tracer_Yellow", ["patronenh",10,"projektil",10,"schwarzp",5,"farbstoff",30], "", -1],
				["arifle_MX_SW_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_sicherungsh",1,"craft_patronenlager",1,"craft_boden_schlies",1,"craft_gehause",1,"craft_rohr",1,"craft_hands",1,"craft_schulters",1,"craft_paper",1], "", 8],
                ["30Rnd_65x39_caseless_mag_Tracer", ["patronenh",10,"projektil",10,"schwarzp",5,"farbstoff",30], "", -1],
                ["100Rnd_65x39_caseless_mag_Tracer", ["patronenh",20,"projektil",20,"schwarzp",10,"farbstoff",50], "", -1],
				["srifle_EBR_F", ["craft_verriegelungs",1,"craft_verschluss",1,"craft_sicherungsh",1,"craft_patronenlager",1,"craft_boden_schlies",1,"craft_gehause",1,"craft_rohr",1,"craft_hands",1,"craft_schulters",1,"craft_muendungsf",1,"craft_trageb",1,"craft_paper",1], "", 8],
                ["20Rnd_762x51_Mag", ["patronenh",5,"projektil",5,"schwarzp",5], "", 8],
				["srifle_LRR_F", ["craft_muendungsf",1,"craft_rohr",2,"craft_trageb",2,"craft_gehause",1,"craft_hands",1,"craft_schulters",3,"craft_verriegelungs",1,"craft_verschluss",1,"craft_sicherungsh",1,"craft_patronenlager",1,"craft_boden_schlies",1,"craft_paper",1,"craft_cheytac",1,"craft_zweibein",1,"craft_repetier",1,"craft_reaver",1,"craft_slingshot",1], "", 10],
                ["7Rnd_408_Mag", ["patronenh",7,"projektil",7,"schwarzp",7,"nickel",7], "", 10],
				["muzzle_snds_H", ["craft_muendungsf",2,"craft_rohr",2,"craft_dichtung",4,"craft_gewinde",1,"craft_epdm",1,"craft_mineralf",1,"craft_edelstahlv",1,"craft_edelstahll",1,"craft_kondenzs",1,"craft_streckmetall",1,"craft_daemmkernt",1], "", -1],
				["muzzle_snds_L", ["craft_muendungsf",2,"craft_rohr",2,"craft_dichtung",4,"craft_gewinde",1,"craft_epdm",1,"craft_mineralf",1,"craft_edelstahlv",1,"craft_edelstahll",1,"craft_kondenzs",1,"craft_streckmetall",1,"craft_daemmkernt",1], "", -1],
				["muzzle_snds_M", ["craft_muendungsf",2,"craft_rohr",2,"craft_dichtung",4,"craft_gewinde",1,"craft_epdm",1,"craft_mineralf",1,"craft_edelstahlv",1,"craft_edelstahll",1,"craft_kondenzs",1,"craft_streckmetall",1,"craft_daemmkernt",1], "", -1]
			];
		};

		case 1:
		{	
			[
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2],outputitem,level]
				["craft_muendungsf", ["iron_unrefined",3,"waterBottle",2]],
				["craft_rohr", ["iron_unrefined",5,"waterBottle",3]],
				["craft_trageb", ["oil_unprocessed",2,"craft_kautschuk",1,"iron_unrefined",1,"waterBottle",2]],
				["craft_gehause", ["oil_unprocessed",3,"craft_kautschuk",1,"iron_unrefined",2,"waterBottle",2]],
				["craft_hands", ["oil_unprocessed",1,"craft_kautschuk",1,"iron_unrefined",1,"waterBottle",2]],
				["craft_schulters", ["oil_unprocessed",2,"craft_kautschuk",1,"iron_unrefined",3,"waterBottle",2]],
				["craft_dichtung", ["oil_unprocessed",1,"craft_kautschuk",1]],
                ["schwarzp", ["schwefel",1,"kohle",1]],
                ["patronenh", ["iron_unrefined",1,"blei",1,"copper_unrefined",1]],
                ["projektil", ["copper_unrefined",1,"zink",1,"messing",1]]
			];
		};
		
	}else{
        
        if(_shop == "vehicles") then
        {
            case 0:
            {

                [
                    //[Object classname, [item #1,quantity item #1,item #2,quantity item #2],outputitem,level]
                    ["C_Van_01_box_f", ["craft_reifen",1,"craft_spiegel",1,"craft_karosseriet",1,"craft_scheibe",1,"craft_dichtung",1,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",1,"craft_kupplung_a",1], "c_van_box", 1],
                    ["C_Van_01_fuel_F", ["craft_reifen",4,"craft_spiegel",3,"craft_karosseriet",5,"craft_scheibe",3,"craft_dichtung",5,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",5,"craft_kupplung_a",1], "c_van_fuel", 1],
                    ["I_Truck_02_transport_F", ["craft_reifen",6,"craft_spiegel",3,"craft_karosseriet",8,"craft_scheibe",3,"craft_dichtung",8,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",8,"craft_kupplung_a",1], "i_truck_transport", 4],
                    ["I_Truck_02_covered_F", ["craft_reifen",6,"craft_spiegel",3,"craft_karosseriet",8,"craft_scheibe",3,"craft_dichtung",8,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",8,"craft_kupplung_a",1], "i_truck_covered", 4],
                    ["O_Truck_03_transport_F", ["craft_reifen",6,"craft_spiegel",3,"craft_karosseriet",8,"craft_scheibe",3,"craft_dichtung",10,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",8,"craft_kupplung_a",1], "o_truck_transport", 8],
                    ["O_Truck_03_covered_F", ["craft_reifen",6,"craft_spiegel",3,"craft_karosseriet",8,"craft_scheibe",3,"craft_dichtung",10,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",8,"craft_kupplung_a",1], "o_truck_covered", 8],
                    ["O_Truck_03_fuel_F", ["craft_reifen",6,"craft_spiegel",3,"craft_karosseriet",9,"craft_scheibe",3,"craft_dichtung",10,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",8,"craft_kupplung_a",1], "o_truck_03_fuel", 8],
                    ["O_Truck_02_fuel_F", ["craft_reifen",6,"craft_spiegel",3,"craft_karosseriet",9,"craft_scheibe",3,"craft_dichtung",10,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",8,"craft_kupplung_a",1], "o_truck_02_fuel", 6],
                    ["B_Truck_01_transport_F", ["craft_reifen",8,"craft_spiegel",3,"craft_karosseriet",10,"craft_scheibe",3,"craft_dichtung",10,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",8,"craft_kupplung_a",1], "b_truck_transport", 6],
                    ["B_Truck_01_box_F", ["craft_reifen",8,"craft_spiegel",3,"craft_karosseriet",10,"craft_scheibe",3,"craft_dichtung",10,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",8,"craft_kupplung_a",1], "b_truck_box", 10],
                    ["B_Truck_01_fuel_F", ["craft_reifen",8,"craft_spiegel",3,"craft_karosseriet",10,"craft_scheibe",3,"craft_dichtung",10,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",8,"craft_kupplung_a",1], "b_truck_fuel", 6],
                    ["O_Truck_03_device_F", ["craft_reifen",6,"craft_spiegel",3,"craft_karosseriet",9,"craft_scheibe",3,"craft_dichtung",10,"craft_motor_a",1,"craft_getriebe_a",1,"craft_innena",1,"craft_kleinteile",8,"craft_kupplung_a",1,"craft_sondert",1], "o_truck_device", 10],
                    ["B_Heli_Light_01_F", ["craft_rotor",4,"craft_pitchk",1,"craft_dichtung",5,"craft_karosseriet",3,"craft_scheibe",2,"craft_spiegel",1,"craft_motor_h",1,"craft_getriebe_h",1,"craft_kleinteile",3,"craft_innena",1,"craft_kupplung_h",1], "b_heli_Light", 4],
                    ["I_Heli_Transport_02_F", ["craft_rotor",8,"craft_pitchk",1,"craft_dichtung",10,"craft_karosseriet",10,"craft_scheibe",8,"craft_spiegel",2,"craft_motor_h",1,"craft_getriebe_h",1,"craft_kleinteile",3,"craft_innena",1,"craft_kupplung_h",1], "i_heli_transport", 6],
                    ["O_Heli_Light_02_unarmed_F", ["craft_rotor",7,"craft_pitchk",1,"craft_dichtung",10,"craft_karosseriet",8,"craft_scheibe",6,"craft_spiegel",2,"craft_motor_h",1,"craft_getriebe_h",1,"craft_kleinteile",3,"craft_innena",1,"craft_kupplung_h",1], "o_heli_light_02_unarmed", 8],
                    ["O_Plane_CAS_02_F", ["craft_dichtung",10,"craft_kleinteile",8,"craft_scheibe",1,"craft_draht",5,"craft_reifen",3,"craft_tragf",2,"craft_hoehenf",2,"craft_seitenf",2,"craft_rumpf",1,"craft_fahrg",3,"craft_seitenr",1,"craft_hoehenr",1,"craft_pilotensitz",2,"craft_querr",2,"craft_triebw",2,"craft_kabine",1,"craft_instru",1,"craft_landek",4], "o_plane_cas_02", 10],
                    ["I_Plane_Fighter_03_AA_F", ["craft_dichtung",10,"craft_kleinteile",8,"craft_scheibe",1,"craft_draht",5,"craft_reifen",3,"craft_tragf",2,"craft_hoehenf",2,"craft_seitenf",2,"craft_rumpf",1,"craft_fahrg",3,"craft_seitenr",1,"craft_hoehenr",1,"craft_pilotensitz",2,"craft_querr",2,"craft_triebw",2,"craft_kabine",1,"craft_instru",1,"craft_landek",4], "i_plane_fighter_03", 10]
                ];
            };

            case 1:
            {
                [
                    //[Object classname, [item #1,quantity item #1,item #2,quantity item #2],outputitem,level]
                    ["craft_spiegel", ["sand",3,"waterbottle",2], "", -1],
                    ["craft_reifen", ["oil_unprocessed",2,"waterBottle",1,"craft_kautschuk",2,"craft_draht",2]],
                    ["craft_draht", ["iron_unrefined",2]],
                    ["craft_rotor", ["iron_unrefined",4,"waterBottle",2,"copper_unrefined",1]],
                    ["craft_pitchk", ["iron_unrefined",2,"waterBottle",2]],
                    ["craft_dichtung", ["oil_unprocessed",1,"craft_kautschuk",1]],
                    ["craft_karosseriet", ["iron_unrefined",5,"waterBottle",2,"copper_unrefined",2]],
                    ["craft_scheibe", ["sand",5,"waterBottle",2]],
                    ["craft_tragf", ["iron_unrefined",8,"waterBottle",4,"copper_unrefined",4]],
                    ["craft_hoehenf", ["iron_unrefined",5,"waterBottle",2,"copper_unrefined",2]],
                    ["craft_seitenf", ["iron_unrefined",5,"waterBottle",2,"copper_unrefined",2]],
                    ["craft_rumpf", ["iron_unrefined",12,"waterBottle",6,"copper_unrefined",6]],
                    ["craft_innena", ["craft_faden",10,"craft_stoff",6,"craft_federn",6]],
                    ["craft_fahrg", ["iron_unrefined",3,"waterBottle",2,"copper_unrefined",2]],
                    ["craft_faden", ["craft_wolle",1], "", -1],
                    ["craft_stoff", ["craft_faden",2], "", -1],
                    ["craft_leder", ["craft_zfell",1], "", -1]
                ];
            };
	
	   }else{
			if(_shop == "clothing") then
			{
				case 0:
				{

					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2],outputitem,level]
						//Anzüge
						["U_IG_Guerilla1_1", ["craft_faden",8,"craft_stoff",3,"craft_innenfutter",1], "", -1],
						["U_I_G_resistanceLeader_F", ["craft_faden",8,"craft_stoff",3,"craft_innenfutter",1], "", 4],
						["U_O_SpecopsUniform_ocamo", ["craft_faden",8,"craft_stoff",4,"craft_innenfutter",1], "", 4],
						["U_O_CombatUniform_oucamo", ["craft_faden",8,"craft_stoff",4,"craft_innenfutter",1], "", 4],
						["U_O_PilotCoveralls", ["craft_faden",8,"craft_leder",5,"craft_innenfutter",1], "", 6],
						["U_B_PilotCoveralls", ["craft_faden",8,"craft_leder",5,"craft_innenfutter",1], "", 6],
						["U_IG_leader", ["craft_faden",8,"craft_stoff",6,"craft_innenfutter",2,"craft_leder",2], "", 8],
						["U_I_OfficerUniform", ["craft_faden",8,"craft_stoff",5,"craft_innenfutter",1,"craft_leder",5,"craft_leder",2], "", 8],
						["U_O_OfficerUniform_ocamo", ["craft_faden",8,"craft_stoff",5,"craft_innenfutter",2,"craft_leder",2], "", 8],
						["U_O_GhillieSuit", ["craft_faden",8,"craft_stoff",6,"craft_innenfutter",3,"craft_leder",2], "", 10],
						["U_C_Scientist", ["craft_faden",8,"craft_stoff",5,"copper_unrefined",10,"craft_innenfutter",3,"craft_leder",2], "", 10],
						["U_I_Wetsuit", ["craft_faden",8,"craft_kautschuk",5], "", 10],
						//Westen
						["V_BandollierB_khk", ["craft_faden",5,"craft_stoff",1,"iron_unrefined",2], "", -1],
						["V_BandollierB_cbr", ["craft_faden",5,"craft_stoff",1,"iron_unrefined",2], "", -1],
						["V_BandollierB_rgr", ["craft_faden",5,"craft_stoff",1,"iron_unrefined",2], "", -1],
						["V_BandollierB_blk", ["craft_faden",5,"craft_stoff",1,"iron_unrefined",2], "", 4],
						["V_Chestrig_khk", ["craft_faden",6,"craft_stoff",3,"iron_unrefined",3], "", 4],
						["V_TacVestCamo_khk", ["craft_faden",6,"craft_stoff",3,"iron_unrefined",6], "", 4],
						["V_TacVestIR_blk", ["craft_faden",6,"craft_stoff",3,"iron_unrefined",6], "", 6],
						["V_TacVest_khk", ["craft_faden",6,"craft_stoff",3,"iron_unrefined",6], "", 6],
						["V_TacVest_brn", ["craft_faden",6,"craft_stoff",3,"iron_unrefined",6], "", 6],
						["V_PlateCarrierGL_rgr", ["craft_faden",6,"craft_stoff",3,"iron_unrefined",5,"copper_unrefined",4], "", 8],
						["V_PlateCarrierIA2_dgtl", ["craft_faden",6,"craft_stoff",3,"iron_unrefined",5,"copper_unrefined",4], "", 8],
						["V_PlateCarrierIAGL_dgtl", ["craft_faden",6,"craft_stoff",3,"iron_unrefined",5,"copper_unrefined",4], "", 8],
						["V_PlateCarrierSpec_rgr", ["craft_faden",6,"craft_stoff",3,"iron_unrefined",5,"copper_unrefined",4], "", 10],
						["V_PlateCarrier3_rgr", ["craft_faden",6,"craft_stoff",4,"iron_unrefined",5,"copper_unrefined",5], "", 10],
						["V_RebreatherIA", ["craft_faden",6,"craft_kautschuk",4,"craft_sauerflasche",1], "", 10],
						//Rucksack
						["B_Carryall_cbr", ["craft_faden",6,"craft_stoff",3], "", 6],
						["B_Carryall_ocamo", ["craft_faden",6,"craft_stoff",3], "", 6],
						["B_Carryall_oucamo", ["craft_faden",6,"craft_stoff",3], "", 6],
						["B_Carryall_mcamo", ["craft_faden",6,"craft_stoff",3], "", 6],
						["B_Carryall_oli", ["craft_faden",6,"craft_stoff",3], "", 6],
						["B_Carryall_khk", ["craft_faden",6,"craft_stoff",3], "", 6],
						["B_Parachute", ["craft_faden",6,"craft_stoff",3], "", 4],
						//Glasses
						["G_Diving", ["sand",3,"waterbottle",2,"craft_kautschuk",1], "", 10],
						["G_Bandanna_shades", ["craft_faden",3,"craft_stoff",1], "", 4],
						["G_Bandanna_oli", ["craft_faden",3,"craft_stoff",1], "", 4],
						["G_Bandanna_blk", ["craft_faden",3,"craft_stoff",1], "", 6],
						["G_Bandanna_sport", ["craft_faden",3,"craft_stoff",1], "", 6],
						["G_Bandanna_tan", ["craft_faden",3,"craft_stoff",1], "", 6],
						["G_Bandanna_beast", ["craft_faden",3,"craft_stoff",1], "", 8],
						["G_Bandanna_aviator", ["craft_faden",3,"craft_stoff",1], "", 8]
					];
				};

				case 1:
				{
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2],outputitem,level]
						["craft_faden", ["craft_wolle",1]],
						["craft_stoff", ["craft_faden",2]],
						["craft_leder", ["craft_zfell",1]],
						//["craft_leder", ["craft_rfell",3]],
						["craft_sauerflasche", ["iron_unrefined",5,"copper_unrefined",2,"craft_kautschuk",1]],
						["craft_innenfutter", ["craft_faden",5,"craft_stoff",1,"craft_federn",5]]	
					];
				};
			};
		};
	};
};