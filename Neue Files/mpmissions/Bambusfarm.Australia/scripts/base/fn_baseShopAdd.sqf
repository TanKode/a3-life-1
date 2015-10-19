/*
	File: fn_baseShopeAdd.sqf
	Autor: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
{
	_obj = (_x select 1) select 0;
	_obj addAction["Rebellem Kleidung",life_fnc_clothingMenu,"reb",0,false,false,"",' license_civ_rebel && playerSide == civilian'];  
	_obj addAction["Rebellen Waffenladen",life_fnc_weaponShopMenu,"rebel",0,false,false,"",' license_civ_rebel && playerSide == civilian']; 
	_obj addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "rebel" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "rebel" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"rebel",0,false,false,"",' !license_civ_rebel && playerSide == civilian '];   
	_obj addAction["Zubehörhändler",life_fnc_weaponShopMenu,"genstore"];
}forEach baseShops1;

{
	_obj = (_x select 1) select 0;
	_obj addAction["Rebellen Market",life_fnc_virt_menu,"rebel"];
}forEach baseShops2;

{
	_obj = (_x select 1) select 0;
	_obj addAction["Kaninchenfleisch",life_fnc_processAction,"hase",0,false,false,"",' life_inv_rabbit_raw > 0 && !life_is_processing']; 
	_obj addAction["Ziegenfleisch",life_fnc_processAction,"ziege",0,false,false,"",' life_inv_goat_raw > 0 && !life_is_processing']; 
	_obj addAction["Taktischerspeck",life_fnc_processAction,"scharf",0,false,false,"",' life_inv_sheep_raw > 0 && !life_is_processing']; 
	_obj addAction["Huenersuppe",life_fnc_processAction,"hueners",0,false,false,"",' life_inv_waterBottle > 0 && life_inv_rooster_raw > 0 && !life_is_processing'];
}forEach baseFire;