/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		bambusfarm_actions = [player addAction[localize "STR_pAct_DropFishingNet",bambusfarm_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && bambusfarm_carryWeight < bambusfarm_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !bambusfarm_net_dropped ']];
		//Rob person
		//bambusfarm_actions = bambusfarm_actions + [player addAction[localize "STR_pAct_RobPerson",bambusfarm_fnc_robAction,"",0,false,false,"",'
		//!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
	};
};