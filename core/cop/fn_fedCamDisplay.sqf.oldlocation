/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint "You need to enable Picture in Picture (PiP) through your video settings to use this!";};
if(isNil "life_fed_scam") then {
	life_fed_scam = "camera" camCreate [0,0,0];
	life_fed_scam camSetFov 0.5;
	life_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	life_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "side": {
		life_fed_scam camSetPos [13181.8,13449,2.46222];
		life_fed_scam camSetTarget [13186,13453.6,2.44281];
		life_fed_scam camCommit 0;
	};
	
	case "vault": {
		life_fed_scam camSetPos [13213.5,13479.2,5.82443];
		life_fed_scam camSetTarget [13215.1,13484.6,3.36312];
		life_fed_scam camCommit 0;
	};
	
	case "front": {
		life_fed_scam camSetPos [13131.4,13500,13.6719] ;
		life_fed_scam camSetTarget [13175,13491.4,6.51822];
		life_fed_scam camCommit 0;
	};
	
	case "back": {
		life_fed_scam camSetPos [13243.6,13442.4,8.47319];
		life_fed_scam camSetTarget [13229.4,13454.4,6.45256];
		life_fed_scam camCommit 0;
	};
	
	case "off" :{
		life_fed_scam cameraEffect ["terminate", "back"];
		camDestroy life_fed_scam;
		_laptop setObjectTexture [0,""];
		life_fed_scam = nil;
	};
};
