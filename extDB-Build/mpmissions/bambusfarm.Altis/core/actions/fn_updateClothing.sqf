/*

	Updates player clothing by replacing vanilla by custom ones
        by Audacious

*/

private["_uniform","_backpack"];

///Uniform
////////////////

_uniform = uniform player;

switch(true) do
{
	case (playerSide == west && _uniform == "U_B_SpecopsUniform_sgg"):
	{
		if( (call life_coplevel) > 4) then
		{
			player setObjectTextureGlobal  [0, "bambusfarm\Texturen\Polizei\Kleidung\cop_captain.jpg"];
		};

		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
	////////////////
	case (playerSide == west && _uniform == "U_B_CombatUniform_mcam_vest"):
	{
		if( (call life_coplevel) > 6) then
		{
			player setObjectTextureGlobal  [0, "bambusfarm\Texturen\Polizei\Kleidung\uniform_FBI.jpg"];
		};

		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
	
	case (playerSide == west && _uniform == "U_B_CombatUniform_mcam_worn"):
	{
		if( (call life_coplevel) > 6) then
		{
			player setObjectTextureGlobal  [0, "bambusfarm\Texturen\Polizei\Kleidung\uniform_DEA.jpg"];
		};

		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
	
	case (playerSide == west && _uniform == "U_B_SpecopsUniform_sgg"):
	{
		if( (call life_coplevel) == 6) then
		{
			player setObjectTextureGlobal  [0, "bambusfarm\Texturen\Polizei\Kleidung\cop_sergeant.jpg"];
		};

		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
};