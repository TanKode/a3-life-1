#include <macro.h>
private["_respondmode","_message"];

_respondmode = [_this,0,0,[0]] call BIS_fnc_param;
_displaystats = [_this,3,0,[0]] call BIS_fnc_param;

if (_respondmode==1) then {
	_message = [_this,1,"",[""]] call BIS_fnc_param;
	hint format ["%1",_message];
	ADD(CASH,5000);
};

if (_respondmode==2) then {
	if(life_is_arrested) exitWith {hintSilent "Sie koennen nicht an einem Paintballgame teilnehmen, da Sie momentan im Gefaengnis sitzen!"; ADD(CASH,5000);};
	if(side player != civilian) exitWith {hintSilent "Sie sind kein Zivilist!"; ADD(CASH,5000);};
	if(player getVariable "restrained") exitWith {hintSilent "Sie sind gefesselt und koennen nicht am Paintball teilnehmen!"; ADD(CASH,5000);};
	_randomSuits = ["U_I_Protagonist_VR","U_O_Protagonist_VR","U_B_Protagonist_VR"];
	_suit = _randomSuits select (floor (random (count _randomSuits)));
	player setVariable["paintballstats",true];
	paintstats = [["K",0,[]],["D",0,[]],["S",0],["P",[]]];
	[player] joinSilent (createGroup civilian);
	paintrespawn = 0;
	player addEventHandler ["handleDamage", {false}];
	playMusic "LeadTrack02_F_Bootcamp";
	hintSilent format["Willkommen in der Paintballarena! Das kommende Spiel wird %1 Minuten laufen, viel Spaß!",life_paintballTime];
	meinePos = getPosATL player;
	[] call life_fnc_saveGear;
	player enableFatigue false;
	meingear = life_gear;
	gewicht = life_maxWeight;
	life_maxWeight = 150;
	life_gear set [18,[]];
	removeAllWeapons player;
	{player removeMagazine _x;} foreach (magazines player);
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadgear player;
	player forceAddUniform _suit;
	player addWeaponGlobal "hgun_Pistol_heavy_02_Yorris_F";
	player addMagazines ["6Rnd_45ACP_Cylinder" , 35];
	player addWeaponGlobal "arifle_TRG20_ACO_Flash_F";
	player addMagazines ["30Rnd_556x45_Stanag_Tracer_Green", 20];
	{
		player unassignItem _x;
		player removeItem _x;
	} foreach (assignedItems player);
	player allowDamage false;
	_position = pb_positionen select (floor (random (count pb_positionen)));
	player setPosATL _position;
	
	tode = 0;
	player addEventHandler ["Hit", {
		if (paintrespawn == 1) exitwith {};
		paintrespawn = 1;
		_shooter = getPlayerUID (_this select 1);
		_shootername = name (_this select 1);
		_playername = name player;
		paintstats select 1 set [1,(paintstats select 1 select 1) + 1];
		paintstats select 1 select 2 pushBack _shootername;
		systemChat format ["Sie wurden von %1 getroffen.",_shootername];
		[[7,_playername],"life_fnc_pb_response",_shooter,false] spawn life_fnc_MP;		
		[] spawn{
		_position = pb_positionen select (floor (random (count pb_positionen)));
		player setPosATL _position;
		tode = tode+1;
		_maxGeld = 15000;
		_grenzeAusz = 30;
		_geldTod = _maxGeld/_grenzeAusz;
		_punkte = _grenzeAusz-tode;
		hintSilent parseText format ["<t align='center' color='#00E500' size='1.3'>Statistik</t><br/><br/><t align='left'>Tode</t><t align='right'>%1</t><br/><t align='left'>Punkte</t><t align='right'>%2</t>",tode,_punkte];
		sleep 0.5;
		paintrespawn = 0;
		};
	}];
};

if (_respondmode==10) then {
	if(life_is_arrested) exitWith {hintSilent "Sie koennen nicht an einem Paintballgame teilnehmen, da Sie momentan im Gefaengnis sitzen!"; ADD(CASH,5000);};
	if(side player != civilian) exitWith {hintSilent "Sie sind kein Zivilist!"; ADD(CASH,5000);};
	if(player getVariable "restrained") exitWith {hintSilent "Sie sind gefesselt und koennen nicht am Paintball teilnehmen!"; ADD(CASH,5000);};
	player setVariable["paintballstats",true];
	_suit = "";
	_randomSuits = ["U_I_Protagonist_VR","U_B_Protagonist_VR"];
	paintstats = [["K",0,[]],["D",0,[]],["S",0],["P",[]]];
	_countGroup = count life_paintball_group;
	_rndGroup = floor(random _countGroup);
	_selectGroup = life_paintball_group select _rndGroup;
	_joinGroup = _selectGroup select 1;
	joinGroup123 = _joinGroup;
	_groupOwner = _selectGroup select 4;
	groupOnwer123 = _groupOwner;
	if((getPlayerUID player) == _groupOwner) then
	{
		[player] joinSilent _joinGroup;
		player setRank "COLONEL";
	}else {
		[player] join _joinGroup;
	};
	if((_selectGroup select 0) == 0) then
	{
		_suit = _randomSuits select 1;
	}else{
		_suit = _randomSuits select 0;
	};
	//[player] joinSilent (createGroup civilian);
	paintrespawn = 0;
	player addEventHandler ["handleDamage", {false}];
	playMusic "LeadTrack02_F_Bootcamp";
	hintSilent format["Willkommen in der Paintballarena! Das kommende Spiel wird %1 Minuten laufen, viel Spaß!",life_paintballTime];
	meinePos = getPosATL player;
	[] call life_fnc_saveGear;
	player enableFatigue false;
	meingear = life_gear;
	gewicht = life_maxWeight;
	life_maxWeight = 150;
	life_gear set [18,[]];
	removeAllWeapons player;
	{player removeMagazine _x;} foreach (magazines player);
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadgear player;
	player forceAddUniform _suit;
	player addWeaponGlobal "hgun_Pistol_heavy_02_Yorris_F";
	player addMagazines ["6Rnd_45ACP_Cylinder" , 35];
	player addWeaponGlobal "arifle_TRG20_ACO_Flash_F";
	player addMagazines ["30Rnd_556x45_Stanag_Tracer_Green", 20];
	{
		player unassignItem _x;
		player removeItem _x;
	} foreach (assignedItems player);
	player allowDamage false;
	_position = pb_positionen select (floor (random (count pb_positionen)));
	player setPosATL _position;
	
	tode = 0;
	player addEventHandler ["Hit", {
		if (paintrespawn == 1) exitwith {};
		paintrespawn = 1;
		_shooter = getPlayerUID (_this select 1);
		_shootername = name (_this select 1);
		_playername = name player;
		paintstats select 1 set [1,(paintstats select 1 select 1) + 1];
		paintstats select 1 select 2 pushBack _shootername;
		systemChat format ["Sie wurden von %1 getroffen.",_shootername];
		[[7,_playername],"life_fnc_pb_response",_shooter,false] spawn life_fnc_MP;		
		[] spawn{
		_position = pb_positionen select (floor (random (count pb_positionen)));
		player setPosATL _position;
		tode = tode+1;
		_maxGeld = 15000;
		_grenzeAusz = 30;
		_geldTod = _maxGeld/_grenzeAusz;
		_punkte = _grenzeAusz-tode;
		hintSilent parseText format ["<t align='center' color='#00E500' size='1.3'>Statistik</t><br/><br/><t align='left'>Tode</t><t align='right'>%1</t><br/><t align='left'>Punkte</t><t align='right'>%2</t>",tode,_punkte];
		sleep 0.5;
		paintrespawn = 0;
		};
	}];
};

if (_respondmode==3) then {
	RemoveAllWeapons player;
	{player removeMagazine _x;} foreach (magazines player);
	if(!(EQUAL(count life_gangData,0))) then {
		[] spawn life_fnc_initGang;
	};
	life_gear = meingear;
	life_maxWeight = gewicht;
	[] call life_fnc_LoadGear;
	player setPosATL meinePos;
	[] spawn { sleep 2; player allowDamage true;};
	player removeAllEventHandlers "Hit";
	player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
	player enableFatigue true;
	life_paintball_group = [];
	publicVariable "life_paintball_group";
	paintballGroup1 = true;
	publicVariable "paintballGroup1";
	paintballGroup2 = true;
	publicVariable "paintballGroup2";
	life_GameOn = false;
	publicVariable "life_gameOn";
	_grenzeAusz = 30;
	if (tode>=_grenzeAusz) then {
		hint "Das Spiel wurde beendet. Leider hast du nicht genügend Punkte erspielt, um einen Geldpreis zu erhalten!";
	} else {
		_maxGeld = 15000;
		_geldTod = _maxGeld/_grenzeAusz;
		_punkte = _grenzeAusz-tode;
		_geldMin= _geldTod*tode;
		_gesamt = _maxGeld-_geldMin;
		life_cash = life_cash + _gesamt;
		hint format ["Das Spiel wurde beendet. Du hast insgesamt %1 Punkte erspielt und einen Geldpreis ($%2) erhalten. Glückwunsch!",_punkte,_gesamt];
	};
};

if (_respondmode==4) then {playMusic "LeadTrack06_F";};

if (_respondmode==5) then {
	_message = [_this,1,"",[""]] call BIS_fnc_param;
	hint format ["%1",_message];
	SUB(CASH,5000);
};



if (_respondmode==7) then {
	if ((_this select 1) == (name player)) then {
		systemChat "Selbstmord!";
		paintstats select 2 set [1,(paintstats select 2 select 1) + 1];
	}else{
		systemChat format ["Ihre Treffer %1.",_this select 1];
		paintstats select 0 set [1,(paintstats select 0 select 1) + 1];
		paintstats select 0 select 2 pushBack (_this select 1);
	};
};

if (_respondmode==8) then {
	paintstats select 3 set [1,(_this select 1)];
};

if (_displaystats==9 || _respondmode==9) then {
	

	Title="<t underline='true' size='1.3' color='#FFD700'>Paintball Arena Final Stats</t><br/><br/>";
	Spacer="<t align='center'>---------------------------</t><br/>";
	OverallTitle = "<t underline='true' align='left' color='#FFD700'>Gesamt Statistik<br/></t>";
	Kills= "<t align='left'>Kills:</t><t align='right'><t color='#008000'>%1</t></t><br/>";
	Deaths="<t align='left'>Deaths:</t><t align='right'><t color='#FF0000'>%2</t></t><br/>";
	VsPlayerTitle = "<t underline='true' align='left' color='#FFD700'>SIE VS Andere Player</t><br/>";
	KD="<t align='right'><t color='#008000'>K</t> | <t color='#FF0000'>D</t></t><br/>";
	finaltext = Format [Title + Spacer+OverallTitle+ Kills + Deaths + Spacer +VsPlayerTitle+ KD,(paintstats select 0) select 1,(paintstats select 1) select 1 ];
	{
		pname = _x;
		killzz = {_x == pname} count ((paintstats select 0) select 2);
		deathzz = {_x == pname} count ((paintstats select 1) select 2);
		if (name player != pname) then {

			if (killzz > deathzz) then {
				PKD = format["<t align='left'><t color='#00ff00'>%1</t></t><t align='right'><t color='#008000' size='1.2'>%2</t> | <t color='#FF0000'>%3</t></t><br/>",pname,killzz,deathzz];
			};
			
			if (killzz < deathzz) then {
				PKD = format["<t align='left'><t color='#FF0066'>%1</t></t><t align='right'><t color='#008000'>%2</t> | <t color='#FF0000' size='1.2'>%3</t></t><br/>",pname,killzz,deathzz];
			};
			
			if (killzz == deathzz) then {
				PKD = format["<t align='left'><t color='#FF9900'>%1</t></t><t align='right'><t color='#008000'>%2</t> | <t color='#FF0000'>%3</t></t><br/>",pname,killzz,deathzz];
			};
			finaltext = finaltext + PKD;
		};
	} foreach ((paintstats select 3) select 1);

	hintSilent parseText finaltext;	
};