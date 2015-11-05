#include <macro.h>

AH_loaded = false;
[[0,player],"TON_fnc_SAH_reciever",false,false] spawn life_fnc_mp;
waitUntil {AH_loaded};
waitUntil {createDialog "AH_buy";};
disableSerialization;
_dialog = findDisplay 15100;
_myListbox = _dialog displayCtrl 15101;
//_myListbox lnbAddColumn 0.3;
//_myListbox lnbAddColumn 0.4;
//_myListbox lnbAddColumn 0.5;

_vItem = [];
{_vItem pushBack (configName _x);} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

{
    _curOffer = _x;
    _pid = _curOffer select 0;
    _item = _curOffer select 1;
    _price = _curOffer select 2;
    _name = M_CONFIG(getText,"VirtualItems",_item,"displayName");
	
    _seller = [_pid] call life_fnc_CAH_getPlayerObj;
    if(_item in _vItem) then {
    	_myListbox lbAdd format["%3 von %1 fuer %2",name _seller,([_price] call life_fnc_numberText),(localize _name)];
        _myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",[_pid,_item,_price]]];
        _icon = M_CONFIG(getText,"VirtualItems",_item,"icon");
        if(!(EQUAL(_icon,""))) then {
        	_myListbox lbSetPicture [(lbSize _myListbox)-1,_icon];
            _myListbox lbSetPictureColor [(lbSize _myListbox)-1, [1, 1, 1, 1]];
        }; 
    }else{
        _myListbox lbAdd format ["%3 von %1 fuer %2",name _seller,([_price] call life_fnc_numberText),([_item] call VAS_fnc_fetchCfgDetails) select 1];
        //_myListbox lnbAddRow [format ["%1",([_item] call VAS_fnc_fetchCfgDetails) select 1],format ["%1",_price],format ["%1",_seller]];
        _myListbox lbSetPicture [(lbSize _myListbox)-1, ([_item] call VAS_fnc_fetchCfgDetails select 2)];
        _myListbox lbSetPictureColor [(lbSize _myListbox)-1, [1, 1, 1, 1]];
        _myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",[_pid,_item,_price]]]; 
    };
} forEach AH_offers;

hint "Erfolgreich geladene Angebote";