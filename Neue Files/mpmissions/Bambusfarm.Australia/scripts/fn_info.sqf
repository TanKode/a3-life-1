#include <macro.h>
/*
	File: fn_info.sqf
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
private["_mode","_dialog","_infoList","_infoText","_infoTitel","_infos","_displayName","_infoSel","_select"];

disableSerialization;
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_dialog = findDisplay 621000;
_infoList = _dialog displayCtrl 621003;
_infoText = _dialog displayCtrl 621002;
_infoTitel = _dialog displayCtrl 621001;

_infos = [
	["Tastaturbelegung","Tastatur/Infos","Um eine Kompelette Liste der Tastaturbelegung zu bekommen,<br/>drücke <a color='#ff1000'>'H'</a>!<br/><br/> Um deine FPS inGame immer mal wieder zu Steigern<br/>Können Sie <a color='#ff1000'>'SHILFT + NUM -'</a> drücken und dann <a color='#ff1000'>'FLUSH'</a> eingeben um den Grafkispeicher zu leeren oder <a color='#ff1000'>'FPS'</a> bis <br/><a color='#ff1000'>'Limit FPS 0'</a> da steht!"],
	["Serverregeln","Serverregeln","Da Sie beim betretten des Servers die AGB´s akzeptiert haben,<br/>sollten Sie die Regeln bereits beherrschen!<br/>Die Aktuellen <a color='#ff1000' href='https://docs.google.com/document/d/1g_ODhM9tQVznIPPOGNRQhP82ov2oK4SylP7f7fbb1Rw/edit'>Serverregeln</a> sind auf unserer HP zu finden!"],
	["Kontakt","So kannst du uns erreichen","<a color='#D0E354' href='http://www.teamspeak.com/invite/ts.bambusfarm.net/'>Teamspeak</a><br/><br/><a color='#D0E354' href='http://bambusfarm.net'>Webseite</a><br/><a color='#D0E354' href='http://bambusfarm.net/app/forum/10-ankundigungen/6-serverregeln'>Regeln</a>"]
];

switch(_mode) do
{
	case 0:
	{
		{
			_displayName = (_x select 0);
			_infoList lbAdd format["%1",_displayName];
		} forEach _infos;
	};
	
	case 1:
	{
		if(isNull _dialog) exitWith {};
		_infoSel = lbCurSel _infoList;
		_select = _infos select _infoSel;
		_infoTitel ctrlSetText (_select select 1);
		_infoText ctrlSetStructuredText parseText (_select select 2);
	};
};