_grenze1 = "Land_HBarrierBig_F" createVehicle [0,0,0];
_grenze1 setDir -253.295;
_grenze1 setPos [17557.9,16082.2,0];
sleep 0.01;
_grenze1 allowDamage false;

waitUntil {grenz_uebergang1};

if(grenz_uebergang1) then
{
	_smoke1 = "SmokeShell" createVehicle [17556.7,16078.0,0];
	_smoke2 = "SmokeShell" createVehicle [17559.4,16086.2,0];
	_smoke3 = "SmokeShell" createVehicle [17557.9,16082.2,0];
	sleep 5;
	_grenze1 setPos [17557.9,16082.2,-0.2];	
	sleep 1;	
	_grenze1 setPos [17557.9,16082.2,-0.6];	
	sleep 1;
	_grenze1 setPos [17557.9,16082.2,-1];	
	sleep 1;
	_grenze1 setPos [17557.9,16082.2,-1.4];	
	sleep 1;
	_grenze1 setPos [17557.9,16082.2,-1.8];
	sleep 1;
	deleteVehicle _grenze1;
	deleteVehicle _smoke1;
	deleteVehicle _smoke2;
	deleteVehicle _smoke3;
	grenz_uebergang1 = false;
};
	


