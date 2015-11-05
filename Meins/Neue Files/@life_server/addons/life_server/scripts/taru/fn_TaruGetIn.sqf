_vehicule = _this select 0 select 0;
	if ([_vehicule] call Script_Verification_Helico) then 
	{
		if (count attachedObjects _vehicule > 0) then 
		{ 
			_time = time + 2;
			waituntil
			{	
				_vehicule setvelocity [0, 0, 0];
				if (time > _time or {time > _time + 15}) exitwith {true};
			};					
		};
	};	