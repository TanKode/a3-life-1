/*
	File: fn_colorEffects.sqf
	Autor: Unknown 
	Edit: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/

switch (life_colorEffects) do {

	case 0:
	{
		"ColorCorrections" ppEffectEnable true; 
		"ColorCorrections" ppEffectAdjust [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]];
		"ColorCorrections" ppEffectCommit 0;
		life_colorEffects = 1;
	};
	
	case 1:
	{
		"ColorCorrections" ppEffectEnable false; 
		"ColorCorrections" ppEffectAdjust [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]];
		"ColorCorrections" ppEffectCommit 0;
		life_colorEffects = 0;
	};
};
