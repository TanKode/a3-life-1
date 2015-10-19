/*
	File: fn_colorEffects.sqf
	Autor: Unknown 
	Edit: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_base","_static","_repair","_sum"];
_base = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(life_inv_base_toolkit > 0) then
{
	sleep 1;
	hintSilent "Die Gebaude deiner Base werden jetzt repariert, dieser Vorgang wird einige zeit in Anspruch nehmen!";
	[false,"base_toolkit",1] call life_fnc_handleInv;
	life_baseDamage = 0.8;
	 sleep (5*60);
	_static = nearestobjects [_base,["Building","House","LandBulding"], 120]; 

	_repair =
	{
		_static = nearestobjects [_base,["Building","House","LandBulding"], 120];  
		_sum = (life_baseDamage - 0.2);
		{
			_x setDamage _sum;
		}forEach _static;
		life_baseDamage = _sum;
	};

	[] spawn _repair;
	sleep (10*60);

	[] spawn _repair;
	sleep (10*60);

	[] spawn _repair;
	sleep (10*60);

	[] spawn _repair;
	sleep (10*60);

	life_baseDamage = 0;

	{
		_x setDamage life_baseDamage;
	} forEach _static;

	hintSilent "Die Gebaude deiner Base wurden alle repariert!";
}else{
	hintSilent "Sie besitzen kein Base Reperaturset!";
};