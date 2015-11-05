/*
	Description:
	Plays a device sound for mining (Mainly Tempest device).
*/
if(isNull _this) exitWith {};
if(player distance _this > 50) exitWith {}; //Don't run it... They're to far out..

while {true} do {
	
	if(!life_oel_pumpe) exitWith {};
	_this say3D "Device_disassembled_loop";
	sleep 28.6;
};