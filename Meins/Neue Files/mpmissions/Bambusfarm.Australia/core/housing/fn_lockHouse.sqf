#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unlocks / locks the house.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !((_house isKindOf "House_F") OR (_house isKindOf "House"))) exitWith {};

_state = _house GVAR ["locked",true];
if(_state) then {
	_house SVAR ["locked",false,true];
	//titleText[localize "STR_House_StorageUnlock","PLAIN"];
	hint composeText [ image "icons\unlock.paa", "  Lager aufgeschlossen"];
} else {
	_house SVAR ["locked",true,true];
	//titleText[localize "STR_House_StorageLock","PLAIN"];
	hint composeText [ image "icons\lock.paa", "  Lager abgeschlossen"];
};