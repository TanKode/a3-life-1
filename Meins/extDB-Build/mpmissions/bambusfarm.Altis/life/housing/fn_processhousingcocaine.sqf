/* 
----------------------------------------------|
Description: Process Hero in a House!
----------------------------------------------|
*/
private ["_amount1", "_amount2", "_amount3"];
_amount1 = life_inv_coke;
_amount2 = life_inv_coke;
_amount3 = "";

if (_amount1 < _amount2) then 
{
	_amount3 = (_amount2 - (_amount2 - _amount1));
	_amount2 = (_amount2 - (_amount2 - _amount1));
};
if (_amount2 < _amount1) then 
{
	_amount3 = (_amount1 - (_amount1 - _amount2));
	_amount1 = (_amount1 - (_amount1 - _amount2));
};
if (_amount1 == _amount2) then 
{
	_amount3 = _amount1;
};

if(vehicle player != player) exitWith {hint "Du kannst nicht im Fahrzeug verarbeiten. Steig aus!"};


	if(([false,"cocaine",_amount1] call life_fnc_handleInv) ) then 
	{
	life_is_processing = true;
	titleText["Sie verarbeiten jetzt Kokain, es dauert ca. 20 Sekunden...", "PLAIN"];
	titleFadeOut 19;
	sleep 20;
	if (([true, "cocainep", _amount3] call life_fnc_handleInv)) then 
	{
	titleText [format ["Sie haben %1 Kokain hergestellt.", _amount3], "PLAIN"];
	};
	};
life_is_processing = false;