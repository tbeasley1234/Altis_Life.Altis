/*
	ALAH SNACKBAR!
*/
private["_test","_i"];


if(vest player != "V_HarnessOGL_brn") exitWith {};

_test = for "_i" from 1 to 3 do {"Bo_GBU12_LGB" createVehicle [0,0,9999];};
_test setPos (getPos player);
_test setVelocity [100,0,0];


if(alive player) then {player setDamage 1;};

[[0,format["%1 has set off their suicide vest.",player getVariable["realname",name player]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;