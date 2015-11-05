#include <macro.h>
/* 
	File:fn_radarCam.sqf
	author: PierreAmyf
	Flash/Basic premise idea from preller, trigger function from shems and Yuka for the waitUntil <3
	Runs cams on map for speeders, if speed too many times diff shit happens
*/
waitUntil {(!isNil "life_fnc_moveIn") && !isNull (findDisplay 46)};
if((vehicle player isKindOf "Ship") OR (vehicle player isKindOf "Air")) exitWith {};//exit if not a freaking car
private ["_limit","_speed","_driver","_ticket","_ticketWL"];
_driver = _this select 0;
_speed = _this select 1;
_limit = _this select 2;
//_ticket = 1500;//perm set amount ticket
_exp = (_speed - _limit) * 10;
_ticket = (_speed - _limit) * 100;//variable ticket for licensed driver
_ticketWL = (_speed - _limit) * 200;//variable ticket for unlicensed driver
//diag_log format["Ticket Fine: %1 - Sp: %2 -- Limit: %3",_ticket,_speed,_limit];
if (_speed > _limit) then {
	if (side _driver == civilian) then {
			if(isNil "life_speedTicket") then {life_speedTicket = 0;};
			if(isNil "life_speedCaught") then {life_speedCaught = 0;};
			//diag_log format["Dr:%1 :: Sp:%2 :: Lmt:%3 ::Fine: %4",name _driver,round _speed,_limit,[_ticket] call life_fnc_numberText];
			player say3d "PhotoSound";//photosound and ppEffects from prellers radar script
			sleep 0.05;
			"colorCorrections" ppEffectEnable true;   
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];    
			"colorCorrections" ppEffectCommit 0;  
			sleep 0;   
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];    
			"colorCorrections" ppEffectCommit 0.05;   
			sleep 0.05;   
			"colorCorrections" ppEffectEnable false;
			sleep 0.1;
			"colorCorrections" ppEffectEnable true;   
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];    
			"colorCorrections" ppEffectCommit 0;  
			sleep 0;   
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];    
			"colorCorrections" ppEffectCommit 0.05;   
			sleep 0.05;   
			"colorCorrections" ppEffectEnable false;
		if(license_civ_driver OR license_civ_trucking ) then {
			
			life_speedTicket = life_speedTicket + 1;
			[] call life_fnc_hudupdate;
			if(life_speedTicket <= 3) then {systemChat format["Sie wurden %1 Mal geblitzt. Weiter so und Sie verlieren mehr als nur Geld.",life_speedTicket];};
			if(life_speedTicket == 4) then {systemChat format["Sie wurden %1 Mal geblitzt. Noch 1 Punkt und Sie verlieren ihre Erlaubnis zum Fuehren von Auto und LKW.",life_speedTicket];};
			if(life_speedTicket > 4 && life_speedTicket < 8) exitWith {
					
					systemChat format["Dies ist dein %1. Punkt im Altis-Punkteregister Kavalla.",life_speedTicket];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Blitzer<br/><t color='#ff0000'><t align='center'><t size='1.25'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Exp: %4 Erfahrungspunkte verloren<br/><t color='#ffffff'><t align='center'><t size='1'>Du bist ein schlimmer Raser, dir wurden deine Fahrzeuglizenzen entzogen und du befindest dich nun auf der Fahndnungsliste!",round _speed,_limit,name _driver,[_exp] call life_fnc_numberText];
					[[4],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
					[[getPlayerUID _driver,name _driver,"120H"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					[2] call SOCK_fnc_updatePartial;
			};
			if(life_speedTicket > 8) exitWith {
					
					//vehicle _driver setFuel 0.1;
					systemChat format["Ohwei! Dies ist dein %1. Punkt im Altis-Punkteregister Kavalla! Lernen Sie es nicht?!",life_speedTicket];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Blitzer<br/><t color='#ff0000'><t align='center'><t size='1.25'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Exp: %4 Erfahrungspunkte verloren<br/>Du wirst nun stafrechtlich gesucht und kannst dafuer ins Gefaengnis kommen.",round _speed,_limit,name _driver,[_exp] call life_fnc_numberText];
					[[getPlayerUID _driver,name _driver,"120FS"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					[[4],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
					[2] call SOCK_fnc_updatePartial;
			};
			if(CASH <= _ticket) then
			{
				if(BANK <= _ticket) exitWith 
				{
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Blitzer<br/><t color='#ff0000'><t align='center'><t size='1.25'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Bussgeld: %4$<br/><t color='#ffffff'><t align='center'><t size='1'>Exp: %5 Erfahrungspunkte verloren<br/>Du kannst nicht zahlen und die Polizei besitzt nun Vollmacht das Bussgeld einzufordern.",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText,[_exp] call life_fnc_numberText];
					[[getPlayerUID _driver,name _driver,"120S"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				};
				SUB(BANK,_ticket);
				_exp = round(random(_exp));[true,_exp,true] spawn life_fnc_expConfig;
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Blitzer<br/><t color='#ff0000'><t align='center'><t size='1.25'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Bussgeld: %4$<br/><t color='#ffffff'><t align='center'><t size='1'>Exp: %5 Erfahrungspunkte verloren",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText,[_exp] call life_fnc_numberText];
				//diag_log "%1 Punkt(e) im Altis-Punkteregister Kavalla wurde durch eine Ueberweisung bezahlt.";
				[1] call SOCK_fnc_updatePartial;
			} else {
						
				SUB(CASH,_ticket);
				_exp = round(random(_exp)); [true,_exp,true] spawn life_fnc_expConfig;
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Blitzer<br/><t color='#ff0000'><t align='center'><t size='1.25'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Bussgeld: %4$<br/><t color='#ffffff'><t align='center'><t size='1'>Exp: %5 Erfahrungspunkte verloren",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText,[_exp] call life_fnc_numberText];	
				//diag_log "Bussgeld wurde vom Spieler Bar bezahlt!";
				[0] call SOCK_fnc_updatePartial;
			};
		} else {
			
					life_speedCaught = life_speedCaught + 1;
					[] call life_fnc_hudupdate;
					if(life_speedCaught <= 5) then { systemChat format["Sie wurden %1 Mal ohne Fahrzeuglizenzen geblitzt.",life_speedCaught];};
					if(life_speedCaught == 6) then { systemChat format["Sie wurden nun schon %1 Mal ohne Fahrzeuglizenzen geblitzt.",life_speedCaught];};
					
					if(life_speedCaught > 6) exitWith {
					
							//vehicle _driver setFuel 0.1;
							systemChat format["Jetzt reichts! Dies ist dein %1. Punkt im Altis-Punkteregister Kavalla! Lernen Sie es nicht?!",life_speedCaught];
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Blitzer<br/><t color='#ff0000'><t align='center'><t size='1.25'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Exp: %4 Erfahrungspunkte verloren<br/>Du wirst nun stafrechtlich gesucht und kannst dafuer ins Gefaengnis kommen.",round _speed,_limit,name _driver,[_exp] call life_fnc_numberText];
							[[getPlayerUID _driver,name _driver,"120FSWL"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
							
					};
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Blitzer<br/><t color='#ff0000'><t align='center'><t size='1.25'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Exp: %4 Erfahrungspunkte verloren<br/><t color='#ffffff'><t align='center'><t size='1'>Du wirst nun fuer Fahren ohne Lizenz gesucht und kannst ins Gefaengnis kommen.",round _speed,_limit,name _driver,[_exp] call life_fnc_numberText];
					[[getPlayerUID _driver,name _driver,"1"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					if(CASH <= _ticketWL) then
					{
						if(BANK <= _ticketWL) exitWith 
						{
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Blitzer<br/><t color='#ff0000'><t align='center'><t size='1.25'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Bussgeld: %4$<br/><t color='#ffffff'><t align='center'><t size='1'>Exp: %5 Erfahrungspunkte verloren<br/>Du kannst nicht zahlen und die Polizei besitzt nun Vollmacht das Bussgeld einzufordern.",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText,[_exp] call life_fnc_numberText];
							[[getPlayerUID _driver,name _driver,"120S"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
						};
						SUB(BANK,_ticketWL);
						_exp = round(random(_exp)); [true,_exp,true] spawn life_fnc_expConfig;
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Blitzer<br/><t color='#ff0000'><t align='center'><t size='1.25'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Bussgeld: %4$<br/><t color='#ffffff'><t align='center'><t size='1'>Exp: %5 Erfahrungspunkte verloren",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText,[_exp] call life_fnc_numberText];
						//diag_log "Ticket paid from player bank";//for logging
						[1] call SOCK_fnc_updatePartial;
					} else {
						
						SUB(CASH,_ticketWL);
						_exp = round(random(_exp)); [true,_exp,true] spawn life_fnc_expConfig;
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Blitzer<br/><t color='#ff0000'><t align='center'><t size='1.25'>Geschwindigkeit: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Bussgeld: %4$<br/><t color='#ffffff'><t align='center'><t size='1'>Exp: %5 Erfahrungspunkte verloren",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText,[_exp] call life_fnc_numberText];	
						//diag_log "Ticket paid from player cash";//for logging
						[0] call SOCK_fnc_updatePartial;
					};
		};
	};
};
//diag_log "Speed cam script done";//for logging
uiSleep 5;