#include <macro.h>

_index = [_this,0,0] call BIS_fnc_param;
_type = [_this,1,0] call BIS_fnc_param;
disableSerialization;
createDialog "lawMenu";
_display = findDisplay 50100;
_listbox = _display displayCtrl 50101;
_button = _display displayCtrl 50102;

if((life_isGov) OR ((call life_adminlevel) > 0)) then {_button ctrlSetText "Entferne Gesetz";};

switch(_type) do {
	
	case 0:
	{
		life_laws = [];
		[[player],"TON_fnc_getLaws",false,false] spawn life_fnc_mp;
		waitUntil {count life_laws > 0};

		{
			_law = [_x,100] call KRON_StrLeft;
			_listbox lbAdd _law;
			_listbox lbSetData [(lbSize _listbox)-1,_x];
		} forEach life_laws;
	};

	case 1: 
	{
		_data = call compile (_listbox lnbData[_index,0]);
		data = _data;
		_listbox ctrlSetText["%1",_data select 0];
	};
};