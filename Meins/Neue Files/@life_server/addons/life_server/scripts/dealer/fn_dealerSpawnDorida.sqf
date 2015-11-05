/*
	File: fn_dealerSpawnTherisa.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dealerrnd spawn zone!
     
*/
private["_dealer_Therisa","_pos","_markerAll","_markerNew","_markerPos","_dealerAl","_house","_positions","_smokePos","_smoke","_timeRdm","_timeFix","_time","_timeUp"];
_dealer_Therisa = Therisa;
_dealer_Therisa addHeadgear "H_Booniehat_mcamo";
_dealer_Therisa addUniform "U_C_HunterBody_grn";
_dealer_Therisa addWeapon "arifle_MX_SW_Black_Hamr_pointer_F";	
_markerAll = ["TherisaDealer_31","TherisaDealer_32","TherisaDealer_33","TherisaDealer_34","TherisaDealer_35","TherisaDealer_36","TherisaDealer_37","TherisaDealer_38","TherisaDealer_39","TherisaDealer_40","TherisaDealer_41","TherisaDealer_42"];
_timeFix = (90*60);
_pos = [0,0,0];	

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
	
	_dealer_Therisa setPosATL _pos;
	deleteVehicle _dealerAl;
	
	sleep 1;
	
	//smoke setzen
	_smokPos = getPosATL _dealer_Therisa;
	_smoke = "SmokeShellOrange" createVehicle _smokPos;
	
	//diag_log format ["Pos Dealer",_smokPos];
	//diag_log format ["pos %1",_markerNew];
	
	sleep 5;
	
	//Rdm timer festlegen
	_timeRdmT = floor(random 60)*60;
	_timeT = _timeRdmT + _timeFix;
	_timeUpT = time + _timeT;
	
	while {true} do
	{
		//contDown bis zum wecksel
		if((round(_timeUpT - time)) > 0) then{
			
			countDownT = [(_timeUpT - time),"MM:SS"] call BIS_fnc_secondsToString;
		};
		
		if((round(_timeUpT - time)) == 0) exitWith {hint ""};
		sleep 0.1;
	};
	[[3,format["<t size='1.35'>Dealer <t color='#FF0000'>%1</t></t><br/> wechselt seine Position um seine Tarnung aufrecht zu erhalten!",_dealer_Therisa]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	[[0,format["Dealer %1 wechselt seine Position um seine Tarnung aufrecht zu erhalten!",_dealer_Therisa]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};