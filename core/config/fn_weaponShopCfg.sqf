#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",20000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["ItemMap",nil,5],
						["ItemCompass",nil,5],
						["Binocular",nil,150],
						["Rangefinder",nil,7000],
						["ItemGPS",nil,100],
						["ToolKit",nil,50],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles_OPFOR",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not at a patrol officer rank!"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["SMG_01_F","Vermin",35000],
						["SMG_02_ACO_F",nil,30000],
						["arifle_MXC_Black_F",nil,50000],
						["arifle_MX_Black_F",nil,60000],
						["arifle_MXM_Black_F",nil,70000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_65x39_caseless_mag",nil,130],
						["MineDetector",nil,1000],
						["acc_flashlight",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,2500],
						["muzzle_snds_acp",nil,2750],
						["muzzle_snds_H",nil,3750],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1700]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"You are not at a sergeant rank!"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
						["hgun_ACPC2_F",nil,17500],
						["srifle_GM6_F",nil,150000],
						["arifle_MX_SW_Black_F",nil,80000],
						["arifle_Mk20C_plain_F",nil,15000],
						["srifle_EBR_F",nil,50000],
						["launch_Titan_F",nil,200000],
						["Titan_AA",nil,20000],
						["optic_MRCO",nil,5000],
						["optic_Arco",nil,2500],
						["optic_SOS",nil,4000],
						["optic_DMS",nil,7500],
						["Rangefinder",nil,7000],
						["acc_pointer_IR",nil,2500],
						["muzzle_snds_H",nil,2750],
						["muzzle_snds_B",nil,4000],
						["30Rnd_9x21_Mag",nil,60],
						["100Rnd_65x39_caseless_mag",nil,500],
						["5Rnd_127x108_Mag",nil,400],
						//["16Rnd_9x21_Mag",nil,25],
						["20Rnd_762x51_Mag",nil,300],
						//["30Rnd_556x45_Stanag",nil,100],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1000]
					]
				];
			};
		};
	};
	
	case "copdonator":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not at a patrol officer rank!"};
			case (__GETC__(life_donator) < 3): {"You are not a level 3 donator!"};
			default
			{
				["Cop Donator's Store",
					[
						["B_UavTerminal",nil,10000]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_TRG20_F","TRG Carbine",25000],
						["arifle_TRG21_F",nil,27500],
						["arifle_Katiba_F",nil,30000],
						["arifle_Katiba_C_F","Katiba Carbine",30000],
						["srifle_DMR_01_F",nil,50000],
						["arifle_SDAR_F",nil,20000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag",nil,500],
						["30Rnd_65x39_caseless_green",nil,275],
						["SmokeShell",nil,100]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator!"};
			case (__GETC__(life_donator) == 1):
			{
				["RoT Donator Shop Tier 1",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["optic_ACO_grn_smg",nil,750],
						["acc_pointer_IR",nil,2500],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["RoT Donator Shop Tier 2",
					[
						["hgun_Rook40_F",nil,600],
						["hgun_PDW2000_F",nil,5000],
						["SMG_01_F","Vermin",35000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["SMG_02_F",nil,50000],
						["arifle_MK20_F",nil,30000],
 						["arifle_MK20C_F","MK20 Carbine",25000],
						["optic_ACO_grn_smg",nil,500],
						["acc_pointer_IR",nil,1000],
						["srifle_GM6_F",nil,300000],
						["optic_SOS",nil,6000],
						["NVGoggles",nil,2000],
						["ToolKit",nil,20],
						["itemgps",nil,50],
						["FirstAidKit",nil,20],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,25],
						["30Rnd_556x45_Stanag",nil,125],
						["5Rnd_127x108_Mag",nil,400]
					]
				];
			};

			case (__GETC__(life_donator) >= 3):
			{
				["RoT Donator Shop Tier 3",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_PDW2000_F",nil,4000],
						["hgun_pistol_heavy_01_F",nil,5850],
						["hgun_Pistol_heavy_02_F",nil,6000],
						["SMG_01_F","Vermin",35000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["SMG_02_F",nil,40000],
						["arifle_MK20_F",nil,20000],
 						["arifle_MK20C_F","MK20 Carbine",15000],
						["arifle_MX_SW_F",nil,100000],
						["arifle_MXM_DMS_F",nil,50000],
						["srifle_GM6_F",nil,175000],
						["srifle_EBR_F",nil,50000],
						["launch_Titan_short_F",nil,500000],
						["Titan_AT",nil,300000],
						["launch_Titan_F",nil,600000],
						["Titan_AA",nil,400000],
						["acc_pointer_IR",nil,500],
						["optic_ACO_grn_smg",nil,250],
						["optic_MRCO",nil,5000],
						["optic_SOS",nil,4000],
						["optic_DMS",nil,10000],
 						["optic_MRD",nil,3500],
						["optic_Yorris",nil,2500],
						["Rangefinder",nil,7000],
						["NVGoggles",nil,2000],
						["ToolKit",nil,20],
						["itemgps",nil,50],
						["FirstAidKit",nil,20],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,25],
						["6Rnd_45ACP_Cylinder",nil,40],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_65x39_caseless_mag",nil,100],
						["100Rnd_65x39_caseless_mag",nil,500],
						["20Rnd_762x51_Mag",nil,300],
						["30Rnd_556x45_Stanag",nil,100],
						["5Rnd_127x108_Mag",nil,200]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};
