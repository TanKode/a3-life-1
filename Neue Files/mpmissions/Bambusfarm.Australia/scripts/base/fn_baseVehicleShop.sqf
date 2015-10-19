/*
	File: fn_baseVehicleShop.sqf
	Autor: Unknown 
	Edit: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_type"];
_type = [_this,1,"",[""]] call BIS_fnc_param;

if (_type == "Car") then {
	[false,false,false,["base_reb",civilian,life_pInact_curTarget,"reb","Rebel Motorpool - Western Side"]] spawn life_fnc_vehicleShopMenu;
}else{
	[false,false,false,["base_air",civilian,life_pInact_curTarget,"civ","APD - Kavala District"]] spawn life_fnc_vehicleShopMenu;
};
