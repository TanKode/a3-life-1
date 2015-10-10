#include <macro.h>
/*
	File: fn_handlePaper.sqf
	Author: Skalicon / Paratus
	
	Description:
	Updates the players Inventory and ATM cash.
*/
if (isServer) exitWith {};

private ["_type","_modifier","_amount","_msg","_test"];
_type = _this select 0;
_modifier = _this select 1;
_amount = _this select 2;
_msg = format["Hack Alert The player with the above name was flagged for money hacking! He seems to have €%1 cash in hand and €%2 in his bank",life_TASCHENGELD,life_BANK];

if ((life_Tswiftie != (life_TASCHENGELD / 2) + 5) || (life_ShakeItOff != (life_BANK / 2) + 3)) exitWith
{
	if(!(life_hacker)) then {
		if(__GETC__(life_adminlevel) > 0)then{
			titleText[format["Hack Alert The player with the above name was flagged for money hacking! He seems to have €%1 cash in hand and €%2 in his bank",life_TASCHENGELD,life_BANK],"PLAIN"];
		};
	};
	hintSilent "";
	life_hacker = true;
};
if(_type in ["atm","cash"] && _modifier in ["add","take"] && _amount == 0) exitWith {};
if(_type == "withdraw") then {
	life_BANK = life_BANK - _amount;
	life_TASCHENGELD = life_TASCHENGELD + _amount;
};
if(_type == "deposit") then {
	life_BANK = life_BANK + _amount;
	life_TASCHENGELD = life_TASCHENGELD - _amount;
};
	
if (_type == "atm") then {
	if (_modifier == "add") then {
		life_BANK = life_BANK + _amount;
	};
	if (_modifier == "take") then {
		life_BANK = life_BANK - _amount;
	};
	if (_modifier == "set") then {
		life_BANK = _amount;
	};
};

if (_type == "cash") then {
	if (_modifier == "add") then {
		life_TASCHENGELD = life_TASCHENGELD + _amount;
	};
	if (_modifier == "take") then {
		life_TASCHENGELD = life_TASCHENGELD - _amount;
	};
	if (_modifier == "set") then {
		life_TASCHENGELD = _amount;
	};
};

life_ShakeItOff = (life_BANK / 2) + 3;
life_Tswiftie = (life_TASCHENGELD / 2) + 5;
if(life_sync) then {
	life_sync = false;
	[] spawn { uiSleep 2.5; [6] call SOCK_fnc_updatePartial; life_sync = true; };
};