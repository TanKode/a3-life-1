#include <macro.h>
/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(EQUAL(_data,"")) exitWith {hint "Sie haben nichts zum entfernen ausgewählt.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Sie haben keine aktuelle Anzahl angegeben."};
if(parseNumber(_value) <= 0) exitWith {hint "Sie müssen eine aktuelle Anzahl angeben die Sie entfernen möchten."};
if(EQUAL(ITEM_ILLEGAL(_data),1) && ([west,visiblePosition player,100] call life_fnc_nearUnits)) exitWith {titleText["Dies ist ein illegales Item, da Polizisten in der Nähe sind können Sie die Beweiße nicht mehr vernichten","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Sie können keine Items entfernen während Sie in einen Fahrzeug sitzen.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Angegebene Anzahl konnte nicht vernichtet werden, möglicherweiße haben Sie nicht diese Anzahl?"};

hint format["Sie haben erfolgreich %1 %2 aus ihrem Inventar entfernt.",(parseNumber _value),(localize ITEM_NAME(_data))];
	
[] call life_fnc_p_updateMenu;