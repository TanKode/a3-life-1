#include <macro.h>
/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_exp","_level"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
_legal = ["oil","diamond","copper","iron","sand","salt","cement","glassbottle","mash","whiskey","beer","bottlebeer","bottlewhiskey","gold","silber","pcola","sotb","mait","hase","eieromlet","scharf","ziege","hueners","kohle","farbstoff"];
_chance = random(100);
_itemNameOld2 = [];
_oldVal2 = [];
_oldItem2 = [];

//Error check
if(isNull _vendor OR EQUAL(_type,"") OR (player distance _vendor > 10)) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

_error = false;// used below check the comment there ;)

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do {
	case "oil": {["oil_unprocessed","oil_processed",1200,(localize "STR_Process_Oil"),false,"",150,3];};
	case "diamond": {["diamond_uncut","diamond_cut",1350,(localize "STR_Process_Diamond"),false,"",200,5];};
	case "heroin": {["heroin_unprocessed","heroin_processed",1750,(localize "STR_Process_Heroin"),false,"",300,7];};
	case "copper": {["copper_unrefined","copper_refined",750,(localize "STR_Process_Copper"),false,"",50,2];};
	case "iron": {["iron_unrefined","iron_refined",1120,(localize "STR_Process_Iron"),false,"",50,2];};
	case "sand": {["sand","glass",650,(localize "STR_Process_Sand"),false,"",150,3];};
	case "salt": {["salt_unrefined","salt_refined",450,(localize "STR_Process_Salt"),false,"",100,5];};
	case "cocaine": {["cocaine_unprocessed","cocaine_processed",1500,(localize "STR_Process_Cocaine"),false,"",400,9];};
	case "marijuana": {["cannabis","marijuana",500,(localize "STR_Process_Marijuana"),false,"",200,6];};
	case "cement": {["rock","cement",350,(localize "STR_Process_Cement"),false,"",150,3];};
	case "glassbottle":{["glass","bottles",650,"Falschen herstellen",false,"",80,3]};//new
	case "mash": {["waterBottle","mash",100,"Mixe Maismehl",true,"cornmeal",100,4]};//new
	case "whiskey": {["yeast","whiskey",1000,"Fermentiere Whiskey",true,"rye",200,5]};//new
	case "beer": {["yeast","beerp",1500,"Braue Bier",true,"hops",150,4]};//new
	case "moonshine": {["yeast","moonshine",250,"Fermentiere Moonshine",true,"mash",400,9]};//new
	case "bottledshine": {["moonshine","bottledshine",500,"Moonshine abfüllen",true,"bottles",140,9]};//new
	case "bottledbeer": {["beerp","bottledbeer",500,"Bier abfüllen",true,"bottles",150,4]};//new
	case "bottledwhiskey": {["whiskey","bottledwhiskey",500,"Whiskey abfüllen",true,"bottles",160,5]};//new
	case "meth": {["meth_unprocessed","meth_processed",7500,"Koche Meth",false,"",200,8]};
	case "gold": {["gold_unprocessed","gold_processed",1000,"Verarbeitet Golderz in Goldbarren",false,"",150,4];};
    case "antiquitaeten": {["goldbarp","reingold",15000,"Schmelze Antiquitaeten ein",false,"",200,9];};
	case "silber": {["silber_unprocessed","silber_processed",1000,"Verarbeitet Silbererz in Silberbarren",false,"",130,4];};
	case "uran": {["uran_unprocessed","uran_processed",10000,"Uran Anreichern",false,"",300,8];};
	case "lsd": {["frogs","frogslsd",5000,"Verarbeitet Tryptophan in LSD",false,"",200,7];};
	case "pcola": {["banane","pcolap",100,"Mixe Pinacolada",true,"cerises",80,1]};
	case "sotb": {["peach","sotbp",100,"Mixe Sex on the Beach",true,"birne",80,1]};
	case "mait": {["apple","maitp",100,"Mixe Mai Tai",true,"banane",80,1]};
    case "hase": {["rabbit_raw","rabbit_grilled",100,"Grille Kaninchenfleisch",false,"",50,3];};
    case "eieromlet": {["h_eier","eieromlet",100,"Brate Eier",false,"",50,3];};
    case "scharf": {["sheep_raw","sheep_grilled",100,"Grille Lamm",false,"",50,3];};
	case "ziege": {["goat_raw", "goat_grilled",100,"Grille Ziege",false,"",50,3];};
    case "hueners": {["waterBottle","hueners",100,"Koche Huenersuppe",true,"rooster_raw",50,3];};
	case "kohle": {["faulbaum","kohle",550,"Kohle herstellen",false,"",100,2];};
    case "swsaeure": {["schwefel","schwefelsaeure",1000,"Schwefelsaeure herstellen",false,"",200,6];};
    case "farbstoff": {["gluew","farbstoff",10000,"Farbstoff herstellen",false,"",150,6];};
	default {[];};
};

if(_chance >= 96) then 
{
	switch (_type) do
	{
		case "cocaine": {[[3,format["<t color='#CB2525'><t size='2.5'>Info!</t><br/> <t color='#FFFFFF'>- Informant: Jemand hat gerade große Mengen Zutaten zur Kokaine herstellungen gekauft!<br/><br/>Er ist in richtung Panagia gefahren!!!</t>"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };
		case "marijuana": {[[3,format["<t color='#CB2525'><t size='2.5'>Info!</t><br/> <t color='#FFFFFF'>- Informant: Jeamd wurde mit einer großen Menge verdächtig ausehender Pflanzen gesehen!<br/><br/> Bei der Thelos-Buch im im Osten Altis!!!</t>"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };
		case "moonshine": {[[3,format["<t color='#CB2525'><t size='2.5'>Info!</t><br/> <t color='#FFFFFF'>- Informant: Die Einwohner von Athira haben den verdacht das bei Kap Zefyris eine Illegale Distillery betrieben wird!!!</t>"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };//new
		case "bottledshine": {[[3,format["<t color='#CB2525'><t size='2.5'>Info!</t><br/> <t color='#FFFFFF'>- Informant: Es besteht der verdacht das die Flaschenabfuellfirma illegale Geschaefte durch abfuellen von Schwarzgebrannten betreibt!!!</t>"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };//new
		case "meth": {[[3,format["<t color='#CB2525'><t size='2.5'>Info!</t><br/> <t color='#FFFFFF'>- Informant: Die Einwohner von Delfinaki beschweren sich über Chemische Dämpfe in der naehe die zu Halluzination fuehren!!!</t>"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };
		case "uran": {[[3,format["<t color='#CB2525'><t size='2.5'>Info!</t><br/> <t color='#FFFFFF'>- Informant: In dem Fischerdorf Neochori an der Katalaki-Bucht tauchen in letzter Zeit vermehrt Tode Fische auf!!!<br/> Er ist in richtung Kavirida gefahren!!!</t>"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };
		case "lsd": {[[3,format["<t color='#CB2525'><t size='2.5'>Info!</t><br/> <t color='#FFFFFF'>- Informant: Es besteht der verdacht das in der naehe von Selakano bei DP 25 eine illegale Chemifrabrik betrieben wird!!!<br/> Er ist in richtung Kavirida gefahren!!!</t>"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };
		case "heroin": {[[3,format["<t color='#CB2525'><t size='2.5'>Info!</t><br/> <t color='#FFFFFF'>- Informant: Bei der alten Bergbaumine in der naehe von Charika wurden verstaerkt aktivitaeten festgestellt!!!<br/> Er ist in richtung Kavirida gefahren!!!</t>"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;};
	};
};

//Error checking
if(EQUAL(count _itemInfo,0)) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

//Setup vars. // true if process action is with 2 Items and false if processing with 1 Item.
_oldItem = SEL(_itemInfo,0);
_newItem = SEL(_itemInfo,1);
_cost = SEL(_itemInfo,2);
_upp = SEL(_itemInfo,3);
_2var = SEL(_itemInfo,4); // true if process action is with 2 Items and false if processing with 1 Item.

_itemNameNew = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
//Skillsystem
_exp = SEL(_itemInfo,6);
_level = SEL(_itemInfo,7);
if(LEVEL < _level) exitWith {hintSilent format["Sie muessen Level %1 erreicht haben um %2 fahrem zu koennen",_level,_itemNameNew ]};

if(_2var) then {_oldItem2 = SEL(_itemInfo,5)};

/*if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = LICENSE_VALUE(_type,"civ");
};*/
if(_type in ["beer"]) then
{
	_type = "liquor";
};

if(_type in ["mash","whiskey","moonshine"]) then
{
	_type = "stiller";
};

if(_type in ["bottledshine","bottledbeer","bottledwhiskey","glassbottle"]) then
{
	_type = "bottler";
};

if(_type in ["hase","eieromlet","scharf","ziege","hueners"]) then
{
	_type = "hunting";
};

_hasLicense = LICENSE_VALUE(_type,"civ");
_itemNameOld = M_CONFIG(getText,"VirtualItems",_oldItem,"displayName");
_oldVal = ITEM_VALUE(_oldItem);

//2vars
if(_2var) then { _oldVal2 = ITEM_VALUE(_oldItem2); _itemNameOld2 = M_CONFIG(getText,"VirtualItems",_oldItem2,"displayName")};

if(_2var) then {
	if(_oldVal != _oldVal2) then {
		_error = true;
	};
};
if(_error) exitWith {hint "Benutzen Sie bitte die gleiche Menge",_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

_cost = _cost * _oldVal;
//Some more checks
if(EQUAL(_oldVal,0)) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.01;
life_is_processing = true;

if(skill_civ_processing && _type in _legal) then {_cpRate = 0.06};

if(_hasLicense) then {
	while{true} do {
		sleep  0.3;
		_cP = _cP + _cpRate;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	//2vars
	if(_2var) then
	{
		([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
		5 cutText ["","PLAIN"];
		cutText[format[localize "STR_Process_Processed3",(localize _itemNameOld),(localize _itemNameOld2),(localize _itemNameNew)],"PLAIN DOWN"];
	}else
	{
		5 cutText ["","PLAIN"];
		cutText[format[localize "STR_Process_Processed",(localize _itemNameOld),(localize _itemNameNew)],"PLAIN DOWN"];
	};
	
	life_is_processing = false;
	_exp = round(random(_exp));
	_exp = _oldVal * _exp;
	[true,_exp] spawn life_fnc_expConfig;
} else {
	
	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	
	while{true} do {
		sleep  0.9;
		_cP = _cP + _cpRate;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(_2var) then
	{
		([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
		5 cutText ["","PLAIN"];
		cutText[format[localize "STR_Process_Processed4",(localize _itemNameOld),(localize _itemNameOld2),(localize _itemNameNew),[_cost] call life_fnc_numberText],"PLAIN DOWN"];
	} else
	{
		5 cutText ["","PLAIN"];
		cutText[format[localize "STR_Process_Processed2",_oldVal,(localize _itemNameNew),[_cost] call life_fnc_numberText],"PLAIN DOWN"];
	};
	SUB(CASH,_cost);
	life_is_processing = false;
	_exp = round(random(_exp));
	_exp = (round(random(_oldVal))) * _exp;
	[true,_exp] spawn life_fnc_expConfig;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
};	
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];