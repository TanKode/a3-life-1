/*
      Created by Mokomoko
      Date: 04.08.2014
      Related Forum Post: http://www.altisbambusfarmrpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
*/

private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption"];

while{true} do
{
	_vehicleToFuel = (vehicle player);
	if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && !(_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player) ) then
	{
		_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;

		_fuelConsumption = _velocityOfVehicle/2500 + 0.0001;
		if(_fuelConsumption > 0.002) then
		{
			_fuelConsumption = 0.002;
		};
		_vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);

		//hint format["Benzinverbrauch: %1L/km",_fuelConsumption*10000/2];

		if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
		{
			hint "Dein Benzin ist leer! Schnell zur Tanke!";
		}
		else
		{
			if(fuel _vehicleToFuel < 0.03) then
			{
				hint "Tja, Pech gehabt. Tank leer. Viel Spaß beim laufen!";
			};
		};
	};
	sleep 2;
};