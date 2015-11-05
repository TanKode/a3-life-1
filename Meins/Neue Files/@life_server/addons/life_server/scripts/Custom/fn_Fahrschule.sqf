
/*
Author = Aideen
File = fn_Fahrschule.sqf
*/
private ["_mode","_timer"];
sleep 2;
_timer = 0;
while {car_use} do {        
	if (_timer >= 90) then { 
    	car_use =  false;
		publicVariable "car_use";
        diag_log format ["%1 wurde zurück gesetzt! spieler mit UID %2 hat abgebrochen oder wurde ausgeloggt!",_mode,_uid];
    };            
    _timer = _timer +1;
    sleep 1;
};
