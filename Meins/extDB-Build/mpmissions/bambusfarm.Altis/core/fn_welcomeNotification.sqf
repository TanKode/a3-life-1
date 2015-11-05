/*
	File: fn_welcome.sqf
	Author: Risk
	Description:
	Welcome Messages after player connected
*/
[] spawn {
    sleep 20;
    [
        [
            ["Komm doch auf unser Teamspeak","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["ts.bambusfarm.net","<t align = 'center' size ='1'>%1</t><br/>"],
            ["Server Restarts: 00:00, 06:00, 12:00, 18:00","<t align = 'center' size = '0.7'>%1</t><br/>"]
        ]
    ] spawn BIS_fnc_typeText;
    sleep 20;
    [
        [
            ["Oder besuch unsere Homepage:","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["www.bambusfarm.net","<t align = 'center' size ='1'>%1</t><br/>"],
            ["","<t align = 'center' size = '0.7'>%1</t><br/>"]
        ]
    ] spawn BIS_fnc_typeText;
    sleep 20;
    [
        [
            ["Beachte immer die Regeln! ","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["Diese findest du auf unserer Webseite ","<t align = 'center' size ='1'>%1</t><br/>"],
            ["www.bambusfarm.net","<t align = 'center' size = '0.7'>%1</t><br/>"]
        ]
    ] spawn BIS_fnc_typeText;
    sleep 20;
    [
        [
            ["Viel Spaß ","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["wünschen dir die ","<t align = 'center' size ='1'>%1</t><br/>"],
            ["Admins von der Bambusfarm Community","<t align = 'center' size = '0.7'>%1</t><br/>"]
        ]
    ] spawn BIS_fnc_typeText;
};