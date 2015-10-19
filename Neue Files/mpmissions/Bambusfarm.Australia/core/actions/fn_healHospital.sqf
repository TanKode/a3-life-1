#include <macro.h>
/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
_mode = SEL(_this,3);
switch (_mode) do 
{
	case "heilen":
		{	
			if(CASH < 100) exitWith {hint format[localize "STR_NOTF_HS_NoCash",100];};
			titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
			sleep 8;
			if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
			titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
			player setdamage 0;
			SUB(CASH,100);
		};
	
	case "checken":
		{
			if(life_checked == 1) exitWith { hint format[localize  "STR_NOTF_HS_Checkup"]; };
			if(life_sex_ill == 0) then
			{
					hint format[localize "STR_NOTF_HS_Diagnosis",name player];
					life_checked = 0;
			};
		    if(life_sex_ill == 1) then
			{
					hint format[localize "STR_NOTF_HS_DiagnosisGonor",name player];
					life_checked = 1;
			};
			if(life_sex_ill == 2) then
			{
					hint format[localize "STR_NOTF_HS_DiagnosisAids",name player];
					life_checked = 1;
			};
			if(life_sex_ill == 3) then
			{
					hint format [localize "STR_NOTF_HS_DiagnosisChlamyd",name player];
					life_checked = 1;
			};	
			if(life_sex_ill == 4) then
			{	
					hint format [localize "STR_NOTF_HS_DiagnosisHerpes",name player];
					life_checked = 1;
			};
			if(life_sex_ill == 5) then
			{	
				    hint format [localize "STR_NOTF_HS_DiagnosisHep",name player];
					life_checked = 1;
			};
			if(life_sex_ill == 6) then
			{		
					hint format [localize "STR_NOTF_HS_DiagnosisSyph",name player];
					life_checked = 1;
			};
		};		
	case "behandeln":
        {
			if(life_checked == 0) exitWith { hint format[localize "STR_NOTF_HS_Check"]; };
			if(life_sex_ill == 1) then
			{
					if(CASH < 1000) exitWith { hint format[localize "STR_NOTF_HS_Sexill"];};
					titleText[localize "STR_NOTF_HS_Gonorrhea","PLAIN"];
					sleep 20;
					titleText[localize "STR_NOTF_HS_Cured","PLAIN"];
					SUB(CASH,1000);
					player setDamage 0;
					life_sex_ill = 0;
					life_checked = 0;
			};
			if(life_sex_ill == 2) then
			{
					if(CASH < 10000) exitWith { hint format[localize "STR_NOTF_HS_Sexill"];};
					titleText[localize "STR_NOTF_HS_Aids","PLAIN"];
					sleep 45;
					titleText[localize "STR_NOTF_HS_Cured","PLAIN"];
					SUB(CASH,10000);
					player setDamage 0;
					life_sex_ill = 0;
					life_checked = 0;
			};
			if(life_sex_ill == 3) then
			{
					if(CASH < 1000) exitWith { hint format[localize "STR_NOTF_HS_Sexill"];};
					titleText[localize "STR_NOTF_HS_Chlamydien","PLAIN"];
					sleep 20;
					titleText[localize "STR_NOTF_HS_Cured","PLAIN"];
					SUB(CASH,1500);
					player setDamage 0;
					life_sex_ill = 0;
					life_checked = 0;
			};
			if(life_sex_ill == 4) then
			{
					if(CASH < 1000) exitWith { hint format[localize "STR_NOTF_HS_Sexill"];};
					titleText[localize "STR_NOTF_HS_Herpes","PLAIN"];
					sleep 20;
					titleText[localize "STR_NOTF_HS_Cured","PLAIN"];
					SUB(CASH,2000);
					player setDamage 0;
					life_sex_ill = 0;
					life_checked = 0;
			};		
			if(life_sex_ill == 5) then
			{
					if(CASH < 1000) exitWith { hint format[localize "STR_NOTF_HS_Sexill"];};
					titleText[localize "STR_NOTF_HS_Hep B","PLAIN"];
					sleep 30;
					titleText[localize "STR_NOTF_HS_Cured","PLAIN"];
					SUB(CASH,5000);
					player setDamage 0;
					life_sex_ill = 0;
					life_checked = 0;
			};
			if(life_sex_ill == 6) then
			{
					if(CASH < 1000) exitWith { hint format[localize "STR_NOTF_HS_Sexill"];};
					titleText[localize "STR_NOTF_HS_Syphillis","PLAIN"];
					sleep 20;
					titleText[localize "STR_NOTF_HS_Cured","PLAIN"];
					SUB(CASH,2500);
					player setDamage 0;
					life_sex_ill = 0;
					life_checked = 0;
			};		
				
		};	
};