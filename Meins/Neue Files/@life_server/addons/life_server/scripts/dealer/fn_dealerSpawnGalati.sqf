/*
	File: fn_dealerSpawnGalati.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dealerrnd spawn zone!
     
*/
private["_dealer_Galati","_pos","_markerAll","_markerNew","_markerPos","_dealerAl","_house","_positions","_smokePos","_smoke","_timeRdm","_timeFix","_time","_timeUp"];
_dealer_Galati = Galati;
_dealer_Galati addHeadgear "H_Booniehat_mcamo";
_dealer_Galati addUniform "U_C_HunterBody_grn";
_dealer_Galati addWeapon "arifle_MX_SW_Black_Hamr_pointer_F";
_markerAll = ["GalatiDealer_16","GalatiDealer_17","GalatiDealer_18","GalatiDealer_19","GalatiDealer_20","GalatiDealer_21","GalatiDealer_22","GalatiDealer_23","GalatiDealer_24","GalatiDealer_25","GalatiDealer_26","GalatiDealer_27","GalatiDealer_28","GalatiDealer_29","GalatiDealer_30"];
_pos = [0,0,0];
_timeFix = (90*60);

while {true} do
{
	//Rmd marker wählen
	_markerNew = _markerAll call BIS_fnc_selectRandom;
	_markerPos = getMarkerPos _markerNew;
	_dealerAl = "Land_runway_edgelight_blue_F" createVehicle _markerPos;
	
	//Hausposition herrausfinden
	_house = nearestBuilding (getPosATL _DealerAl);
	_positions = [_house] call life_fnc_getBuildingPositions;
	{_pos = _x;} foreach _positions;
	
	_dealer_Galati setPosATL _pos;
	deleteVehicle _dealerAl;
	
	sleep 1;
	
	//smoke setzen
	_smokPos = getPosATL _dealer_Galati;
	_smoke = "SmokeShellOrange" createVehicle _smokPos;
	
	//diag_log format ["Pos Dealer",_smokPos];
	//diag_log format ["pos %1",_markerNew];
	
	sleep 5;
	
	//Rdm timer festlegen
	_timeRdmG = floor(random 60)*60;
	_timeG = _timeRdmG + _timeFix;
	_timeUpG = time + _timeG;
	
	while {true} do
	{
		//contDown bis zum wecksel
		if((round(_timeUpG - time)) > 0) then{
			
			countDownG = [(_timeUpG - time),"MM:SS"] call BIS_fnc_secondsToString;
		};
		
		if((round(_timeUpG - time)) == 0) exitWith {hint ""};
		sleep 0.1;
	};
	[[3,format["<t size='1.35'>Dealer <t color='#FF0000'>%1</t></t><br/> wechselt seine Position um seine Tarnung aufrecht zu erhalten!",_dealer_Galati]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	[[0,format["Dealer %1 wechselt seine Position um seine Tarnung aufrecht zu erhalten!",_dealer_Galati]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};