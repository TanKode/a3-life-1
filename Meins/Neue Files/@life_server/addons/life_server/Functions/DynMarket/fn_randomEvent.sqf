/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT. ###
### STEAM: www.steamcommunity.com/id/ryanthett ###
### ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY ###
### WITH THIS HEADER / NOTIFICATION ###
#################################################################
*/

// In this file you can configure random events
DYNMARKET_chance = 1; // Chance for a random event to happen
DYNMARKET_Events =
[
		["Im Norden von Altis haben Aktivisten einen Anschlag auf eine Ölbohrinsel verübt!","<t size='1.2'>Verarbeitestes Öl</t><br/><br/><img size='2' image='icons\trendup.paa'/>",["oil_processed"],-2], // -2 MEANS CHANGE PRICE TO MAX, -1 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
		["Eine Umfrage hat ergeben die Beliebteste Droge bei der Unterschicht inst CrystelMeth!","<t size='1.2'>Verarbeitetes CrystelMeth</t><br/><br/><img size='2' image='icons\trendup.paa'/>",["meth_processed"],-2],
		["Dubai hat mit dem Bus eines der größten Gebäude der Wet begonnen!","<t size='1.2'>Glas</t><br/><br/><img size='2' image='icons\trendup.paa'/>",["glass"],-2],
		["Die Nachfrage an Glasflaschen überflutet den Markt!","<t size='1.2'>Glasflaschen</t><br/><br/><img size='2' image='icons\trendup.paa'/>",["bottles"],-2],
		["Deutsche Rüstungsindustrie erforscht neue Legierungen für Waffen","<t size='1.2'>Kupferbarren</t><br/><br/><img size='2' image='icons\trendup.paa'/><br/><br/><t size='1.2'>Eisenbarren</t><br/><br/><img size='2' image='icons\trendup.paa'/>",["copper_refined","iron_refined"],-2],
		["Anleger verlieren Vertrauen in den Euro","<t size='1.2'>Goldbarren</t><br/><br/><img size='2' image='icons\trendup.paa'/>",["gold_processed"],-2],
		["Ein Frachtschiff voller Silber ist vor der Küste von Altis gesunken!","<t size='1.2'>Silberbarren</t><br/><br/><img size='2' image='icons\trendup.paa'/>",["silber_processes"],-2],
		["Eine Umfrage hat ergeben Marihuana ist die beliebteste Einsteigerdroge bei der jungen Altis Bevölkerung!","<t size='1.2'>Marihuana</t><br/><br/><img size='2' image='icons\trendup.paa'/>",["marijuana"],-2],
		["Bandenkriege haben die Preise von Heroin in die höhe schießen lassen!","<t size='1.2'>Verarbeitetes Heroin</t><br/><br/><img size='2' image='icons\trendup.paa'/>",["heroin_processed"],-2],
		["Die Polizei von Altis hat einen Illegalen Spirituosen Ring ausgehoben!","<t size='1.2'>Flasche Moonshine</t><br/><br/><img size='2' image='icons\trendup.paa'/>",["bottledshine"],-2],
		["Irland und USA haben ihre Whiskeyproduktion verdoppelt!","<t size='1.2'>Flasche Whiskey</t><br/><br/><img size='2' image='icons\trenddown.paa'/>",["bottledwhiskey"],-2],
		["Die Deutschen Bierbrauereien haben eine überproduktion!","<t size='1.2'>Flasche Bier</t><br/><br/><img size='2' image='icons\trenddown.paa'/>",["bottledbeer"],-1],
		["In Kongo wurde ein neues riesen Diamantenvorkommen entdeckt!","<t size='1.2'>Geschliffene Diamanten</t><br/><br/><img size='2' image='icons\trenddown.paa'/>",["diamond_cut"],-1],
		["Debatte über deutsches Atomprogramm!","<t size='1.2'>Uranium</t><br/><br/><img size='2' image='icons\trenddown.paa'/>",["uran_processed"],-1],
		["Die Droge Kokain überschwemmt den Drogenmarkt!","<t size='1.2'>Verarbeitetest Kokain</t><br/><br/><img size='2' image='icons\trenddown.paa'/>",["cocaine_processed"],-1],
		["Der Bau des neuen Flughafen Altis wurde eingestellt!","<t size='1.2'>Zement Sack</t><br/><br/><img size='2' image='icons\trenddown.paa'/>",["cement"],-1],
		["Riesiges Salzfeld wurde auf Altis entdeckt!","<t size='1.2'>Raffiniertes Salz</t><br/><br/><img size='2' image='icons\trenddown.paa'/>",["salt_refined"],-1],
		["Keine Abnehmer für den LSD Markt da die Ware immer schlechtere Qualität aufweist!","<t size='1.2'>Lysergsaeurediethylamid</t><br/><br/><img size='2' image='icons\trenddown.paa'/>",["frogslsd"],-1]
];

_random = floor(random 100)+1;
if (_random > DYNMARKET_chance) exitWith {DYNMARKET_waitForEvent = true;};
_eventCount = count DYNMARKET_Events;
_randomEventID = floor(random _eventCount);
_eventToHappen = DYNMARKET_Events select _randomEventID;

// Create the event

_eventMessage = _eventToHappen select 0;
_eventTrend = _eventToHappen select 1;
_eventItems = _eventToHappen select 2;
_eventToPrice = _eventToHappen select 3;
//diag_log format["EventMessage: %1, EventTrend: %2, EventItem: %3, EventToPrice: %4", _eventMessage,_eventTrend,_eventItems,_eventToPrice];
{
	_itemName = _x ;
	_itemNewPrice = _x ;
	_index = -1;
	{
		_index = _index + 1;
		_newItem = _x select 0;
		//diag_log format["OldName: %1 NewItem: %2",_itemName,_newItem];
		if (_newItem == _itemName) then {
			if (_eventToPrice==-1) then {
				{
					{
						if (_x select 0 == _itemName) then {_itemNewPrice = _x select 2;};
						//diag_log format["Preis: %1",_itemNewPrice];
					} forEach (_x select 1);
				} forEach DYNMARKET_Items_Groups;
				DYNMARKET_sellarraycopy set [_index,[_x select 0,_itemNewPrice]];
				DYNMARKET_Items_CurrentPriceArr set [_index,[_x select 0,_itemNewPrice,0]];
				//diag_log format["Preis sinkt: %1",[_index,[_x select 0,_itemNewPrice,0]]];
				//diag_log format["Preis sinkt: %1",[_index,[_x select 0,_itemNewPrice]]];
			} else {
				if (_eventToPrice==-2) then {
					{
						{
							if (_x select 0 == _itemName) then {_itemNewPrice = _x select 3;};
							//diag_log format["Preis: %1",_itemNewPrice];
						} forEach (_x select 1);
					} forEach DYNMARKET_Items_Groups;
					DYNMARKET_sellarraycopy set [_index,[_x select 0,_itemNewPrice]];
					DYNMARKET_Items_CurrentPriceArr set [_index,[_x select 0,_itemNewPrice,0]];
					//diag_log format["Preis steigt: %1",[_index,[_x select 0,_itemNewPrice,0]]];
					//diag_log format["Preis steigt: %1",[_index,[_x select 0,_itemNewPrice]]];
				} else {
					DYNMARKET_sellarraycopy set [_index,[_x select 0,_eventToPrice]];
					DYNMARKET_Items_CurrentPriceArr set [_index,[_x select 0,_eventToPrice,0]];
					//diag_log format["Preis: %1",[_index,[_x select 0,_itemNewPrice,0]]];
					//diag_log format["Preis: %1",[_index,[_x select 0,_itemNewPrice]]];
				};
			};
		};
	} forEach DYNMARKET_sellarraycopy;
} forEach _eventItems;
DYNMARKET_waitForEvent = true;
sleep 2;
[[4,_eventMessage],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[3,_eventTrend],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
