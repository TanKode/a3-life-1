#include <macro.h>
/*
	File: fn_damageCheck.sqf
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/

_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
if(_veh GVAR "AdacCheck") exitWith {hintSilent parseText "Dieses Fahrzeug wurde schon ueberprueft!"};
life_adac_ticket = 0;
_wheel = 0;

_motor = _veh getHitPointDamage "HitEngine";
_HMotor = _veh getHitPointDamage "HitHRotor";
_VMotor = _veh getHitPointDamage "HitVRotor";
_fuel = _veh getHitPointDamage "HitFuel";
_WheelLF = _veh getHitPointDamage "HitLFWheel";
_WheelLF2 = _veh getHitPointDamage "HitLF2Wheel";
_WheelRF = _veh getHitPointDamage "HitRFWheel";
_WheelRF2 = _veh getHitPointDamage "HitRF2Wheel";
_HitGear = _veh getHitPointDamage "HitGear";
_damage = damage _veh;

if(_veh isKindOf "Car") then
{
	_mText = "";
	_fText = "";
	_wText = "";
	_dText = "";
	
	if(_motor > 0.5) then
	{
		_mText = format["Motorschaden: <t color='#ff2f45'>Stark Beschädigt</t><br/>"];	
		ADD(life_adac_ticket,3500);	
	}else{
		if(_motor > 0) then
		{
			_mText = format["Motorschaden: <t color='#ff812f'>Beschaedigt</t><br/>"];
			ADD(life_adac_ticket,2000);
		}else{
			_mText = format["Motorschaden: <t color='#45ff2f'>OK</t><br/>"];
		};
	};
	
	if(_fuel > 0.5) then
	{
		_fText = format["Tankschaden: <t color='#ff2f45'>Stark Beschädigt</t><br/>"];	
		ADD(life_adac_ticket,2000);
	}else{
		if(_fuel > 0) then
		{
			_fText = format["Tankschaden: <t color='#ff812f'>Beschaedigt</t><br/>"];
			ADD(life_adac_ticket,1000);
		}else{
			_fText = format["Tankschaden: <t color='#45ff2f'>OK</t><br/>"];
		};
	};
	
	if(_WheelLF > 0) then
	{
		ADD(_wheel,1);	
		ADD(life_adac_ticket,500);
	};
	   
	if(_WheelLF2 > 0) then
	{
		ADD(_wheel,1);	
		ADD(life_adac_ticket,500);
	};
	
	if(_WheelRF > 0) then
	{
		ADD(_wheel,1);	
		ADD(life_adac_ticket,500);
	};   
	  
	if(_WheelRF2 > 0) then
	{
		ADD(_wheel,1);	
		ADD(life_adac_ticket,500);
	};
	   
	if(_damage > 0.5) then
	{
		_dText = format["Karoserieschaden: <t color='#ff2f45'>Stark Beschädigt</t><br/>"];	
		ADD(life_adac_ticket,3000);
	}else{
		if(_damage > 0) then
		{
			_dText = format["Karoserieschaden: <t color='#ff812f'>Beschaedigt</t><br/>"];
			ADD(life_adac_ticket,1500);
		}else{
			_dText = format["Karoserieschaden: <t color='#45ff2f'>OK</t><br/>"];
		};
	};
	
	_wText = format["Beschaedigte Reifen: %1",_wheel];
	_rText = format["<br/><br/>Rechnungsbetrag: %1",life_adac_ticket];
	_text = _mText + _fText + _dText + _wText + _rText;
	hintSilent parseText _text;
	
};

if(_veh isKindOf "Air") then
{
	_hText = "";
	_vText = "";
	_fText = "";
	_hiText = "";
	_dText = "";
	
	if(_HMotor > 0.5) then
	{
		_hText = format["Rotorschaden: <t color='#ff2f45'>Stark Beschädigt</t><br/>"];	
		ADD(life_adac_ticket,4500);	
	}else{
		if(_HMotor > 0) then
		{
			_hText = format["Rotorschaden: <t color='#ff812f'>Beschaedigt</t><br/>"];
			ADD(life_adac_ticket,2500);
		}else{
			_hText = format["Rotorschaden: <t color='#45ff2f'>OK</t><br/>"];
		};
	};
	
	if(_VMotor > 0.5) then
	{
		_vText = format["Heckrotorschaden: <t color='#ff2f45'>Stark Beschädigt</t><br/>"];	
		ADD(life_adac_ticket,35000);	
	}else{
		if(_VMotor > 0) then
		{
			_vText = format["Heckrotorschaden: <t color='#ff812f'>Beschaedigt</t><br/>"];
			ADD(life_adac_ticket,1500);
		}else{
			_vText = format["Heckrotorschaden: <t color='#45ff2f'>OK</t><br/>"];
		};
	};
	
	if(_fuel > 0.5) then
	{
		_fText = format["Tankschaden: <t color='#ff2f45'>Stark Beschädigt</t><br/>"];	
		ADD(life_adac_ticket,4000);
	}else{
		if(_fuel > 0) then
		{
			_fText = format["Tankschaden: <t color='#ff812f'>Beschaedigt</t><br/>"];
			ADD(life_adac_ticket,3500);
		}else{
			_fText = format["Tankschaden: <t color='#45ff2f'>OK</t><br/>"];
		};
	};

	if(_HitGear > 0.5) then
	{
		_hiText = format["Fahrwerk: <t color='#ff2f45'>Stark Beschädigt</t><br/>"];	
		ADD(life_adac_ticket,5000);
	}else{
		if(_HitGear > 0) then
		{
			_hiText = format["Fahrwerk: <t color='#ff812f'>Beschaedigt</t><br/>"];
			ADD(life_adac_ticket,3000);
		}else{
			_hiText = format["Fahrwerk: <t color='#45ff2f'>OK</t><br/>"];
		};
	};
	   
	if(_damage > 0.5) then
	{
		_dText = format["Fahrzeugschaden: <t color='#ff2f45'>Stark Beschädigt</t><br/>"];	
		ADD(life_adac_ticket,5000);
	}else{
		if(_damage > 0) then
		{
			_dText = format["Fahrzeugschaden: <t color='#ff812f'>Beschaedigt</t><br/>"];
			ADD(life_adac_ticket,2500);
		}else{
			_dText = format["Fahrzeugschaden: <t color='#45ff2f'>OK</t><br/>"];
		};
	};
	
	_wText = format["Beschaedigte Reifen: %1",_wheel];
	_rText = format["<br/><br/>Rechnungsbetrag: %1",life_adac_ticket];
	_text = _hText + _vText + _fText + _dText + _hiText + _rText;
	hintSilent parseText _text;
	
};

_veh SVAR["AdacCheck",true,true];

