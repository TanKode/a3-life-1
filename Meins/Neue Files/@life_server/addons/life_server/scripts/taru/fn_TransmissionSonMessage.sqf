_type_Son_Message = _this select 0;
	_helicoptere = vehicle (_this select 1);

	[] call
	{
		if (_type_Son_Message isEqualTo "Son Arrimage") exitwith
		{
			if (!isclass (configFile >> "CfgPatches" >> "DragonFyre_Distance")) then
			{
				playSound3D ["A3\Sounds_F\vehicles\air\noises\SL_engineUpEXT.wss",_helicoptere];
			};
			if (isclass (configFile >> "CfgPatches" >> "DragonFyre_Distance")) then
			{
				_helicoptere say "XENO_Helitreuillage_Arrimage_Exterieur_JSRS";
			};

			if (player in crew _helicoptere) then
			{
				if (!isclass (configFile >> "CfgPatches" >> "DragonFyre_Distance")) then
				{
					playSound3D ["A3\Sounds_F\vehicles\air\noises\SL_engineUpINT.wss",_helicoptere];
				};
				if (isclass (configFile >> "CfgPatches" >> "DragonFyre_Distance")) then
				{
					playSound ["XENO_Helitreuillage_Arrimage_Interieur_JSRS",true];
				};
			};
		};

		if (_type_Son_Message isEqualTo "Son Desarrimage") exitwith
		{
			if (!isclass (configFile >> "CfgPatches" >> "DragonFyre_Distance")) then
			{
				playSound3D ["A3\Sounds_F\vehicles\air\noises\SL_engineDownEXT.wss",_helicoptere];
			};
			if (isclass (configFile >> "CfgPatches" >> "DragonFyre_Distance")) then
			{
				_helicoptere say "XENO_Helitreuillage_Desarrimage_Exterieur_JSRS";
			};

			if (player in crew _helicoptere) then
			{
				if (!isclass (configFile >> "CfgPatches" >> "DragonFyre_Distance")) then
				{
					playSound3D ["A3\Sounds_F\vehicles\air\noises\SL_engineDownINT.wss",_helicoptere];
				};
				if (isclass (configFile >> "CfgPatches" >> "DragonFyre_Distance")) then
				{
					playSound ["XENO_Helitreuillage_Desarrimage_Interieur_JSRS",true];
				};
			};
		};

		if (_type_Son_Message isEqualTo "Son Fixation") exitwith
		{
			playSound3D ["A3\Sounds_F\vehicles\air\noises\SL_4hookslock.wss",_helicoptere];
			if (player in crew _helicoptere) then {playSound3D ["A3\Sounds_F\vehicles\air\noises\SL_4hookslock.wss",_helicoptere];};
		};

		if (_type_Son_Message isEqualTo "Son Défixation") exitwith
		{
			playSound3D ["A3\Sounds_F\vehicles\air\noises\SL_4hooksUnlock.wss",_helicoptere];
			if (player in crew _helicoptere) then {playSound3D ["A3\Sounds_F\vehicles\air\noises\SL_4hooksUnlock.wss",_helicoptere];};
		};

		if (_type_Son_Message isEqualTo "Son Largage") exitwith
		{
			playSound3D ["A3\Sounds_F\vehicles\air\noises\SL_unhook_air_ext.wss",_helicoptere];
			if (player in crew _helicoptere) then {playSound3D ["A3\Sounds_F\vehicles\air\noises\SL_unhook_air_ext.wss",_helicoptere];};
		};

		if (_type_Son_Message isEqualTo "Chat arrimage") exitwith
		{
			if (player in crew _helicoptere) then {_helicoptere vehicleChat localize "STR_XENO_Chat_Arrimer";};
		};

		if (_type_Son_Message isEqualTo "Chat désarrimage") exitwith
		{
			if (player in crew _helicoptere) then {_helicoptere vehicleChat localize "STR_XENO_Chat_Desarrimer";};
		};

		if (_type_Son_Message isEqualTo "Chat largage avec parachute") exitwith
		{
			if (player in crew _helicoptere) then {_helicoptere vehicleChat localize "STR_XENO_Chat_Larguer_Avec_Parachute";};
		};

		if (_type_Son_Message isEqualTo "Chat largage sans parachute") then
		{
			if (player in crew _helicoptere) then {_helicoptere vehicleChat localize "STR_XENO_Chat_Larguer_Sans_Parachute";};
		};
	};