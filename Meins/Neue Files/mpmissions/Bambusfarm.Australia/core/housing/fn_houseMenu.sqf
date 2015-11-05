#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Building interaction menu
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Btn11 37460
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_houseCfg = M_CONFIG(getNumber,"Houses",typeOf(_curTarget),"price");
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

_Btn1 = CONTROL(37400,Btn1);
_Btn2 = CONTROL(37400,Btn2);
_Btn3 = CONTROL(37400,Btn3);
_Btn4 = CONTROL(37400,Btn4);
_Btn5 = CONTROL(37400,Btn5);
_Btn6 = CONTROL(37400,Btn6);
_Btn7 = CONTROL(37400,Btn7);
_Btn8 = CONTROL(37400,Btn8);
_Btn9 = CONTROL(37400,Btn9);
_Btn10 = CONTROL(37400,Btn10);
{_x ctrlShow false;} foreach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];

life_pInact_curTarget = _curTarget;
if(((_curTarget isKindOf "House_f") OR (_curTarget isKindOf "House")) && playerSide == west) exitWith {
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget) then {
		
		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor; closeDialog 0;";
		_Btn1 ctrlShow true;
		
		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate; closeDialog 0;";
		_Btn2 ctrlShow true;
		
	} else {
		if(!isNil {_curTarget GVAR "house_owner"}) then {
			_Btn1 ctrlSetText localize "STR_House_Raid_Owner";
			_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_copHouseOwner;";
			_Btn1 ctrlShow true;
			
			_Btn2 ctrlSetText localize "STR_pInAct_BreakDown";
			_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_copBreakDoor; closeDialog 0;";
			_Btn2 ctrlShow true;
			
			_Btn3 ctrlSetText localize "STR_pInAct_SearchHouse";
			_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_raidHouse; closeDialog 0;";
			_Btn3 ctrlShow true;
			
			if(player distance _curTarget > 3.6) then {
				_Btn3 ctrlEnable false;
			};
			
			_Btn4 ctrlSetText localize "STR_pInAct_LockHouse";
			_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse; closeDialog 0;";
			_Btn4 ctrlShow true;
		} else {
			closeDialog 0;
		};
	};
};

if((typeOf _curTarget) in ["Land_dp_bigTank_F"]) then
{
	if(!(EQUAL(life_base,[]))) then {
		_Btn1 ctrlSetText  "Helicopterhändler";
		_Btn1 buttonSetAction "closeDialog 0;[false,false,false,[""base_air"",civilian,life_pInact_curTarget,""civ"",""APD - Kavala District""]] spawn life_fnc_vehicleShopMenu;";
		_Btn1 ctrlShow true;
		_Btn2 ctrlSetText  "Helicopter Garage";
		_Btn2 buttonSetAction "closeDialog 0;[life_pInact_curTarget,""Air""] spawn life_fnc_vehicleBase;";
		_Btn2 ctrlShow true;
		_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
		_Btn3 buttonSetAction "closeDialog 0;[life_pInact_curTarget,player] spawn life_fnc_storeVehicle;";
		_Btn3 ctrlShow true;
		_position = call compile format["%1",((life_base select 0) select 0)];
		if(!(license_civ_pilot)) then {_Btn1 ctrlEnable false;};
		if((player distance _position) > 145 ) then {_Btn1 ctrlEnable false; _Btn2 ctrlEnable false; _Btn3 ctrlEnable false;};
	}else{_Btn1 ctrlEnable false; _Btn2 ctrlEnable false; _Btn3 ctrlEnable false;};
}else{
	if((typeOf _curTarget) in ["Land_TentHangar_V1_F"]) then
	{
		if(!(EQUAL(life_base,[]))) then {
			_Btn1 ctrlSetText  "Rebellen Autohaus";
			_Btn1 buttonSetAction "closeDialog 0;[life_pInact_curTarget,""Car""] spawn life_fnc_baseVehicleShop;";
			_Btn1 ctrlShow true;
			_Btn2 ctrlSetText  "Fahrzeug Garage";
			_Btn2 buttonSetAction "closeDialog 0;[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleBase;";
			_Btn2 ctrlShow true;
			_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
			_Btn3 buttonSetAction "closeDialog 0;[life_pInact_curTarget,player] spawn life_fnc_storeVehicle;";
			_Btn3 ctrlShow true;
			_position = call compile format["%1",((life_base select 0) select 0)];
			if(!(license_civ_rebel)) then {_Btn1 ctrlEnable false;};
			if((player distance _position) > 145 ) then {_Btn1 ctrlEnable false; _Btn2 ctrlEnable false; _Btn3 ctrlEnable false;};
		}else{_Btn1 ctrlEnable false; _Btn2 ctrlEnable false; _Btn3 ctrlEnable false;};
	}else{	
		if((typeOf _curTarget) in ["Land_Medevac_house_V1_F"]) then
		{
			if(!(EQUAL(life_base,[]))) then {
				_Btn1 ctrlSetText  "Med. Behandlung";
				_Btn1 buttonSetAction " [life_pInact_curTarget,false,fasle,""heilen""] spawn life_fnc_healHospital; closeDialog 0;";
				_Btn1 ctrlShow true;
				_position = call compile format["%1",((life_base select 0) select 0)];
				if((player distance _position) > 145 ) then {_Btn1 ctrlEnable false;};
			}else{_Btn1 ctrlEnable false;};
		}else{
			if(_houseCfg == 0) exitWith {closeDialog 0;};
			if( playerSide == civilian) then 
			{
				if(!(_curTarget in life_vehicles) OR isNil {_curTarget getVariable "house_owner"}) then 
				{
					if((typeOf _curTarget) in ["Land_Cargo_House_V3_F"]) then 
					{	
						if(_curTarget in life_vehicles) then{
							private["_strom"];
							_Btn1 ctrlSetText	"Geldautomat";
							_Btn1 buttonSetAction "closeDialog 0; [] spawn life_fnc_atmMenu;";
							_Btn1 ctrlShow true;
							_Btn2 ctrlSetText "Base Reparieren";
							_Btn2 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_repairBase;";
							_Btn2 ctrlShow true;
							if(!(life_inv_base_toolkit > 0)) then {_Btn2 ctrlEnable false};
							//_Btn3 ctrlSetText	"Clan Shop";
							//_Btn3 buttonSetAction "closeDialog 0; createDialog "shops_menu"; ["base"] spawn life_fnc_virt_menu; ";
							//_Btn3 ctrlShow true;
						}else{
							_Btn1 ctrlSetText	"Base Kaufen";
							_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_buyBase;";
							_Btn1 ctrlShow true;
						};
					}
					else
					{
						if(_curTarget in life_vehicles) then {SUB(life_vehicles,[_curTarget]);};
						_Btn1 ctrlSetText localize "STR_pInAct_BuyHouse";
						_Btn1 buttonSetAction "[life_pInact_curTarget,0] spawn life_fnc_buyHouse;";
						_Btn1 ctrlShow true;
					};
				} else {
					/*if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V1_dam_F","Land_i_Garage_V2_F","Land_i_Garage_V2_dam_F"]) then
					{
						_Btn1 ctrlSetText localize "STR_pInAct_SellGarage";
						_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
						_Btn1 ctrlShow true;

						if(SEL(_curTarget GVAR "house_owner",0) != steamid) then {
							_Btn1 ctrlEnable false;
						};

						_Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
						_Btn2 buttonSetAction "[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;";
						_Btn2 ctrlShow true;
						if(life_cargo) then
						{
							_Btn3 ctrlSetText localize "STR_pInAct_AccessGarage";
							_Btn3 buttonSetAction "[] spawn life_fnc_cargoGarage; closeDialog 0;";      
							_Btn3 ctrlShow true;
						}else{
							_Btn3 ctrlSetText  "Container";
							_Btn3 buttonSetAction "[life_pInact_curTarget,""cargo""] spawn life_fnc_vehicleGarage; closeDialog 0;";   
							_Btn3 ctrlShow true;
						};	
						_Btn4 ctrlSetText localize "STR_pInAct_StoreVeh";
						_Btn4 buttonSetAction "[life_pInact_curTarget,player] spawn life_fnc_storeVehicle; closeDialog 0;";
						_Btn4 ctrlShow true;
					} else {*/
						if((typeOf _curTarget) in ["Land_Cargo_House_V3_F"]) then 
						{

						}
						else
						{
							_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
							_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
							_Btn1 ctrlShow true;

							if(((_curTarget GVAR "house_owner") select 0) != (getPlayerUID player)) then {
								_Btn1 ctrlEnable false;
							};

							if(_curTarget GVAR ["locked",false]) then {
								_Btn2 ctrlSetText localize "STR_pInAct_UnlockStorage";
							} else {
								_Btn2 ctrlSetText localize "STR_pInAct_LockStorage";
							};
							_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
							_Btn2 ctrlShow true;

							if(isNull (_curTarget GVAR ["lightSource",ObjNull])) then {
								_Btn3 ctrlSetText localize "STR_pInAct_LightsOn";
							} else {
								_Btn3 ctrlSetText localize "STR_pInAct_LightsOff";
							};
							_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;";
							_Btn3 ctrlShow true;

							_Btn4 ctrlSetText localize "STR_pInAct_CloseOpen";
							_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate; closeDialog 0;";
							_Btn4 ctrlShow true;

							_Btn5 ctrlSetText localize "STR_pInAct_LockHouse";
							_Btn5 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse; closeDialog 0;";
							_Btn5 ctrlShow true;
							
							_Btn6 ctrlSetText localize "STR_pInAct_AccessGarage";
							_Btn6 buttonSetAction "[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;";
							_Btn6 ctrlShow true;
							
							_Btn7 ctrlSetText localize "STR_pInAct_StoreVeh";
							_Btn7 buttonSetAction "[life_pInact_curTarget,player] spawn life_fnc_storeVehicle; closeDialog 0;";
							_Btn7 ctrlShow true;
						};
						if (!(_curTarget GVAR ["locked",false])&&(!isNil {_curTarget GVAR "house_owner"})) then
						{
							if (isNil {cursorTarget GVAR "inUse"}) then {cursorTarget SVAR ["inUse",[false,""],true];};
							_Btn8 ctrlSetText "Haus Inventar";
							_Btn8 buttonSetAction "[] spawn {closeDialog 0;sleep 0.1;[life_pInact_curTarget] spawn life_fnc_openHouseVInv;};";
							if !((cursorTarget GVAR "inUse") select 0) then {
								_Btn8 ctrlShow true;
							};
						};
				};
			};
		};
	};
};