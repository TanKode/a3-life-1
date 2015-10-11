/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "gun": {50000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {130000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {350000}; //Heroin processing license cost
	case "marijuana": {25000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {750000}; //Rebel license cost
	case "truck": {20000}; //Truck license cost
	case "diamond": {350000};
	case "salt": {80000};
	case "cocaine": {150000};
	case "sand": {35000};
	case "iron": {175000};
	case "copper": {8000};
	case "cement": {25000};
	case "mair": {15000};
	case "home": {500000};
	case "ADAC": {500000};
	case "apple": {500};
	case "peach": {500};

};


