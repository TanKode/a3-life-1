#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Tries to place a storage box in the nearest house.
*/
private["_boxType","_house","_positions","_containers","_pos","_houseCfg"];
_boxType = _this select 0;

_house = (getPosATL player) nearestObject "House";
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};

__containers = _house getVariable["containers",[]];
_houseCfg = M_CONFIG(getNumber,"Houses",typeOf(_house),"maxStorage");
if(_houseCfg == 0) exitWith {}; //What the fuck just happened?
if(count _containers >= _houseCfg) exitWith {hint localize "STR_ISTR_Box_HouseFull"};


_full = false;
_boxWasInstalled = false;
if (isNil {cursorTarget getVariable "content"}) then {} else {
	_content = cursorTarget getVariable "content";
	_boxes = 0;
	{
		if (_x select 0 == "B_supplyCrate_F") then {_boxes = _boxes + 1;};
	} forEach _content;

	if (_boxes<6) then 
	{
		_content pushBack ["B_supplyCrate_F",1];
		_house setVariable ["content",_content,true];
		_full = false;
	} else 
	{
		_full = true;
	};
};

if (!_full) then 
{
	hint "Die Lagerboxen wurde zu ihrem Hausinventar hinzugefuegt!";
	[false,_boxType,1] call life_fnc_handleInv;
	[[_house],"TON_fnc_updateHouseContainers",false,false] call life_fnc_MP;
} 
else 
{
	hint "Das Limit der verfuegbaren Lagerboxen in ihrem Haus wurde erreicht!!";
};