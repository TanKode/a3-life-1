 _ok = createDialog "life_messages";
disableSerialization;
waitUntil {!isNull (findDisplay 10000)};
_display = findDisplay 10000;

[] call life_fnc_initMessages;

waitUntil { !dialog };