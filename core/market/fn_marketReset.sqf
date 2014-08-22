/*

	Resets market by calling marketConfiguration

*/

[] call life_fnc_marketconfiguration;

[[0,format["ADMIN: %1 Market Prices set to default.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

hint "Reset Market Price.";