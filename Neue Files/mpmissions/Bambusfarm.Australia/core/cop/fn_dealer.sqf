/*
	File: fn_dealer.sqf
	Author: PierreAmyf
	
	Description:
	Dealer verkaufs aufruf mit Warnung und Polizei info!
     
*/
private["_sellers","_action","_chance"];

_sellers = _this select 0;
_action = _this select 2;
_chance = random(100);


hint "pssst nicht so laut\nNur her mit dem Zeuch! =)";

_sellers removeAction _action;

sleep 3;

if(_chance >= 85) then { 
	_action = _sellers addAction ["Zeuch verkaufen",life_fnc_virt_menu,"drugdealer",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian '];	
	_sellers, _action;
	
	sleep (5*60);
	
	hint "Der Dealer ist der Meinung deine Drogen sind gestreckt\nEr hat die Polizei informiert!!!"; 
	[[3,format["<t color='#CB2525'><t size='2.5'>Info!</t><br/> <t color='#FFFFFF'>- Informant %1: Bei mir will jemand Drogen verkaufen ich bin zu finden bei den Kordinaten: %2!!!</t>", _sellers, mapGridPosition _sellers]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 
	_sellers removeAction _action;
	
	sleep (15*60);
	
	_action = _sellers addAction ["Verkaufen?!","",life_fnc_dealer,"",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian '];
	_sellers, _action;
} else {
	_action = _sellers addAction ["Zeuch verkaufen",life_fnc_virt_menu,"drugdealer",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian '];	
	_sellers, _action;	
	
	sleep (15*60);
	
	_sellers removeAction _action;
	_action = _sellers addAction ["Verkaufen?!",life_fnc_dealer,"",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian '];
	_sellers, _action;
};
