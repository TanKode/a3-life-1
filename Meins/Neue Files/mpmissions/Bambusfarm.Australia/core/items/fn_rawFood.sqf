_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_food = [_this,1,"",[""]] call BIS_fnc_param;
if(_food == "") exitWith {};
if(isNull _player) exitWith {};
_hunger = life_hunger;
_val = -2;
_time = 125;
_timeUp = time + _time;

if(_player getVariable["rawFood",true]) exitWith {hint "Sie haben sich den Magen schon verdorben!!!"};
if([false,_food,1] call life_fnc_handleInv) then {
    hint "Sie haben rohes Fleisch verzehrt, und sich dadruch den Magen verdorben!!!";
    _player setVariable["rawFood",true,true];
    
    _val spawn
    {
        _time = 125;
        _timeUp = time + _time;
        _player = player;
        _hunger = life_hunger;
        while{(_player getVariable["rawFood",true])} do
        {
             if((round(_timeUp - time)) > 0) then {
                _sum = life_hunger + _this;
                life_hunger = _sum;
                [] call life_fnc_hudUpdate;
                sleep 5;
             };
            
             if((round(_timeUp - time)) == 0) exitWith{_player setVariable["rawFood",false,true];};
        };
    };
    
    while{_player getVariable["rawFood",true];} do
    {
        if((round(_timeUp - time)) > 0) then {
            _damage = damage _player;
            _damage = _damage + 0.02; // player lose 10hp/5 sec
            _player setDamage (_damage);
            [] call life_fnc_hudUpdate;
            sleep 5;
        };
        
        if((round(_timeUp - time)) == 0) exitWith{_player setVariable["rawFood",false,true];};
    };
};