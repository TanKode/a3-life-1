/*sign_1 SetObjectTextureGlobal [0,"scripts\infotafel\Pictures\flug_bootinfo.paa"];
sign_2 SetObjectTextureGlobal [0,"scripts\infotafel\Pictures\flug_bootinfo.paa"];
sign_3 SetObjectTextureGlobal [0,"scripts\infotafel\Pictures\flug_bootinfo.paa"];
sign_4 SetObjectTextureGlobal [0,"scripts\infotafel\Pictures\flug_bootinfo.paa"];
sign_5 SetObjectTextureGlobal [0,"scripts\infotafel\Pictures\flug_bootinfo.paa"];
ProcessInitCommands;*/
_player = player;

[[sign_1,0,"scripts\infotafel\Pictures\flug_bootinfo.paa"],"life_fnc_setTexture",_player,false] spawn life_fnc_MP;
[[sign_2,0,"scripts\infotafel\Pictures\flug_bootinfo.paa"],"life_fnc_setTexture",_player,false] spawn life_fnc_MP;
[[sign_3,0,"scripts\infotafel\Pictures\flug_bootinfo.paa"],"life_fnc_setTexture",_player,false] spawn life_fnc_MP;
[[sign_4,0,"scripts\infotafel\Pictures\flug_bootinfo.paa"],"life_fnc_setTexture",_player,false] spawn life_fnc_MP;
[[sign_5,0,"scripts\infotafel\Pictures\flug_bootinfo.paa"],"life_fnc_setTexture",_player,false] spawn life_fnc_MP;