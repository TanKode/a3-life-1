/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/

// In this file you can configure random EventsAktien
DYNMARKET_chance = 50; // Chance for a random event to happen
DYNMARKET_EventsAktien =
[
	["Der Preis der FUX Aktie hat sich verändert.",["aktie_FX"],round(random 1000)], // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
	["Der Preis der Windoof Aktie hat sich verändert.",["aktie_windoof"],round(random 1000)], // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
	["Der Preis der EUR/USD Aktie hat sich verändert.",["aktie_doller"],round(random 1000)], // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
	["Der Preis der Öl Aktie hat sich verändert.",["aktie_oel"],round(random 1000)], // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
	["Der Preis der Linux Aktie hat sich verändert.",["aktie_linux"],round(random 1000)], // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
	["Der Preis der Gold Aktie hat sich verändert.",["aktie_gold"],round(random 1000)], // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
	["Der Preis der Kupfer Aktie hat sich verändert.",["aktie_kupfer"],round(random 1000)], // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
	["Der Preis der Facebak Aktie hat sich verändert.",["aktie_faebak"],round(random 1000)], // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
	["Der Preis der Altis Aktie hat sich verändert.",["aktie_altis"],round(random 1000)], // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
	["Der Preis der stratis Aktie hat sich verändert.",["aktie_stratis"],round(random 1000)] // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
];

_random = floor(random 100)+1;
if (_random>DYNMARKET_chance) exitWith {DYNMARKET_waitForEventAktien = true;};
_EventAktienCount = count DYNMARKET_EventsAktien;
_randomEventAktienID = floor(random _EventAktienCount);
_EventAktienToHappen = DYNMARKET_EventsAktien select _randomEventAktienID;

// Create the EventAktien

_EventAktienMessage = _EventAktienToHappen select 0;
_EventAktienItems = _EventAktienToHappen select 1;
_EventAktienToPrice = _EventAktienToHappen select 2;

{
	_itemName = _x;
	_itemNewPrice = 0;
	_index = -1;
	{
		_index = _index + 1;
		if (_x select 0 == _itemName) then {
			if (_EventAktienToPrice==-1) then {
				{
					{
						if (_x select 0 == _itemName) then {_itemNewPrice = _x select 2;};
					} forEach (_x select 1);
				} forEach DYNMARKET_Items_Groups;
				DYNMARKET_sellarraycopy set [_index,[_x select 0,_itemNewPrice]];
				DYNMARKET_Items_CurrentPriceArr set [_index,[_x select 0,_itemNewPrice,0]];
			} else {
				if (_EventAktienToPrice==-2) then {
					{
						{
							if (_x select 0 == _itemName) then {_itemNewPrice = _x select 3;};
						} forEach (_x select 1);
					} forEach DYNMARKET_Items_Groups;
					DYNMARKET_sellarraycopy set [_index,[_x select 0,_itemNewPrice]];
					DYNMARKET_Items_CurrentPriceArr set [_index,[_x select 0,_itemNewPrice,0]];
				} else {
					DYNMARKET_sellarraycopy set [_index,[_x select 0,_EventAktienToPrice]];
					DYNMARKET_Items_CurrentPriceArr set [_index,[_x select 0,_EventAktienToPrice,0]];
				};
			};
		};
	} forEach DYNMARKET_sellarraycopy;
} forEach _EventAktienItems;

DYNMARKET_waitForEventAktien = true;

sleep 2;

[[0,_EventAktienMessage],"bambusfarm_fnc_broadcast",true,false] spawn bambusfarm_fnc_MP;