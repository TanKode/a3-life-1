#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = SEL(_this,0);
_mode = SEL(_this,3);

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_city_scam") then {
	life_city_scam = "camera" camCreate [0,0,0];
	life_city_scam camSetFov 0.5;
	life_city_scam camCommit 0;
	"rendertarget3" setPiPEffect [0];
	life_city_scam cameraEffect ["INTERNAL", "BACK", "rendertarget3"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget3,1.0)"];
};

switch (_mode) do {
	case "safe": {
		life_city_scam camSetPos [3669.45,13199.9,3.08817];
		life_city_scam camSetTarget [3666.97,13196.2,0.00146008];
		life_city_scam camCommit 0;
	};
		
	case "hinter": {
		life_city_scam camSetPos [3670.3,13206.8,13.08817] ;
		life_city_scam camSetTarget [3659.09,13221.1,0.00145817];
		life_city_scam camCommit 0;
	};
	
	case "schalter": {
		life_city_scam camSetPos [3663.64,13203.4,3.08817];
		life_city_scam camSetTarget [3656.14,13197.8,0.00146866];
		life_city_scam camCommit 0;
	};
	
	case "haupt": {
		life_city_scam camSetPos [3667.07,13173.2,13.08817];
		life_city_scam camSetTarget [3662.77,13186.6,0.00146866];
		life_city_scam camCommit 0;
	};
		
	case "aus" :{
		life_city_scam cameraEffect ["terminate", "back"];
		camDestroy life_city_scam;
		_laptop setObjectTexture [0,""];
		life_city_scam = nil;
	};
};
