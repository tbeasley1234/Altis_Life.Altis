/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction["Drop Fishing Net",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction["Rob Person",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		//Grab Turtle
		life_actions = life_actions + [player addAction["Grab Turtle",life_fnc_catchTurtle,"",0,false,false,"",'
		!isNull cursorTarget && (typeOf cursorTarget) == "Turtle_F" && ((player distance (getMarkerPos "turtle_1") < 350) OR (player distance (getMarkerPos "turtle_2") < 350) OR (player distance (getMarkerPos "turtle_3") < 350)) && !alive cursorTarget && (life_carryWeight + (["turtle"] call life_fnc_itemWeight)) <= life_maxWeight']];
		//SVest.
		life_actions = life_actions + [player addAction["Activate Suicide Vest",life_fnc_suicideBomb,"",0,false,false,"",'
		vest player == "V_HarnessOGL_brn" && alive player && playerSide == civilian && !life_istazed && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];

		//Re add Mining scroll
		life_actions = life_actions + [player addAction["Mine Copper",life_fnc_pickaxeUse,"",0,false,false,"",'
	 	!life_action_in_use && (player distance (getMarkerPos "lead_1") < 30) && (vehicle player == player) && (life_carryWeight + (["copperore"] call life_fnc_itemWeight)) <= life_maxWeight ']];
 		life_actions = life_actions + [player addAction["Mine Iron",life_fnc_pickaxeUse,"",0,false,false,"",'
 		!life_action_in_use && (player distance (getMarkerPos "iron_1") < 30) && (vehicle player == player) && (life_carryWeight + (["ironore"] call life_fnc_itemWeight)) <= life_maxWeight ']];
 	//	life_actions = life_actions + [player addAction["Mine Salt",life_fnc_pickaxeUse,"",0,false,false,"",'
 	//	!life_action_in_use && (player distance (getMarkerPos "salt_1") < 120) && (vehicle player == player) && (life_carryWeight + (["salt"] call life_fnc_itemWeight)) <= life_maxWeight ']];
 		life_actions = life_actions + [player addAction["Mine Sand",life_fnc_pickaxeUse,"",0,false,false,"",'
 		!life_action_in_use && (player distance (getMarkerPos "sand_1") < 75) && (vehicle player == player) && (life_carryWeight + (["sand"] call life_fnc_itemWeight)) <= life_maxWeight ']];
 		life_actions = life_actions + [player addAction["Mine Diamonds",life_fnc_pickaxeUse,"",0,false,false,"",'
 		!life_action_in_use && (player distance (getMarkerPos "diamond_1") < 50) && (vehicle player == player) && (life_carryWeight + (["diamond"] call life_fnc_itemWeight)) <= life_maxWeight ']];
 		life_actions = life_actions + [player addAction["Mine Oil",life_fnc_pickaxeUse,"",0,false,false,"",'
 		!life_action_in_use && (player distance (getMarkerPos "oil_1") < 40) && (vehicle player == player) && (life_carryWeight + (["oilu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
 		life_actions = life_actions + [player addAction["Mine Oil",life_fnc_pickaxeUse,"",0,false,false,"",'
 		!life_action_in_use && (player distance (getMarkerPos "oil_2") < 40) && (vehicle player == player) && (life_carryWeight + (["oilu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
 		life_actions = life_actions + [player addAction["Mine Rocks",life_fnc_pickaxeUse,"",0,false,false,"",'
 		!life_action_in_use && (player distance (getMarkerPos "rock_1") < 50) && (vehicle player == player) && (life_carryWeight + (["rock"] call life_fnc_itemWeight)) <= life_maxWeight ']];

	};
};

switch (playerSide) do
{
	case west:
	{
		//BD MK1
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Anti-Air 'Fuel Killer'</t>",life_fnc_fireBirdDown,"BDMK1",1,false,true,"",'(!(isNull (vehicle player))) && (vehicle player) isKindOf "Air" ']];
	};
};
/*
	Undecided actions
life_actions = life_actions + [player addAction["Repair Vehicle ($500)",life_fnc_pumpRepair,"",999,false,false,"",
' vehicle player != player && (typeOf cursorTarget == "Land_fs_feed_F") && (vehicle player) distance cursorTarget < 6 ']];
life_actions = life_actions + [player addAction["Place Spike Strip",{if(!isNull life_spikestrip) then {detach life_spikeStrip; life_spikeStrip = ObjNull;};},"",999,false,false,"",'!isNull life_spikestrip']];
//Use Chemlights in hand
life_actions = life_actions + [player addAction["Chemlight (RED) in Hand",life_fnc_chemlightUse,"red",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_red" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Chemlight (YELLOW) in Hand",life_fnc_chemlightUse,"yellow",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_yellow" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Chemlight (GREEN) in Hand",life_fnc_chemlightUse,"green",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_green" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Chemlight (BLUE) in Hand",life_fnc_chemlightUse,"blue",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_blue" in (magazines player) && vehicle player == player ']];
//Drop Chemlight
life_actions = life_actions + [player addAction["Drop Chemlight",{if(isNil "life_chemlight") exitWith {};if(isNull life_chemlight) exitWith {};detach life_chemlight; life_chemlight = nil;},"",-1,false,false,"",'!isNil "life_chemlight" && !isNull life_chemlight && vehicle player == player ']];
//Custom Heal
life_actions = life_actions + [player addAction["<t color='#FF0000'>Heal Self</t>",life_fnc_heal,"",99,false,false,"",' vehicle player == player && (damage player) > 0.25 && ("FirstAidKit" in (items player)) && (currentWeapon player == "")']];
//Custom Repair
life_actions = life_actions + [player addAction["<t color='#FF0000'>Repair Vehicle</t>",life_fnc_repairTruck,"",99,false,false,"", ' vehicle player == player && !isNull cursorTarget && ((cursorTarget isKindOf "Car") OR (cursorTarget isKindOf "Air") OR (cursorTarget isKindOf "Ship")) && (damage cursorTarget) > 0.001 && ("ToolKit" in (backpackItems player)) && (player distance cursorTarget < ((boundingBox cursorTarget select 1) select 0) + 2) ']];
//Service Truck Stuff
life_actions = life_actions + [player addAction["<t color='#0000FF'>Service Nearest Car</t>",life_fnc_serviceTruck,"",99,false,false,"",' (typeOf (vehicle player) == "C_Offroad_01_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
life_actions = life_actions +
[player addAction["Push",life_fnc_pushVehicle,"",0,false,false,"",
'!isNull cursorTarget && player distance cursorTarget < 4.5 && cursorTarget isKindOf "Ship"']];
*/
