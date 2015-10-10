private["_target", "_message", "_hatauto", "_hatLKW"];

_target = cursorTarget;
_hatauto = if (license_civ_driver) then {"Im Besitz"} else {"Nicht im Besitz"};
_hatLKW =  if (license_civ_truck) then {"Im Besitz"} else {"Nicht im Besitz"};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_message = format["<t size='1.5'>%1</t><br/><t size='1'>PKW-Fahrlizenz: %2</t><br/><t size='1'>LKW-Fahrlizenz: %3</t>", name player, _hatauto, _hatLKW];

[[player, _message],"life_fnc_LicenseShown",_target,false] spawn life_fnc_MP;
