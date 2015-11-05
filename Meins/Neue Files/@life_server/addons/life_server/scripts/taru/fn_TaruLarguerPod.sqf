_helicoptere = _this select 0;
	_objet_Arrimer = [];	
	_objet_Arrimer_Egal_Pod = false;
	
	
	{
		_objet_Arrimer = typeOf _x;
		_liste_Class_Parent = [(configfile >> "CfgVehicles" >> _objet_Arrimer),true] call BIS_fnc_returnParents;
	
		{
			if (_x isEqualTo "Pod_Heli_Transport_04_base_F") exitwith {_objet_Arrimer_Egal_Pod = true;};
		} foreach _liste_Class_Parent;
		
		if (_objet_Arrimer_Egal_Pod) exitwith {_objet_Arrimer = _x;};
	} foreach attachedObjects _helicoptere;

	_helicoptere allowdamage false;
	{ropeCut [_x, 0];} foreach ropes _helicoptere;
	_helicoptere setCustomWeightRTD 0;
	detach _objet_Arrimer;	
	_helicoptere allowdamage true;

	[["Son Largage", _helicoptere],"life_fnc_TransmissionSonMessage",[] call life_fnc_ListeJoueur,false] spawn life_fnc_MP;

	sleep 0.5;

	if (ASLToATL getposasl _objet_Arrimer select 2 >= 70) exitwith
	{
		[["Chat largage avec parachute", _helicoptere],"life_fnc_TransmissionSonMessage",[] call life_fnc_ListeJoueur,false] spawn life_fnc_MP;
		
		waitUntil {ASLToATL getPosASL _objet_Arrimer select 2 <= 120};
		
		_parachute = createVehicle ["B_Parachute_02_F",getposatl _objet_Arrimer, [], 0, "CAN COLLIDE"];
		_parachute attachTo [_objet_Arrimer,[0,0,-1]];

		[_objet_Arrimer,_parachute,_helicoptere] spawn
		{
			_objet_Arrimer = _this select 0;
			_parachute = _this select 1;
			_helicoptere = _this select 2;


			waituntil
			{
				if (ASLToATL getposasl _objet_Arrimer select 2 <= 5) exitwith
				{
					detach _objet_Arrimer;
					_vitesse_nacelle = velocity _objet_Arrimer;
					_parachute setVelocity [_vitesse_nacelle select 0 + 1, _vitesse_nacelle select 1 + 1, 0];
					true
				};
				false
			};
		};

		waituntil
		{
			if (getposasl _helicoptere distance getposasl _objet_Arrimer >= 50) exitwith
			{
				detach _parachute;
				_objet_Arrimer attachTo [_parachute,[0,0,-1]];
				true
			};
			false
		};
	};

	[["Chat largage sans parachute", _helicoptere],"life_fnc_TransmissionSonMessage",[] call life_fnc_ListeJoueur,false] spawn life_fnc_MP;