private ["_player_damage","_heal"];
//Schlaf wie ein Schaf du Nelke
disableUserInput true;

_player_damage = damage player;
_heal = true;

for "_i" from 0 to 10 do
{
	sleep 1;
	titleText["ZZZZZzzzz........","BLACK FADED"];

	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then
	{
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	if( _player_damage != damage player) exitWith
	{
		_heal = false;
	};
};

disableUserInput false;

if(!_heal) then
{
	hint "Du wurdest unterbrochen und wurdest nicht geheilt. Du hast dich aber etwas erholt.";
	player setFatigue 0;
	player playActionNow "stop";
}
else
{
	hint "Du hast dich ausgeruht und bist etwas geheilt worden.";
	player setFatigue 0;
	player playActionNow "stop";

	if(damage player > 0.2) then
	{
		player setDamage 0.2;
	};
};