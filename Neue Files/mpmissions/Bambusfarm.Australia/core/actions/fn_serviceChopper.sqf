/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
private["_search","_ui","_progress","_cP","_pgText","_title"];
if(life_action_inUse) exitWith {hint localize "STR_NOTF_Action"};
_heli = false;
_vehicleOn = false;
_search = nearestObjects[getPos (_this select 0), ["Air"],25];
_vehicle = nearestObjects[getPos (_this select 0), ["Car","Ship"],25];

if(count _search > 0) then
{
	_heli = true;
}else{
	if(count _vehicle > 0) then
	{
		_vehicleOn = true
	}else{
		hint " Es befindet sich kein Fahrzeug auf dem Servericpunkt!";
	};
};


if(_heli) then
{
	//if(count _search == 0) exitWith {hint localize "STR_Service_Chopper_NoAir"};
	if(life_cash < 8000) exitWith {hint localize "STR_Serive_Chopper_NotEnough"};
	life_cash = life_cash - 8000;
	life_action_inUse = true;
	_title = format[localize "STR_Service_Chopper_Servicing"];
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_title];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	while {true} do
	{
		sleep  0.2;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(_cP >= 1) exitWith {};
	};

	if(!alive (_search select 0)) exitWith {life_action_inUse = false; hint localize "STR_Service_Chopper_Missing"};
	if(!local (_search select 0)) then
	{
		[[(_search select 0),1],"life_fnc_setFuel",(_search select 0),false] spawn life_fnc_MP;
	}
		else
	{
		(_search select 0) setFuel 1;
	};
	(_search select 0) setDamage 0;

	5 cutText ["","PLAIN"]; 
	titleText [localize "STR_Service_Chopper_Done","PLAIN"];
	life_action_inUse = false;
	_heli = false;
}else{
	if(_vehicleOn) then
	{
		if(count _vehicle == 0) exitWith {hint localize "STR_Service_Chopper_NoAir"};
		if(life_cash < 6000) exitWith {hint localize "STR_Serive_Chopper_NotEnoughCar"};
		life_cash = life_cash - 6000;
		life_action_inUse = true;
		_title = format[localize "STR_Service_Chopper_ServicingCar"];
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_title];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		while {true} do
		{
			sleep  0.2;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
			if(_cP >= 1) exitWith {};
		};

		if(!alive (_vehicle select 0)) exitWith {life_action_inUse = false; hint localize "STR_Service_Chopper_MissingCar"};
		/*if(!local (_vehicle select 0)) then
		{
			[[(_vehicle select 0),1],"life_fnc_setFuel",(_vehicle select 0),false] spawn life_fnc_MP;
		}
			else
		{
			(_vehicle select 0) setFuel 1;
		};*/
		(_vehicle select 0) setDamage 0;

		5 cutText ["","PLAIN"];
		titleText [localize "STR_Service_Chopper_DoneCar","PLAIN"];
		life_action_inUse = false;
		_vehicleOn = false;
	};
};