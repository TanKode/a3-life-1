private ["_obj","_dat","_cString","_adString"];

_obj = objNull;_dat = [];_adString = "CAN_COLLIDE";
_cString = {_obj = createVehicle [(_dat select 0), call compile (_dat select 1), [], 0, _adString];if((_dat select 4) == 0) then {_obj enableSimulation false};_obj allowDamage false;_obj setdir (_dat select 2);if((_dat select 3) == -100) then {_obj setposATL (call compile (_dat select 1))} else {_obj setposASL [((call compile (_dat select 1)) select 0),((call compile (_dat select 1)) select 1),(_dat select 3)]};if((_dat select 5) == 0) then {_obj setVectorUp [0,0,1]} else {_obj setVectorUp (surfacenormal (getPosATL _obj))};if(count (_dat select 6) > 0) then {{call _x} foreach (_dat select 6)}};

_dat = ["xcam_City2_8m_F","[30976.201172,9871.3125,0]",0,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30983.220703,9871.3125,0]",0,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30990.240234,9871.3125,0]",0,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30997.259766,9871.3125,0]",0,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31001.601563,9871.3125,0]",180,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31013.269531,9871.416992,0]",360,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31020.289063,9871.416992,0]",360,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31027.308594,9871.416992,0]",360,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31034.328125,9871.416992,0]",360,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31041.347656,9871.416992,0]",360,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31048.367188,9871.416992,0]",360,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.896484,9868.12793,0]",450,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.896484,9861.107422,0]",450,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.896484,9854.0869141,0]",450,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.896484,9847.0664063,0]",450,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.896484,9840.0458984,0]",450,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.896484,9833.0253906,0]",450,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.896484,9826.00488281,0]",450,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.896484,9818.984375,0]",450,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.896484,9811.963867,0]",450,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.896484,9804.943359,0]",450,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.90625,9799.879883,-0.0411235]",630,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31048.277344,9796.652344,-0.0411234]",2.00358e-005,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31041.257813,9796.652344,-0.0411235]",720,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31034.238281,9796.652344,-0.0411235]",720,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31027.21875,9796.652344,-0.0411235]",720,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31023.728516,9796.646484,-0.0411235]",720,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31008.300781,9796.641602,-0.0411235]",900,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31001.28125,9796.641602,-0.0411235]",900,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30994.261719,9796.641602,-0.0411235]",900,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30987.242188,9796.641602,-0.0411235]",900,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30980.222656,9796.641602,-0.0411235]",900,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30975.835938,9796.646484,-0.0411234]",2.73298e-006,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.673828,9800.15625,-0.0411235]",1170,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.673828,9807.176758,-0.0411235]",1170,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.673828,9814.197266,-0.0411235]",1170,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.673828,9821.217773,-0.0411235]",1170,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.673828,9828.238281,-0.0411235]",1170,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.673828,9835.258789,-0.0411235]",1170,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.673828,9842.279297,-0.0411235]",1170,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.673828,9849.299805,-0.0411235]",1170,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.673828,9856.320313,-0.0411235]",1170,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.740234,9863.354492,-0.0411235]",1170.86,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.78125,9867.939453,-0.0411234]",270.857,-100,1,0,[]];call _cString;
_dat = ["xcam_City_Gate_F","[31007.453125,9871.320313,0]",359.275,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.568359,9792.993164,-0.0411235]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.568359,9785.972656,-0.0411235]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.568359,9778.952148,-0.0411235]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30972.574219,9771.853516,-0.0411234]",270,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31011.525391,9785.908203,-0.0411234]",270,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31011.515625,9792.948242,-0.0411234]",270,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31011.525391,9771.867188,-0.0411234]",270,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_4m_F","[31011.542969,9766.660156,0]",270,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_4m_F","[30972.480469,9766.646484,-0.0822468]",270,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30976.101563,9765.119141,-0.0664975]",899.934,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30983.121094,9765.126953,-0.0664975]",899.934,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30990.140625,9765.134766,-0.0664975]",899.934,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[30997.160156,9765.142578,-0.0664975]",899.934,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31004.179688,9765.150391,-0.0664975]",899.934,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_4m_F","[31009.462891,9765.120117,-0.0664973]",179.934,-100,1,0,[]];call _cString;
_dat = ["xcam_Wreck_Car3_F","[30993.929688,9771.232422,0]",269.934,-100,1,0,[]];call _cString;
_dat = ["xcam_Wreck_CarDismantled_F","[30982.726563,9774.03125,0]",269.934,-100,1,0,[]];call _cString;
_dat = ["xcam_Wreck_Hunter_F","[30993.714844,9786.217773,-4.76837e-007]",269.934,-100,1,0,[]];call _cString;
_dat = ["xcam_Wreck_Offroad_F","[30982.626953,9782.772461,0]",1169.93,-100,1,0,[]];call _cString;
_dat = ["xcam_Wreck_Offroad_F","[30982.638672,9782.741211,1.40889]",89.934,-100,1,0,[]];call _cString;
_dat = ["xcam_Wreck_Truck_F","[31031.238281,9782.636719,0]",89.934,-100,1,0,[]];call _cString;
_dat = ["xcam_Wreck_Van_F","[31031.923828,9770.675781,0]",89.934,-100,1,0,[]];call _cString;
_dat = ["xcam_Wreck_Ural_F","[31043.113281,9773.598633,0]",199.934,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31020.488281,9792.941406,-0.0411235]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31020.488281,9785.920898,-0.0411235]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31024.332031,9765.178711,-0.168869]",180.395,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31020.488281,9771.879883,-0.0411235]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.943359,9792.861328,-0.0411235]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.943359,9785.84082,-0.0411235]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.943359,9778.820313,-0.0411235]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31051.943359,9771.799805,-0.0411235]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_4m_F","[31020.546875,9766.673828,-0.0787472]",990,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_4m_F","[31051.880859,9766.569336,-0.0787473]",270,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31031.351563,9765.129883,-0.168869]",900.396,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31038.371094,9765.0810547,-0.168869]",900.396,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_8m_F","[31045.390625,9765.0322266,-0.168869]",180.395,-100,1,0,[]];call _cString;
_dat = ["xcam_City2_4m_F","[31050.162109,9764.996094,-0.181993]",1.00179e-005,-100,1,0,[]];call _cString;
_dat = ["xcam_MilOffices_V1_F","[30989.269531,9849.736328,-8.2016e-005]",269.471,-100,1,0,[]];call _cString;
_dat = ["xcam_fs_roof_F","[31033.808594,9813.865234,1.90735e-006]",314.902,-100,1,0,[]];call _cString;
_dat = ["xcam_fs_feed_F","[31033.705078,9813.817383,0.13838]",134.902,-100,1,0,[]];call _cString;
_dat = ["Land_Mattaust_ATM","[30992.136719,9856,0.404235]",359.902,-100,1,0,[]];call _cString;
_dat = ["xcam_runway_edgelight_blue_F","[30988.513672,9809.820313,-0.110324]",101.544,-100,1,0,[]];call _cString;
_dat = ["xcam_runway_edgelight_blue_F","[30994.3125,9805.141602,-0.0672913]",101.544,-100,1,0,[]];call _cString;
_dat = ["xcam_runway_edgelight_blue_F","[30995.498047,9812.285156,-0.117324]",101.544,-100,1,0,[]];call _cString;
_dat = ["xcam_LampHalogen_F","[30973.519531,9797.462891,-0.146116]",142.259,-100,1,0,[]];call _cString;
_dat = ["xcam_LampHalogen_F","[30973.683594,9870.761719,-0.146117]",232.259,-100,1,0,[]];call _cString;
_dat = ["xcam_LampHalogen_F","[31051.316406,9846.744141,-0.146117]",312.259,-100,1,0,[]];call _cString;
_dat = ["xcam_LampHalogen_F","[31051.242188,9797.155273,-0.146117]",407.259,-100,1,0,[]];call _cString;
_dat = ["xcam_LampHalogen_F","[31051.355469,9796.0166016,-0.146117]",307.259,-100,1,0,[]];call _cString;
_dat = ["xcam_LampHalogen_F","[31021.119141,9765.87207,-0.146117]",497.259,-100,1,0,[]];call _cString;
_dat = ["xcam_LampHalogen_F","[31010.943359,9765.764648,-0.146117]",402.259,-100,1,0,[]];call _cString;
_dat = ["xcam_LampHalogen_F","[30973.275391,9796.0488281,-0.146117]",222.259,-100,1,0,[]];call _cString;
_dat = ["xcam_HelipadSquare_F","[30993.210938,9809.595703,0.169744]",40.1612,-100,1,0,[]];call _cString;
