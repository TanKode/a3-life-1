/*


	Description:
	Changes the FuelFit
*/

private["_display","_txtStation","_txtVehicle","_upp","_ui","_progress","_pgText","_cP","_previousState","_refill","_duration","_away"];
disableSerialization;

if(!isNull findDisplay 29000) then { closeDialog 29000; };

bambusfarm_interrupted = false;

_veh = bambusfarm_fuelstation_lockVeh select 0;
_isTrailer = bambusfarm_fuelstation_lockVeh select 1;

_txtStation = "Gas Pump";
if(!isNull bambusfarm_fuelstation_fueltruck) then {
	_txtStation = getText(configFile >> "CfgVehicles" >> (typeOf bambusfarm_fuelstation_fueltruck) >> "displayName");
};
_txtVehicle = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
if(_isTrailer == 1) then { _txtVehicle = _txtVehicle + " - Auflieger"; };

_upp = format["%2 -> %1",_txtVehicle,_txtStation];
//Setup our progress bar.
5 cutRsc ["bambusfarm_progress","PLAIN"];
_ui = uiNameSpace getVariable "bambusfarm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%1 (0 / %2 Liter)...",_upp,bambusfarm_fuelstation_amount];
_progress progressSetPosition 0.01;
_cP = 0.01;
_duration = (((bambusfarm_fuelstation_amount / 2000) max 0.1) min 0.7);
_away = true;

while{alive player && !bambusfarm_interrupted && _cP < 1 && _away} do
{
	sleep _duration;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%1 (%2 / %3 Liter)...",_upp, round(_cP * bambusfarm_fuelstation_amount), bambusfarm_fuelstation_amount];
	if((_veh distance player) > 20) then { _away = false; };
	if(!isNull bambusfarm_fuelstation_fueltruck) then {
		if((bambusfarm_fuelstation_fueltruck distance player) > 20) then {  _away = false; };
	};
};

5 cutText ["","PLAIN"];
_succAmount = round (bambusfarm_fuelstation_amount * _cP);

if(bambusfarm_interrupted || !alive player || !_away) then {
	_txtTmp = format ["Betankungsvorgang abgebrochen, du hast %1 Liter eingefuellt", _succAmount];
	//titleText[_txtTmp,"PLAIN"];
	[_txtTmp, -1, 0.5, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

} else {
	_txtTmp = format ["Betankungsvorgang erfolgreich, du hast %1 Liter eingefuellt", _succAmount];
	//titleText[_txtTmp,"PLAIN"];
	[_txtTmp, -1, 0.5, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;
};

if(!isNull bambusfarm_fuelstation_fueltruck) then {
	bambusfarm_fuelstation_fueltruck setVariable["fueltruck_fuel",((bambusfarm_fuelstation_fueltruck getVariable["fueltruck_fuel",0]) - _succAmount),true];
} else {
	bambusfarm_BANK = round (bambusfarm_BANK - (_succAmount * bambusfarm_fuelstation_price));
	if(bambusfarm_BANK < 0) then { bambusfarm_BANK = 0; };
};

if(_isTrailer == 1) then {
	_fillTrailer = ((_veh getVariable["fueltruck_fuel",0]) + _succAmount) min ([(typeOf _veh) + "_TRAILER"] call bambusfarm_fnc_vehFuelCap);
	_veh setVariable["fueltruck_fuel",_fillTrailer,true];
} else {
	_fillValue = (fuel _veh) + (_succAmount / ([typeOf _veh] call bambusfarm_fnc_vehFuelCap));
	if(local _veh) then {
		_veh setFuel _fillValue;
	} else {
		[[_veh,_fillValue],"bambusfarm_fnc_setFuel",_veh,false] spawn bambusfarm_fnc_MP;
	};
};

bambusfarm_interrupted = false;
bambusfarm_action_inUse = false;