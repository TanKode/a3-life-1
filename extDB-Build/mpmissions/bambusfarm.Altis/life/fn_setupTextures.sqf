/*
	File: fn_setupTextures.sqf
	Author: ThirtySeven
	(setupTextures example by KiloSwiss on Nitrado Forums)
	
	Description:
	Lädt die Texturen beim beitritt des Spielers
*/
private ["_tempPlakat"];
[] spawn{
	_tempPlakat = "Land_Billboard_F" createVehicleLocal (player modelToWorld [0,0,0]);
	_tempPlakat attachTo[player,[0,0.0,0]];
	_tempPlakat allowDamage false;
	_tempPlakat hideObject true;
	_tempPlakat setDir 360;
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ziv_offroad_Getarnt.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ziv_offroad_Gay.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ziv_offroad.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ziv_hummingbird_Voll_Getarnt.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\zamak_weed_back.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\zamak_weed.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\werbung.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Werber3.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Werber2.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\van_kh_f.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\van_kh.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Van_gruen.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\uniform_FBI.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\uniform_DEA.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ThirtySeven_Werbung.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\swat_hunter.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\suv_sek.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\suv_security.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\suv_pro.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\suv_Monster_energy_block.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\suv_medik.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\suv_makaveli.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\suv_bmw.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\sun.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\sport.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\sman.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\riffelblech.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\redgull_hatchback_sport.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\recruit_uniform_rangemaster.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\rebell_hunter2.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\rebell_hunter.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\rally.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Quad.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Puma_Abklatsch.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\POR.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\polizei_uni.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\polizei_strider_ausbilder.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\polizei_strider.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\policehq.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\policeHB_Autobahn.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\policeHB.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\police_suv_autobahn.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\police_suv.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Police_Sea_Uniform_co.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\police_recruit_uniform.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\police_offroad_hamburg.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\police_Officer.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\police_hummingbird.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\police_hellcats.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\police_heli_ausbilder.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\police_heli.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\police_01.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\pokemon.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\orca_notarzt.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\oil.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\offroader.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\offroad_Rockstar_energy_rot_gelb.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\offroad_notarzt.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\offroad_Black-white_stickerbomb.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\offroad_badmobil.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\offroad_adac3.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Notarzt_Hummingbird.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Notarzt.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\NODDY.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\newoffroad.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\My_Pony.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\monsterenergy_off.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\med_uniform.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\med_suv.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\med_orca.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\med_offroad.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\med_hummingbird.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\MECH.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ifrit_red_front.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ifrit_red_back.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Ifrit_Polizei4_hinten.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Ifrit_Polizei4_Front.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ifrit_lion_front.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ifrit_lion_back.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ifrit_grey_front.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ifrit_grey_back.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ifrit_forest_front.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ifrit_forest_back.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\hunter_back.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\hemtt_adac.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Hello_Kitty.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\heli_Police.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\hatchbackv2.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\hatchbackv1.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\hatchback_sport_ken_block.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\hatchback_badmobil.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ghost_hatchback_sport.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ganja.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Fire_hatchback.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ferrari_suv.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\ferrari.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\fbi_hunter.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\dea_hunter.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\cop2.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\cop_sergeant.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\cop_officer_ausbilder.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\cop_officer.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\cop_captain.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\civ_hatchback_sport.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\carbon_suv_V3.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\carbon_full_suv_v1.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Bayern1.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Batman_Hatch.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\barbie.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Autohaus.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Adidas_Abklatsch_Drache.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\Adidas_Abklatsch.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\adac_offroad.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\adac_logo.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\adac_Hummingbird.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\adac_hemett_02.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\adac_hemett_01.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\adac_02.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\adac_01.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\adac.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\30.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\zamak_front_justiz.jpg"];
	sleep 2.5;
	_tempPlakat setObjectTexture [0, "life\Texturen\zamak_back-justiz.jpg"];
	sleep 2.5;
	deleteVehicle _tempPlakat;
};