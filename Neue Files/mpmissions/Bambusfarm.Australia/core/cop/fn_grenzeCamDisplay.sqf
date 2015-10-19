#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = SEL(_this,0);
_mode = SEL(_this,3);

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_grenze_scam") then {
	life_grenze_scam = "camera" camCreate [0,0,0];
	life_grenze_scam camSetFov 0.5;
	life_grenze_scam camCommit 0;
	"rendertarget2" setPiPEffect [0];
	life_grenze_scam cameraEffect ["INTERNAL", "BACK", "rendertarget2"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget2,1.0)"];
};

switch (_mode) do {
	case "nord": {
		life_grenze_scam camSetPos [18389.9,17967.3,10.08817];
		life_grenze_scam camSetTarget [18368.9,17948.4,0.00146008];
		life_grenze_scam camCommit 0;
	};
		
	case "mid": {
		life_grenze_scam camSetPos [17827.1,16877.8,10.6492] ;
		life_grenze_scam camSetTarget [17801.4,16879.2,0.00145817];
		life_grenze_scam camCommit 0;
	};
	
	case "sued": {
		life_grenze_scam camSetPos [17570.1,16080.7,10.71753];
		life_grenze_scam camSetTarget [17540.4,16085.6,0.00146866];
		life_grenze_scam camCommit 0;
	};
	
	case "aus" :{
		life_grenze_scam cameraEffect ["terminate", "back"];
		camDestroy life_grenze_scam;
		_laptop setObjectTexture [0,""];
		life_grenze_scam = nil;
	};
};
