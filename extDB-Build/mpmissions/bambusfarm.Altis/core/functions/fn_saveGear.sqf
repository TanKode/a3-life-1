/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka
    
    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_return = [];

_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;
if(playerSide == west || playerSide == civilian && {(call bambusfarm_save_civ)}) then {
    _return pushBack primaryWeapon player;
    _return pushBack handgunWeapon player;
} else {
    _return pushBack [];
    _return pushBack [];
};

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if(_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then
{
    _hMag = ((handgunMagazine player) select 0);
    if(_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_hMag];
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems = _hItems + [_x];
    } forEach (handGunItems player);
};

{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yItems = _yItems + [_name];
        };
    };
} forEach [
    ["bambusfarm_inv_apple", bambusfarm_inv_apple],
    ["bambusfarm_inv_rabbit", bambusfarm_inv_rabbit],
    ["bambusfarm_inv_salema", bambusfarm_inv_salema],
    ["bambusfarm_inv_ornate", bambusfarm_inv_ornate],
    ["bambusfarm_inv_mackerel", bambusfarm_inv_mackerel],
    ["bambusfarm_inv_tuna", bambusfarm_inv_tuna],
    ["bambusfarm_inv_mullet", bambusfarm_inv_mullet],
    ["bambusfarm_inv_catshark", bambusfarm_inv_catshark],
    ["bambusfarm_inv_fishingpoles", bambusfarm_inv_fishingpoles],
    ["bambusfarm_inv_water", bambusfarm_inv_water],
    ["bambusfarm_inv_donuts", bambusfarm_inv_donuts],
    ["bambusfarm_inv_turtlesoup", bambusfarm_inv_turtlesoup],
    ["bambusfarm_inv_coffee", bambusfarm_inv_coffee],
    ["bambusfarm_inv_fuelF", bambusfarm_inv_fuelF],
    ["bambusfarm_inv_fuelE", bambusfarm_inv_fuelE],
    ["bambusfarm_inv_pickaxe", bambusfarm_inv_pickaxe],
    ["bambusfarm_inv_tbacon", bambusfarm_inv_tbacon],
    ["bambusfarm_inv_lockpick", bambusfarm_inv_lockpick],
    ["bambusfarm_inv_redgull", bambusfarm_inv_redgull],
    ["bambusfarm_inv_peach", bambusfarm_inv_peach],
    ["bambusfarm_inv_spikeStrip", bambusfarm_inv_spikeStrip],
    ["bambusfarm_inv_defusekit", bambusfarm_inv_defusekit],
    ["bambusfarm_inv_storagesmall", bambusfarm_inv_storagesmall],
    ["bambusfarm_inv_storagebig", bambusfarm_inv_storagebig],
    ["bambusfarm_inv_handcuffs", bambusfarm_inv_handcuffs],
    ["bambusfarm_inv_Schere", bambusfarm_inv_Schere]
];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
if(call bambusfarm_save_yinv) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

bambusfarm_gear = _return;
