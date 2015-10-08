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
_msg = format["Hack Alert The player with the above name was flagged for money hacking! He seems to have €%1 cash in hand and €%2 in his bank",bambusfarm_TASCHENGELD,bambusfarm_BANK];

if ((bambusfarm_Tswiftie != (bambusfarm_TASCHENGELD / 2) + 5) || (bambusfarm_ShakeItOff != (bambusfarm_BANK / 2) + 3)) exitWith
{
	if(!(bambusfarm_hacker)) then {
		if(__GETC__(bambusfarm_adminlevel) > 0)then{
			titleText[format["Hack Alert The player with the above name was flagged for money hacking! He seems to have €%1 cash in hand and €%2 in his bank",bambusfarm_TASCHENGELD,bambusfarm_BANK],"PLAIN"];
		};
	};
	hintSilent "";
	bambusfarm_hacker = true;
};
if(_type in ["atm","cash"] && _modifier in ["add","take"] && _amount == 0) exitWith {};
if(_type == "withdraw") then {
	bambusfarm_BANK = bambusfarm_BANK - _amount;
	bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD + _amount;
};
if(_type == "deposit") then {
	bambusfarm_BANK = bambusfarm_BANK + _amount;
	bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD - _amount;
};
	
if (_type == "atm") then {
	if (_modifier == "add") then {
		bambusfarm_BANK = bambusfarm_BANK + _amount;
	};
	if (_modifier == "take") then {
		bambusfarm_BANK = bambusfarm_BANK - _amount;
	};
	if (_modifier == "set") then {
		bambusfarm_BANK = _amount;
	};
};

if (_type == "cash") then {
	if (_modifier == "add") then {
		bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD + _amount;
	};
	if (_modifier == "take") then {
		bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD - _amount;
	};
	if (_modifier == "set") then {
		bambusfarm_TASCHENGELD = _amount;
	};
};

bambusfarm_ShakeItOff = (bambusfarm_BANK / 2) + 3;
bambusfarm_Tswiftie = (bambusfarm_TASCHENGELD / 2) + 5;
if(bambusfarm_sync) then {
	bambusfarm_sync = false;
	[] spawn { uiSleep 2.5; [6] call SOCK_fnc_updatePartial; bambusfarm_sync = true; };
};