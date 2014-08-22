/*
	File: fn_gatherSalt.sqf
	
	Description:
	Gathers Salt
*/
private["_sum"];
_sum = ["salt",4,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (life_inv_pickaxe < 1) exitWith {hint "You don't have a pickaxe with which to mine!";}; // no pickaxe
if(vehicle player != player) exitWith {hint "You can't mine from inside a car!";};

if(_sum > 3) then
{
	life_action_inUse = true;
	
	titleText[format[localize "STR_NOTF_Gathering",localize "STR_Item_Salt"],"PLAIN"];
	titleFadeOut 5;
	//sleep 5;
	for "_i" from 0 to 2 do
	{
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		sleep 2.5;
	};
	
	if(([true,"salt",4] call life_fnc_handleInv)) then
	{
		titleText[format[localize "STR_NOTF_Collected",localize "STR_Item_Salt"],"PLAIN"];
	};
};

life_action_inUse = false;