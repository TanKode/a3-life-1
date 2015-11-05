_helicoptere = vehicle (_this select 0);
	_sans_Son = if (count _this > 1) then {_this select 1} else {false};
	_objet_Heliporter = getSlingLoad _helicoptere;
	_mass_Objet_Heliporter = getmass getSlingLoad _helicoptere;
	_mass_Helicoptere = getmass _helicoptere;
	_poids_Helico = weightRTD _helicoptere;
	
	if (!isTouchingGround _helicoptere) then
	{
		if (!_sans_Son) then {[["Son Arrimage", _helicoptere],"life_fnc_TransmissionSonMessage",[] call life_fnc_ListeJoueur,false] spawn life_fnc_MP;};
		{ropeUnwind [_x, 1.9, 1];} foreach ropes _helicoptere;

		waituntil {ropeLength (ropes _helicoptere select 0) isEqualTo 1};
	};

	[] call
	{
		_liste_Class_Parent = [(configfile >> "CfgVehicles" >> typeOf _objet_Heliporter),true] call BIS_fnc_returnParents;
		_helicoptere allowdamage false;

		{
			if (_x isEqualTo "Land_Pod_Heli_Transport_04_bench_F") exitwith
			{
				_objet_Heliporter attachTo [_helicoptere,[0,0.1,-1.13]];
				_helicoptere setCustomWeightRTD 680;
				_helicoptere setmass _mass_Objet_Heliporter + _mass_Helicoptere;
			};

			if (_x isEqualTo "Land_Pod_Heli_Transport_04_covered_F") exitwith
			{
				_objet_Heliporter attachTo [_helicoptere,[-0.1,-1.05,-0.82]];
				_helicoptere setCustomWeightRTD 1413;
				_helicoptere setmass _mass_Objet_Heliporter + _mass_Helicoptere;
			};

			if (_x isEqualTo "Land_Pod_Heli_Transport_04_fuel_F") exitwith
			{
				_objet_Heliporter attachTo [_helicoptere,[0,-0.282,-1.25]];
				_helicoptere setCustomWeightRTD 13311;
				_helicoptere setmass _mass_Objet_Heliporter + _mass_Helicoptere;
			};

			if (_x isEqualTo "Land_Pod_Heli_Transport_04_medevac_F") exitwith
			{
				_objet_Heliporter attachTo [_helicoptere,[-0.14,-1.05,-0.92]];
				_helicoptere setCustomWeightRTD 1321;
				_helicoptere setmass _mass_Objet_Heliporter + _mass_Helicoptere;
			};

			if (_x in ["Land_Pod_Heli_Transport_04_repair_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_ammo_F"]) exitwith
			{
				_objet_Heliporter attachTo [_helicoptere,[-0.09,-1.05,-1.1]];
				_helicoptere setCustomWeightRTD 1270;
				_helicoptere setmass _mass_Objet_Heliporter + _mass_Helicoptere;
			};
		} foreach _liste_Class_Parent;
	};

	_helicoptere allowdamage true;
	{ropeUnwind [_x, 250, 1];} foreach ropes _helicoptere;

	if (!_sans_Son) then 
	{
		[["Son Fixation", _helicoptere],"life_fnc_TransmissionSonMessage",[] call life_fnc_ListeJoueur,false] spawn life_fnc_MP;
		[["Chat arrimage", _helicoptere],"life_fnc_TransmissionSonMessage",[] call life_fnc_ListeJoueur,false] spawn life_fnc_MP;	
	};

	if (isnil {_helicoptere getVariable "EH_GetOut_Taru"}) then
	{
		_helicoptere addEventHandler ["Getin", "[_this] spawn life_fnc_TaruGetIn;"];
		_helicoptere setVariable ["EH_GetIn_Taru", true, false];
	};	   