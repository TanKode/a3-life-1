/*
	File: fn_fuelTank.sqf
	Author: PierreAmyf
	
	Description:
	Fill fuelcan at a gas station
     
*/

private["_error","_tanke","_tanker"];
_distance = 5; 
_tanke = (count (nearestObjects [player, ["Land_fs_feed_F"],_distance]) > 0);

if (vehicle player != player) exitWith { hint "Sie muessen aus dem Fahrzeug aussteigen!" };
if(!(_tanke)) exitWith {};

hint "Kanister auffuellen kostet ($600)";

if( life_cash < 600 && life_atmcash < 600) exitWith 
{	
	hint parseText "<t color='#ff0000'>Du hast nicht das nötige Geld ($600)</t>";
};

_error = false;

_var_item = ["fuelE",0] call life_fnc_varHandle;
_value_item = missionNamespace getVariable _var_item;
if(_value_item <= 0) exitWith {hint "Du hast keinen leeren Kanister dabei!"};

if(_tanke) then
{
		
	if(!_error) then
	{
		//Money
		//Remove money
		if( life_cash >= 600 ) then
		{
			//Use main
			life_cash = life_cash - 600;
		}
		else
		{
			//Use ATM
			if(life_atmcash >= 600) then
			{
				life_atmcash = life_atmcash - 600;
			};
		};
	
		_success = [20, "Fuelle Kanister auf", _tanke] call life_fnc_progressWaitUntilFinished;
		if(_success) then
		{
			//leeren Kanister entfernen
			if(([false,"fuelE",1] call life_fnc_handleInv)) then
			{
				//vollen Kanister einfügen
				if(([true,"fuelF",1] call life_fnc_handleInv)) then
				{
					hint "Der Kaninster ist voll.";
				}
				else
				{								
					hint "Dein Inventar ist voll.";	
				};
			}
			else
			{
				hint "Du hast keinen leeren Kanister dabei.";
			};										
		};	
	};	
};