/**
*	instaHealth(BOOL health, food, water)
*
*/



private ["_health", "_food", "_water"];
_health = _this select 0;
_food = _this select 1;
_water = _this select 2;
_battery = _this select 3;

if((call life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint localize "STR_ANOTF_ErrorLevel";
	["Sie haben keine Berechtigung das das AdminMenu zu benutzen!!"] spawn bis_fnc_dynamictext;
	_message = format["%1 versuchte die DebugConsole zu oeffnen!!", name player];
	[["",_message,player,9],"TON_fnc_handleMessages",false,false] spawn life_fnc_MP;
	0 cutText["","BLACK FADED"];
	0 cutFadeOut 9999999;
	disableUserInput true;
	life_frozen = true;
	player setPos [0,0,0];
};



if(_health) then
{
	[[0,format["ADMIN: %1 hat Gesundheit auf 100 gesetzt.",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

	player setDamage 0;
	player setFatigue 0;
};

if(_food) then
{
	[[0,format["ADMIN: %1 hat Hunger auf 100 gesetzt.",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

	life_hunger = 100;
	player setFatigue 0;
};

if(_water) then
{
	[[0,format["ADMIN: %1 hat Durst auf 100 gesetzt.",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	
	life_thirst = 100;
	player setFatigue 0;
};

if(_battery) then
{
	[[0,format["ADMIN: %1 hat Battery auf 100 gesetzt.",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	
	life_battery = 100;
	player setFatigue 0;
};

/////////////Hints
if(_health) then
{
	hint "Gesundheit auf 100 gesetzt.";
	sleep 2;
};

if(_food) then
{
	hint "Hunger auf 100 gesetzt.";
	sleep 2;
};

if(_water) then
{
	hint "Durst auf 100 gesetzt.";
};

if(_battery) then
{
	hint "Battery auf 100 gesetzt.";
};

call life_fnc_hudUpdate;
