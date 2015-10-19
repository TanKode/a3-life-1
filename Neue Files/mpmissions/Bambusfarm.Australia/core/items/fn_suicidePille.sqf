/*
	Selbstmordpille
*/

private["_unit","_damage", "_fatigue"];
//_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
//if(isNull _unit) exitWith {};
if(playerSide == west) exitWith {};
if(life_action_inUse) exitWith {};

life_action_inUse = true;

hintSilent "Das war die falsche Pille!\nDu fuehlst dich nicht gut.";
player setDamage (0.1 + (damage player));//+10 schaden
sleep 5;
player setDamage (0.1 + (damage player));//+10 schaden
sleep 5;
player setDamage (0.1 + (damage player));//+10 schaden
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [2];
"dynamicBlur" ppEffectCommit 1;
enableCamShake true;// kamera gewackle 
addCamShake [10, 45, 10];
player setFatigue 1;// erschöpfung bei 100% ... sprich der rennt erstma nirgends hin
hintSilent "Dir wird schwindelig.";
sleep 5;
player setDamage (0.1 + (damage player));//+10 schaden
sleep 5;
player setDamage (0.1 + (damage player));//+10 schaden
sleep 5;
player setDamage (0.1 + (damage player));//+10 schaden
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [2];
"dynamicBlur" ppEffectCommit 1;
hintSilent "Dir wird langsam schwarz vor Augen.";
sleep 5;
player setDamage (0.1 + (damage player));//+10 schaden
sleep 5;
player setDamage (0.1 + (damage player));//+10 schaden
sleep 5;
player setDamage (0.1 + (damage player));//+10 schaden
sleep 5;
player setDamage (0.1 + (damage player));//+10 schaden
hintSilent "Du bist Tot und hast Selbsmord begangen.";
resetCamShake;// weil tod muss hier auch nichts mehr wackeln
player setFatigue 0;// damit er nicht ohne ausdauer spawned
"dynamicBlur" ppEffectEnable false;
[[3,format["!!!%1 hat Selbstmord begangen!!!",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
life_action_inUse = false;