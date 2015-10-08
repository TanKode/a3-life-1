/*
	HACK THE BANK!
	Autor: stolzerrabe
	
	You are allowed to:
	Use, Share and modify
	You are not allowed to:
	Remove Author or say this script is yours in anyway!
	
	Based on Tonic´s FedCam
	
*/
_laptop = nearestObjects[getPos player,["Land_Laptop_unfolded_F"],8] select 0;
_mode = _this select 3;
if(isNil "HackBankCam") then {HackBankCam = 0;};
if(HackBankCam == 0) exitWith { hint "Du hast keinen Zugriff auf die Überwachungskameras"; };

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "bambusfarm_fed_scam") then {
	bambusfarm_fed_scam = "camera" camCreate [0,0,0];
	bambusfarm_fed_scam camSetFov 0.5;
	bambusfarm_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	bambusfarm_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "side": {
		bambusfarm_fed_scam camSetPos [16029.1,16938.9,3.08817];
		bambusfarm_fed_scam camSetTarget [16034.9,16930.6,0.00146008];
		bambusfarm_fed_scam camCommit 0;
	};
	
	case "vault": {
		bambusfarm_fed_scam camSetPos [16031.1,16936.6,10.287];
		bambusfarm_fed_scam camSetTarget [16017.1,16957.3,0.597221];
		bambusfarm_fed_scam camCommit 0;
	};
	
	case "front": {
		bambusfarm_fed_scam camSetPos [16084.3,16997.8,23.6492] ;
		bambusfarm_fed_scam camSetTarget [16037.8,16966.7,0.00145817];
		bambusfarm_fed_scam camCommit 0;
	};
	
	case "back": {
		bambusfarm_fed_scam camSetPos [16002,16904.9,5.71753];
		bambusfarm_fed_scam camSetTarget [15998.7,16939.7,0.00146866];
		bambusfarm_fed_scam camCommit 0;
	};
	
	case "off" :{
		bambusfarm_fed_scam cameraEffect ["terminate", "back"];
		camDestroy bambusfarm_fed_scam;
		_laptop setObjectTexture [0,""];
		bambusfarm_fed_scam = nil;
	};
};
