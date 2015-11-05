#include <macro.h>
_type = [_this,0,0] call BIS_fnc_param;

//_unit = cursorTarget;
_unit = lbData[1500,lbCurSel (1500)];
_unit = call compile format["%1", _unit];
life_gangl_unit = _unit;

switch(_type) do
{
	case 0:
	{
		if((call life_adminlevel) < 3) exitWith {
			closeDialog 0; 
			hint localize "STR_ANOTF_ErrorLevel";
			["Sie haben keine Berechtigung das das AdminMenu zu benutzen!!"] spawn bis_fnc_dynamictext;
			_message = format["%1 versuchte die DebugConsole zu oeffnen!!", name player];
			[["",_message,player,9],"TON_fnc_handleMessages",false,false] spawn life_fnc_MP;
			0 cutText["","BLACK FADED"];
			0 cutFadeOut 9999999;
			disableUserInput true;
			life_frozen = true;
			player setPos [0,0,0];
		};
		if(!isPlayer _unit) exitWith {};
		[[1],"life_fnc_gangLicense",life_gangl_unit,false] spawn life_fnc_MP;
		hintSilent format["Sie haben %1 und seiner Gang eine Baugenehmigung erteilt", name _unit];
	};
	
	case 1:
	{

		_varName = M_CONFIG(getText,"Licenses","gang","variable");
		_sideFlag = M_CONFIG(getText,"Licenses","gang","side");
		_license = LICENSE_VARNAME(_varName,_sideFlag);
		SVAR_MNS [_license,true];
		hintSilent "Sie haben von einem Admin eine Baugenehmigung erteilt bekommen!";
	};
};