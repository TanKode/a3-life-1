// Turn Table 

_dir = getDir Display;

waitUntil {
_dir = _dir + (
if (_dir > 360) then [{-360},{0.5}]
);
Display setDir _dir;
};

// (Thanks to Killzone Kid)
