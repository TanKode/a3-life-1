#include <macro.h>
/*

	Updates player clothing by replacing vanilla by custom ones

*/

private["_uniform","_backpack"];
///Uniform
////////////////

//Cop
if(playerSide isEqualTo west) then {
	_uniform = uniform player;
	_backpack = backpack player;

	if(_uniform isEqualTo "U_Rangemaster") then {
		[[player,0,"textures\uniforms\cop1.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP; //recruit uniform
	};
	if(_uniform isEqualTo "U_B_SpecopsUniform_sgg") then {
		[[player,0,"textures\uniforms\sek.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP; //SEK uniform
	};
	if(_uniform isEqualTo "U_B_CombatUniform_mcam") then {
		[[player,0,"textures\uniforms\bw_tropen.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP; //Militär uniform
	};
	if(_uniform isEqualTo "U_B_GhillieSuit") then {
		[[player,0,"textures\uniforms\bw_tropen.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP; //Militär ghilli
	};
	///backpack
	////////////////
	if(_backpack isEqualTo "B_Bergen_blk") then {	
		(unitBackpack player) setObjectTextureGlobal [0,""];
		//[[unitBackpack player,0,""],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
	};
	if(_backpack isEqualTo "B_Bergen_sgg") then {
		(unitBackpack player) setObjectTextureGlobal [0,""];
		//[[unitBackpack player,0,""],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
	};
	if(_backpack isEqualTo "B_Kitbag_mcamo") then { 
		[[unitBackpack player,0,"textures\uniforms\seesack_tropen.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
	};
};

///Medic
if(playerSide isEqualTo independent) then {
	_uniform = uniform player;
	_backpack = backpack player;
		
	if(_uniform isEqualTo "U_I_HeliPilotCoveralls") then {
		[[player,0,"textures\uniforms\medic_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
	};
	if(_uniform isEqualTo "U_Rangemaster") then {
		[[player,0,"textures\uniforms\notarzt_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
	};
	///backpack
	////////////////
	if(_backpack isEqualTo "B_Bergen_blk") then {
		[[unitBackpack player,0,"textures\uniforms\med_backpack.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;		
	};
	if(_backpack isEqualTo "B_Bergen_sgg") then {
		[[unitBackpack player,0,"textures\uniforms\notarzt_backpack.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
	};
};

///ADAC
if(playerSide isEqualTo east) then {
	_uniform = uniform player;
	_backpack = backpack player;

	if(_uniform isEqualTo "U_OG_Guerilla2_3") then {
		[[player,0,"textures\uniforms\adac.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;		
	};
	///backpack
	////////////////
	if(_backpack isEqualTo "B_Bergen_blk") then { 
		[[unitBackpack player,0,"textures\uniforms\adac_backpack.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
	};
};

