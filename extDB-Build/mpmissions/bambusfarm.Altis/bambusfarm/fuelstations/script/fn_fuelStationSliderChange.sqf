/*
	File: fn_fuelStationSliderChange.sqf

	Description:
	Changes the FuelFit
*/

private["_display","_newFit"];
disableSerialization;

_display = findDisplay 29000;

_txtFit = _display displayCtrl 29003;
_txtCash = _display displayCtrl 29004;
_sliFit = _display displayCtrl 29012;

if(isNull bambusfarm_fuelstation_fueltruck) then {
	_maxFit = ( floor (bambusfarm_BANK / bambusfarm_fuelstation_price)) min bambusfarm_fuelstation_fitamount;
	_sliNew = sliderPosition _sliFit;
	if(_sliNew > _maxFit) then {
		_sliFit sliderSetPosition _maxFit;
	};
	bambusfarm_fuelstation_amount = sliderPosition _sliFit;

	_txtCash ctrlSetText format["€%1", round (bambusfarm_fuelstation_price * bambusfarm_fuelstation_amount)];
};

bambusfarm_fuelstation_amount = floor(sliderPosition _sliFit);
_newFit = bambusfarm_fuelstation_amount;

_txtFit ctrlSetText format["%1 / %2 Liter", bambusfarm_fuelstation_amount, bambusfarm_fuelstation_fitamount];