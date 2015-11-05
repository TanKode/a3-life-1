#include "\life_server\script_macros.hpp"
/*
	File: fn_skillLearn.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
disableSerialization;
_skillList = CONTROL(170000,170002);
_info = CONTROL(170000,170003);
_index = CONTROL_DATA(170002);
_lern = CONTROL(170000,170004);

if(isNil "_index") exitWith {_info ctrlSetText "Sie haben kein Talent ausgewaehlt"};

_skill = "";
{
	_varName = M_CONFIG(getText,"Skills",configName _x,"variable");
	if(EQUAL(_varName,_index)) exitWith {_skill = _x};
} forEach ("true" configClasses (missionConfigFile >> "Skills"));

_skillConf = configName _skill;
_skillName = M_CONFIG(getText,"Skills",_skillConf,"displayName");
_sideFlage = M_CONFIG(getText,"Skills",_skillConf,"side");
_kindOfSkill = M_CONFIG(getText,"Skills",_skillConf,"kindOf");
_dependence = M_CONFIG(getText,"Skills",_skillConf,"dependence");
_price = M_CONFIG(getNumber,"Skills",_skillConf,"price");
_level = M_CONFIG(getNumber,"Skills",_skillConf,"level");
_skillpoint = M_CONFIG(getNumber,"Skills",_skillConf,"skillpoint");
_hasSkill = SKILL_VALUE(_skillConf,_sideFlage);
_newSkill = SKILL_VARNAME(_skillConf,_sideFlage);

_hasDependence = false;
if(!(EQUAL(_dependence,""))) then
{
	_sideDependence = M_CONFIG(getText,"Skills",_dependence,"side");
	_hasDependence = SKILL_VALUE(_dependence,_sideDependence);
};

_kindOf = "";
_hasKindOf = false;
_kindOfName = "";
if(!(EQUAL(_kindOfSkill,""))) then
{
	{
		if((EQUAL(_kindOfSkill,configName _x))) exitWith {_kindOf = configName _x};
	} forEach ("true" configClasses (missionConfigFile >> "Skills"));
	
	_kindOfVarName = M_CONFIG(getText,"Skills",_kindOf,"varialbe");
	_kindOfName = M_CONFIG(getText,"Skills",_kindOf,"displayName");
	_sideKindOf = M_CONFIG(getText,"Skills",_kindOf,"side");
	_kindOfPrice = M_CONFIG(getNumber,"Skills",_kindOf,"price");
	_hasKindOf = SKILL_VALUE(_kindOf,_sideKindOf);
};

if(_hasSkill) then
{
	if(_hasKindOf) exitWith {hint format["Sie koennen dieses Talent nicht verlärnen, es besteht eine Abhaeningkeit zu %1 dieses Talent muessen Sie zuerst verlernen!",localize _kindOfName]};

	_action = [
		format["Sind Sie sich sicher das Sie %1 fuer einen Preis von %2 wieder verlernen moechten?",localize _skillName,[_price] call life_fnc_numberText],
		"Talent verlernen?",
		"Ja",
		"Nein"
	] call BIS_fnc_guiMessage;
	
	if(_action) then
	{
		SVAR_MNS [_newSkill,false];
		SUB(BANK,_price);
		ADD(SKILLPOINT,_skillpoint);
		hint format["Sie haben das Talent: %1 verlernt!",localize _skillName];
		uiSleep 1;
		[] spawn life_fnc_skillMenu;
	};
}else{
	if(!(LEVEL >= _level)) exitWith {hintSilent "Sie haben noch nicht das benoetigte Level!"};
	if(!(SKILLPOINT >= _skillpoint)) exitWith {hintSilent "Sie besitzen momentan nicht genung Skillpunkte!";};
	if((!(EQUAL(_dependence,""))) && !_hasDependence) exitWith {hintSilent "Um dieses Talent zu erlernen muessen Sie zuerst andere Talente erlernen die Sie momentan nicht besitzen!";};
	_action = [
		format["Sin Sie sich Sicher das Sie das Taltent: %1 fuer %2 Skillpunkt/e erlernen wollen?",localize _skillName,_skillpoint],
		"Talent erlernen?",
		"Ja",
		"Nein"
	]call BIS_fnc_guiMessage;
	
	if(_action) then
	{
		SVAR_MNS [_newSkill,true];
		SUB(SKILLPOINT,_skillpoint);
		hint format["Sie haben das Talent: %1 erlernt!",localize _skillName];
		
		uiSleep 1;
		[] spawn life_fnc_skillMenu;
	};
};
