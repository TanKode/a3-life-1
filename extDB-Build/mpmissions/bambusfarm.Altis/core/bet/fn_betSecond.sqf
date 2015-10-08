// **********  Disclaimer *********** //
//        Script by ThirtySeven             
//     Nur mit genehmigung von           
//        ThirtySeven nutzbar           
// **********  Disclaimer *********** //
if(!bambusfarm_bet) exitWith {hint "Bitte ersteinmal die Wette anschauen!"};
if(bambusfarm_TASCHENGELD < 2500) exitWith {hint "Willst du mich verarschen?! Ich habe gesagt €2500!"};
bambusfarm_TASCHENGELD = bambusfarm_TASCHENGELD - 2500;

bambusfarm_bets = 2;
hint format["Du hast €2500 auf %1 gesetzt!",bambusfarm_club2];
[] spawn bambusfarm_fnc_betSystem;