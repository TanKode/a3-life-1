#include "\life_server\script_macros.hpp"
/*
	File: fn_skillInfo.sqf
	Author: Tertius @ GBB (Dave)
	
	Description:
	Dieses Script ist von mir für den GBB(Ballerbude Altis Life Server) geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
disableSerialization;
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

if(count _skill < 1) exitWith {_info ctrlSetText "Keine Talent Info gefunden"};

_displayName = M_CONFIG(getText,"Skills",_skillConf,"displayName");
_dependence = M_CONFIG(getText,"Skills",_skillConf,"dependence");
_level = M_CONFIG(getNumber,"Skills",_skillConf,"level");
_skillpoint = M_CONFIG(getNumber,"Skills",_skillConf,"skillpoint");

_label = format["<t font='puristaMedium' shadow='1' size='2'>%1</t><br/>",localize _displayName];

_dep = "";
_hasDep = false;
if(!(EQUAL(_dependence,""))) then
{
	_varNameDe = M_CONFIG(getText,"Skills",_dependence,"variable");
	_dep = M_CONFIG(getText,"Skills",_dependence,"displayName");
	_sideFlageDe = M_CONFIG(getText,"Skills",_dependence,"side");
	_hasDep = SKILL_VALUE(_dependence,_sideFlageDe);
	_label = format["%1<t shadow='1' size='1.4'>Anforderung:</t><br/><t shadow='1'>Talent: %2 || Level: %3 || Skillpunkte: %4</t><br/><br/>", _label,localize _dep,_level,_skillpoint];
}else{
	if(!(EQUAL(_level,0))) then
	{
		_label = format["%1<t shadow='1' size='1.4'>Anforderung:</t><br/><t shadow='1'>Talent: Keine || Level: %2 || Skillpunkte: %3.</t><br/><br/>", _label,_level,_skillpoint];
	}else{
		_label = format["%1<t shadow='1'>Keine Talent Anforderungen benoetingt.<br/> Skillpunkte: %2</t><br/><br/>", _label,_skillpoint];
	};
};

_hasSkillName = M_CONFIG(getText,"Skills",_skillConf,"varialbe");
_sideFlage = M_CONFIG(getText,"Skills",_skillConf,"side");
_hasSkill = SKILL_VALUE(_skillConf,_sideFlage);

if(_hasSkill) then {
	_label = format["%1<t color='#00FF00'>Dieses Talent haben Sie schon erlernt!</t><br/><br/>", _label];
}else{
	if(count _dep > 0) then
	{
		if(!((_hasDep) && (LEVEL >= _level))) then {
			_label = format["%1<t color='#FF0000'>Sie muessen zuerst %2 erlernen und Level %3 erreicht haben bevor Sie dieses Talent erlernen koennen!</t><br/><br/>", _label, localize _dep,_level];
		}else{
			_label = format["%1Sie haben dieses Talent noch nicht erlernt, aber Sie erfuellen die Anforderungen um es zu erlernen!<br/><br/>",_label];
		};
	}else{
		_label = format["%1Sie haben dieses Talent noch nicht erlernt!<br/><br/>",_label];
	};
};

_infoText = M_CONFIG(getText,"Skills",_skillConf,"info");
_label = format["%1%2",_label,localize _infoText];
_info ctrlSetStructuredText parseText _label;

_lern ctrlShow true;
if(!_hasSkill) then {_lern ctrlSetText "Erlernen"}
else {_lern ctrlSetText "Verlernen"};

_learn ctrlEnable (((SKILLPOINT > 0)|| EQUAL(SKILLPOINT,0)) && ((EQUAL(_dependence,"")) || _hasSkill || _hasDep || (_level >= LEVEL)));