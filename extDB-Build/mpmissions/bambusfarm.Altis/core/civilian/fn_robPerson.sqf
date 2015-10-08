/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(bambusfarm_TASCHENGELD > 0) then
{
	[[bambusfarm_TASCHENGELD],"bambusfarm_fnc_robReceive",_robber,false] spawn bambusfarm_fnc_MP;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"bambusfarm_fnc_wantedAdd",false,false] spawn bambusfarm_fnc_MP;
	[[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[bambusfarm_TASCHENGELD] call bambusfarm_fnc_numberText]],"bambusfarm_fnc_broadcast",nil,false] spawn bambusfarm_fnc_MP;
	bambusfarm_TASCHENGELD = 0;
}
	else
{
	[[2,"STR_NOTF_RobFail",true,[profileName]],"bambusfarm_fnc_broadcast",_robber,false] spawn bambusfarm_fnc_MP;
};