#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
life_TASCHENGELD = parseNumber (_this select 2);
life_BANK = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donatorlevel,parseNumber(_this select 32));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

switch(__GETC__(life_donatorlevel)) do
{
	case 1: {life_paycheck = life_paycheck + 175;};
	case 2: {life_paycheck = life_paycheck + 250;};
	case 3: {life_paycheck = life_paycheck + 500 + PayDynamicDonator;};
	case 4: {life_paycheck = life_paycheck + 800 + PayDynamicDonator;};
	case 5: {life_paycheck = life_paycheck + 1250 + PayDynamicDonator;};
};

switch(__GETC__(life_donatorlevel)) do
{
	case 1: {DonatorBuyChange = DonatorBuyChange - 0.05;};
	case 2: {DonatorBuyChange = DonatorBuyChange - 0.10;};
	case 3: {DonatorBuyChange = DonatorBuyChange - 0.15;};
	case 4: {DonatorBuyChange = DonatorBuyChange - 0.15;};
	case 5: {DonatorBuyChange = DonatorBuyChange - 0.15;};
};

switch(__GETC__(life_donatorlevel)) do
{
	case 1: {DonatorBuyChangeCar = DonatorBuyChangeCar - 0.05;};
	case 2: {DonatorBuyChangeCar = DonatorBuyChangeCar - 0.10;};
	case 3: {DonatorBuyChangeCar = DonatorBuyChangeCar - 0.15;};
	case 4: {DonatorBuyChangeCar = DonatorBuyChangeCar - 0.15;};
	case 5: {DonatorBuyChangeCar = DonatorBuyChangeCar - 0.15;};
};
switch(__GETC__(life_donatorlevel)) do
{
	case 0: {__CONST__(life_vip_discount,1);};
	case 1: {__CONST__(life_vip_discount,0.95);};
	case 2: {__CONST__(life_vip_discount,0.90);};
	case 3: {__CONST__(life_vip_discount,0.85);};
	case 4: {__CONST__(life_vip_discount,0.85);};
	case 5: {__CONST__(life_vip_discount,0.85);};
};

if((__GETC__(life_donatorlevel)) > 0) then {
systemChat format["Du bist Donatorlevel %1, danke für deine Hilfe!",__GETC__(life_donatorlevel)]; };

life_gear = _this select 8;
[] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel,parseNumber(_this select 7));
		life_blacklisted = _this select 9;
		__CONST__(life_medicLevel,0);

		switch (__GETC__(life_coplevel)) do
		{
			case 1: {life_paycheck = 500;};
			case 2: {life_paycheck = 600;};
			case 3: {life_paycheck = 700;};
			case 4: {life_paycheck = 800;};
			case 5: {life_paycheck = 900;};
			case 6: {life_paycheck = 1000;};
			case 7: {life_paycheck = 1250;};
			case 8: {life_paycheck = 1500;};
			case 9: {life_paycheck = 1500;};
			case 10: {life_paycheck = 1500;};
			case 11: {life_paycheck = 1500;};
			case 12: {life_paycheck = 1500;};
			case 13: {life_paycheck = 1500;};
			case 14: {life_paycheck = 1500;};
			case 15: {life_paycheck = 1500;};
			case 16: {life_paycheck = 1750;};
			case 17: {life_paycheck = 1750;};
			case 18: {life_paycheck = 2000;};
			case 19: {life_paycheck = 2000;};
			case 20: {life_paycheck = 2000;};
			default {life_paycheck = 500; };
		};
	};
	
	case civilian: {
		life_is_arrested = _this select 7;
		__CONST__(life_coplevel,0);
		__CONST__(life_medicLevel,0);
		life_houses = _this select 9;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		life_gangData = _this select 10;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
		life_Karma = parseNumber (_this select 13);
		life_skillApple = parseNumber (_this select 14);
		life_skillPeach = parseNumber (_this select 15);
		life_skillEhemalsRock = parseNumber (_this select 16);
		life_skillSalt = parseNumber (_this select 17);
		life_skillSand = parseNumber (_this select 18);
		life_skillIronore = parseNumber (_this select 19);
		life_skillCopperore = parseNumber (_this select 20);
		life_skillDiamond = parseNumber (_this select 21);
		life_skillCannabis = parseNumber (_this select 22);
		life_skillCocaine = parseNumber (_this select 23);
		life_skillHeroinu = parseNumber (_this select 24);
		life_skillOilu = parseNumber (_this select 25);
		life_skillBauen = parseNumber (_this select 26);
		life_skillcoalu = parseNumber (_this select 27);
		life_skillBruchstein = parseNumber (_this select 28);
		life_skillTon = parseNumber (_this select 29);
		life_skillKrabben = parseNumber (_this select 30);
		life_skillFischen = parseNumber (_this select 31);
	};
	
	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_coplevel,0);

		switch (__GETC__(life_medicLevel)) do
        {
        	case 1: {life_paycheck = life_paycheck + 450;};
        	case 2: {life_paycheck = life_paycheck + 600;};
        	case 3: {life_paycheck = life_paycheck + 850;};
        	case 4: {life_paycheck = life_paycheck + 1450;};
        	case 5: {life_paycheck = life_paycheck + 2000;};
        };
	};
};

if(count (_this select 12) > 0) then {
	{life_vehicles pushBack _x;} foreach (_this select 12);
};

life_session_completed = true;