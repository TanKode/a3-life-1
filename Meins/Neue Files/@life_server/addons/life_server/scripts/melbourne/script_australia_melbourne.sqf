private ["_obj","_dat","_cString","_adString"];

_obj = objNull;_dat = [];_adString = "CAN_COLLIDE";
_cString = {_obj = createVehicle [(_dat select 0), call compile (_dat select 1), [], 0, _adString];if((_dat select 4) == 0) then {_obj enableSimulation false};_obj allowDamage false;_obj setdir (_dat select 2);if((_dat select 3) == -100) then {_obj setposATL (call compile (_dat select 1))} else {_obj setposASL [((call compile (_dat select 1)) select 0),((call compile (_dat select 1)) select 1),(_dat select 3)]};if((_dat select 5) == 0) then {_obj setVectorUp [0,0,1]} else {_obj setVectorUp (surfacenormal (getPosATL _obj))};if(count (_dat select 6) > 0) then {{call _x} foreach (_dat select 6)}};

_dat = ["Land_E76_shop_single1","[31097.548828,10526.700195,2.38419e-007]",180,-100,1,0,[]];call _cString;
_dat = ["Land_E76_tower2","[31150.271484,10558.830078,0.0490508]",90,-100,1,0,[]];call _cString;
_dat = ["Land_E76_tower6","[31046.232422,10734.830078,-9.03816]",90,-100,1,0,[]];call _cString;
_dat = ["Land_PostB","[31561.560547,11287.851563,3.3743]",220,-100,1,0,[]];call _cString;
_dat = ["Land_PostB","[31854.730469,10846.245117,3.3743]",220,-100,1,0,[]];call _cString;
_dat = ["Land_E76_shop_single1","[31832.0898438,10799.798828,2.196]",180,-100,1,0,[]];call _cString;
_dat = ["Land_HouseDoubleAL","[30695.488281,10550.193359,0.323757]",220,-100,1,0,[]];call _cString;
_dat = ["Land_HouseDoubleAL","[30786.00390625,10805.105469,0.332175]",90,-100,1,0,[]];call _cString;
_dat = ["Land_HouseDoubleAL","[30724.0351563,10851.977539,0.332175]",240,-100,1,0,[]];call _cString;
_dat = ["Land_HouseDoubleAL","[31564.748047,11330.697266,0.391019]",295,-100,1,0,[]];call _cString;
_dat = ["Land_HouseDoubleAL","[31884.277344,10872.749023,0.391018]",295,-100,1,0,[]];call _cString;
_dat = ["xcam_MilOffices_V1_F","[30989.572266,9851.276367,1.04476]",270.475,-100,1,0,[]];call _cString;
