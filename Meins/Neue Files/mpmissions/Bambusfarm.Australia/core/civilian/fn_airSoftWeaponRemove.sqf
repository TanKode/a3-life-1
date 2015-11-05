/*
	File: fn_airSoftWeaponRemove.sqf
	Author: PierreAmyf
	
	Description:
	remove AirSoft Weapon 
     
*/
for "_i" from 0 to 1000 do
{
	if(playerSide == civilian) then
	{
		player removeMagazine "30Rnd_556x45_Stanag_Tracer_Red";
		player removeWeapon "arifle_TRG20_ACO_Flash_F";
		player removeWeapon "arifle_TRG20_ACO_pointer_F";
	};
};