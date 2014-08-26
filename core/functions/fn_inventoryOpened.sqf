/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
//This should allow cops-only to look inside backpacks.
if(_isPack == 1 && playerSide != west) then {
	hint "You are not allowed to look into someone's backpack";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint "You are not allowed to access this storage container without the owner opening it.";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

//This prevents people from accessing inventories inside vehicles while they are locked.
if(_container isKindOf "Car" || _container isKindOf "Ship" || _container isKindOf "Air") exitWith{
	if(!(_container in life_vehicles) && (locked _container) == 2) exitWith {
		hint "You're not allowed to open the vehicles inventory while it's locked.";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

//This prevents people from looting dead bodies (Temp Fix for Duping)
if(_container isKindOf "Man") exitWith {
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};