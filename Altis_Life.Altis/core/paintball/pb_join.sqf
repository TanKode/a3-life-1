if (joinmode==0) then {
    _PUID = getPlayerUID player;
    hint "Eine Anfrage wurde an den Server gesendet, bitte warte einen Moment";
    [[_PUID],"TON_fnc_paintball",false,false] spawn life_fnc_MP;
    joinmode = 1;
    life_atmcash = life_atmcash - 30000;
} else {
    hint "Du bist der Lobby bereits beigetreten, versuche es sp�ter noch einmal!";
};