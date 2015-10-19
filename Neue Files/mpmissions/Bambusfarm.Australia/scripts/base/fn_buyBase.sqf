#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	Edit Matthias Bun
	Description:
	Buys the base?
*/

_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;
_grp = group player;
if(isNull _house) exitWith {};
if(isNull _grp) exitWith {hint"Du bist in keiner Gang"};

_grpMembers = (group player) getVariable "gang_members";
_gFund = (group player) getVariable ["gang_bank",0];
_groupID = (group player) getVariable "gang_id";
_groupOwner = (group player)  getVariable "gang_owner";

if(!(EQUAL(_uid,_groupOwner))) exitWith {hintSilent "Sie sind nicht der GangLeader"};
if(!license_civ_gang) exitWith {hint localize "STR_House_License1"};
if(count life_base >= 1) exitWith {hint "Eure Gang besitz schon eine Base";};
if (!isNil{_house getVariable "base_owner"}) then 
{
	if(!(EQUAL(_grouOwner,((_house getVariable "base_owner") select 0)))) exitWith {hint "Diese base gehört nicht zu deiner gang"};
};
closeDialog 0;

_houseCfg = [M_CONFIG(getNumber,"Houses",typeOf(_house),"price"),M_CONFIG(getNumber,"Houses",typeOf(_house),"maxStorage")];
if(count _houseCfg == 0) exitWith {};
	
_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	
	if (isNil{_house getVariable "base_owner"}) then 
	{
		if(_gFund < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
		[[_uid,_house,_grp],"TON_fnc_addBase",false,false] spawn life_fnc_MP;
		_gFund = _gFund - (_houseCfg select 0);
		(group player) setVariable ["gang_bank",_gFund,true];
		_house setVariable["base_owner",[_uid,profileName],true];
		_house setVariable["members",[_grpMembers],true];
		_house setVariable["locked",true,true];
		_house setVariable["Trunk",[[],0],true];
		_house setVariable["containers",[],true];
		_house setVariable["slot",3000,true];
		_house setVariable["uid",round(random 99999),true];
		life_vehicles pushBack _house;
		life_base pushBack [str(getPosATL _house),[]];
		_marker = createMarker [format["base_%1",(_house getVariable "uid")],position player];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerType "Empty";
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [100,100];

		_gangName = formatText["Gang-Base von: %1",(life_gangData select 2)];
		_markerText = createMarker [format["baseText_%1",(_house getVariable "uid")],position player];
		_markerText setMarkerShape "ICON";
		_markerText setMarkerText str(_gangName);
		_markerText setMarkerColor "ColorBlack";
		_markerText setMarkerType "mil_Warning";
		hint" Glückwunsch du hast eine Clanbase erworben.Diese wird nun errichtet und steht Dir nach dem Server Restart zur Verfügung.";
	}else{
		_position = call compile format["%1",life_base select 0];
		
		[[_uid,_house,_grp],"TON_fnc_addBase2",false,false] spawn life_fnc_MP;
		life_vehicles pushBack _house;
		life_base pushBack [str(getPosATL _house),[]];
		_marker = createMarker [format["base_%1",(_house getVariable "uid")],_position];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerType "Empty";
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [100,100];

		_gangName = formatText["Gang-Base von: %1",(life_gangData select 2)];
		_markerText = createMarker [format["baseText_%1",(_house getVariable "uid")],_position];
		_markerText setMarkerShape "ICON";
		_markerText setMarkerText str(_gangName);
		_markerText setMarkerColor "ColorBlack";
		_markerText setMarkerType "mil_Warning";
		hint" Glückwunsch du hast eine Clanbase erworben.Diese wird nun errichtet und steht Dir nach dem Server Restart zur Verfügung.";
	};
	
};