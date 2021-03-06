#include <macro.h>
/*
	fn_equipGear.sqf
	Author: Keine Ahnung.. Bohemia Wiki+SQF? o.O
	Edit: Nox, www.ragecore.de / www.native-gamer.net
*/
private["_path","_unit","_type"];
_unit = [_this,0] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;


//COP KLEIDUNG
if(playerSide == west) then {
	switch(_type) do {
		//1
		if(__GETC__(life_coplevel) == 1) then
        {
			case "U_Rangemaster":{
				_path = "life\Texturen\Polizei\Kleidung\cop_1.jpg";
				_unit setObjectTextureGlobal [0,_path];
			};
		};
		//2
		if(__GETC__(life_coplevel) == 2) then
        {
			case "U_Rangemaster":{
				_path = "life\Texturen\Polizei\Kleidung\cop_2.jpg";
				_unit setObjectTextureGlobal [0,_path];
			};
		};
		//3
		if(__GETC__(life_coplevel) == 3) then
        {
			case "U_Rangemaster":{
				_path = "life\Texturen\Polizei\Kleidung\cop_3.jpg";
				_unit setObjectTextureGlobal [0,_path];
			};
		};
		//4
		if(__GETC__(life_coplevel) == 4) then
        {
			case "U_Rangemaster":{
				_path = "life\Texturen\Polizei\Kleidung\cop_4.jpg";
				_unit setObjectTextureGlobal [0,_path];
			};
		};
		//5
		if(__GETC__(life_coplevel) == 5) then
        {
			case "U_Rangemaster":{
				_path = "life\Texturen\Polizei\Kleidung\cop_5.jpg";
				_unit setObjectTextureGlobal [0,_path];
			};
		};
		//6
		if(__GETC__(life_coplevel) == 6) then
        {
			case "U_Rangemaster":{
				_path = "life\Texturen\Polizei\Kleidung\cop_6.jpg";
				_unit setObjectTextureGlobal [0,_path];
			};
		};
		//7
		if(__GETC__(life_coplevel) == 7) then
        {
			case "U_Rangemaster":{
				_path = "life\Texturen\Polizei\Kleidung\cop_7.jpg";
				_unit setObjectTextureGlobal [0,_path];
			};
		};
		//8
		if(__GETC__(life_coplevel) == 8) then
        {
			case "U_Rangemaster":{
				_path = "life\Texturen\Polizei\Kleidung\cop_8.jpg";
				_unit setObjectTextureGlobal [0,_path];
			};
		};

		//All
		case "U_B_CTRG_1" : {
				_path = "life\Texturen\Polizei\Kleidung\polizei.paa";
				_unit setObjectTextureGlobal [0,_path];
		}
	};
	
	if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
};

//MEDIC-ADAC KLEIDUNG
if(playerSide == independent) then {
	switch(_type) do {
		case "U_Rangemaster" : {
			_path = "life\Texturen\Medic\Kleidung\med_uniform.jpg";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "U_C_WorkerCoveralls" : {
			_path = "life\Texturen\ADAC\Kleidung\adac.jpg";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
};

//ZIVILISTEN KLEIDUNG
if(playerSide == civilian) then {
	switch(_type) do {
		//1
		case "U_C_Poloshirt_blue":{
			_path = "life\Texturen\Zivilisten\Adidas_Abklatsch.jpg";
			_unit setObjectTextureGlobal [0,_path];
		};
		//2
		case "U_C_Poloshirt_burgundy":{
			player setObjectTextureGlobal  [0, "life\Texturen\Zivilisten\Adidas_Abklatsch_Drache.jpg"];
		};
		//3
		case "U_C_Poloshirt_redwhite":{
			player setObjectTextureGlobal  [0, "life\Texturen\Zivilisten\Hello_Kitty.jpg"];
		};
		//4
		case "U_C_Poloshirt_stripped":{
			player setObjectTextureGlobal  [0, "life\Texturen\Zivilisten\My_Pony.jpg"];
		};
		//5
		case "U_C_Poloshirt_tricolour":{
			player setObjectTextureGlobal  [0, "life\Texturen\Zivilisten\Puma_Abklatsch.jpg"];
		};

	};
};