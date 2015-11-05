/*
	File: fn_dealerSpawnKavala.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dealerrnd spawn zone!
     
*/
private["_dealer_Kavala","_pos","_markerAll","_markerNew","_markerPos","_dealerAl","_house","_positions","_smokePos","_smoke","_timeRdm","_timeFix","_time","_timeUp"];
_dealer_Kavala = Kavala;
_dealer_Kavala addHeadgear "H_Booniehat_mcamo";
_dealer_Kavala addUniform "U_C_HunterBody_grn";
_dealer_Kavala addWeapon "arifle_MX_SW_Black_Hamr_pointer_F";
_markerAllK = ["KavalaDealer_1","KavalaDealer_2","KavalaDealer_3","KavalaDealer_4","KavalaDealer_5","KavalaDealer_6","KavalaDealer_7","KavalaDealer_8","KavalaDealer_9","KavalaDealer_10","KavalaDealer_11","KavalaDealer_12","KavalaDealer_13","KavalaDealer_14","KavalaDealer_15"];
_timeFix = (90*60);
_pos = [0,0,0];

while {true} do
{
	//Rmd marker wählen
	_markerNewK = _markerAllK call BIS_fnc_selectRandom;
	_markerPos = getMarkerPos _markerNewK;
	_dealerAlK = "Land_runway_edgelight_blue_F" createVehicle _markerPos;

	//Hausposition herrausfinden
	_houseK = nearestBuilding (getPosATL _DealerAlK);
	_positionsK = [_houseK] call life_fnc_getBuildingPositions;
	{_pos = _x;} foreach _positionsK;

	_dealer_Kavala setPosATL _pos;
	deleteVehicle _dealerAlK;
	
	sleep 1;

	//smoke setzen
	_smokPosK = getPosATL _dealer_Kavala;
	_smokeK = "SmokeShellOrange" createVehicle _smokPosK;
	
	//diag_log format ["Pos Dealer",_smokPosK];
	//diag_log format ["pos %1",_markerNewK];

	sleep 5;
	
	//Rdm timer festlegen
	_timeRdmK = floor(random 60)*60;
	_timeK = _timeRdmK + _timeFix;
	_timeUpK = time + _timeK;
	
	while {true} do
	{
		//contDown bis zum wecksel
		if((round(_timeUpK - time)) > 0) then{

			countDownK = [(_timeUpK - time),"MM:SS"] call BIS_fnc_secondsToString;
		};
		
		if((round(_timeUpK - time)) == 0) exitWith {hint ""};
		sleep 0.1;
	};
	[[3,format["<t size='1.35'>Dealer <t color='#FF0000'>%1</t></t><br/> wechselt seine Position um seine Tarnung aufrecht zu erhalten!",_dealer_kavala]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;		
	[[0,format["Dealer %1 wechselt seine Position um seine Tarnung aufrecht zu erhalten!",_dealer_kavala]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;		
};