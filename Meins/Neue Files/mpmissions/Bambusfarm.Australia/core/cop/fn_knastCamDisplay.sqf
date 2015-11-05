#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = SEL(_this,0);
_mode = SEL(_this,3);

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_knast_scam") then {
	life_knast_scam = "camera" camCreate [0,0,0];
	life_knast_scam camSetFov 0.5;
	life_knast_scam camCommit 0;
	"rendertarget1" setPiPEffect [0];
	life_knast_scam cameraEffect ["INTERNAL", "BACK", "rendertarget1"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget1,1.0)"];
};

switch (_mode) do {
	case "hof1": {
		life_knast_scam camSetPos [12146.8,10488.3,3.08817];
		life_knast_scam camSetTarget [12148.9,10506.7,0.00146008];
		life_knast_scam camCommit 0;
	};
		
	case "hof2": {
		life_knast_scam camSetPos [12195.5,10541.2,3.08817] ;
		life_knast_scam camSetTarget [12176.7,10534.8,0.00145817];
		life_knast_scam camCommit 0;
	};
	
	case "hof3": {
		life_knast_scam camSetPos [12199.7,10549.9,3.08817];
		life_knast_scam camSetTarget [12200.7,10570.1,0.00146866];
		life_knast_scam camCommit 0;
	};
	
	case "hof4": {
		life_knast_scam camSetPos [12170.9,10545.3,3.08817];
		life_knast_scam camSetTarget [12166.5,10560.8,0.00146866];
		life_knast_scam camCommit 0;
	};
	
	case "eingang": {
		life_knast_scam camSetPos [12147.8,10537.1,13.71753];
		life_knast_scam camSetTarget [12128.4,10526.2,0.00146866];
		life_knast_scam camCommit 0;
	};
	
	case "aus" :{
		life_knast_scam cameraEffect ["terminate", "back"];
		camDestroy life_knast_scam;
		_laptop setObjectTexture [0,""];
		life_knast_scam = nil;
	};
};
