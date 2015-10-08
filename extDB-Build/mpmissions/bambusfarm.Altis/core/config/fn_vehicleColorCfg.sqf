/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			["#(argb,8,8,3)color(0.302,0.275,0,1)","med","#(argb,8,8,3)color(0.302,0.275,0,1)","#(argb,8,8,3)color(0.302,0.275,0,1)"]
		];
	};
	
	case "B_Truck_01_transport_F":
	{
		_ret =
		[
			["bambusfarm\Texturen\ADAC\Land\hemtt_adac.jpg","med"]
		];
	};
	
	case "B_Truck_01_mover_F":
    {
        _ret = 
        [
            ["bambusfarm\Texturen\ADAC\Land\adac_01.jpg","med","bambusfarm\Texturen\ADAC\Land\adac_02.jpg"],
			["bambusfarm\Texturen\ADAC\Land\adac_hemett_01.jpg","med","bambusfarm\Texturen\ADAC\Land\adac_hemett_02.jpg"]
        ];
    };
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			["\A3\soft_f_gamma\Hatchback_01\Data\hatchback_01_ext_sport06_co.paa","civ"],
			["bambusfarm\Texturen\Polizei\Land\hatchback_Polizei.paa","cop"],
			["bambusfarm\Texturen\Polizei\Land\hatchback_Polizei.paa","cop"], //Autobahn
			["#(ai,64,64,1)Fresnel(1.3,7)","fed"],
			["bambusfarm\Texturen\Zivilisten\civ_hatchback_sport.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\ghost_hatchback_sport.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\hatchbackv1.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\hatchbackv2.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\redgull_hatchback_sport.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\hatchback_sport_ken_block.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\Fire_hatchback.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\barbie.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\batman_hatch.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\ferrari.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\rally.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\ganja.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\noddy.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\por.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\oil.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\hatchback_badmobil.jpg","civ"]
		];
	};
		
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["bambusfarm\Texturen\Medic\Land\med_offroad.jpg","med"],
			["bambusfarm\Texturen\Zivilisten\monsterenergy_off.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\pokemon.jpg","civ"],
			["bambusfarm\Texturen\ADAC\Land\offroad_adac3.jpg","med"],
			["bambusfarm\Texturen\Polizei\Land\police_offroad.paa","cop"],
			["bambusfarm\Texturen\Zivilisten\ziv_offroad_Getarnt.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\ziv_offroad.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\ziv_offroad_Gay.jpg","civ"],
			["bambusfarm\Texturen\ADAC\Land\adac_offroad.jpg","med"],
			["bambusfarm\Texturen\Zivilisten\mech.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\newoffroad.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\offroad_Black-white_stickerbomb.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\offroad_Rockstar_energy_rot_gelb.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\offroad_badmobil.jpg","civ"],
			["bambusfarm\Texturen\Medic\Land\offroad_notarzt.jpg","med"]
		];
	};
	
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
			["bambusfarm\Texturen\Zivilisten\civ_hatchback_sport.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\ghost_hatchback_sport.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\hatchbackv1.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\hatchbackv2.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\redgull_hatchback_sport.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\hatchback_sport_ken_block.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\Fire_hatchback.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\barbie.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\batman_hatch.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\ferrari.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\rally.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\ganja.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\noddy.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\por.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\oil.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\hatchback_badmobil.jpg","civ"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","fed"],
			["bambusfarm\Texturen\Polizei\Land\suvpolizei.paa","cop"],
			["bambusfarm\Texturen\Polizei\Land\police_suv_autobahn.jpg","cop"],
			["bambusfarm\Texturen\Zivilisten\suv_pro.jpg","civ"],
			["bambusfarm\Texturen\Medic\Land\med_suv.jpg","med"],
			["bambusfarm\Texturen\Zivilisten\ferrari_suv.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\suv_bmw.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\Bayern1.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\carbon_full_suv_v1.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\carbon_suv_V3.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\suv_makaveli.jpg","civ"],
			["bambusfarm\Texturen\Zivilisten\suv_Monster_energy_block.jpg","civ"],
			["bambusfarm\Texturen\Medic\Land\suv_medik.jpg","med"],
			["bambusfarm\Texturen\Polizei\Land\suv_security.jpg","cop"],
			["bambusfarm\Texturen\Polizei\Land\suv_sek.jpg","cop"],
			["bambusfarm\Texturen\donator_suv.jpg","donator"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["bambusfarm\Texturen\Medic\Land\rtwfront.paa","med","bambusfarm\Texturen\Medic\Land\rtwback.paa"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["bambusfarm\Texturen\Zivilisten\Van_gruen.jpg","civ"]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["bambusfarm\Texturen\Polizei\Luft\police_heli.jpg","cop"],
			["bambusfarm\Texturen\Polizei\Luft\police_heli_ausbilder.jpg","cop"],
			["bambusfarm\Texturen\Polizei\Luft\police_hummingbird.jpg","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["bambusfarm\Texturen\Medic\Luft\med_hummingbird.jpg","med"],
			["#(argb,8,8,3)color(0.302,0.275,0,1)","med"],
			["bambusfarm\Texturen\ADAC\Luft\adac_Hummingbird.jpg","med"],
			["bambusfarm\Texturen\ziv_hummingbird_Voll_Getarnt.jpg","reb"],
			["bambusfarm\Texturen\Medic\Luft\Notarzt_Hummingbird.jpg","med"],
			["bambusfarm\Texturen\Polizei\Luft\cop2.jpg","cop"]
		];
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","reb"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["bambusfarm\Texturen\Medic\Luft\med_orca.jpg","med"],
			["bambusfarm\Texturen\Medic\Luft\orca_notarzt.jpg","med"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["bambusfarm\Texturen\rebell_hunter.jpg","reb","bambusfarm\Texturen\rebell_hunter2.jpg"],
			["bambusfarm\Texturen\Polizei\Land\hunter_sek_01.jpg","cop","bambusfarm\Texturen\Polizei\Land\hunter_sek_hinten.jpg"]
		];
	};
	
	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["bambusfarm\Texturen\Polizei\Land\polizei_strider.jpg","cop"],
			["bambusfarm\Texturen\Polizei\Land\polizei_strider_ausbilder.jpg","cop"]
		];
	};
	
	case "O_MRAP_02_F":
	{
		_ret = 
		[
			["bambusfarm\Texturen\Polizei\Land\cop_ifrit_1.paa","cop","bambusfarm\Texturen\Polizei\Land\cop_ifrit_2.paa"],
			["bambusfarm\Texturen\ifrit_forest_front.jpg","reb","bambusfarm\Texturen\ifrit_forest_back.jpg"],
			["bambusfarm\Texturen\ifrit_grey_front.jpg","reb","bambusfarm\Texturen\ifrit_grey_back.jpg"],
			["bambusfarm\Texturen\ifrit_lion_front.jpg","reb","bambusfarm\Texturen\ifrit_lion_back.jpg"],
			["bambusfarm\Texturen\ifrit_red_front.jpg","reb","bambusfarm\Texturen\ifrit_red_back.jpg"]
		];
	};
	
	case "O_Truck_02_covered_F":
	{
		_ret = 
		[
			["bambusfarm\Texturen\Polizei\Land\1.jpg","cop"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0.047,0.322,0.875,1)"],
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0,0,0,1)"],
			["#(argb,8,8,3)color(0.059,0.576,0,1)","civ","#(argb,8,8,3)color(0.729,0.004,0.004,1)"],
			["bambusfarm\Texturen\Zivilisten\zamak_weed.jpg","civ","bambusfarm\Texturen\Zivilisten\zamak_weed_back.jpg"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0.047,0.322,0.875,1)"],
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0,0,0,1)"],
			["#(argb,8,8,3)color(0.059,0.576,0,1)","civ","#(argb,8,8,3)color(0.729,0.004,0.004,1)"]
		];
	};
	
	case "I_Truck_02_box_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0.047,0.322,0.875,1)"],
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0,0,0,1)"],
			["#(argb,8,8,3)color(0.059,0.576,0,1)","civ","#(argb,8,8,3)color(0.729,0.004,0.004,1)"],
			["bambusfarm\Texturen\Zivilisten\zamak_weed.jpg","civ","bambusfarm\Texturen\Zivilisten\zamak_weed_back.jpg"]
		];
	};
	
	
	case "I_Heli_light_03_unarmed_F":
	{
		_path = "\A3\air_f_ebp\Heli_Light_03\data\";
		_ret =
		[
			["bambusfarm\Texturen\Polizei\Luft\police_hellcats.jpg","cop"],
			["bambusfarm\Texturen\Polizei\Luft\hellcat.png","cop"]
		];
	};
};

_ret;