while {true} do {
    sleep 300;
    if (alive player) then
        {
        [false] call SOCK_fnc_syncData;
        [] call bambusfarm_fnc_hudUpdate;
        hint "Spiel automatisch gespeichert."
    };
};