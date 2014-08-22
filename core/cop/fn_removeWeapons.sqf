/*
	Author: Tobias 'Xetoxyc' Sittenauer
	Edited by: ColinM9991

	File: fn_removeWeapons.sqf
*/

private["_cop","_legal","_handgun"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
_legal = ["hgun_Rook40_F","hgun_Pistol_heavy_02_F","hgun_ACPC2_F"];
_handgun = handgunWeapon player;
if(_cop == player) then {}; //WTF?

if(isNull _cop OR !(player getVariable["restrained",FALSE])) exitWith {}; //Error check?

if((handgunWeapon player) in _legal) then 
{
	switch(true)do 
	{
		case (player canAddItemToBackpack _handgun):
		{
			removeAllWeapons player;
			player addItemToBackpack _handgun;
			hint "Your pistol has been holstered to your backpack";
		};
		case (player canAddItemToVest _handgun):
		{
			removeAllWeapons player;
			player addItemToVest _handgun;
			hint "Your pistol has been holstered to your vest";
		};
		case (player canAddItemToUniform _handgun):
		{
			removeAllWeapons player;
			player addItemToUniform _handgun;
			hint "Your pistol has been holstered to your uniform";
		};
		default
		{
			removeAllWeapons player;
			hint "Your pistol has been seized";
		};
	};
} else {
	removeAllWeapons player;
	{player removeMagazine _x} foreach (magazines player);
	hint "Your weapons have been seized";
};