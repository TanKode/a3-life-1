 _ok = createDialog "bambusfarm_messages";
disableSerialization;
waitUntil {!isNull (findDisplay 10000)};
_display = findDisplay 10000;

[] call bambusfarm_fnc_initMessages;

waitUntil { !dialog };