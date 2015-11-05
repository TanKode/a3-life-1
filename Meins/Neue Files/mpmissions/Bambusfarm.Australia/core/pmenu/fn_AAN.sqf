#include <macro.h>
/*
Author: alleskapot

Description: Sends AAN News to the player

*/
private["_display","_message"];
disableSerialization;
_message = _this select 0;
[parseText format["<t size='3'>GBB - Live News</t>"],parseText format["<t size='1.2'>%1 - %1 - %1</t>",_message]] spawn BIS_fnc_AAN;
player say3d "news";
sleep 16; //Time the News is shown
_display = GVAR_UINS "BIS_AAN";
_display closeDisplay 0; 