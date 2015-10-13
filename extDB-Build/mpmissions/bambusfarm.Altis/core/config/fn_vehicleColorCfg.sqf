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
			["life\Texturen\ADAC\Land\hemtt_adac.jpg","med"]
		];
	};
	
	case "B_Truck_01_mover_F":
    {
        _ret = 
        [
            ["life\Texturen\ADAC\Land\adac_01.jpg","med","life\Texturen\ADAC\Land\adac_02.jpg"],
			["life\Texturen\ADAC\Land\adac_hemett_01.jpg","med","life\Texturen\ADAC\Land\adac_hemett_02.jpg"]
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
			["life\Texturen\Polizei\Land\hatchback_Polizei.paa","cop"],
			["life\Texturen\Polizei\Land\hatchback_Polizei.paa","cop"], //Autobahn
			["#(ai,64,64,1)Fresnel(1.3,7)","fed"],
			["life\Texturen\Zivilisten\civ_hatchback_sport.jpg","civ"],
			["life\Texturen\Zivilisten\ghost_hatchback_sport.jpg","civ"],
			["life\Texturen\Zivilisten\hatchbackv1.jpg","civ"],
			["life\Texturen\Zivilisten\hatchbackv2.jpg","civ"],
			["life\Texturen\Zivilisten\redgull_hatchback_sport.jpg","civ"],
			["life\Texturen\Zivilisten\hatchback_sport_ken_block.jpg","civ"],
			["life\Texturen\Zivilisten\Fire_hatchback.jpg","civ"],
			["life\Texturen\Zivilisten\barbie.jpg","civ"],
			["life\Texturen\Zivilisten\batman_hatch.jpg","civ"],
			["life\Texturen\Zivilisten\ferrari.jpg","civ"],
			["life\Texturen\Zivilisten\rally.jpg","civ"],
			["life\Texturen\Zivilisten\ganja.jpg","civ"],
			["life\Texturen\Zivilisten\noddy.jpg","civ"],
			["life\Texturen\Zivilisten\por.jpg","civ"],
			["life\Texturen\Zivilisten\oil.jpg","civ"],
			["life\Texturen\Zivilisten\hatchback_badmobil.jpg","civ"]
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
			["life\Texturen\Medic\Land\medic_offroad.paa","med"],
			["life\Texturen\Zivilisten\monsterenergy_off.jpg","civ"],
			["life\Texturen\Zivilisten\pokemon.jpg","civ"],
			["life\Texturen\ADAC\Land\offroad_adac3.jpg","med"],
			["life\Texturen\Polizei\Land\police_offroad.paa","cop"],
			["life\Texturen\Zivilisten\ziv_offroad_Getarnt.jpg","civ"],
			["life\Texturen\Zivilisten\ziv_offroad.jpg","civ"],
			["life\Texturen\Zivilisten\ziv_offroad_Gay.jpg","civ"],
			["life\Texturen\ADAC\Land\adac_offroad.jpg","med"],
			["life\Texturen\Zivilisten\mech.jpg","civ"],
			["life\Texturen\Zivilisten\newoffroad.jpg","civ"],
			["life\Texturen\Zivilisten\offroad_Black-white_stickerbomb.jpg","civ"],
			["life\Texturen\Zivilisten\offroad_Rockstar_energy_rot_gelb.jpg","civ"],
			["life\Texturen\Zivilisten\offroad_badmobil.jpg","civ"]
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
			["life\Texturen\Zivilisten\civ_hatchback_sport.jpg","civ"],
			["life\Texturen\Zivilisten\ghost_hatchback_sport.jpg","civ"],
			["life\Texturen\Zivilisten\hatchbackv1.jpg","civ"],
			["life\Texturen\Zivilisten\hatchbackv2.jpg","civ"],
			["life\Texturen\Zivilisten\redgull_hatchback_sport.jpg","civ"],
			["life\Texturen\Zivilisten\hatchback_sport_ken_block.jpg","civ"],
			["life\Texturen\Zivilisten\Fire_hatchback.jpg","civ"],
			["life\Texturen\Zivilisten\barbie.jpg","civ"],
			["life\Texturen\Zivilisten\batman_hatch.jpg","civ"],
			["life\Texturen\Zivilisten\ferrari.jpg","civ"],
			["life\Texturen\Zivilisten\rally.jpg","civ"],
			["life\Texturen\Zivilisten\ganja.jpg","civ"],
			["life\Texturen\Zivilisten\noddy.jpg","civ"],
			["life\Texturen\Zivilisten\por.jpg","civ"],
			["life\Texturen\Zivilisten\oil.jpg","civ"],
			["life\Texturen\Zivilisten\hatchback_badmobil.jpg","civ"]
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
			["life\Texturen\Polizei\Land\suvpolizei.paa","cop"],
			["life\Texturen\Polizei\Land\police_suv_autobahn.jpg","cop"],
			["life\Texturen\Zivilisten\suv_pro.jpg","civ"],
			["life\Texturen\Medic\Land\medic_suv.paa","med"],
			["life\Texturen\Zivilisten\ferrari_suv.jpg","civ"],
			["life\Texturen\Zivilisten\suv_bmw.jpg","civ"],
			["life\Texturen\Zivilisten\Bayern1.jpg","civ"],
			["life\Texturen\Zivilisten\carbon_full_suv_v1.jpg","civ"],
			["life\Texturen\Zivilisten\carbon_suv_V3.jpg","civ"],
			["life\Texturen\Zivilisten\suv_makaveli.jpg","civ"],
			["life\Texturen\Zivilisten\suv_Monster_energy_block.jpg","civ"],
			["life\Texturen\Polizei\Land\suv_security.jpg","cop"],
			["life\Texturen\Polizei\Land\suv_sek.jpg","cop"],
			["life\Texturen\donator_suv.jpg","donator"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["life\Texturen\Medic\Land\rtwfront.paa","med","life\Texturen\Medic\Land\rtwback.paa"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["life\Texturen\Zivilisten\Van_gruen.jpg","civ"]
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
			["life\Texturen\Polizei\Luft\police_heli.jpg","cop"],
			["life\Texturen\Polizei\Luft\police_heli_ausbilder.jpg","cop"],
			["life\Texturen\Polizei\Luft\police_hummingbird.jpg","cop"],
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
			["#(argb,8,8,3)color(0.302,0.275,0,1)","med"],
			["life\Texturen\ADAC\Luft\adac_Hummingbird.jpg","med"],
			["life\Texturen\ziv_hummingbird_Voll_Getarnt.jpg","reb"],
			["life\Texturen\Medic\Luft\Notarzt_Hummingbird.paa","med"],
			["life\Texturen\Polizei\Luft\cop2.jpg","cop"]
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
			["life\Texturen\Medic\Luft\orca_notarzt.jpg","med"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["life\Texturen\rebell_hunter.jpg","reb","life\Texturen\rebell_hunter2.jpg"],
			["life\Texturen\Polizei\Land\hunter_sek_01.jpg","cop","life\Texturen\Polizei\Land\hunter_sek_hinten.jpg"]
		];
	};
	
	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["life\Texturen\Polizei\Land\polizei_strider.jpg","cop"],
			["life\Texturen\Polizei\Land\polizei_strider_ausbilder.jpg","cop"]
		];
	};
	
	case "O_MRAP_02_F":
	{
		_ret = 
		[
			["life\Texturen\Polizei\Land\cop_ifrit_1.paa","cop","life\Texturen\Polizei\Land\cop_ifrit_2.paa"],
			["life\Texturen\ifrit_forest_front.jpg","reb","life\Texturen\ifrit_forest_back.jpg"],
			["life\Texturen\ifrit_grey_front.jpg","reb","life\Texturen\ifrit_grey_back.jpg"],
			["life\Texturen\ifrit_lion_front.jpg","reb","life\Texturen\ifrit_lion_back.jpg"],
			["life\Texturen\ifrit_red_front.jpg","reb","life\Texturen\ifrit_red_back.jpg"]
		];
	};
	
	case "O_Truck_02_covered_F":
	{
		_ret = 
		[
			["life\Texturen\Polizei\Land\1.jpg","cop"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0.047,0.322,0.875,1)"],
			["#(argb,8,8,3)color(1,1,1,1)","civ","#(argb,8,8,3)color(0,0,0,1)"],
			["#(argb,8,8,3)color(0.059,0.576,0,1)","civ","#(argb,8,8,3)color(0.729,0.004,0.004,1)"],
			["life\Texturen\Zivilisten\zamak_weed.jpg","civ","life\Texturen\Zivilisten\zamak_weed_back.jpg"]
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
			["life\Texturen\Zivilisten\zamak_weed.jpg","civ","life\Texturen\Zivilisten\zamak_weed_back.jpg"]
		];
	};
	
	
	case "I_Heli_light_03_unarmed_F":
	{
		_path = "\A3\air_f_ebp\Heli_Light_03\data\";
		_ret =
		[
			["life\Texturen\Polizei\Luft\police_hellcats.jpg","cop"],
			["life\Texturen\Polizei\Luft\hellcat.png","cop"]
		];
	};
};

_ret;