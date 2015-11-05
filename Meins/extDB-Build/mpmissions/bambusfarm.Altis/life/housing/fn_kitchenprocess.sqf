/* 
----------------------------------------------|
Description: Start the Process with the kitchen
Author: Backer
----------------------------------------------|
Drug0= Weed
Drug1= Hero
Drug2= Coca
*/

private["_drug","_chance","_house"];

_drug = _this select 1; //Drogen
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_chance = round(random 10);

if (_drug == 0) then
{
		if !(life_is_processing) then
		{
			if (life_inv_cannabis > 0) then
				{
					hint "Sie erstellen nun Weed";
					closeDialog 0;
					[] spawn life_fnc_processhousingweed;
					if (_chance == 1) exitWith {};
					if (_chance == 2) exitWith {};
					if (_chance == 3) exitWith {};
					if (_chance == 4) exitWith {};
					if (_chance == 5) exitWith {};
					if (_chance == 6) exitWith {};
					if (_chance == 7) exitWith {};
					if (_chance == 8) exitWith {};
					if (_chance == 9) exitWith {};
					if(_chance == 10) then {
							hint "FUCK Sie haben vergessen die Kueche auszuschalten, Ihr haus geht in Rauch auf, die Cops wissen bescheid.";
							_house2 = getPos _house;
							[[_house2,name player,8],"TON_fnc_clientMessage",_uid,false] spawn life_fnc_MP;
							[] spawn life_fnc_housecookfail;
											};	
				
				}
				else 
					{
						hint "Sie haben kein Cannabis dabei";
					};
		}		
		else
		{
				hint "Sie verarbeiten gerade eine Droge!";
		};
};
	
if (_drug == 1) then
{
		if !(life_is_processing) then
		{
			if (life_inv_heroinu > 0) then
				{
					hint "Sie erstellen nun Heroin";
					closeDialog 0;
					[] spawn life_fnc_processhousingheroin;
					if (_chance == 1) exitWith {};
					if (_chance == 2) exitWith {};
					if (_chance == 3) exitWith {};
					if (_chance == 4) exitWith {};
					if (_chance == 5) exitWith {};
					if (_chance == 6) exitWith {};
					if (_chance == 7) exitWith {};
					if (_chance == 8) exitWith {};
					if (_chance == 9) exitWith {};
					if(_chance == 10) then {
							hint "FUCK Sie haben vergessen die Kueche auszuschalten, Ihr haus geht in Rauch auf, die Cops wissen bescheid.";
							_house2 = getPos _house;
							[[_house2,name player,8],"TON_fnc_clientMessage",_uid,false] spawn life_fnc_MP;
							[] spawn life_fnc_housecookfail;
											};	
				
				}
				else 
					{
						hint "Sie haben kein unverarbeitetes Heroin dabei";
					};
		}		
		else
		{
				hint "Sie verarbeiten gerade eine Droge!";
		};
};	
	
if (_drug == 2) then
{
		if !(life_is_processing) then
		{
			if (life_inv_coke > 0) then
				{
					hint "Sie erstellen nun Cocain";
					closeDialog 0;
					[] spawn life_fnc_processhousingcocaine;
					if (_chance == 1) exitWith {};
					if (_chance == 2) exitWith {};
					if (_chance == 3) exitWith {};
					if (_chance == 4) exitWith {};
					if (_chance == 5) exitWith {};
					if (_chance == 6) exitWith {};
					if (_chance == 7) exitWith {};
					if (_chance == 8) exitWith {};
					if (_chance == 9) exitWith {};
					if(_chance == 10) then {
							hint "FUCK Sie haben vergessen die Kueche auszuschalten, Ihr haus geht in Rauch auf, die Cops wissen bescheid.";
							_house2 = getPos _house;
							[[_house2,name player,8],"TON_fnc_clientMessage",_uid,false] spawn life_fnc_MP;
							[] spawn life_fnc_housecookfail;
											};	
				}
				else 
					{
						hint "Sie haben kein unverarbeitetes Cocain dabei";
					};
		}		
		else
		{
				hint "Sie verarbeiten gerade eine Droge!";
		};
};		
	




