#include <macro.h>
/*
	File: fn_godmode.sqf
	Author: Not Sure on original
	
	Description:
	God Mode for Admins
	
	Edited by: Blindy
*/

if (life_teleport_admin_lvl > __GETC__(life_adminlevel)) exitWith{
	hint "Insufficient Admin Level God Mode";};

if (isNil "godmode") then
{
	godmode = 0;
};

if (godmode == 0) then
{
	godmode = 1;
    cutText ["God mode activated.", "PLAIN"];
	player removeAllEventHandlers "handleDamage";
	player addEventHandler ["handleDamage", {false}];
	player allowDamage false;
}

else
{
	godmode = 0;
    cutText ["God mode Deactivated.", "PLAIN"];
	player allowDamage true;
	
	player addEventHandler ["handleDamage", {true}];
	player removeAllEventHandlers "handleDamage";
	
};