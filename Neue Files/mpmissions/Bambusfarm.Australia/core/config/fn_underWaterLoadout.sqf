/*
		File:fn_underWaterLoadout.sqf 
		Author:[midgetgrimm] 
*/
private ["_loadoutName","_action","_guncost"];
_type = [_this,3,"",[""]] call BIS_fnc_param;
if(playerSide in [west,independent,east]) exitWith {hint"Sie haben nicht die Erlaubnis dieses Ausrüstungspacket zu kaufen!";};
if (vehicle player != player) exitWith { hint "Steigen Sie aus dem Fahrzeug aus!" };
if(!alive player) exitWith {hint"Sie sind Tot....";};
_guncost = 55000;
if(life_cash < _guncost) exitWith {hint format[localize "STR_NOTF_LO_NoCash",_guncost];};
_loadoutName = "Taucherausrüstungspacket";
_action = [
			format["Sind Sie sicher das Sie ihre Ausrüstung austauschen wollen? Ein %1 kostet $%2",_loadoutName,[_guncost] call life_fnc_numberText],
			"Kaufe Ausrüstungspacket",
			"Kaufen",
			"Nein"
		] call BIS_fnc_guiMessage;
if(_action) then {
			
hint parseText format["Sie haben ein %1 für <t color='#8cff9b'>$%2</t> gekauft",_loadoutName,[_guncost] call life_fnc_numberText];
life_cash =life_cash - _guncost;
			
titleText ["Das kostet $55,000. Sie ziehen sich nun um.....","PLAIN"];

sleep 1;
//RemoveAllWeapons player;
//{player removeMagazine _x;} foreach (magazines player);
//removeUniform player;
removeVest player;
//removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	//player removeItem _x;
} foreach (assignedItems player);
titleText[format["Sie legen jetzt %1 an...",_loadoutName],"PLAIN"];
sleep 3;

player addUniform "U_B_Wetsuit";
player addGoggles "G_Diving";
player addVest "V_RebreatherB";
player addMagazine "20Rnd_556x45_UW_mag";
player addMagazine "20Rnd_556x45_UW_mag";
player addMagazine "20Rnd_556x45_UW_mag";
player addMagazine "20Rnd_556x45_UW_mag";
player addMagazine "20Rnd_556x45_UW_mag";
player addWeapon "arifle_SDAR_F";
player selectWeapon "arifle_SDAR_F";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";
titleText ["...Vergessen Sie nicht ihren Rucksack...","PLAIN"];
player addBackPack "B_Carryall_khk";
mybackpack = unitBackpack player;
mybackpack addItemCargoGlobal ["Toolkit", 1];
//you can also y-inv items too like this
//life_inv_coffee = life_inv_coffee + 1;
reload player;
titleText [format["Viel spaß mit ihrem %1",_loadoutName],"PLAIN"];
} else {
			hint"Okay, dante für nichts....";
};