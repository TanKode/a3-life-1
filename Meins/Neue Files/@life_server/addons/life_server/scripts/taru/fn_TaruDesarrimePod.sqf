_helicoptere = _this select 0;
	_sans_Son = if (count _this > 1) then {_this select 1} else {false};
	_objet_Arrimer = [];	
	_objet_Arrimer_Egal_Pod = false;
	_mass_helicoptere = getmass _helicoptere;
	
	
	{
		_objet_Arrimer = typeOf _x;
		_liste_Class_Parent = [(configfile >> "CfgVehicles" >> _objet_Arrimer),true] call BIS_fnc_returnParents;
	
		{
			if (_x isEqualTo "Pod_Heli_Transport_04_base_F") exitwith {_objet_Arrimer_Egal_Pod = true;};
		} foreach _liste_Class_Parent;
		
		if (_objet_Arrimer_Egal_Pod) exitwith {_objet_Arrimer = _x;};
	} foreach attachedObjects _helicoptere;

	_mass_Objet_Heliporter = getmass _objet_Arrimer;	
	_helicoptere allowdamage false;
	
	if (!isTouchingGround _helicoptere) then
	{
		_liste_Class_Parent = [(configfile >> "CfgVehicles" >> typeOf _objet_Arrimer),true] call BIS_fnc_returnParents;		

		{
			if (_x isEqualTo "Land_Pod_Heli_Transport_04_bench_F") exitwith
			{
				_objet_Arrimer attachTo [_helicoptere,[0,0.1,-2.83]];
			};
		} foreach _liste_Class_Parent;

		{
			if (_x isEqualTo "Land_Pod_Heli_Transport_04_covered_F") exitwith
			{
				_objet_Arrimer attachTo [_helicoptere,[-0.1,-1.05,-2.52]];
			};
		} foreach _liste_Class_Parent;

		{
			if (_x isEqualTo "Land_Pod_Heli_Transport_04_fuel_F") exitwith
			{
				_objet_Arrimer attachTo [_helicoptere,[0,-0.282,-3.05]];
			};
		} foreach _liste_Class_Parent;

		{
			if (_x isEqualTo "Land_Pod_Heli_Transport_04_medevac_F") exitwith
			{
				_objet_Arrimer attachTo [_helicoptere,[-0.14,-1.05,-2.62]];
			};
		} foreach _liste_Class_Parent;

		{
			if (_x isEqualTo ["Land_Pod_Heli_Transport_04_repair_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_ammo_F"]) then
			{
				_objet_Arrimer attachTo [_helicoptere,[-0.09,-1.05,-2.8]];
			};
		} foreach _liste_Class_Parent;
	};		
	
	if (isTouchingGround _helicoptere) then {{ropeCut [_x, 0];} foreach ropes _helicoptere; _helicoptere setSlingLoad _objet_Arrimer;};
	if (!isTouchingGround _helicoptere) then {{ropeUnwind [_x, 1.9, 10]; [["Son Desarrimage", _helicoptere],"life_fnc_TransmissionSonMessage",[] call life_fnc_ListeJoueur,false] spawn life_fnc_MP;} foreach ropes _helicoptere;};
	
	_helicoptere setCustomWeightRTD 0;	
	_helicoptere setmass _mass_helicoptere - _mass_Objet_Heliporter;
	
	detach _objet_Arrimer;	
	
	_helicoptere allowdamage true;	

	if (!_sans_Son) then {[["Son Défixation", _helicoptere],"life_fnc_TransmissionSonMessage",[] call life_fnc_ListeJoueur,false] spawn life_fnc_MP;};
	
	if (!isTouchingGround _helicoptere) then {waituntil {ropeLength (ropes _helicoptere select 0) isEqualTo 10};};

	if (!_sans_Son) then {[["Chat désarrimage", _helicoptere],"life_fnc_TransmissionSonMessage",[] call life_fnc_ListeJoueur,false] spawn life_fnc_MP;};