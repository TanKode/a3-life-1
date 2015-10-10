/*
	Author: Anton

	Description:
	Performancefreundliche IgiLoad-Alternative
*/
private["_Base","_BaseType","_CargoType","_Compatible","_AnimationType"];

if(call (life_mediclevel) <= 0) exitWith {};
if(side player != INDEPENDENT) exitWith {};
life_ADAC_vehicle = cursorTarget;

BaseLevel2 = ["C_Offroad_01_F"]; 
BaseLevel3 = [];
BaseLevel4 = ["B_Truck_01_mover_F"];

CargoKarts = ["C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F"];
CargoQuads = ["B_Quadbike_01_F"];
CargoOffroad = ["C_Offroad_01_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F"];
CargoLimo = ["C_Hatchback_01_F","C_Hatchback_01_sport_F"];
CargoSUV = ["C_SUV_01_F"];
CargoBOXER = ["C_Van_01_transport_F","C_Van_01_box_F","O_MRAP_02_F","O_MRAP_02_hmg_F","B_MRAP_01_F"];

nearestsupported = [];
{
	_p1 = false;
	_p2 = true;
	_p3 = true;
	private["_p1","_p2","_p3"];
	if((typeOf _x) in BaseLevel2) then {_p1 = true};
	if((typeOf _x) in BaseLevel3) then {_p1 = true};
	if((typeOf _x) in BaseLevel4) then {_p1 = true};

	if(!alive _x) then {_p2 = false};
	if((player distance _x) > 15) then {_p3 = false};
	if(format["%1%2%3",_p1,_p2,_p3] == "truetruetrue") then {nearestsupported pushBack _x};
}
forEach entities "Car";
if(!(alive life_ADAC_vehicle) || !(player distance life_ADAC_vehicle <= 4)) exitWith {};
if(format["%1",nearestsupported] == "[]") exitWith {hint "Es wurde kein geeignetes Transportfahrzeug in der Nähe gefunden"};
if(count crew life_ADAC_vehicle > 0) exitWith {hint "Um ein Fahrzeug zu transportieren, dürfen sich keine Personen in diesem befinden"};
_Base = (nearestsupported select 0);

if((typeOf _Base) in BaseLevel2) then {_BaseType = 2};
if((typeOf _Base) in BaseLevel3) then {_BaseType = 3};	
if((typeOf _Base) in BaseLevel4) then {_BaseType = 4};

if((typeOf life_ADAC_vehicle) in CargoKarts) then {_CargoType = 1};
if((typeOf life_ADAC_vehicle) in CargoQuads) then {_CargoType = 2};
if((typeOf life_ADAC_vehicle) in CargoOffroad) then {_CargoType = 3};
if((typeOf life_ADAC_vehicle) in CargoLimo) then {_CargoType = 4};
if((typeOf life_ADAC_vehicle) in CargoSUV) then {_CargoType = 5};
if((typeOf life_ADAC_vehicle) in CargoBoxer) then {_CargoType = 6};

_Compatible = false;

if(_BaseType == 2 && (_CargoType == 1)) then {_Compatible = true;_AnimationType = 0};
if(_BaseType == 2 && (_CargoType == 2)) then {_Compatible = true;_AnimationType = 1};
if(_BaseType == 4 && (_CargoType == 3)) then {_Compatible = true;_AnimationType = 2};
if(_BaseType == 4 && (_CargoType == 4)) then {_Compatible = true;_AnimationType = 3};
if(_BaseType == 4 && (_CargoType == 5)) then {_Compatible = true;_AnimationType = 4};
if(_BaseType == 4 && (_CargoType == 6)) then {_Compatible = true;_AnimationType = 5};


if(!_Compatible) exitWith {};

_oldPos = position player;
_oldDir = getDir player;
life_ADAC_vehicle = life_ADAC_vehicle;
player moveinDriver life_ADAC_vehicle;
moveout player;
player setPos _oldPos;
player setDir _oldDir;

_Load0 = {
	private["_height","_kart","_base"];
	_base = _this select 0;
	_kart = _this select 1;
	_height = -0.49407;
	_lenght = -5;
	while{true} do {
		if(_height >= 0.375926) exitWith {};
		_kart attachTo [_base,[-0.109796,-5,_height]];
		_height = _height + 0.01;
		sleep 0.001;
	};
	while{true} do {

		if(_lenght >= -1.84421) exitWith {};
		_kart attachTo [_base,[-0.109796,_lenght,0.375926]];
		_lenght = _lenght + 0.01;
		sleep 0.001;
	};
};
_Load1 = {
	private["_height","_quad","_base"];
	_base = _this select 0;
	_quad = _this select 1;
	_height = -0.121070;
	_lenght = -5;
	while{true} do {
		if(_height >= 0.735926) exitWith {};
		_quad attachTo [_base,[-0.0548959,-5,_height]];
		_height = _height + 0.01;
		sleep 0.004;
	};
	while{true} do {

		if(_lenght >= -1.84421) exitWith {};
		_quad attachTo [_base,[-0.0548959,_lenght,0.735926]];
		_lenght = _lenght + 0.01;
		sleep 0.001;
	};
};
_Load2 = {
	private["_height","_offr","_base"];
	_base = _this select 0;
	_offr = _this select 1;
	_height = -0.108559;
	_lenght = -8;
	_angle = 0;
	_offr setVectorDirAndUp [[0,5,0],[0,-5,5]];
	while{true} do {
		if(_height >= 1.535926) exitWith {};
		_offr attachTo [_base,[0.0585573,-8,_height]];
		_height = _height + 0.01;
		sleep 0.004;
	};
	while{true} do {

		if(_angle < 2) then {_offr setVectorDirAndUp [[0,5,_angle],[0,-5,5]];};
		if(_lenght >= -0.933247) exitWith {};
		_offr attachTo [_base,[0.0585573,_lenght,1.535926]];
		_lenght = _lenght + 0.01;
		_angle = _angle + 0.01;
		sleep 0.001;
	};
};
_Load3 = {
	private["_height","_limo","_base"];
	_base = _this select 0;
	_limo = _this select 1;
	_height = -0.108559;
	_lenght = -8;
	_angle = 0;
	_limo setVectorDirAndUp [[0,5,0],[0,-5,5]];
	while{true} do {
		if(_height >= 1.535926) exitWith {};
		_limo attachTo [_base,[0.0548959,-8,_height]];
		_height = _height + 0.01;
		sleep 0.004;
	};
	while{true} do {

		if(_angle < 2) then {_limo setVectorDirAndUp [[0,5,_angle],[0,-5,5]];};
		if(_lenght >= -0.933247) exitWith {};
		_limo attachTo [_base,[0.0548959,_lenght,1.535926]];
		_lenght = _lenght + 0.01;
		_angle = _angle + 0.01;
		sleep 0.001;
	};
};
_Load4 = {
	private["_height","_limo","_base"];
	_base = _this select 0;
	_limo = _this select 1;
	_height = -0.108559;
	_lenght = -8;
	_angle = 0;
	_limo setVectorDirAndUp [[0,5,0],[0,-5,5]];
	while{true} do {
		if(_height >= 1.735926) exitWith {};
		_limo attachTo [_base,[0.0548959,-8,_height]];
		_height = _height + 0.005;
		sleep 0.004;
	};
	while{true} do {

		if(_angle < 2) then {_limo setVectorDirAndUp [[0,5,_angle],[0,-5,5]];};
		if(_lenght >= -0.933247) exitWith {};
		_limo attachTo [_base,[0.0548959,_lenght,1.735926]];
		_lenght = _lenght + 0.01;
		_angle = _angle + 0.01;
		sleep 0.001;
	};
};
_Load0 = {
	private["_height","_kart","_base"];
	_base = _this select 0;
	_kart = _this select 1;
	_height = -0.49407;
	_lenght = -5;
	while{true} do {
		if(_height >= 0.375926) exitWith {};
		Kart attachTo [Base,[-0.109796,-5,_height]];
		_height = _height + 0.001;
		sleep 0.001;
	};
	while{true} do {

		if(_lenght >= -1.84421) exitWith {};
		Kart attachTo [Base,[-0.109796,_lenght,0.375926]];
		_lenght = _lenght + 0.01;
		sleep 0.001;
	};
	detach _kart;
};
_UnLoad1 = {
	private["_height","_quad","_base"];
	_base = _this select 0;
	_quad = _this select 1;
	_height = -0.121070;
	_lenght = -5;
	while{true} do {
		if(_height >= 0.735926) exitWith {};
		_quad attachTo [_base,[-0.0548959,-5,_height]];
		_height = _height + 0.01;
		sleep 0.004;
	};
	while{true} do {

		if(_lenght >= -1.84421) exitWith {};
		_quad attachTo [_base,[-0.0548959,_lenght,0.735926]];
		_lenght = _lenght + 0.01;
		sleep 0.001;
	};
	detach _quad;
};
_UnLoad2 = {
	private["_height","_offr","_base"];
	_base = _this select 0;
	_offr = _this select 1;
	_height = -0.108559;
	_lenght = -8;
	_angle = 0;
	_offr setVectorDirAndUp [[0,5,0],[0,-5,5]];
	while{true} do {
		if(_height >= 1.535926) exitWith {};
		_offr attachTo [_base,[0.0585573,-8,_height]];
		_height = _height + 0.01;
		sleep 0.004;
	};
	while{true} do {

		if(_angle < 2) then {_offr setVectorDirAndUp [[0,5,_angle],[0,-5,5]];};
		if(_lenght >= -0.933247) exitWith {};
		_offr attachTo [_base,[0.0585573,_lenght,1.535926]];
		_lenght = _lenght + 0.01;
		_angle = _angle + 0.01;
		sleep 0.001;
	};
	detach _offr;
};
_UnLoad3 = {
	private["_height","_limo","_base"];
	_base = _this select 0;
	_limo = _this select 1;
	_height = -0.108559;
	_lenght = -8;
	_angle = 0;
	_limo setVectorDirAndUp [[0,5,0],[0,-5,5]];
	while{true} do {
		if(_height >= 1.535926) exitWith {};
		_limo attachTo [_base,[0.0548959,-8,_height]];
		_height = _height + 0.01;
		sleep 0.004;
	};
	while{true} do {

		if(_angle < 2) then {_limo setVectorDirAndUp [[0,5,_angle],[0,-5,5]];};
		if(_lenght >= -0.933247) exitWith {};
		_limo attachTo [_base,[0.0548959,_lenght,1.535926]];
		_lenght = _lenght + 0.01;
		_angle = _angle + 0.01;
		sleep 0.001;
	};
	detach _limo;
};
_UnLoad4 = {
	private["_height","_limo","_base"];
	_base = _this select 0;
	_limo = _this select 1;
	_height = -0.108559;
	_lenght = -8;
	_angle = 0;
	_limo setVectorDirAndUp [[0,5,0],[0,-5,5]];
	while{true} do {
		if(_height >= 1.735926) exitWith {};
		_limo attachTo [_base,[0.0548959,-8,_height]];
		_height = _height + 0.01;
		sleep 0.004;
	};
	while{true} do {

		if(_angle < 2) then {_limo setVectorDirAndUp [[0,5,_angle],[0,-5,5]];};
		if(_lenght >= -0.933247) exitWith {};
		_limo attachTo [_base,[0.0548959,_lenght,1.735926]];
		_lenght = _lenght + 0.01;
		_angle = _angle + 0.01;
		sleep 0.001;
	};
	detach _limo;
};

if(_AnimationType == 0) exitWith {[(nearestsupported select 0),life_ADAC_vehicle]spawn _Load0};
if(_AnimationType == 1) exitWith {[(nearestsupported select 0),life_ADAC_vehicle]spawn _Load1};
if(_AnimationType == 2) exitWith {[(nearestsupported select 0),life_ADAC_vehicle]spawn _Load2};
if(_AnimationType == 3) exitWith {[(nearestsupported select 0),life_ADAC_vehicle]spawn _Load3};
if(_AnimationType == 4) exitWith {[(nearestsupported select 0),life_ADAC_vehicle]spawn _Load3};
if(_AnimationType == 5) exitWith {[(nearestsupported select 0),life_ADAC_vehicle]spawn _Load4};