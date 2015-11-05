/*

	Called when vehicle is hit by BD-Weapon

*/

private["_sender","_vehicle","_type","_sender"];

_sender = _this select 0;
_vehicle = _this select 1;
_type = _this select 2;
_sender = _this select 3;

if(_sender == _vehicle) exitWith {};

switch(_type) do 
{
	case "BDMK1":
	{	
		while{true} do
		{
			_vehicle setFuel (fuel _vehicle)-0.005;
				
			if((fuel _vehicle) <= 0.09) exitWith {hint ""};
			sleep 0.1;
		};
		_vehicle setFuel 0.09;
	};
	case "BDMK2":
	{
        _vehicle setFuel 0;
		_vehicle setDamage 0.95;
	};
};