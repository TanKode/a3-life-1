_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_vehicule = vehicle _player;

waituntil
{
	sleep 2;
	_degat_VRotor = vehicle player getHitPointDamage "HitVRotor";
	// _disfonctionnement_Taru_Hotfixer = false;

	// if ([player] call Script_Verification_Helico and {vehicle player != _vehicule}) then
	if ([player] call Script_Verification_Helico) then
	{
		// if (!_disfonctionnement_Taru_Hotfixer) then
		// {
			if (_degat_VRotor isEqualTo 1 and {damage vehicle player != 1}) then
			{
				_vehicule = vehicle player;
				// _disfonctionnement_Taru_Hotfixer = true;
				_vehicule setHitPointDamage ["HitVRotor", 0];
				systemchat "Hotfix ATRQ";
			};
		// };
	};
};

