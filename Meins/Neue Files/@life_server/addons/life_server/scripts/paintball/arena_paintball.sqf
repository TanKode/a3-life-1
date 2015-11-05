private ["_obj","_dat","_cString","_adString"];

_obj = objNull;_dat = [];_adString = "CAN_COLLIDE";
_cString = {_obj = createVehicle [(_dat select 0), call compile (_dat select 1), [], 0, _adString];if((_dat select 4) == 0) then {_obj enableSimulation false};_obj setdir (_dat select 2);if((_dat select 3) == -100) then {_obj setposATL (call compile (_dat select 1))} else {_obj setposASL [((call compile (_dat select 1)) select 0),((call compile (_dat select 1)) select 1),(_dat select 3)]};if((_dat select 5) == 0) then {_obj setVectorUp [0,0,1]} else {_obj setVectorUp (surfacenormal (getPosATL _obj))};if(count (_dat select 6) > 0) then {{call _x} foreach (_dat select 6)}};

_dat = ["Land_VR_Block_01_F","[12144.552734,13921.991211,0]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12134.015625,13938.990234,0]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12123.478516,13955.989258,0]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12213.387695,13961.649414,0]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12202.850586,13978.648438,0]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12192.313477,13995.647461,0]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12202.850586,13978.648438,8]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12192.313477,13995.647461,8]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12144.552734,13921.991211,8]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12134.015625,13938.990234,8]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12123.478516,13955.989258,8]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12125.0595703,13962.640625,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12135.320313,13968.862305,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12145.581055,13975.0839844,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12155.841797,13981.305664,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12166.102539,13987.527344,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12176.363281,13993.749023,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12186.624023,13999.970703,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12192.845703,13989.709961,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12199.0673828,13979.449219,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12205.289063,13969.188477,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12211.510742,13958.927734,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12201.25,13952.706055,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12190.989258,13946.484375,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12180.728516,13940.262695,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12170.467773,13934.0410156,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12160.207031,13927.819336,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12149.946289,13921.597656,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12143.724609,13931.858398,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12137.50293,13942.119141,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12131.28125,13952.379883,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12141.541992,13958.601563,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12151.802734,13964.823242,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12162.0634766,13971.0449219,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12172.324219,13977.266602,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12182.584961,13983.488281,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12188.806641,13973.227539,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12195.0283203,13962.966797,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12184.767578,13956.745117,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12174.506836,13950.523438,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12164.246094,13944.301758,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12153.985352,13938.0800781,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12147.763672,13948.34082,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12158.0244141,13954.5625,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12168.285156,13960.78418,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12178.545898,13967.00585938,16.0441]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12149.946289,13921.597656,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12143.724609,13931.858398,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12137.50293,13942.119141,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12131.28125,13952.379883,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12125.0595703,13962.640625,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12135.320313,13968.862305,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12145.581055,13975.0839844,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12155.841797,13981.305664,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12166.102539,13987.527344,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12176.363281,13993.749023,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12186.624023,13999.970703,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12192.845703,13989.709961,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12199.0673828,13979.449219,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12205.289063,13969.188477,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12211.510742,13958.927734,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12201.25,13952.706055,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12190.989258,13946.484375,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12180.728516,13940.262695,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12170.467773,13934.0410156,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12160.207031,13927.819336,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12153.985352,13938.0800781,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12147.763672,13948.34082,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12141.541992,13958.601563,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12151.802734,13964.823242,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12172.324219,13977.266602,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12182.584961,13983.488281,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12188.806641,13973.227539,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12195.0283203,13962.966797,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12184.767578,13956.745117,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12174.506836,13950.523438,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12164.246094,13944.301758,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12158.0244141,13954.5625,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12168.285156,13960.78418,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12178.545898,13967.00585938,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12162.311523,13990.536133,0.0347891]",239.824,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12213.387695,13961.649414,8]",328.208,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12191.861328,13940.341797,0]",238.464,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12174.81543,13929.880859,0]",238.464,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12157.769531,13919.419922,0]",238.464,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12157.769531,13919.419922,8]",238.464,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12174.81543,13929.880859,8]",238.464,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12191.861328,13940.341797,8]",238.464,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12208.907227,13950.802734,8]",238.464,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12208.907227,13950.802734,0]",238.464,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12179.601563,14000.588867,0.0347891]",239.824,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12179.601563,14000.588867,8.03479]",239.824,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12162.311523,13990.536133,8.03479]",239.824,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12145.0214844,13980.483398,8.03479]",239.824,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12127.731445,13970.430664,8.03479]",239.824,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12127.731445,13970.430664,0.0347891]",239.824,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_01_F","[12145.0214844,13980.483398,0.0347891]",239.824,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12145.581055,13975.0839844,-3.89281]",148.771,-100,0,0,[]];call _cString;
_dat = ["Land_VR_Block_02_F","[12162.0634766,13971.0449219,-3.89281]",148.771,-100,0,0,[]];call _cString;

_vehicle_44 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12142.581, 13961.426, -6.9618225e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//44 = _this;
    _this setDir -29.92499;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12142.581, 13961.426, -6.9618225e-005];
    //_this disableSimulation true;
};

_vehicle_46 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12149.367, 13949.746, -4.7683716e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//46 = _this;
    _this setDir -29.92499;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12149.367, 13949.746, -4.7683716e-006];
    //_this disableSimulation true;
};

_vehicle_49 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12156.856, 13937.014, 1.2397766e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//49 = _this;
    _this setDir -29.92499;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12156.856, 13937.014, 1.2397766e-005];
    //_this disableSimulation true;
};

_vehicle_52 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12152.579, 13959.287, -4.7683716e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//52 = _this;
    _this setDir -29.92499;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12152.579, 13959.287, -4.7683716e-005];
    //_this disableSimulation true;
};

_vehicle_55 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12149.31, 13957.359, 3.5972693], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//55 = _this;
    _this setDir -29.92499;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12149.31, 13957.359, 3.5972693];
    //_this disableSimulation true;
};

_vehicle_58 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12159.572, 13947.558, 3.7193298e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//58 = _this;
    _this setDir -29.92499;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12159.572, 13947.558, 3.7193298e-005];
    //_this disableSimulation true;
};

_vehicle_60 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12155.971, 13945.491, 3.8700211], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//60 = _this;
    _this setDir -29.92499;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12155.971, 13945.491, 3.8700211];
    //_this disableSimulation true;
};

_vehicle_62 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_03_F", [12160.96, 13970.039], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//62 = _this;
    _this setDir -29.940516;
    _this setPos [12160.96, 13970.039];
};

_vehicle_64 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_03_F", [12182.079, 13956.23, 0.00012588501], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//64 = _this;
    _this setDir -29.940516;
    _this setPos [12182.079, 13956.23, 0.00012588501];
    //_this enableSimulation false;
};

_vehicle_66 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_04_F", [12170.995, 13953.233, 2.8610229e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//66 = _this;
    _this setDir -29.113487;
    _this setPos [12170.995, 13953.233, 2.8610229e-006];
    //_this enableSimulation false;
};

_vehicle_68 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_04_F", [12175.609, 13969.637, 2.4795532e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//68 = _this;
    _this setDir -29.113487;
    _this setPos [12175.609, 13969.637, 2.4795532e-005];
    //_this enableSimulation false;
};

_vehicle_70 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12175.483, 13976.148, -0.00018692017], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//70 = _this;
    _this setDir -29.832727;
    _this setPos [12175.483, 13976.148, -0.00018692017];
    //_this enableSimulation false;
};

_vehicle_72 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12166.856, 13978.172, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//72 = _this;
    _this setDir -29.832727;
    _this setPos [12166.856, 13978.172, 3.8146973e-005];
    //_this enableSimulation false;
};

_vehicle_74 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12166.354, 13979.033, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//74 = _this;
    _this setDir -29.832727;
    _this setPos [12166.354, 13979.033, 7.6293945e-006];
    //_this enableSimulation false;
};

_vehicle_76 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12165.851, 13979.898, 2.8610229e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//76 = _this;
    _this setDir -29.832727;
    _this setPos [12165.851, 13979.898, 2.8610229e-005];
    //_this enableSimulation false;
};

_vehicle_78 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12167.697, 13978.663, 1.4305115e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//78 = _this;
    _this setDir -29.832727;
    _this setPos [12167.697, 13978.663, 1.4305115e-005];
    //_this enableSimulation false;
};

_vehicle_80 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12166.674, 13980.386, 1.0490417e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//80 = _this;
    _this setDir -29.832727;
    _this setPos [12166.674, 13980.386, 1.0490417e-005];
    //_this enableSimulation false;
};

_vehicle_82 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12168.575, 13962.425, 1.4305115e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//82 = _this;
    _this setDir -29.832727;
    _this setPos [12168.575, 13962.425, 1.4305115e-005];
    //_this enableSimulation false;
};

_vehicle_84 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12167.263, 13962.73, 1.4305115e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//84 = _this;
    _this setDir -29.832727;
    _this setPos [12167.263, 13962.73, 1.4305115e-005];
    //_this enableSimulation false;
};

_vehicle_86 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12165.934, 13963.102, 1.0490417e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//86 = _this;
    _this setDir -29.832727;
    _this setPos [12165.934, 13963.102, 1.0490417e-005];
    //_this enableSimulation false;
};

_vehicle_88 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12165.539, 13961.823, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//88 = _this;
    _this setDir -29.832727;
    _this setPos [12165.539, 13961.823, 7.6293945e-006];
    //_this enableSimulation false;
};

_vehicle_90 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12165.114, 13960.493, 1.6212463e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//90 = _this;
    _this setDir -29.832727;
    _this setPos [12165.114, 13960.493, 1.6212463e-005];
    //_this enableSimulation false;
};

_vehicle_92 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12160.231, 13956.563, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//92 = _this;
    _this setDir -29.832727;
    _this setPos [12160.231, 13956.563, -1.9073486e-006];
    //_this enableSimulation false;
};

_vehicle_94 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12159.752, 13957.378, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//94 = _this;
    _this setDir -29.832727;
    _this setPos [12159.752, 13957.378, 3.8146973e-006];
    //_this enableSimulation false;
};

_vehicle_96 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12159.286, 13958.184, 9.5367432e-007], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//96 = _this;
    _this setDir -29.832727;
    _this setPos [12159.286, 13958.184, 9.5367432e-007];
    //_this enableSimulation false;
};

_vehicle_98 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_standHigh_F", [12158.846, 13958.981, 9.5367432e-007], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//98 = _this;
    _this setDir -29.832727;
    _this setPos [12158.846, 13958.981, 9.5367432e-007];
    //_this enableSimulation false;
};

_vehicle_101 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12151.469, 13964.925, -9.5367432e-007], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//101 = _this;
    _this setDir -29.473534;
    _this setPos [12151.469, 13964.925, -9.5367432e-007];
    //_this enableSimulation false;
};

_vehicle_103 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12147.782, 13961.623, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//103 = _this;
    _this setDir -29.473534;
    _this setPos [12147.782, 13961.623, -3.0517578e-005];
    //_this enableSimulation false;
};

_vehicle_105 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12147.331, 13959.162, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//105 = _this;
    _this setDir -29.473534;
    _this setPos [12147.331, 13959.162, -2.2888184e-005];
    //_this enableSimulation false;
};

_vehicle_107 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12150.442, 13944.063, -4.7683716e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//107 = _this;
    _this setDir -29.473534;
    _this setPos [12150.442, 13944.063, -4.7683716e-006];
    //_this enableSimulation false;
};

_vehicle_109 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12151.717, 13943.677, -8.5830688e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//109 = _this;
    _this setDir -29.473534;
    _this setPos [12151.717, 13943.677, -8.5830688e-006];
    //_this enableSimulation false;
};

_vehicle_111 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12152.987, 13943.31, 1.6212463e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//111 = _this;
    _this setDir -29.473534;
    _this setPos [12152.987, 13943.31, 1.6212463e-005];
    //_this enableSimulation false;
};

_vehicle_113 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12155.884, 13942.695, -0.00011825562], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//113 = _this;
    _this setDir -29.473534;
    _this setPos [12155.884, 13942.695, -0.00011825562];
    //_this enableSimulation false;
};

_vehicle_115 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12155.414, 13943.532, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//115 = _this;
    _this setDir -29.473534;
    _this setPos [12155.414, 13943.532, -1.9073486e-006];
    //_this enableSimulation false;
};

_vehicle_117 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12159.229, 13932.074, -4.7683716e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//117 = _this;
    _this setDir -29.473534;
    _this setPos [12159.229, 13932.074, -4.7683716e-006];
    //_this enableSimulation false;
};

_vehicle_119 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12160.597, 13929.682, -4.4822693e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//119 = _this;
    _this setDir -29.473534;
    _this setPos [12160.597, 13929.682, -4.4822693e-005];
    //_this enableSimulation false;
};

_vehicle_121 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12161.939, 13927.498, -1.335144e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//121 = _this;
    _this setDir -29.473534;
    _this setPos [12161.939, 13927.498, -1.335144e-005];
    //_this enableSimulation false;
};

_vehicle_123 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12173.536, 13939.998, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//123 = _this;
    _this setDir -29.473534;
    _this setPos [12173.536, 13939.998, 3.0517578e-005];
    //_this enableSimulation false;
};

_vehicle_125 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12173.401, 13936.833, -1.8119812e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//125 = _this;
    _this setDir -29.473534;
    _this setPos [12173.401, 13936.833, -1.8119812e-005];
    //_this enableSimulation false;
};

_vehicle_127 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12177.833, 13940.462, 1.2397766e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//127 = _this;
    _this setDir -29.473534;
    _this setPos [12177.833, 13940.462, 1.2397766e-005];
    //_this enableSimulation false;
};

_vehicle_129 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12173.945, 13944.554, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//129 = _this;
    _this setDir -29.473534;
    _this setPos [12173.945, 13944.554, -3.8146973e-006];
    //_this enableSimulation false;
};

_vehicle_131 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12169.15, 13939.671, -5.1498413e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//131 = _this;
    _this setDir -29.473534;
    _this setPos [12169.15, 13939.671, -5.1498413e-005];
    //_this enableSimulation false;
};

_vehicle_133 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12169.737, 13934.868, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//133 = _this;
    _this setDir -29.473534;
    _this setPos [12169.737, 13934.868, -1.9073486e-006];
    //_this enableSimulation false;
};

_vehicle_135 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12177.929, 13943.217, -3.2424927e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//135 = _this;
    _this setDir -29.473534;
    _this setPos [12177.929, 13943.217, -3.2424927e-005];
    //_this enableSimulation false;
};

_vehicle_137 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12183.962, 13943.4, 4.9591064e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//137 = _this;
    _this setDir -29.473534;
    _this setPos [12183.962, 13943.4, 4.9591064e-005];
    //_this enableSimulation false;
};

_vehicle_139 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12185.108, 13948.054, 1.6212463e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//139 = _this;
    _this setDir -29.473534;
    _this setPos [12185.108, 13948.054, 1.6212463e-005];
    //_this enableSimulation false;
};

_vehicle_141 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12190.444, 13948.304, -5.9127808e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//141 = _this;
    _this setDir -29.473534;
    _this setPos [12190.444, 13948.304, -5.9127808e-005];
    //_this enableSimulation false;
};

_vehicle_144 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_03_F", [12194.655, 13961.147, 2.0980835e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//144 = _this;
    _this setDir -29.940516;
    _this setPos [12194.655, 13961.147, 2.0980835e-005];
    //_this enableSimulation false;
};

_vehicle_147 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12189.431, 13972.717, 2.8610229e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//147 = _this;
    _this setDir -29.92499;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12189.431, 13972.717, 2.8610229e-005];
    //_this enableSimulation false;
};

_vehicle_149 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12179.858, 13981.232, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//149 = _this;
    _this setDir -29.92499;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12179.858, 13981.232, -3.0517578e-005];
    //_this enableSimulation false;
};

_vehicle_151 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12185.666, 13977.547, 3.7719696], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//151 = _this;
    _this setDir -29.92499;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12185.666, 13977.547, 3.7719696];
    //_this enableSimulation false;
};

_vehicle_153 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12186.49, 13961.505, 5.7400212], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//153 = _this;
    _this setDir 59.633301;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12186.49, 13961.505, 5.7400212];
    //_this enableSimulation false;
};

_vehicle_156 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12177.294, 13954.028, 5.8602834], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//156 = _this;
    _this setDir 59.929405;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12177.294, 13954.028, 5.8602834];
    //_this enableSimulation false;
};

_vehicle_158 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12164.305, 13950.008, 3.8672664], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//158 = _this;
    _this setDir 59.633301;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12164.305, 13950.008, 3.8672664];
    //_this enableSimulation false;
};

_vehicle_160 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12156.801, 13964.194, 3.6403995], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//160 = _this;
    _this setDir 59.633301;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12156.801, 13964.194, 3.6403995];
    //_this enableSimulation false;
};

_vehicle_162 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12168.738, 13967.723, 5.4892454], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//162 = _this;
    _this setDir 59.633301;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12168.738, 13967.723, 5.4892454];
    //_this enableSimulation false;
};

_vehicle_164 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_Block_05_F", [12173.787, 13980.082, 3.8767016], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//164 = _this;
    _this setDir 60.635227;
    _this setVehicleAmmo 0.89999998;
    _this setPos [12173.787, 13980.082, 3.8767016];
    //_this enableSimulation false;
};

_vehicle_169 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12185.094, 13959.479, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//169 = _this;
    _this setDir -29.473534;
    _this setPos [12185.094, 13959.479, -2.2888184e-005];
    //_this enableSimulation false;
};

_vehicle_171 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12185.563, 13958.626, -9.5367432e-007], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//171 = _this;
    _this setDir -29.473534;
    _this setPos [12185.563, 13958.626, -9.5367432e-007];
    //_this enableSimulation false;
};

_vehicle_173 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12186.034, 13957.771, -6.6757202e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//173 = _this;
    _this setDir -29.473534;
    _this setPos [12186.034, 13957.771, -6.6757202e-006];
    //_this enableSimulation false;
};

_vehicle_175 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12186.493, 13956.938, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//175 = _this;
    _this setDir -29.473534;
    _this setPos [12186.493, 13956.938, 3.8146973e-006];
    //_this enableSimulation false;
};

_vehicle_177 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12186.955, 13956.102, -2.8610229e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//177 = _this;
    _this setDir -29.473534;
    _this setPos [12186.955, 13956.102, -2.8610229e-006];
    //_this enableSimulation false;
};

_vehicle_179 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12187.419, 13955.258, 5.4359436e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//179 = _this;
    _this setDir -29.473534;
    _this setPos [12187.419, 13955.258, 5.4359436e-005];
    //_this enableSimulation false;
};

_vehicle_181 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12185.562, 13958.615, 0.95970511], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//181 = _this;
    _this setDir -29.473534;
    _this setPos [12185.562, 13958.615, 0.95970511];
    //_this enableSimulation false;
};

_vehicle_183 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12186.032, 13957.76, 1.9547187], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//183 = _this;
    _this setDir -29.473534;
    _this setPos [12186.032, 13957.76, 1.9547187];
    //_this enableSimulation false;
};

_vehicle_185 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12186.487, 13956.938, 2.9318721], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//185 = _this;
    _this setDir -29.473534;
    _this setPos [12186.487, 13956.938, 2.9318721];
    //_this enableSimulation false;
};

_vehicle_187 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12186.951, 13956.1, 4.0011616], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//187 = _this;
    _this setDir -29.473534;
    _this setPos [12186.951, 13956.1, 4.0011616];
    //_this enableSimulation false;
};

_vehicle_189 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12187.416, 13955.231, 4.8744521], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//189 = _this;
    _this setDir -29.473534;
    _this setPos [12187.416, 13955.231, 4.8744521];
    //_this enableSimulation false;
};

_vehicle_191 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12158.97, 13948.447, 6.7472472], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//191 = _this;
    _this setDir -29.473534;
    _this setPos [12158.97, 13948.447, 6.7472472];
    //_this enableSimulation false;
};

_vehicle_193 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12159.434, 13947.659, 6.1392937], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//193 = _this;
    _this setDir -29.473534;
    _this setPos [12159.434, 13947.659, 6.1392937];
    //_this enableSimulation false;
};

_vehicle_195 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12162.017, 13944.07, -1.4305115e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//195 = _this;
    _this setDir -29.473534;
    _this setPos [12162.017, 13944.07, -1.4305115e-005];
    //_this enableSimulation false;
};

_vehicle_197 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12159.92, 13946.809, 5.3088403], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//197 = _this;
    _this setDir -29.473534;
    _this setPos [12159.92, 13946.809, 5.3088403];
    //_this enableSimulation false;
};

_vehicle_199 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12160.404, 13946.016, 4.5513153], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//199 = _this;
    _this setDir -29.473534;
    _this setPos [12160.404, 13946.016, 4.5513153];
    //_this enableSimulation false;
};

_vehicle_201 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12160.821, 13945.257, 3.7438579], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//201 = _this;
    _this setDir -29.473534;
    _this setPos [12160.821, 13945.257, 3.7438579];
    //_this enableSimulation false;
};

_vehicle_203 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12163.945, 13943.813, 2.9375584], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//203 = _this;
    _this setDir -29.473534;
    _this setPos [12163.945, 13943.813, 2.9375584];
    //_this enableSimulation false;
};

_vehicle_205 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12163.177, 13943.329, 2.312897], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//205 = _this;
    _this setDir -29.473534;
    _this setPos [12163.177, 13943.329, 2.312897];
    //_this enableSimulation false;
};

_vehicle_207 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12162.357, 13942.851, 1.3850713], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//207 = _this;
    _this setDir -29.473534;
    _this setPos [12162.357, 13942.851, 1.3850713];
    //_this enableSimulation false;
};

_vehicle_209 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12161.547, 13942.402, 0.54221153], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//209 = _this;
    _this setDir -29.473534;
    _this setPos [12161.547, 13942.402, 0.54221153];
    //_this enableSimulation false;
};

_vehicle_211 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12160.723, 13941.848, -0.16529901], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//211 = _this;
    _this setDir -29.473534;
    _this setPos [12160.723, 13941.848, -0.16529901];
    //_this enableSimulation false;
};

_vehicle_213 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12194.266, 13968.259, 4.8336849], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//213 = _this;
    _this setDir -29.473534;
    _this setPos [12194.266, 13968.259, 4.8336849];
    //_this enableSimulation false;
};

_vehicle_215 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12193.775, 13969.053, 4.2615662], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//215 = _this;
    _this setDir -29.473534;
    _this setPos [12193.775, 13969.053, 4.2615662];
    //_this enableSimulation false;
};

_vehicle_217 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12193.357, 13969.772, 3.5965667], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//217 = _this;
    _this setDir -29.473534;
    _this setPos [12193.357, 13969.772, 3.5965667];
    //_this enableSimulation false;
};

_vehicle_219 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12192.875, 13972.33, 3.0139019], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//219 = _this;
    _this setDir -29.473534;
    _this setPos [12192.875, 13972.33, 3.0139019];
    //_this enableSimulation false;
};

_vehicle_221 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12192.389, 13973.19, 2.1421502], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//221 = _this;
    _this setDir -29.473534;
    _this setPos [12192.389, 13973.19, 2.1421502];
    //_this enableSimulation false;
};

_vehicle_223 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12191.909, 13974.074, 1.3449485], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//223 = _this;
    _this setDir -29.473534;
    _this setPos [12191.909, 13974.074, 1.3449485];
    //_this enableSimulation false;
};

_vehicle_225 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12191.416, 13974.928, 0.55411941], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//225 = _this;
    _this setDir -29.473534;
    _this setPos [12191.416, 13974.928, 0.55411941];
    //_this enableSimulation false;
};

_vehicle_227 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12190.939, 13975.788, -0.19764446], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//227 = _this;
    _this setDir -29.473534;
    _this setPos [12190.939, 13975.788, -0.19764446];
    //_this enableSimulation false;
};

_vehicle_229 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12190.623, 13964.949, 8.5631647], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//229 = _this;
    _this setDir -29.473534;
    _this setPos [12190.623, 13964.949, 8.5631647];
    //_this enableSimulation false;
};

_vehicle_231 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12191.125, 13964.123, 7.7136717], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//231 = _this;
    _this setDir -29.473534;
    _this setPos [12191.125, 13964.123, 7.7136717];
    //_this enableSimulation false;
};

_vehicle_233 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12191.602, 13963.311, 6.9893069], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//233 = _this;
    _this setDir -29.473534;
    _this setPos [12191.602, 13963.311, 6.9893069];
    //_this enableSimulation false;
};

_vehicle_235 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12192.054, 13962.442, 6.120718], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//235 = _this;
    _this setDir -29.473534;
    _this setPos [12192.054, 13962.442, 6.120718];
    //_this enableSimulation false;
};

_vehicle_237 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12192.487, 13961.587, 5.265244], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//237 = _this;
    _this setDir -29.473534;
    _this setPos [12192.487, 13961.587, 5.265244];
    //_this enableSimulation false;
};

_vehicle_239 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12175.139, 13988.593, 4.7683716e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//239 = _this;
    _this setDir -29.473534;
    _this setPos [12175.139, 13988.593, 4.7683716e-005];
    //_this enableSimulation false;
};

_vehicle_241 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12170.663, 13987.211, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//241 = _this;
    _this setDir -29.473534;
    _this setPos [12170.663, 13987.211, -1.9073486e-006];
    //_this enableSimulation false;
};

_vehicle_243 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12168.177, 13983.195, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//243 = _this;
    _this setDir -29.473534;
    _this setPos [12168.177, 13983.195, -7.6293945e-006];
    //_this enableSimulation false;
};

_vehicle_245 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12163.891, 13983.607, -1.335144e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//245 = _this;
    _this setDir -29.473534;
    _this setPos [12163.891, 13983.607, -1.335144e-005];
    //_this enableSimulation false;
};

_vehicle_247 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12161.598, 13980.073, -0.00013446808], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//247 = _this;
    _this setDir -29.473534;
    _this setPos [12161.598, 13980.073, -0.00013446808];
    //_this enableSimulation false;
};

_vehicle_249 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12157.852, 13979.912, 0], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//249 = _this;
    _this setDir -29.473534;
    _this setPos [12157.852, 13979.912, 0];
    //_this enableSimulation false;
};

_vehicle_251 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12155.935, 13976.297, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//251 = _this;
    _this setDir -29.473534;
    _this setPos [12155.935, 13976.297, -1.1444092e-005];
    //_this enableSimulation false;
};

_vehicle_253 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12152.385, 13976.369, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//253 = _this;
    _this setDir -29.473534;
    _this setPos [12152.385, 13976.369, -2.0980835e-005];
    //_this enableSimulation false;
};

_vehicle_255 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12150.78, 13971.599, -4.7683716e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//255 = _this;
    _this setDir -29.473534;
    _this setPos [12150.78, 13971.599, -4.7683716e-005];
    //_this enableSimulation false;
};

_vehicle_257 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12152.917, 13967.66, 0.00010204315], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//257 = _this;
    _this setDir -29.473534;
    _this setPos [12152.917, 13967.66, 0.00010204315];
    //_this enableSimulation false;
};

_vehicle_259 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12149.233, 13968.189, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//259 = _this;
    _this setDir -29.473534;
    _this setPos [12149.233, 13968.189, 7.6293945e-006];
    //_this enableSimulation false;
};

_vehicle_261 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12146.813, 13965.694, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//261 = _this;
    _this setDir -29.473534;
    _this setPos [12146.813, 13965.694, 6.1035156e-005];
    //_this enableSimulation false;
};

_vehicle_263 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12144.64, 13971.333, -3.528595e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//263 = _this;
    _this setDir -29.473534;
    _this setPos [12144.64, 13971.333, -3.528595e-005];
    //_this enableSimulation false;
};

_vehicle_265 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12141.35, 13967.13, -2.8610229e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//265 = _this;
    _this setDir -29.473534;
    _this setPos [12141.35, 13967.13, -2.8610229e-006];
    //_this enableSimulation false;
};

_vehicle_267 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12140.861, 13968.021, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//267 = _this;
    _this setDir -29.473534;
    _this setPos [12140.861, 13968.021, -3.8146973e-006];
    //_this enableSimulation false;
};

_vehicle_269 = objNull;
if (true) then
{
    _this = createVehicle ["Land_VR_CoverObject_01_kneelHigh_F", [12139.212, 13971.334, 1.4305115e-005], [], 0, "CAN_COLLIDE"];
    _this allowDamage false;//269 = _this;
    _this setDir -29.473534;
    _this setPos [12139.212, 13971.334, 1.4305115e-005];
    //_this enableSimulation false;
};

_light1 = "#lightpoint" createVehicleLocal [12148.1,13935.5,11.7261];   
_light1 setLightBrightness 1.5;    
_light1 setLightAmbient[0.7, 0.7, 0.7];
_light1 setLightColor[1.0, 1.0, 1.0]; 

_light2 = "#lightpoint" createVehicleLocal [12143.1,13965.8,11.8024];   
_light2 setLightBrightness 1.5;    
_light2 setLightAmbient[0.7, 0.7, 0.7];
_light2 setLightColor[1.0, 1.0, 1.0]; 

_light3 = "#lightpoint" createVehicleLocal [12158.9,13973.4,117267];   
_light3 setLightBrightness 1.5;    
_light3 setLightAmbient[0.7, 0.7, 0.7];
_light3 setLightColor[1.0, 1.0, 1.0]; 

_light4 = "#lightpoint" createVehicleLocal [12171.3,13980.2,116721];   
_light4 setLightBrightness 1.5;    
_light4 setLightAmbient[0.7, 0.7, 0.7];
_light4 setLightColor[1.0, 1.0, 1.0]; 

_light5 = "#lightpoint" createVehicleLocal [12185.8,13988.8,11.68];   
_light5 setLightBrightness 1.5;    
_light5 setLightAmbient[0.7, 0.7, 0.7];
_light5 setLightColor[1.0, 1.0, 1.0]; 

_light6 = "#lightpoint" createVehicleLocal [12193.2,13976.7,11.67];   
_light6 setLightBrightness 1.5;    
_light6 setLightAmbient[0.7, 0.7, 0.7];
_light6 setLightColor[1.0, 1.0, 1.0]; 

_light7 = "#lightpoint" createVehicleLocal [12178.8,13968,11.67];   
_light7 setLightBrightness 1.5;    
_light7 setLightAmbient[0.7, 0.7, 0.7];
_light7 setLightColor[1.0, 1.0, 1.0]; 

_light8 = "#lightpoint" createVehicleLocal [12165,13960.1,116867];   
_light8 setLightBrightness 1.5;    
_light8 setLightAmbient[0.7, 0.7, 0.7];
_light8 setLightColor[1.0, 1.0, 1.0]; 

_light9 = "#lightpoint" createVehicleLocal [12150.6,13952.2,11.6999];   
_light9 setLightBrightness 1.5;    
_light9 setLightAmbient[0.7, 0.7, 0.7];
_light9 setLightColor[1.0, 1.0, 1.0]; 

_light10 = "#lightpoint" createVehicleLocal [12139.8,13946.3,11.5772];   
_light10 setLightBrightness 1.5;    
_light10 setLightAmbient[0.7, 0.7, 0.7];
_light10 setLightColor[1.0, 1.0, 1.0]; 

_light11 = "#lightpoint" createVehicleLocal [12147.9,13932.2,11.6342];   
_light11 setLightBrightness 1.5;    
_light11 setLightAmbient[0.7, 0.7, 0.7];
_light11 setLightColor[1.0, 1.0, 1.0]; 

_light12 = "#lightpoint" createVehicleLocal [12160,13939.4,11.6675];   
_light12 setLightBrightness 1.5;    
_light12 setLightAmbient[0.7, 0.7, 0.7];
_light12 setLightColor[1.0, 1.0, 1.0]; 

_light13 = "#lightpoint" createVehicleLocal [12174.8,13947.5,11.6903];   
_light13 setLightBrightness 1.5;    
_light13 setLightAmbient[0.7, 0.7, 0.7];
_light13 setLightColor[1.0, 1.0, 1.0]; 

_light14 = "#lightpoint" createVehicleLocal [12187.8,13955.3,11.68];   
_light14 setLightBrightness 1.5;    
_light14 setLightAmbient[0.7, 0.7, 0.7];
_light14 setLightColor[1.0, 1.0, 1.0]; 

_light15 = "#lightpoint" createVehicleLocal [12201.9,13962.4,11.6508];   
_light15 setLightBrightness 1.5;    
_light15 setLightAmbient[0.7, 0.7, 0.7];
_light15 setLightColor[1.0, 1.0, 1.0];