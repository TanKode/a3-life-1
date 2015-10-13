/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Fahrlaessige Toetung",195000]}; //65000
	case "187": {_type = ["Toetung",255000]}; //85000
	case "901": {_type = ["Ausbruch aus dem Gefaengnis",135000]}; //45000
	case "261": {_type = ["Vergewaltigung",150000]}; //50000
	case "261A": {_type = ["Versuchte Vergewaltigung",90000]}; //30000
	case "215": {_type = ["Versuchter Autodiebstahl",60000]}; //20000
	case "213": {_type = ["Gebrauch explosiever Stoffe",300000]}; //100000
	case "211": {_type = ["Raub",30000]}; //10000
	case "207": {_type = ["Geiselnahme",105000]}; //35000
	case "207A": {_type = ["versuchte Geiselnahme",60000]}; //20000
	case "487": {_type = ["Autodiebstahl",45000]}; //15000
	case "488": {_type = ["Petty Theft",7000]}; //7000
	case "480": {_type = ["Hit and run",39000]}; //13000
	case "481": {_type = ["Drogenbesitz",30000]}; //10000
	case "482": {_type = ["Die Absicht Drogen zu verteilen",150000]}; //50000
	case "483": {_type = ["Drogenhandel",285000]}; //95000
	case "459": {_type = ["Einbruch",195000]}; //65000
	case "485": {_type = ["Versuchtes aufbrechen der Handfesseln",75000]}; //25000
    case "486": {_type = ["Aufbrechen der handfesseln",150000]}; //50000
	case "1002": {_type = ["Hacking",150000]};
	case "1003": {_type = ["Vers. Hacking",50000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
};