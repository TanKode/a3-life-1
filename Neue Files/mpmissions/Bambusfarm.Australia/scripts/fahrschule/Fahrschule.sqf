/* 
Author: Aideen
File: fahrschule.sqf
Description: Öffne Dialog
*/
_ok = createDialog "fahrschule";
disableSerialization;
waitUntil {!isnull (findDisplay 123456)};
_display = findDisplay 123456;
waitUntil {!dialog};