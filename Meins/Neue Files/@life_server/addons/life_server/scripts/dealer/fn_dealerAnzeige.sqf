/*
	File: fn_dealerAnzeige.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dealerrnd spawn zone!
     
*/
private["_anz","_anzK","_anzT","_anzG"];
sleep 30;

_dealer_Kavala = Kavala;
_dealer_Therisa = Therisa;
_dealer_Galati = Galati;

while {true} do
{
	//Kavala
	_smokPosK = getPosATL _dealer_Kavala;
	_smokeK = "SmokeShellOrange" createVehicle _smokPosK;
	
	//Therisa
	_smokPosT = getPosATL _dealer_Therisa;
	_smokeT = "SmokeShellOrange" createVehicle _smokPosT;
	
	//Galati
	_smokPosG = getPosATL _dealer_Galati;
	_smokeG = "SmokeShellOrange" createVehicle _smokPosG;
	
	_countDownK = countDownK;
	_countDownT = countDownT;
	_countDownG = countDownG;
	
	_anz = "<t size='1.75'>DROGENDEALER</t><br/>";
	_anz = _anz + "<t size='1.45'>Verbleibene Zeit:</t><br/>";
	_anzK = format ["<t size='1.35'>Dealer %2 <t color='#FF0000'>%1 min</t></t><br/>",_countDownK,Kavala];
	_anzT = format ["<t size='1.35'>Dealer %2 <t color='#FF0000'>%1 min</t></t><br/>",_countDownT,Therisa];
	_anzG = format ["<t size='1.35'>Dealer %2 <t color='#FF0000'>%1 min</t></t><br/>",_countDownG,Galati];
	_anz = _anz + _anzK + _anzT + _anzG + format ["Bis zum Positionswechsel!"];
	
	[[3,_anz],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	sleep 1;
	
	[[0,format["DROGENDEALER: Dealer %2 %1 min, Dealer %4 %3 min, Dealer %6 %5 min, bis zum Positionswechsel!",_countDownK,Kavala,_countDownT,Therisa,_countDownG,Galati]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	
	sleep 1801;
};