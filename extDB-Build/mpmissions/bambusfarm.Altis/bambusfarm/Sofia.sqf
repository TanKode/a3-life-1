/*
 -----------------------------------
 Author: RAinZz5718
 Description: Intro Sofia
 -----------------------------------
 */
 waitUntil { alive player };
 player allowDamage false;
 _camera = "camera" camCreate [0,0,0];
 _camera CameraEffect ["internal","back"];
 _camera CamCommitPrepared 0;
 //-----------------------------------
 // Das sind die Kamera Koordinaten (Sofia)
 _camera camPrepareTarget [-60140.65,26641.50,-50810.04];
 _camera camPreparePos [25785.72,21368.36,52.56];
 _camera camPrepareFOV 0.700;
 _camera camCommitPrepared 0;
 //-----------------------------------


 titleText ["","Black IN",4];


any=[
    [
        ["Willkommen auf dem Altis Life Server","<t align = 'center' size = '0.7'>%1</t><br/>"],
        ["RISK YOUR LIFE","<t align = 'center' size ='1'>%1</t><br/>"],
        ["Server Restarts: 00:00, 06:00, 12:00, 18:00","<t align = 'center' size = '0.7'>%1</t><br/>"]
    ]
] spawn BIS_fnc_typeText;


 sleep 11;
 titleText ["","black out",3];
 waitUntil {camCommitted _camera};
 sleep 5;
 titleText ["","Black IN",4];
 _camera cameraEffect ["terminate","back"];
 camDestroy _camera;
 player allowDamage true;
 sleep 0;